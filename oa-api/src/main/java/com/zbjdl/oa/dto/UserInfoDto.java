/*
 * Powered By zbjdl-code-generator
 * Web Site: http://www.zbjdl.com
 * Since 2018 - 2022
 */

package com.zbjdl.oa.dto;

import java.io.Serializable;

/**
 * UserInfoDto
 * 
 * @author code-generator
 *
 */
public class UserInfoDto implements Serializable {
	private static final long serialVersionUID = 1L;

	private java.lang.Long id;
	private java.lang.String jobNo;
	private java.lang.String userName;
	private java.lang.String mobile;
	private java.lang.String password;
	private java.lang.String region;
	private java.lang.String city;
	private java.lang.String duty;
	private java.lang.String status;
	private java.util.Date createTime;
	private java.util.Date lastUpdateTime;
	private java.lang.Long bossUserId;
	private java.lang.Boolean isAdmin;

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
	 * 工号
	 * 
	 * @param jobNo
	 */
	public void setJobNo(java.lang.String jobNo) {
		this.jobNo = jobNo;
	}

	/**
	 * 工号
	 * 
	 * @return
	 */
	public java.lang.String getJobNo() {
		return this.jobNo;
	}

	/**
	 * 用户名
	 * 
	 * @param userName
	 */
	public void setUserName(java.lang.String userName) {
		this.userName = userName;
	}

	/**
	 * 用户名
	 * 
	 * @return
	 */
	public java.lang.String getUserName() {
		return this.userName;
	}

	/**
	 * 手机号
	 * 
	 * @param mobile
	 */
	public void setMobile(java.lang.String mobile) {
		this.mobile = mobile;
	}

	/**
	 * 手机号
	 * 
	 * @return
	 */
	public java.lang.String getMobile() {
		return this.mobile;
	}

	/**
	 * 
	 * @param password
	 */
	public void setPassword(java.lang.String password) {
		this.password = password;
	}

	/**
	 * 
	 * @return
	 */
	public java.lang.String getPassword() {
		return this.password;
	}

	/**
	 * 区域
	 * 
	 * @param region
	 */
	public void setRegion(java.lang.String region) {
		this.region = region;
	}

	/**
	 * 区域
	 * 
	 * @return
	 */
	public java.lang.String getRegion() {
		return this.region;
	}

	/**
	 * 地区
	 * 
	 * @param city
	 */
	public void setCity(java.lang.String city) {
		this.city = city;
	}

	/**
	 * 地区
	 * 
	 * @return
	 */
	public java.lang.String getCity() {
		return this.city;
	}

	/**
	 * 职务
	 * 
	 * @param duty
	 */
	public void setDuty(java.lang.String duty) {
		this.duty = duty;
	}

	/**
	 * 职务
	 * 
	 * @return
	 */
	public java.lang.String getDuty() {
		return this.duty;
	}

	/**
	 * 状态
	 * 
	 * @param status
	 */
	public void setStatus(java.lang.String status) {
		this.status = status;
	}

	/**
	 * 状态
	 * 
	 * @return
	 */
	public java.lang.String getStatus() {
		return this.status;
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

	/**
	 * boss系统用户id
	 * 
	 * @param bossUserId
	 */
	public void setBossUserId(java.lang.Long bossUserId) {
		this.bossUserId = bossUserId;
	}

	/**
	 * boss系统用户id
	 * 
	 * @return
	 */
	public java.lang.Long getBossUserId() {
		return this.bossUserId;
	}

	public java.lang.Boolean getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(java.lang.Boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

}