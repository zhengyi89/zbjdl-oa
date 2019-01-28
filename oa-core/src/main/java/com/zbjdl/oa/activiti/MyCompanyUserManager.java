package com.zbjdl.oa.activiti;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.activiti.engine.ActivitiException;
import org.activiti.engine.ActivitiIllegalArgumentException;
import org.activiti.engine.identity.Group;
import org.activiti.engine.identity.Picture;
import org.activiti.engine.identity.User;
import org.activiti.engine.identity.UserQuery;
import org.activiti.engine.impl.Page;
import org.activiti.engine.impl.UserQueryImpl;
import org.activiti.engine.impl.context.Context;
import org.activiti.engine.impl.persistence.entity.IdentityInfoEntity;
import org.activiti.engine.impl.persistence.entity.UserEntity;
import org.activiti.engine.impl.persistence.entity.UserEntityManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zbjdl.boss.admin.facade.SecurityConfigFacade;
import com.zbjdl.boss.admin.facade.UserFacade;
import com.zbjdl.boss.admin.user.dto.UserDTO;

/**
 * 自定义Activiti User Manager
 * 
 * 使用公司的人员权限模型
 * 
 * @author yejiyong
 *
 */
@Service
public class MyCompanyUserManager extends UserEntityManager {

	private static Logger logger = LoggerFactory.getLogger(MyCompanyUserManager.class);

	@Autowired
	private UserFacade userFacade;

	@Override
	public User createNewUser(String userId) {
		throw new ActivitiException("user manager doesn't support creating a new user");
	}

	@Override
	public void insertUser(User user) {
		throw new ActivitiException("user manager doesn't support inserting a new user");
	}

	@Override
	public void updateUser(User updatedUser) {
		throw new ActivitiException("user manager doesn't support updating a user");
	}

	@Override
	public boolean isNewUser(User user) {
		throw new ActivitiException("user manager doesn't support adding or updating a user");
	}

	@Override
	public UserEntity findUserById(final String userId) {
		logger.info("+++++++++++++++++++MyCompanyUserManager with userId: " + userId);
		UserEntity userEntity = new UserEntity();
		// UserDTO user = userFacade.queryUserById(Long.parseLong(userId));

		UserDTO user = userFacade.queryUserByLoginName(userId);

		userEntity.setEmail(user.getEmail());
		userEntity.setFirstName(user.getUserName());
//		userEntity.setLastName(user.getUserName());
		userEntity.setId(user.getLoginName());

		return userEntity;
	}

	@Override
	public void deleteUser(String userId) {
		throw new ActivitiException("user manager doesn't support deleting a user");
	}

	@Override
	public List<User> findUserByQueryCriteria(final UserQueryImpl query, final Page page) {

		if (query.getId() != null) {
			List<User> result = new ArrayList<User>();
			result.add(findUserById(query.getId()));
			return result;
		} else if (query.getFullNameLike() != null) {

			final String fullNameLike = query.getFullNameLike().replaceAll("%", "");
			// TODO
			return null;

		} else {
			throw new ActivitiIllegalArgumentException("Query is currently not supported by UserManager.");
		}

	}

	@Override
	public long findUserCountByQueryCriteria(UserQueryImpl query) {
		return findUserByQueryCriteria(query, null).size(); // Is there a
															// generic way to do
															// counts in ldap?
	}

	@Override
	public List<Group> findGroupsByUser(String userId) {
		throw new ActivitiException("user manager doesn't support querying");
	}

	@Override
	public UserQuery createNewUserQuery() {
		return new UserQueryImpl(Context.getProcessEngineConfiguration().getCommandExecutor());
	}

	@Override
	public IdentityInfoEntity findUserInfoByUserIdAndKey(String userId, String key) {
		throw new ActivitiException("user manager doesn't support querying");
	}

	@Override
	public List<String> findUserInfoKeysByUserIdAndType(String userId, String type) {
		throw new ActivitiException("user manager doesn't support querying");
	}

	@Override
	public List<User> findPotentialStarterUsers(String proceDefId) {
		throw new ActivitiException("user manager doesn't support querying");
	}

	@Override
	public List<User> findUsersByNativeQuery(Map<String, Object> parameterMap, int firstResult, int maxResults) {
		throw new ActivitiException("user manager doesn't support querying");
	}

	@Override
	public long findUserCountByNativeQuery(Map<String, Object> parameterMap) {
		throw new ActivitiException("user manager doesn't support querying");
	}

	@Override
	public void setUserPicture(String userId, Picture picture) {
		throw new ActivitiException("user manager doesn't support user pictures");
	}

	@Override
	public Picture getUserPicture(String userId) {
		logger.debug("user manager doesn't support user pictures. Returning null");
		return null;
	}

	@Override
	public Boolean checkPassword(final String userId, final String password) {

		// Extra password check, see http://forums.activiti.org/comment/22312
		if (password == null || password.length() == 0) {
			throw new ActivitiException("Null or empty passwords are not allowed!");
		}

		try {
			// TODO
			return true;

		} catch (ActivitiException e) {
			logger.info("Could not authenticate user : " + e);
			return false;
		}
	}

}