/*
 * Powered By zbjdl-code-generator
 * Web Site: http://www.zbjdl.com
 * Since 2018 - 2022
 */

package com.zbjdl.oa.repository;

import java.util.List;

import com.zbjdl.common.respository.mybatis.GenericRepository;
import com.zbjdl.oa.dto.OrderWithUserInfoDto;
import com.zbjdl.oa.dto.request.ReportBaseReqDto;
import com.zbjdl.oa.dto.response.BussAnalyzeReportRespDto;
import com.zbjdl.oa.dto.response.OrderSummaryReportRespDto;
import com.zbjdl.oa.dto.response.SalePerformanceReportRespDto;
import com.zbjdl.oa.model.OrderInfo;

import org.springframework.stereotype.Repository;

/**
 * OrderInfo
 * 
 * @author code-generator
 *
 */
@Repository
public interface OrderInfoRepository extends GenericRepository {

	List<OrderWithUserInfoDto> findListWithUser(OrderInfo orderInfo);

	List<OrderSummaryReportRespDto> findOrderSummaryReport(String date);

	List<BussAnalyzeReportRespDto> findBussAnalyzeReport(ReportBaseReqDto dto);

	List<SalePerformanceReportRespDto> findSalePerformanceReport(ReportBaseReqDto dto);

}