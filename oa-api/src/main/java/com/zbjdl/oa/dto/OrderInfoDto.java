/*
 * Powered By zbjdl-code-generator
 * Web Site: http://www.zbjdl.com
 * Since 2018 - 2022
 */

package com.zbjdl.oa.dto;

import java.io.Serializable;

import org.springframework.format.annotation.DateTimeFormat;

import com.zbjdl.common.amount.Amount;

/**
 * OrderInfoDto
 * 
 * @author code-generator
 *
 */
public class OrderInfoDto implements Serializable {
	private static final long serialVersionUID = 1L;

	private java.lang.Long id;
	private java.lang.Long userId;
	private java.lang.String city;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private java.util.Date orderDate;
	private java.lang.String productType;
	private java.lang.String customerType;
	private java.lang.String customerChannel;
	private java.lang.String productDetailType;
	private java.lang.String productContext;
	private java.lang.String productPackage;
	private java.lang.String serverDetails;
	private java.lang.String companyName;
	private java.lang.String customerName;
	private java.lang.String mobile;
	private com.zbjdl.common.amount.Amount orderSumAmount;
	private com.zbjdl.common.amount.Amount orderRealAmount;
	private com.zbjdl.common.amount.Amount orderRetailAmount;
	private com.zbjdl.common.amount.Amount cost1;
	private com.zbjdl.common.amount.Amount cost2;
	private com.zbjdl.common.amount.Amount cost3;
	private com.zbjdl.common.amount.Amount cost4;
	private com.zbjdl.common.amount.Amount cost5;
	private com.zbjdl.common.amount.Amount cost6;
	private com.zbjdl.common.amount.Amount cost7;
	private com.zbjdl.common.amount.Amount cost8;
	private com.zbjdl.common.amount.Amount cost9;
	private com.zbjdl.common.amount.Amount cost10;
	private com.zbjdl.common.amount.Amount costOther;
	private com.zbjdl.common.amount.Amount profitAmount;
	private com.zbjdl.common.amount.Amount profitAccount;
	private com.zbjdl.common.amount.Amount profitOther;
	private java.lang.String zbjId;
	private java.lang.String orderNo;
	private java.lang.String contractNo;
	private java.lang.String payChannel;

	/**
	 * @param id
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return
	 */
	public Long getId() {
		return this.id;
	}

	/**
	 * 员工id
	 * 
	 * @param userId
	 */
	public void setUserId(java.lang.Long userId) {
		this.userId = userId;
	}

	/**
	 * 员工id
	 * 
	 * @return
	 */
	public java.lang.Long getUserId() {
		return this.userId;
	}

	/**
	 * 订单时间
	 * 
	 * @param orderDate
	 */
	public void setOrderDate(java.util.Date orderDate) {
		this.orderDate = orderDate;
	}

	/**
	 * 订单时间
	 * 
	 * @return
	 */
	public java.util.Date getOrderDate() {
		return this.orderDate;
	}

	/**
	 * 
	 * @param productType
	 */
	public void setProductType(java.lang.String productType) {
		this.productType = productType;
	}

	/**
	 * 
	 * @return
	 */
	public java.lang.String getProductType() {
		return this.productType;
	}

	/**
	 * 客户类型
	 * 
	 * @param customerType
	 */
	public void setCustomerType(java.lang.String customerType) {
		this.customerType = customerType;
	}

	/**
	 * 客户类型
	 * 
	 * @return
	 */
	public java.lang.String getCustomerType() {
		return this.customerType;
	}

	/**
	 * 获客渠道
	 * 
	 * @param customerChannel
	 */
	public void setCustomerChannel(java.lang.String customerChannel) {
		this.customerChannel = customerChannel;
	}

	/**
	 * 获客渠道
	 * 
	 * @return
	 */
	public java.lang.String getCustomerChannel() {
		return this.customerChannel;
	}

	/**
	 * 产品细分
	 * 
	 * @param productDetailType
	 */
	public void setProductDetailType(java.lang.String productDetailType) {
		this.productDetailType = productDetailType;
	}

	/**
	 * 产品细分
	 * 
	 * @return
	 */
	public java.lang.String getProductDetailType() {
		return this.productDetailType;
	}

	/**
	 * 产品内容
	 * 
	 * @param productContext
	 */
	public void setProductContext(java.lang.String productContext) {
		this.productContext = productContext;
	}

	/**
	 * 产品内容
	 * 
	 * @return
	 */
	public java.lang.String getProductContext() {
		return this.productContext;
	}

	/**
	 * 套餐类型
	 * 
	 * @param productPackage
	 */
	public void setProductPackage(java.lang.String productPackage) {
		this.productPackage = productPackage;
	}

	/**
	 * 套餐类型
	 * 
	 * @return
	 */
	public java.lang.String getProductPackage() {
		return this.productPackage;
	}

	/**
	 * 
	 * @param serverDetails
	 */
	public void setServerDetails(java.lang.String serverDetails) {
		this.serverDetails = serverDetails;
	}

	/**
	 * 
	 * @return
	 */
	public java.lang.String getServerDetails() {
		return this.serverDetails;
	}

	/**
	 * 公司名称
	 * 
	 * @param companyName
	 */
	public void setCompanyName(java.lang.String companyName) {
		this.companyName = companyName;
	}

	/**
	 * 公司名称
	 * 
	 * @return
	 */
	public java.lang.String getCompanyName() {
		return this.companyName;
	}

	/**
	 * 客户名称
	 * 
	 * @param customerName
	 */
	public void setCustomerName(java.lang.String customerName) {
		this.customerName = customerName;
	}

	/**
	 * 客户名称
	 * 
	 * @return
	 */
	public java.lang.String getCustomerName() {
		return this.customerName;
	}

	/**
	 * 联系方式
	 * 
	 * @param mobile
	 */
	public void setMobile(java.lang.String mobile) {
		this.mobile = mobile;
	}

	/**
	 * 联系方式
	 * 
	 * @return
	 */
	public java.lang.String getMobile() {
		return this.mobile;
	}

	/**
	 * 订单总额
	 * 
	 * @param orderSumAmount
	 */
	public void setOrderSumAmount(com.zbjdl.common.amount.Amount orderSumAmount) {
		this.orderSumAmount = orderSumAmount;
	}

	/**
	 * 订单总额
	 * 
	 * @return
	 */
	public com.zbjdl.common.amount.Amount getOrderSumAmount() {
		return this.orderSumAmount;
	}

	/**
	 * 实收
	 * 
	 * @param orderRealAmount
	 */
	public void setOrderRealAmount(com.zbjdl.common.amount.Amount orderRealAmount) {
		this.orderRealAmount = orderRealAmount;
	}

	/**
	 * 实收
	 * 
	 * @return
	 */
	public com.zbjdl.common.amount.Amount getOrderRealAmount() {
		return this.orderRealAmount;
	}

	/**
	 * 尾款
	 * 
	 * @param orderRetailAmount
	 */
	public void setOrderRetailAmount(com.zbjdl.common.amount.Amount orderRetailAmount) {
		this.orderRetailAmount = orderRetailAmount;
	}

	/**
	 * 尾款
	 * 
	 * @return
	 */
	public com.zbjdl.common.amount.Amount getOrderRetailAmount() {
		return this.orderRetailAmount;
	}

	/**
	 * 
	 * @param cost1
	 */
	public void setCost1(com.zbjdl.common.amount.Amount cost1) {
		this.cost1 = cost1;
	}

	/**
	 * 
	 * @return
	 */
	public com.zbjdl.common.amount.Amount getCost1() {
		return this.cost1;
	}

	/**
	 * 
	 * @param cost2
	 */
	public void setCost2(com.zbjdl.common.amount.Amount cost2) {
		this.cost2 = cost2;
	}

	/**
	 * 
	 * @return
	 */
	public com.zbjdl.common.amount.Amount getCost2() {
		return this.cost2;
	}

	/**
	 * 
	 * @param cost3
	 */
	public void setCost3(com.zbjdl.common.amount.Amount cost3) {
		this.cost3 = cost3;
	}

	/**
	 * 
	 * @return
	 */
	public com.zbjdl.common.amount.Amount getCost3() {
		return this.cost3;
	}

	/**
	 * 
	 * @param cost4
	 */
	public void setCost4(com.zbjdl.common.amount.Amount cost4) {
		this.cost4 = cost4;
	}

	/**
	 * 
	 * @return
	 */
	public com.zbjdl.common.amount.Amount getCost4() {
		return this.cost4;
	}

	/**
	 * 
	 * @param cost5
	 */
	public void setCost5(com.zbjdl.common.amount.Amount cost5) {
		this.cost5 = cost5;
	}

	/**
	 * 
	 * @return
	 */
	public com.zbjdl.common.amount.Amount getCost5() {
		return this.cost5;
	}

	/**
	 * 
	 * @param cost6
	 */
	public void setCost6(com.zbjdl.common.amount.Amount cost6) {
		this.cost6 = cost6;
	}

	/**
	 * 
	 * @return
	 */
	public com.zbjdl.common.amount.Amount getCost6() {
		return this.cost6;
	}

	/**
	 * 
	 * @param cost7
	 */
	public void setCost7(com.zbjdl.common.amount.Amount cost7) {
		this.cost7 = cost7;
	}

	/**
	 * 
	 * @return
	 */
	public com.zbjdl.common.amount.Amount getCost7() {
		return this.cost7;
	}

	/**
	 * 
	 * @param cost8
	 */
	public void setCost8(com.zbjdl.common.amount.Amount cost8) {
		this.cost8 = cost8;
	}

	/**
	 * 
	 * @return
	 */
	public com.zbjdl.common.amount.Amount getCost8() {
		return this.cost8;
	}

	/**
	 * 
	 * @param cost9
	 */
	public void setCost9(com.zbjdl.common.amount.Amount cost9) {
		this.cost9 = cost9;
	}

	/**
	 * 
	 * @return
	 */
	public com.zbjdl.common.amount.Amount getCost9() {
		return this.cost9;
	}

	/**
	 * 
	 * @param cost10
	 */
	public void setCost10(com.zbjdl.common.amount.Amount cost10) {
		this.cost10 = cost10;
	}

	/**
	 * 
	 * @return
	 */
	public com.zbjdl.common.amount.Amount getCost10() {
		return this.cost10;
	}

	/**
	 * 其他费用
	 * 
	 * @param costOther
	 */
	public void setCostOther(com.zbjdl.common.amount.Amount costOther) {
		this.costOther = costOther;
	}

	/**
	 * 其他费用
	 * 
	 * @return
	 */
	public com.zbjdl.common.amount.Amount getCostOther() {
		return this.costOther;
	}

	/**
	 * 毛利－总额
	 * 
	 * @param profitAmount
	 */
	public void setProfitAmount(com.zbjdl.common.amount.Amount profitAmount) {
		this.profitAmount = profitAmount;
	}

	/**
	 * 毛利－总额
	 * 
	 * @return
	 */
	public com.zbjdl.common.amount.Amount getProfitAmount() {
		return this.profitAmount == null ? new Amount() : this.profitAmount;
	}

	/**
	 * 代帐费用
	 * 
	 * @param profitAccount
	 */
	public void setProfitAccount(com.zbjdl.common.amount.Amount profitAccount) {
		this.profitAccount = profitAccount;
	}

	/**
	 * 代帐费用
	 * 
	 * @return
	 */
	public com.zbjdl.common.amount.Amount getProfitAccount() {
		return this.profitAccount;
	}

	/**
	 * 毛利－其他收入
	 * 
	 * @param profitOther
	 */
	public void setProfitOther(com.zbjdl.common.amount.Amount profitOther) {
		this.profitOther = profitOther;
	}

	/**
	 * 毛利－其他收入
	 * 
	 * @return
	 */
	public com.zbjdl.common.amount.Amount getProfitOther() {
		return this.profitOther;
	}

	/**
	 * 猪八戒ID
	 * 
	 * @param zbjId
	 */
	public void setZbjId(java.lang.String zbjId) {
		this.zbjId = zbjId;
	}

	/**
	 * 猪八戒ID
	 * 
	 * @return
	 */
	public java.lang.String getZbjId() {
		return this.zbjId;
	}

	/**
	 * 猪八戒ID
	 * 
	 * @param orderNo
	 */
	public void setOrderNo(java.lang.String orderNo) {
		this.orderNo = orderNo;
	}

	/**
	 * 猪八戒ID
	 * 
	 * @return
	 */
	public java.lang.String getOrderNo() {
		return this.orderNo;
	}

	/**
	 * 合同号
	 * 
	 * @param contractNo
	 */
	public void setContractNo(java.lang.String contractNo) {
		this.contractNo = contractNo;
	}

	/**
	 * 合同号
	 * 
	 * @return
	 */
	public java.lang.String getContractNo() {
		return this.contractNo;
	}

	/**
	 * 付款方式
	 * 
	 * @param payChannel
	 */
	public void setPayChannel(java.lang.String payChannel) {
		this.payChannel = payChannel;
	}

	/**
	 * 付款方式
	 * 
	 * @return
	 */
	public java.lang.String getPayChannel() {
		return this.payChannel;
	}

	public java.lang.String getCity() {
		return city;
	}

	public void setCity(java.lang.String city) {
		this.city = city;
	}

}