package com.zbjdl.oa.exception;

import com.zbjdl.common.exception.BaseException;

public class ParamValidateException extends BaseException{
	private String errorCode;

	public String getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}

	public ParamValidateException(String defineCode, String defineMsg,
			String message) {
		super(defineCode, defineMsg, message);
		this.errorCode = defineMsg;
		// TODO Auto-generated constructor stub
	}
	
	public ParamValidateException(String defineCode, String defineMsg) {
		super(defineCode, defineMsg);
		this.errorCode = defineMsg;
		// TODO Auto-generated constructor stub
	}
	
	public ParamValidateException(String defineCode) {
		super(defineCode);
		// TODO Auto-generated constructor stub
	}

}
