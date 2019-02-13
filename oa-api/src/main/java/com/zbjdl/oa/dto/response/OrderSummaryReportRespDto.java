/*
 * Powered By zbjdl-code-generator
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
public class OrderSummaryReportRespDto implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String city;
	private Amount dayAmount;
	private Amount monthAmount;
	private Amount targetAmount;
	private Amount unsellAmount;
	private Amount finishRate;
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public Amount getDayAmount() {
		return dayAmount;
	}
	public void setDayAmount(Amount dayAmount) {
		this.dayAmount = dayAmount;
	}
	public Amount getMonthAmount() {
		return monthAmount;
	}
	public void setMonthAmount(Amount monthAmount) {
		this.monthAmount = monthAmount;
	}
	public Amount getTargetAmount() {
		return targetAmount;
	}
	public void setTargetAmount(Amount targetAmount) {
		this.targetAmount = targetAmount;
	}
	public Amount getUnsellAmount() {
		return unsellAmount;
	}
	public void setUnsellAmount(Amount unsellAmount) {
		this.unsellAmount = unsellAmount;
	}
	public Amount getFinishRate() {
		return finishRate;
	}
	public void setFinishRate(Amount finishRate) {
		this.finishRate = finishRate;
	}
	
	
	
}