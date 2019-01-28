package com.zbjdl.oa.wx.exception;

/**
 * 系统非法访问异常，没有正常获取到OpenId
 * 
 * 
 * @since 2014-9-10 19:41:46
 */
public class WxIllegalAccessException extends RuntimeException {
	private static final long serialVersionUID = 1L;

	public WxIllegalAccessException() {
		super();
	}

	public WxIllegalAccessException(String message) {
		super(message);
	}

	public WxIllegalAccessException(String message, Throwable cause) {
		super(message, cause);
	}

	public WxIllegalAccessException(Throwable cause) {
		super(cause);
	}
}
