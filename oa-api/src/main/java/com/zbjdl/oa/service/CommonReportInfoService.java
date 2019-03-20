/*
 * Powered By zbjdl-code-generator
 * Web Site: http://www.zbjdl.com
 * Since 2018 - 2022
 */

package com.zbjdl.oa.service;

import java.util.List;

import com.zbjdl.oa.dto.CommonReportInfoDto;

public interface CommonReportInfoService {
	Integer saveOrUpdate(CommonReportInfoDto commonReportInfoDto);

	CommonReportInfoDto selectById(Long id);
	
	List<CommonReportInfoDto> findList(CommonReportInfoDto commonReportInfoDto);

	CommonReportInfoDto selectOneByDate(String type, String userId, String date);
	
}
