/*
 * Powered By zbjdl-code-generator
 * Web Site: http://www.zbjdl.com
 * Since 2018 - 2022
 */

package com.zbjdl.oa.model;

/**
 * TargetInfo
 * @author code-generator
 *
 */
public class TargetInfo {
	
	private java.lang.Long id;
	private java.lang.Long userId;
	private com.zbjdl.common.amount.Amount targetAmount;
	private java.lang.String targetMonth;
	private java.lang.String assignId;
	private java.util.Date createTime;
	private java.util.Date lastUpdateTime;

	/**
	 * @param id
	 */
	public void setId(Long id) {
		this.id = id;
	}
	
	/**
	 * @return
	 */
	public Long getId() {
		return this.id;
	}
	/**
	 * 员工id
	 * @param userId
	 */
	public void setUserId(java.lang.Long userId) {
		this.userId = userId;
	}
	
	/**
	 * 员工id
	 * @return
	 */
	public java.lang.Long getUserId() {
		return this.userId;
	}
	/**
	 * 销售目标
	 * @param targetAmount
	 */
	public void setTargetAmount(com.zbjdl.common.amount.Amount targetAmount) {
		this.targetAmount = targetAmount;
	}
	
	/**
	 * 销售目标
	 * @return
	 */
	public com.zbjdl.common.amount.Amount getTargetAmount() {
		return this.targetAmount;
	}
	/**
	 * 目标月份
	 * @param targetMonth
	 */
	public void setTargetMonth(java.lang.String targetMonth) {
		this.targetMonth = targetMonth;
	}
	
	/**
	 * 目标月份
	 * @return
	 */
	public java.lang.String getTargetMonth() {
		return this.targetMonth;
	}
	/**
	 * 委派人id
	 * @param assignId
	 */
	public void setAssignId(java.lang.String assignId) {
		this.assignId = assignId;
	}
	
	/**
	 * 委派人id
	 * @return
	 */
	public java.lang.String getAssignId() {
		return this.assignId;
	}
	/**
	 * 
	 * @param createTime
	 */
	public void setCreateTime(java.util.Date createTime) {
		this.createTime = createTime;
	}
	
	/**
	 * 
	 * @return
	 */
	public java.util.Date getCreateTime() {
		return this.createTime;
	}
	/**
	 * 
	 * @param lastUpdateTime
	 */
	public void setLastUpdateTime(java.util.Date lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}
	
	/**
	 * 
	 * @return
	 */
	public java.util.Date getLastUpdateTime() {
		return this.lastUpdateTime;
	}
}