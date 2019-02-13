/*
 * Powered By zbjdl-code-generator
 * Web Site: http://www.zbjdl.com
 * Since 2018 - 2022
 */

package com.zbjdl.oa.service;

import java.util.List;

import com.zbjdl.oa.dto.TargetInfoDto;
import com.zbjdl.oa.dto.TargetWithUserInfoDto;

public interface TargetInfoService {

	Integer saveOrUpdate(TargetInfoDto targetInfoDto);

	TargetInfoDto selectById(Long id);

	List<TargetInfoDto> findList(TargetInfoDto targetInfoDto);

	List<TargetWithUserInfoDto> findListWithUserByCity(String city);

	void monthInit(String targetMonth, String city, String userId);

}
