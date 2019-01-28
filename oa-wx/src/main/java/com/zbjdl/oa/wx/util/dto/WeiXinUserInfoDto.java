package com.zbjdl.oa.wx.util.dto;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 {
   "openid":" OPENID",
   "nickname": NICKNAME,
   "sex":"1",
   "province":"PROVINCE"
   "city":"CITY",
   "country":"COUNTRY",
    "headimgurl":    "http://wx.qlogo.cn/mmopen/g3MonUZtNHkdmzicIlibx6iaFqAc56vxLSUfpb6n5WKSYVY0ChQKkiaJSgQ1dZuTOgvLLrhJbERQQ4eMsv84eavHiaiceqxibJxCfHe/46", 
	"privilege":[用户特权信息，json 数组，如微信沃卡用户为（chinaunicom）
	"PRIVILEGE1"
	"PRIVILEGE2"
    ]
    "unionid": "o6_bmasdasdsad6_2sgVt7hMZOPfL"	只有在用户将公众号绑定到微信开放平台帐号后，才会出现该字段
}
 * 
 * @since 2014-11-28 16:20:46
 */
public class WeiXinUserInfoDto extends BaseAPIDto{
	private String openid;
	private String nickname;
	private Integer sex;
	private String province;
	private String city;
	private String country;
	private String subscribe;
	private Long subscribe_time;
	/**
	 * 头像地址可能会更新
	 */
	private String headimgurl;
	private String unionid;
	
	
	/**
	 * 判断是否关注
	 */
	public boolean isSubscribe(){
		if("1".equals(subscribe)){
			return true;
		}
		return false;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this , ToStringStyle.MULTI_LINE_STYLE);
	}
	
	
	public String getSubscribe() {
		return subscribe;
	}
	public void setSubscribe(String subscribe) {
		this.subscribe = subscribe;
	}
	public Long getSubscribe_time() {
		return subscribe_time;
	}

	public void setSubscribe_time(Long subscribe_time) {
		this.subscribe_time = subscribe_time;
	}

	public String getUnionid() {
		return unionid;
	}
	public void setUnionid(String unionid) {
		this.unionid = unionid;
	}
	public String getOpenid() {
		return openid;
	}
	public void setOpenid(String openid) {
		this.openid = openid;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Integer getSex() {
		return sex;
	}
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getHeadimgurl() {
		return headimgurl;
	}
	public void setHeadimgurl(String headimgurl) {
		this.headimgurl = headimgurl;
	}
}
