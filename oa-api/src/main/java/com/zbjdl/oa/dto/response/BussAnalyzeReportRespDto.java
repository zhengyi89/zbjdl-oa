/*
 * Powered By zbjdl-code-generator
 * Web Site: http://www.zbjdl.com
 * Since 2018 - 2022
 */

package com.zbjdl.oa.dto.response;

import java.io.Serializable;

/**
 * 
 * @author zhengy
 * @date: 2019年2月12日 上午11:26:20
 */
public class BussAnalyzeReportRespDto implements Serializable {
	private static final long serialVersionUID = 1L;

	private String city;
	private String userName;
	private String userId;
	private Integer dayOpp1;
	private Integer dayOpp2;
	private Integer dayOpp3;
	private Integer monthOpp1;
	private Integer monthOpp2;
	private Integer monthOpp3;
	private Integer qdsDay;
	private Integer qsbDay;
	private Integer bossDay;
	private Integer qdsMonth;
	private Integer qsbMonth;
	private Integer bossMonth;

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Integer getDayOpp1() {
		return dayOpp1;
	}

	public void setDayOpp1(Integer dayOpp1) {
		this.dayOpp1 = dayOpp1;
	}

	public Integer getDayOpp2() {
		return dayOpp2;
	}

	public void setDayOpp2(Integer dayOpp2) {
		this.dayOpp2 = dayOpp2;
	}

	public Integer getDayOpp3() {
		return dayOpp3;
	}

	public void setDayOpp3(Integer dayOpp3) {
		this.dayOpp3 = dayOpp3;
	}

	public Integer getMonthOpp1() {
		return monthOpp1;
	}

	public void setMonthOpp1(Integer monthOpp1) {
		this.monthOpp1 = monthOpp1;
	}

	public Integer getMonthOpp2() {
		return monthOpp2;
	}

	public void setMonthOpp2(Integer monthOpp2) {
		this.monthOpp2 = monthOpp2;
	}

	public Integer getMonthOpp3() {
		return monthOpp3;
	}

	public void setMonthOpp3(Integer monthOpp3) {
		this.monthOpp3 = monthOpp3;
	}

	public Integer getQdsDay() {
		return qdsDay;
	}

	public void setQdsDay(Integer qdsDay) {
		this.qdsDay = qdsDay;
	}

	public Integer getQsbDay() {
		return qsbDay;
	}

	public void setQsbDay(Integer qsbDay) {
		this.qsbDay = qsbDay;
	}

	public Integer getBossDay() {
		return bossDay;
	}

	public void setBossDay(Integer bossDay) {
		this.bossDay = bossDay;
	}

	public Integer getQdsMonth() {
		return qdsMonth;
	}

	public void setQdsMonth(Integer qdsMonth) {
		this.qdsMonth = qdsMonth;
	}

	public Integer getQsbMonth() {
		return qsbMonth;
	}

	public void setQsbMonth(Integer qsbMonth) {
		this.qsbMonth = qsbMonth;
	}

	public Integer getBossMonth() {
		return bossMonth;
	}

	public void setBossMonth(Integer bossMonth) {
		this.bossMonth = bossMonth;
	}

}