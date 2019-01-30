/*
 * Powered By zbjdl-code-generator
 * Web Site: http://www.zbjdl.com
 * Since 2018 - 2022
 */

package com.zbjdl.oa.manager;

import java.util.List;

import com.zbjdl.oa.model.UserInfo;

public interface UserInfoManager {

	Integer save(UserInfo userInfo);
	
	Integer update(UserInfo userInfo);
	
	UserInfo selectById(Long id);
	
	List<UserInfo> findList(UserInfo userInfo);
	
}
