/*
 * Powered By zbjdl-code-generator
 * Web Site: http://www.zbjdl.com
 * Since 2018 - 2022
 */

package com.zbjdl.oa.service;

import java.util.List;

import com.zbjdl.oa.dto.OrderInfoDto;

public interface OrderInfoService {
	Integer saveOrUpdate(OrderInfoDto orderInfoSaveReqDto);

	OrderInfoDto selectById(Long id);
	
	List<OrderInfoDto> findList(OrderInfoDto orderInfoDto);
	
}
