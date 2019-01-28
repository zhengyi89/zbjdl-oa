package com.zbjdl.oa;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.activiti.engine.FormService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.zbjdl.oa.RansomfloorWebApplication;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = RansomfloorWebApplication.class)
@WebAppConfiguration
public class ActivitiTests {

	private final String PROCESS_KEY = "ransomfloor_process";

	@Autowired
	RuntimeService runtimeService;
	
	@Autowired
	FormService formService;

	@Autowired
	IdentityService identityService;
	@Autowired
	TaskService taskService;

	@Test
	public void startProcessInstanceByKey() {
		Map<String, Object> params = new HashMap<String, Object>();
		String businessKey = String.valueOf(System.currentTimeMillis());
		// 使用runtimeService启动流程实例
		params.put("businessKey", businessKey);
		params.put("jieyanAmount", 10000L);
		params.put("businessType", "cash");
		params.put("isSpecialBusiness", "true");

		// 经办员创建流程
		String userId = "ztdb001";
		identityService.setAuthenticatedUserId(userId);

		ProcessInstance processInstance = runtimeService.startProcessInstanceByKey(PROCESS_KEY, businessKey, params);

		assertNotNull(processInstance.getId());
		System.out.println("id " + processInstance.getId() + " " + processInstance.getProcessDefinitionId());
	}

	@Test
	public void testTaskList() {
		//业务审核员
//		String userId = "ztdb002";
		//风控
		String userId = "ztdb003";
		identityService.setAuthenticatedUserId(userId);

		// 根据当前人的ID查询
		List<Task> tasks = taskService.createTaskQuery().taskCandidateOrAssigned(userId).orderByTaskCreateTime()
				.orderByProcessInstanceId().desc().list();
		assertNotNull(tasks);
		assertTrue(!tasks.isEmpty());
		for (Task task : tasks) {
			try {
				String processInstanceId = task.getProcessInstanceId();
				ProcessInstance processInstance = runtimeService.createProcessInstanceQuery()
						.processInstanceId(processInstanceId).active().singleResult();
				String businessKey = processInstance.getBusinessKey();
				System.out.println("#### "+businessKey+" " + processInstanceId +" " +task.getId()+" " +task.getName());
				
				if (businessKey == null) {
					continue;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
	}
	@Test
	public void testAllTaskList() {

		// 根据当前人的ID查询
		List<Task> tasks = taskService.createTaskQuery().orderByTaskCreateTime()
				.orderByProcessInstanceId().desc().list();
		assertNotNull(tasks);
		assertTrue(!tasks.isEmpty());
		for (Task task : tasks) {
			try {
				String processInstanceId = task.getProcessInstanceId();
				ProcessInstance processInstance = runtimeService.createProcessInstanceQuery()
						.processInstanceId(processInstanceId).active().singleResult();
				String businessKey = processInstance.getBusinessKey();
				System.out.println("#### "+businessKey+" " + processInstanceId +" " +task.getId()+" " +task.getName());
				
				if (businessKey == null) {
					continue;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
	}
	
	
	@Test
	public void testCompleteTask(){
		//业务审核员
		String userId = "ztdb002";
		String taskId = "2509";
		
		// 签收任务
		taskService.claim(taskId, userId);

		// 需要保存到流程变量的属性，定义在流程中的form表单数
		Map<String, String> formParams = new HashMap<String, String>();
		formParams.put("isApproved", "true");

		try {
			identityService.setAuthenticatedUserId(userId);
			formService.submitTaskFormData(taskId, formParams);
		} finally {
			identityService.setAuthenticatedUserId(null);
		}

		List<Task> tasks = taskService.createTaskQuery().taskCandidateOrAssigned(userId).taskId(taskId).orderByTaskCreateTime()
				.orderByProcessInstanceId().desc().list();
		assertTrue(tasks.isEmpty());
		
		
	}

}
