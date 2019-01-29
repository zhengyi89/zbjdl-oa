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
	private String userName;
	/**
	 * 验证码
	 */
	private String password;

	/**
	 * 手机号
	 */
	private String mobile;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

}
