/*
∫ * Powered By zbjdl-code-generator
 * Web Site: http://www.zbjdl.com
 * Since 2018 - 2022
 */

package com.zbjdl.oa.dto.response;

import java.io.Serializable;

import com.zbjdl.common.amount.Amount;

/**
 * 
 * @author zhengy
 * @date: 2019年2月12日 上午11:26:20
 */
public class SalePerformanceReportRespDto implements Serializable {
	private static final long serialVersionUID = 1L;

	private Long userId;
	private String city;
	private String userName;
	private String orderDate;
	private Amount targetAmount;
	private Amount profitAmount;

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public Amount getTargetAmount() {
		return targetAmount;
	}

	public void setTargetAmount(Amount targetAmount) {
		this.targetAmount = targetAmount;
	}

	public Amount getProfitAmount() {
		return profitAmount;
	}

	public void setProfitAmount(Amount profitAmount) {
		this.profitAmount = profitAmount;
	}

}