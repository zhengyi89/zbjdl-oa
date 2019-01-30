/*
 * Powered By zbjdl-code-generator
 * Web Site: http://www.zbjdl.com
 * Since 2018 - 2022
 */

package com.zbjdl.oa.service;

import java.util.List;

import com.zbjdl.oa.dto.UserInfoDto;

public interface UserInfoService {
	Integer save(UserInfoDto userInfoSaveReqDto);

	Integer update(UserInfoDto userInfoSaveReqDto);

	UserInfoDto selectById(Long id);

	List<UserInfoDto> findList(UserInfoDto userInfoDto);

	UserInfoDto login(String username, String password);

}
