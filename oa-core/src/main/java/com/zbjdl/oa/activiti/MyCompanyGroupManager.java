package com.zbjdl.oa.activiti;

import java.util.ArrayList;
import java.util.List;

import org.activiti.engine.identity.Group;
import org.activiti.engine.impl.GroupQueryImpl;
import org.activiti.engine.impl.Page;
import org.activiti.engine.impl.persistence.entity.GroupEntity;
import org.activiti.engine.impl.persistence.entity.GroupEntityManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zbjdl.boss.admin.facade.SecurityConfigFacade;
import com.zbjdl.boss.admin.facade.UserFacade;
import com.zbjdl.boss.admin.role.dto.RoleDTO;
import com.zbjdl.boss.admin.user.dto.UserDTO;

/**
 * 自定义Activiti Group Manager
 * 
 * 使用公司的人员权限模型
 * 
 * @author yejiyong
 *
 */
@Service
public class MyCompanyGroupManager extends GroupEntityManager {

	private static Logger log = LoggerFactory.getLogger(MyCompanyGroupManager.class);

	@Autowired
	private SecurityConfigFacade securityConfigFacade;

	@Autowired
	private UserFacade userFacade;

	@Override
	public List<Group> findGroupsByUser(String userId) {

		log.info("+++++++++++++++++++MyCompanyGroupManager with userId: " + userId);

		List<Group> list = new ArrayList<>();

		UserDTO user = userFacade.queryUserByLoginName(userId);

		List<RoleDTO> roleDtoList = securityConfigFacade.queryRolesByUser(user.getUserId());

		if (roleDtoList != null && !roleDtoList.isEmpty()) {
			for (int i = 0; i < roleDtoList.size(); i++) {
				Group group = new GroupEntity();
				RoleDTO role = roleDtoList.get(i);
				group.setId(role.getRoleId().toString());
				group.setName(role.getRoleName());
				list.add(group);
			}
		}

		return list;
	}

	@Override
	public List<Group> findGroupByQueryCriteria(GroupQueryImpl query, Page page) {
		throw new UnsupportedOperationException();
	}

	@Override
	public long findGroupCountByQueryCriteria(GroupQueryImpl query) {
		throw new UnsupportedOperationException();
	}

	@Override
	public Group createNewGroup(String groupId) {
		throw new UnsupportedOperationException();
	}

	@Override
	public void deleteGroup(String groupId) {
		throw new UnsupportedOperationException();
	}
}