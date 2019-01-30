package com.zbjdl.oa.dto.resp;

import java.io.Serializable;

import com.zbjdl.oa.enumtype.ReturnEnum;

@SuppressWarnings("serial")
public class BaseRespDto implements Serializable {

	protected String code; // 状态码

	protected String msg; // 描述

	public BaseRespDto() {
	};

	public BaseRespDto(String code) {
		this.code = code;
	}

	public BaseRespDto(String code, String msg) {
		this.code = code;
		this.msg = msg;
	}

	public BaseRespDto(ReturnEnum returnEnum) {
		this.code = returnEnum.getCode();
		this.msg = returnEnum.getMsg();
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

}