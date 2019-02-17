/*
 * Powered By zbjdl-code-generator
 * Web Site: http://www.zbjdl.com
 * Since 2018 - 2022
 */

package com.zbjdl.oa.service;

import java.util.List;

import com.zbjdl.oa.dto.OrderInfoDto;
import com.zbjdl.oa.dto.OrderWithUserInfoDto;
import com.zbjdl.oa.dto.request.ReportBaseReqDto;
import com.zbjdl.oa.dto.response.BussAnalyzeReportRespDto;
import com.zbjdl.oa.dto.response.OrderSummaryReportRespDto;

public interface OrderInfoService {
	Integer saveOrUpdate(OrderInfoDto orderInfoSaveReqDto);

	OrderInfoDto selectById(Long id);

	List<OrderInfoDto> findList(OrderInfoDto orderInfoDto);

	List<OrderWithUserInfoDto> findListWithUser(OrderInfoDto orderInfoDto);

	List<OrderSummaryReportRespDto> findOrderSummaryReport(String date);

	List<BussAnalyzeReportRespDto> findBussAnalyzeReport(ReportBaseReqDto dto);

}
