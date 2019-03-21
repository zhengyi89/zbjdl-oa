/*
 * Powered By zbjdl-code-generator
 * Web Site: http://www.zbjdl.com
 * Since 2018 - 2022
 */

package com.zbjdl.oa.service;

import java.util.List;

import com.zbjdl.oa.dto.CommonReportInfoDto;
import com.zbjdl.oa.dto.CommonReportWithUserDto;
import com.zbjdl.oa.dto.request.CommonReportQueryReqDto;
import com.zbjdl.oa.dto.request.ReportBaseReqDto;

public interface CommonReportInfoService {
	Integer saveOrUpdate(CommonReportInfoDto commonReportInfoDto);

	CommonReportInfoDto selectById(Long id);

	List<CommonReportInfoDto> findList(CommonReportInfoDto commonReportInfoDto);

	List<CommonReportWithUserDto> findReport(CommonReportQueryReqDto reqDto);

	CommonReportInfoDto selectOneByDate(String type, String userId, String date);

}
