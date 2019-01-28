package com.zbjdl.oa.wx.util.dto;

/**
 * 所有接口调用的父类，用户提供调用失败的统一属性
 * 
 * @since 2014-12-21 11:57:20
 */
public class BaseAPIDto {
	/**
	 * 获取access_token时AppSecret错误，或者access_token无效
	 */
	public static final String ERROR_INVALID = "40001";
	
	private String errcode;
	private String errmsg;
	public String getErrcode() {
		return errcode;
	}
	public void setErrcode(String errcode) {
		this.errcode = errcode;
	}
	public String getErrmsg() {
		return errmsg;
	}
	public void setErrmsg(String errmsg) {
		this.errmsg = errmsg;
	}
}
