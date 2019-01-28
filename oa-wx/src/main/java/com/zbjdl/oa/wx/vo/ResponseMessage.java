package com.zbjdl.oa.wx.vo;

/**
 * 响应消息
 *
 */
public class ResponseMessage {
	public static final String OK = "ok";
	public static final String FAIL = "fail";
	public static final String ERROR = "error";
	
	private String status;

	private String message;

	public ResponseMessage(String message) {
		this.message = message;
	}

	public ResponseMessage(String status, String message) {
		this.status = status;
		this.message = message;
	}

	public static ResponseMessage getOk(String message){
		return new ResponseMessage(OK , message);
	} 

	public static ResponseMessage getError(String message){
		return new ResponseMessage(ERROR , message);
	} 

	public static ResponseMessage getFail(String message){
		return new ResponseMessage(FAIL , message);
	} 
	
	public String getStatus() {
		return status;
	}

	public String getMessage() {
		return message;
	}

}
