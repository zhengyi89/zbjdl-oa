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
	String BIND = "type=bind";
	/**
	 * 进度查询
	 */
	String SHOW_FLOW = "type=flow_show";
	/**
	 * 关于赎楼
	 */
	String ABOUT = "type=about";
	/**
	 * 赎楼列表
	 */
	String FLOW_LIST = "type=oa_list";

	/**
	 * 业务需求买房
	 */
	String BUSS_DEMAND_BUY = "type=bussDemandBuy";

	/**
	 * 业务需求卖房
	 */
	String BUSS_DEMAND_SELL = "type=bussDemandSell";

	/**
	 * 付款明细
	 */
	String PAY = "type=pay";

	/**
	 * 置业顾问
	 */
	String ADVISER = "type=adviser";
	
	/**
	 * 贷款产品
	 */
	String LOAN_PRODUCT = "type=product";

}
