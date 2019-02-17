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
import com.zbjdl.oa.manager.OrderInfoManager;
import com.zbjdl.oa.repository.OrderInfoRepository;
import com.zbjdl.oa.service.OrderInfoService;
import com.zbjdl.oa.model.OrderInfo;
import com.zbjdl.oa.dto.OrderInfoDto;
import com.zbjdl.oa.dto.OrderWithUserInfoDto;
import com.zbjdl.oa.dto.request.ReportBaseReqDto;
import com.zbjdl.oa.dto.response.BussAnalyzeReportRespDto;
import com.zbjdl.oa.dto.response.OrderSummaryReportRespDto;

@Service("orderInfoService")
public class OrderInfoServiceImpl implements OrderInfoService {
	
	@Autowired
	private OrderInfoManager orderInfoManager;
	
	@Autowired
	private OrderInfoRepository orderInfoRepository;
	
	@Override
	public Integer saveOrUpdate(OrderInfoDto orderInfoDto) {
		if (orderInfoDto.getId()!=null) {
			OrderInfo orderInfo = orderInfoManager.selectById(orderInfoDto.getId());
			BeanUtils.copyProperties(orderInfoDto, orderInfo);
			return orderInfoManager.update(orderInfo);
		}else {
			OrderInfo orderInfo = new OrderInfo();
			BeanUtils.copyProperties(orderInfoDto, orderInfo);
			return orderInfoManager.save(orderInfo);
		}
	}
	
	@Override
	public OrderInfoDto selectById(Long id) {
		OrderInfo orderInfo = orderInfoManager.selectById(id);
		OrderInfoDto orderInfoDto = new OrderInfoDto();
		BeanUtils.copyProperties(orderInfo, orderInfoDto);
		return orderInfoDto;
	}
	
	@Override
	public List<OrderInfoDto> findList(OrderInfoDto orderInfoDto) {
		OrderInfo orderInfo = new OrderInfo();
		BeanUtils.copyProperties(orderInfoDto, orderInfo);
		List<OrderInfo> orderInfoList = orderInfoManager.findList(orderInfo);
		
		List<OrderInfoDto> orderInfoDtoList = new ArrayList<OrderInfoDto>();
		for(OrderInfo dto : orderInfoList){
			OrderInfoDto respDto = new OrderInfoDto();
			BeanUtils.copyProperties(dto, respDto);
			orderInfoDtoList.add(respDto);
		}
		return orderInfoDtoList;
	}

	@Override
	public List<OrderWithUserInfoDto> findListWithUser(OrderInfoDto orderInfoDto) {
		OrderInfo orderInfo = new OrderInfo();
		BeanUtils.copyProperties(orderInfoDto, orderInfo);
		return orderInfoManager.findListWithUser(orderInfo);
	}

	@Override
	public List<OrderSummaryReportRespDto> findOrderSummaryReport(String date) {
		return orderInfoRepository.findOrderSummaryReport(date);
	}

	@Override
	public List<BussAnalyzeReportRespDto> findBussAnalyzeReport(ReportBaseReqDto dto) {
		return orderInfoRepository.findBussAnalyzeReport(dto);
	}
	
}

