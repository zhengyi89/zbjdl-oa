package com.zbjdl.oa.dto;

import java.io.Serializable;
import java.util.Date;

public class UserDto implements Serializable {
	private static final long serialVersionUID = 1L;

	private Long id;// ID
	private String userNo;// 客户编号
	private String nameA;// 姓名A
	private String phoneA;// 电话A
	private String idCardA;// 身份证A
	private String nameB;// 姓名B
	private String phoneB;// 电话B
	private String idCardB;// 身份证B
	private String marryType;
	private String userType;// 买卖类型;0买方，1卖方
	private String relation;
	private Date createTime;
	private Date updateTime;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo == null ? null : userNo.trim();
	}

	public String getNameA() {
		return nameA;
	}

	public void setNameA(String nameA) {
		this.nameA = nameA == null ? null : nameA.trim();
	}

	public String getPhoneA() {
		return phoneA;
	}

	public void setPhoneA(String phoneA) {
		this.phoneA = phoneA == null ? null : phoneA.trim();
	}

	public String getIdCardA() {
		return idCardA;
	}

	public void setIdCardA(String idCardA) {
		this.idCardA = idCardA == null ? null : idCardA.trim();
	}

	public String getNameB() {
		return nameB;
	}

	public void setNameB(String nameB) {
		this.nameB = nameB == null ? null : nameB.trim();
	}

	public String getPhoneB() {
		return phoneB;
	}

	public void setPhoneB(String phoneB) {
		this.phoneB = phoneB == null ? null : phoneB.trim();
	}

	public String getIdCardB() {
		return idCardB;
	}

	public void setIdCardB(String idCardB) {
		this.idCardB = idCardB == null ? null : idCardB.trim();
	}

	public String getMarryType() {
		return marryType;
	}

	public void setMarryType(String marryType) {
		this.marryType = marryType == null ? null : marryType.trim();
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType == null ? null : userType.trim();
	}

	public String getRelation() {
		return relation;
	}

	public void setRelation(String relation) {
		this.relation = relation == null ? null : relation.trim();
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
}