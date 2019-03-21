/*
 * Powered By zbjdl-code-generator
 * Web Site: http://www.zbjdl.com
 * Since 2018 - 2022
 */

package com.zbjdl.oa.dto.request;

import java.io.Serializable;

/**
 * OrderInfoDto
 * 
 * @author code-generator
 *
 */
public class ReportBaseReqDto implements Serializable {
	private static final long serialVersionUID = 1L;

	private java.lang.Long userId;
	private java.lang.String city;
	private java.lang.String date;

	public java.lang.Long getUserId() {
		return userId;
	}

	public void setUserId(java.lang.Long userId) {
		this.userId = userId;
	}

	public java.lang.String getCity() {
		return city;
	}

	public void setCity(java.lang.String city) {
		this.city = city;
	}

	public java.lang.String getDate() {
		return date;
	}

	public void setDate(java.lang.String date) {
		this.date = date;
	}

}