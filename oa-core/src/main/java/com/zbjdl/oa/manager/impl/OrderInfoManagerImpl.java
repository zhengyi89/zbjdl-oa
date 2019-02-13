/*
 * Powered By zbjdl-code-generator
 * Web Site: http://www.zbjdl.com
 * Since 2018 - 2022
 */

package com.zbjdl.oa.manager.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zbjdl.oa.repository.OrderInfoRepository;
import com.zbjdl.oa.dto.OrderWithUserInfoDto;
import com.zbjdl.oa.dto.response.OrderSummaryReportRespDto;
import com.zbjdl.oa.manager.OrderInfoManager;
import com.zbjdl.oa.model.OrderInfo;

@Component
public class OrderInfoManagerImpl implements OrderInfoManager {
	
	@Autowired
	private OrderInfoRepository orderInfoRepository;
	
	@Override
	public Integer save(OrderInfo orderInfo) {
		return orderInfoRepository.save(orderInfo);
	}
	
	@Override
	public Integer update(OrderInfo orderInfo) {
		return orderInfoRepository.update(orderInfo);
	}
	
	@Override
	public OrderInfo selectById(Long id) {
		return orderInfoRepository.selectById(id);
	}
	
	@Override
	public List<OrderInfo> findList(OrderInfo orderInfo) {
		return orderInfoRepository.findList(orderInfo);
	}

	@Override
	public List<OrderWithUserInfoDto> findListWithUser(OrderInfo orderInfo) {
		return orderInfoRepository.findListWithUser(orderInfo);
	}

}

