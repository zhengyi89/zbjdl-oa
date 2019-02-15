package com.zbjdl.oa.wx.vo;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.zbjdl.common.utils.StringUtils;
import com.zbjdl.oa.wx.util.dto.WeiXinUserInfoDto;

/**
 * 系统Session对象
 * 
 * 
 * @since 2014-9-9 16:07:59
 */
public class WxSession implements Serializable {
	private static final long serialVersionUID = 8287457153796156866L;
	private static final Logger logger = LoggerFactory.getLogger(WxSession.class);

	public WxSession() {
	}

	public WxSession(boolean wxBrowser) {
		this.wxBrowser = wxBrowser;
	}

	public WxSession(WeiXinUserInfoDto userInfoDto) {
		this.wxHeadimgurl = userInfoDto.getHeadimgurl();
		this.wxNickName = userInfoDto.getNickname();
		this.opi = userInfoDto.getOpenid();
	}

	/**
	 * 是否是微信服务号中打开，还是在浏览器中打开
	 */
	private boolean wxBrowser = true;

	/**
	 * Session标识
	 */
	public static final String NAME = "_wxSession";

	/**
	 * 微信昵称标识
	 */
	public static final String WX_NICK_NAME = "wxNickname";
	/**
	 * 微信头像网址标识
	 */
	public static final String WX_HEADIMG_URL = "wxHeadimgurl";

	/**
	 * 微信OpenId
	 */
	private String opi;
	/**
	 * 微信昵称
	 */
	private String wxNickName;
	/**
	 * 微信头像地址
	 */
	private String wxHeadimgurl;
	/**
	 * 用户标识id
	 */
	private String userId;

	/**
	 * 所属部门id
	 */
	private String departmentId;

	/**
	 * 用户名
	 */
	private String userName;

	/**
	 * 登陆名
	 */
	private String loginName;

	private String city;

	private Boolean isAdmin;
	
	private Boolean isSuperAdmin;

	/**
	 * 判断用户是否已经绑定了会员
	 * 
	 * @return
	 */
	public boolean isBind() {
		logger.info("user:" + userId);
		// if(StringUtils.isNotBlank(userId) &&
		// StringUtils.isNotBlank(loginName)){
		if (StringUtils.isNotBlank(userId)) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

	public String getWxNickName() {
		return wxNickName;
	}

	public void setWxNickName(String wxNickName) {
		this.wxNickName = wxNickName;
	}

	public String getWxHeadimgurl() {
		return wxHeadimgurl;
	}

	public void setWxHeadimgurl(String wxHeadimgurl) {
		this.wxHeadimgurl = wxHeadimgurl;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getOpi() {
		return opi;
	}

	public void setOpi(String opi) {
		this.opi = opi;
	}

	/**
	 * 是否是微信服务号中打开，还是在浏览器中打开
	 */
	public boolean isWxBrowser() {
		return wxBrowser;
	}

	public String getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public Boolean getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(Boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

	public Boolean getIsSuperAdmin() {
		return isSuperAdmin;
	}

	public void setIsSuperAdmin(Boolean isSuperAdmin) {
		this.isSuperAdmin = isSuperAdmin;
	}
	
	

}
