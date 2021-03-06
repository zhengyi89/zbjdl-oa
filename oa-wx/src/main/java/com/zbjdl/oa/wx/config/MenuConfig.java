package com.zbjdl.oa.wx.config;

/**
 * 菜单类型
 * 
 * @since 2014-9-17 23:40:32
 */
public interface MenuConfig {
	/**
	 * 账号绑定
	 */
	String LOGIN = "type=login";
	/**
	 * 解绑
	 */
	String UNBIND = "type=unbind";
	/**
	 * 创建订单
	 */
	String ADD_ORDER = "type=addOrder";
	/**
	 * 每日商机
	 */
	String ADD_OPP = "type=addOpp";

	/**
	 * 首页
	 */
	String INDEX = "type=index";

	/**
	 * 外勤看板
	 */
	String OUTWORK1 = "type=outwork1";

	/**
	 * 外勤展板
	 */
	String OUTWORK2 = "type=outwork2";

}
