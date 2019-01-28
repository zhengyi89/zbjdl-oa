package com.zbjdl.oa.activiti;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.activiti.engine.FormService;
import org.activiti.engine.HistoryService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.TaskService;
import org.activiti.engine.form.FormProperty;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.impl.persistence.entity.ProcessDefinitionEntity;
import org.activiti.engine.impl.persistence.entity.TaskEntity;
import org.activiti.engine.impl.pvm.PvmActivity;
import org.activiti.engine.impl.pvm.PvmTransition;
import org.activiti.engine.impl.pvm.process.ActivityImpl;
import org.activiti.engine.impl.pvm.process.TransitionImpl;
import org.apache.commons.beanutils.BeanUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 
 * 扩展Activiti的api实现
 * 
 * @author yejiyong
 *
 */
@Service("activitiService")
public class ActivitiService {
	private final static Logger logger = LoggerFactory.getLogger(ActivitiService.class);

	@Autowired
	private RepositoryService repositoryService;
	@Autowired
	private TaskService taskService;
	@Autowired
	private HistoryService historyService;
	@Autowired
	FormService formService;
	@Autowired
	IdentityService identityService;

	/**
	 * 取得当前任务的上一个任务节点定义id
	 * 
	 * （暂不支持前一个节点为并行任务的节点获取）
	 * 
	 * @param taskId
	 * @return
	 */
	public String[] getPreviousTaskDefinitionKey(String taskId) {
		TaskEntity task = (TaskEntity) taskService.createTaskQuery().taskId(taskId).singleResult();
		List<String> taskDefinitionKeyList = new ArrayList<>();

		// 取得上一任务的节点id

		// 查询历史任务
		List<HistoricTaskInstance> taskList = historyService.createHistoricTaskInstanceQuery()// 创建历史任务实例查询
				.processInstanceId(task.getProcessInstanceId())//
				.orderByTaskCreateTime().desc().list();
		if (taskList != null && taskList.size() > 1) {
			HistoricTaskInstance hti = taskList.get(1); // 取得前一个节点
			taskDefinitionKeyList.add(hti.getTaskDefinitionKey());
		}

		return taskDefinitionKeyList.toArray(new String[0]);

	}

	/**
	 * 将节点之后的节点删除然后指向新的节点。
	 * 
	 * @param actDefId
	 *            流程定义ID
	 * @param nodeId
	 *            流程节点ID
	 * @param aryDestination
	 *            需要跳转的节点
	 * @return Map<String,Object> 返回节点和需要恢复节点的集合。
	 */
	@SuppressWarnings("unchecked")
	private Map<String, Object> prepare(String actDefId, String nodeId, String[] aryDestination) {
		Map<String, Object> map = new HashMap<String, Object>();

		// 修改流程定义
		ProcessDefinitionEntity processDefinition = (ProcessDefinitionEntity) repositoryService.getProcessDefinition(actDefId);

		ActivityImpl curAct = processDefinition.findActivity(nodeId);
		List<PvmTransition> outTrans = curAct.getOutgoingTransitions();
		try {
			List<PvmTransition> cloneOutTrans = new ArrayList<>();
			cloneOutTrans.addAll(outTrans);
			map.put("outTrans", cloneOutTrans);
		} catch (Exception ex) {

		}

		/**
		 * 解决通过选择自由跳转指向同步节点导致的流程终止的问题。 在目标节点中删除指向自己的流转。
		 */
		for (Iterator<PvmTransition> it = outTrans.iterator(); it.hasNext();) {
			PvmTransition transition = it.next();
			PvmActivity activity = transition.getDestination();
			List<PvmTransition> inTrans = activity.getIncomingTransitions();
			for (Iterator<PvmTransition> itIn = inTrans.iterator(); itIn.hasNext();) {
				PvmTransition inTransition = itIn.next();
				if (inTransition.getSource().getId().equals(curAct.getId())) {
					itIn.remove();
				}
			}
		}

		curAct.getOutgoingTransitions().clear();

		if (aryDestination != null && aryDestination.length > 0) {
			for (String dest : aryDestination) {
				// 创建一个连接
				ActivityImpl destAct = processDefinition.findActivity(dest);
				TransitionImpl transitionImpl = curAct.createOutgoingTransition();
				transitionImpl.setDestination(destAct);
			}
		}

		map.put("activity", curAct);

		return map;

	}

	/**
	 * 将临时节点清除掉，加回原来的节点。
	 * 
	 * @param map
	 *            void
	 */
	@SuppressWarnings("unchecked")
	private void restore(Map<String, Object> map) {
		ActivityImpl curAct = (ActivityImpl) map.get("activity");
		List<PvmTransition> outTrans = (List<PvmTransition>) map.get("outTrans");
		curAct.getOutgoingTransitions().clear();
		curAct.getOutgoingTransitions().addAll(outTrans);
	}

	/**
	 * 回退到前一个执行过的流程节点上
	 * 
	 * @param taskId
	 */
	public void rollbackPreviousTask(String taskId, Map<String, String[]> map) {
		Map<String, String> formParams = new HashMap<String, String>();
		List<FormProperty> formLists = formService.getTaskFormData(taskId).getFormProperties();
		if (formLists != null && formLists.size() > 0) {
			for (FormProperty formProperty : formLists) {
				try {
					formParams.put(formProperty.getId(), BeanUtils.getProperty(map, "fp_" + formProperty.getId()));
				} catch (IllegalAccessException | InvocationTargetException | NoSuchMethodException e) {
					e.printStackTrace();
				}
			}
		}
		formService.saveFormData(taskId, formParams);

		String[] destNodeIds = getPreviousTaskDefinitionKey(taskId);

		rollback(taskId, destNodeIds, map);

	}

	/**
	 * 回退到已经执行过的流程的任意节点上
	 * 
	 * @param taskId
	 * @param destNodeIds
	 *            要回退到的任务id列表（一般仅有一个）
	 */
	public void rollback(String taskId, String[] destNodeIds, Map<String, String[]> map) {
		TaskEntity task = (TaskEntity) taskService.createTaskQuery().taskId(taskId).singleResult();
		// 取得上一次的节点id
		String curNodeId = task.getTaskDefinitionKey();
		String actDefId = task.getProcessDefinitionId();
		Map<String, Object> activityMap = prepare(actDefId, curNodeId, destNodeIds);
		try {
			taskService.complete(taskId);

		} catch (Exception ex) {
			throw new RuntimeException(ex);
		} finally {
			// 恢复
			restore(activityMap);
		}

	}

}
