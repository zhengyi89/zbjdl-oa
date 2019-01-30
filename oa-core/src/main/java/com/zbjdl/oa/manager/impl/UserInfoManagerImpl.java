/*
 * Powered By zbjdl-code-generator
 * Web Site: http://www.zbjdl.com
 * Since 2018 - 2022
 */

package com.zbjdl.oa.manager.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zbjdl.oa.repository.UserInfoRepository;
import com.zbjdl.oa.manager.UserInfoManager;
import com.zbjdl.oa.model.UserInfo;

@Component
public class UserInfoManagerImpl implements UserInfoManager {

	@Autowired
	private UserInfoRepository userInfoRepository;

	@Override
	public Integer save(UserInfo userInfo) {
		return userInfoRepository.save(userInfo);
	}

	@Override
	public Integer update(UserInfo userInfo) {
		return userInfoRepository.update(userInfo);
	}

	@Override
	public UserInfo selectById(Long id) {
		return userInfoRepository.selectById(id);
	}

	@Override
	public List<UserInfo> findList(UserInfo userInfo) {
		return userInfoRepository.findList(userInfo);
	}

}
