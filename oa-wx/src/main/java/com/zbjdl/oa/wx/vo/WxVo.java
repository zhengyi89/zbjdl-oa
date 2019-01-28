package com.zbjdl.oa.wx.vo;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;


/**
 * 微信交互参数
 * 
 * @since
 */
public class WxVo implements Serializable{
	private static final long serialVersionUID = 1L;

	/**
	 * 微信昵称
	 */
	private String nickname;
	
	/**
	 * 微信头像网址
	 */
	private String headimgurl;
	
	/**
	 * 微信OpenId
	 */
	private String opi;
	/**
	 * 用户是否订阅该公众号标识：
	 * 	0时，代表此用户没有关注该公众号
	 */
	private Integer subscribe;
	
	/**
	 * 判断微信用户是否已经关注了，我们的服务号:
	 * true:关注，false:未关注
	 */
	public boolean isSubscribe(){
		if(subscribe == null){
			return false;
		}
		return (subscribe == 1);
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getHeadimgurl() {
		return headimgurl;
	}
	public void setHeadimgurl(String headimgurl) {
		this.headimgurl = headimgurl;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getOpi() {
		return opi;
	}

	public void setOpi(String opi) {
		this.opi = opi;
	}

	public Integer getSubscribe() {
		return subscribe;
	}

	public void setSubscribe(Integer subscribe) {
		this.subscribe = subscribe;
	}
}
