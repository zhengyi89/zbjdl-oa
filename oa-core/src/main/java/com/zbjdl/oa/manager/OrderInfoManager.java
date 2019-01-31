/*
 * Powered By zbjdl-code-generator
 * Web Site: http://www.zbjdl.com
 * Since 2018 - 2022
 */

package com.zbjdl.oa.manager;

import java.util.List;

import com.zbjdl.oa.model.OrderInfo;

public interface OrderInfoManager {

	Integer save(OrderInfo orderInfo);
	
	Integer update(OrderInfo orderInfo);
	
	OrderInfo selectById(Long id);
	
	List<OrderInfo> findList(OrderInfo orderInfo);
	
}
