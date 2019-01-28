package com.zbjdl.oa.enumtype;

/**
 * 短信发送状态
 * 
 * @author MengXiangChao
 * @date 2016年7月15日 上午10:31:36
 */
public enum SmsStateEnum {

	/**
	 * 成功
	 */
	SMSSTATE_SUCC("SUCC", "成功"),
	/**
	 * 失败
	 */
	SMSSTATE_FAILURE("FAILURE", "失败");

	/**
	 * 判断enum值是否合法
	 * 
	 * @param code
	 * @return
	 */
	public static boolean isEnum(String code) {
		SmsStateEnum[] items = SmsStateEnum.values();
		for (SmsStateEnum item : items) {
			if (item.name().equals(code)) {
				return true;
			}
		}
		return false;
	}

	private SmsStateEnum(String code, String msg) {
		this.code = code;
		this.msg = msg;
	}

	private String code;
	private String msg;

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
