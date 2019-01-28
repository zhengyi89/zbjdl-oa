package com.zbjdl.oa.wx.controller.common.vo;

import java.io.Serializable;

/**
 * UserVO
 * 
 * 
 * @since 2014-9-10 11:54:34
 */
public class UserVo implements Serializable {
	private static final long serialVersionUID = 1L;
	/**
	 * 用户名
	 */
	private String mobile;
	/**
	 * 验证码
	 */
	private String code;

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
}
