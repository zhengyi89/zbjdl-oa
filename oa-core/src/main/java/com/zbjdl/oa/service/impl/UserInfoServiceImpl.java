/*
 * Powered By zbjdl-code-generator
 * Web Site: http://www.zbjdl.com
 * Since 2018 - 2022
 */

package com.zbjdl.oa.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zbjdl.common.utils.BeanUtils;
import com.zbjdl.oa.manager.UserInfoManager;
import com.zbjdl.oa.service.UserInfoService;
import com.zbjdl.oa.model.UserInfo;
import com.zbjdl.oa.dto.UserInfoDto;

@Service("userInfoService")
public class UserInfoServiceImpl implements UserInfoService {

	@Autowired
	private UserInfoManager userInfoManager;

	@Override
	public Integer save(UserInfoDto userInfoDto) {
		UserInfo userInfo = new UserInfo();
		BeanUtils.copyProperties(userInfoDto, userInfo);
		return userInfoManager.save(userInfo);
	}

	@Override
	public Integer update(UserInfoDto userInfoDto) {
		UserInfo userInfo = userInfoManager.selectById(userInfoDto.getId());
		BeanUtils.copyProperties(userInfoDto, userInfo);
		return userInfoManager.update(userInfo);
	}

	@Override
	public UserInfoDto selectById(Long id) {
		UserInfo userInfo = userInfoManager.selectById(id);
		UserInfoDto userInfoDto = new UserInfoDto();
		if (userInfo == null) {
			return null;
		}
		BeanUtils.copyProperties(userInfo, userInfoDto);
		return userInfoDto;
	}

	@Override
	public List<UserInfoDto> findList(UserInfoDto userInfoDto) {
		UserInfo userInfo = new UserInfo();
		BeanUtils.copyProperties(userInfoDto, userInfo);
		List<UserInfo> userInfoList = userInfoManager.findList(userInfo);

		List<UserInfoDto> userInfoDtoList = new ArrayList<UserInfoDto>();
		for (UserInfo dto : userInfoList) {
			UserInfoDto respDto = new UserInfoDto();
			BeanUtils.copyProperties(dto, respDto);
			userInfoDtoList.add(respDto);
		}
		return userInfoDtoList;
	}

	@Override
	public UserInfoDto login(String username, String password) {
		UserInfoDto userInfo = new UserInfoDto();
		userInfo.setUserName(username);
		userInfo.setPassword(password);
		List<UserInfoDto> list = this.findList(userInfo);
		return list == null || list.size() < 1 ? null : list.get(0);
	}

}
