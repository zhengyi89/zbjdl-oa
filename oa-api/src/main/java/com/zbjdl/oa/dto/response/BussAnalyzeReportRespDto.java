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
	private int dayOpp1;
	private int dayOpp2;
	private int dayOpp3;
	private int monthOpp1;
	private int monthOpp2;
	private int monthOpp3;
	private int qdsDay;
	private int qsbDay;
	private int bossDay;
	private int qdsMonth;
	private int qsbMonth;
	private int bossMonth;

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

	public int getDayOpp1() {
		return dayOpp1;
	}

	public void setDayOpp1(int dayOpp1) {
		this.dayOpp1 = dayOpp1;
	}

	public int getDayOpp2() {
		return dayOpp2;
	}

	public void setDayOpp2(int dayOpp2) {
		this.dayOpp2 = dayOpp2;
	}

	public int getDayOpp3() {
		return dayOpp3;
	}

	public void setDayOpp3(int dayOpp3) {
		this.dayOpp3 = dayOpp3;
	}

	public int getMonthOpp1() {
		return monthOpp1;
	}

	public void setMonthOpp1(int monthOpp1) {
		this.monthOpp1 = monthOpp1;
	}

	public int getMonthOpp2() {
		return monthOpp2;
	}

	public void setMonthOpp2(int monthOpp2) {
		this.monthOpp2 = monthOpp2;
	}

	public int getMonthOpp3() {
		return monthOpp3;
	}

	public void setMonthOpp3(int monthOpp3) {
		this.monthOpp3 = monthOpp3;
	}

	public int getQdsDay() {
		return qdsDay;
	}

	public void setQdsDay(int qdsDay) {
		this.qdsDay = qdsDay;
	}

	public int getQsbDay() {
		return qsbDay;
	}

	public void setQsbDay(int qsbDay) {
		this.qsbDay = qsbDay;
	}

	public int getBossDay() {
		return bossDay;
	}

	public void setBossDay(int bossDay) {
		this.bossDay = bossDay;
	}

	public int getQdsMonth() {
		return qdsMonth;
	}

	public void setQdsMonth(int qdsMonth) {
		this.qdsMonth = qdsMonth;
	}

	public int getQsbMonth() {
		return qsbMonth;
	}

	public void setQsbMonth(int qsbMonth) {
		this.qsbMonth = qsbMonth;
	}

	public int getBossMonth() {
		return bossMonth;
	}

	public void setBossMonth(int bossMonth) {
		this.bossMonth = bossMonth;
	}

}