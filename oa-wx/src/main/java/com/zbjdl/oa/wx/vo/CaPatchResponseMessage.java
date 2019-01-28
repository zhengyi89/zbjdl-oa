package com.zbjdl.oa.wx.vo;


/**
 * 验证码返回Vo
 */
public class CaPatchResponseMessage extends ResponseMessage{
	//是否需要展示验证码
	private int isCp = 0;
	
	public CaPatchResponseMessage(String status , String message) {
		super(status , message);
	}

	public CaPatchResponseMessage(String status , String message, int errorCount) {
		super(status , message);
		if(errorCount == 3){
			this.isCp = 1;
		}
	}

	public int getIsCp() {
		return isCp;
	}

	public void setIsCp(int isCp) {
		this.isCp = isCp;
	}
	
}
