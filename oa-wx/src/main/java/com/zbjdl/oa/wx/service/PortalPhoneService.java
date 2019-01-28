package com.zbjdl.oa.wx.service;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zbjdl.common.wx.param.WxUserDTO;
import com.zbjdl.common.wx.service.WeixinUserService;
import com.zbjdl.common.wx.util.dto.WxBindUserDto;
import com.zbjdl.oa.wx.config.Constants;
import com.zbjdl.oa.wx.vo.WxSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * 手机官网服务
 * 
 * 
 * @since 2015-02-12 19:06:53
 */
@Service("portalPhoneService")
public class PortalPhoneService extends SessionService{
	private Logger logger = LoggerFactory.getLogger(PortalPhoneService.class);
	@Autowired
	private WeixinUserService weixinUserService;
	
	/**
	 * 手机官网：session重新加载
	 * @param openId
	 * @return
	 */
	public WxSession reLoad(String userId, String loginName){
		WxSession wxSession = new WxSession(false);
		if(StringUtils.isBlank(userId)){
			return wxSession;
		}
		wxSession.setUserId(userId);
		wxSession.setLoginName(loginName);
		//TODO 去业务商户信息（商户编号），wxSession.setMerchantCode(merchantCode);
		
		WxBindUserDto bindUser = weixinUserService.queryBindUserByUserId(userId, Constants.SYSTEM_CODE);

		if(bindUser != null && StringUtils.isNotBlank(bindUser.getOpenId())){
			//绑定过微信
			WxUserDTO wxUser = weixinUserService.findWxUser(bindUser.getOpenId());
			if(wxUser != null){
				wxSession.setWxHeadimgurl(wxUser.getPhotoUrl());
				wxSession.setWxNickName(wxUser.getNickName());
			}
		}
		//加载
		loadUserSession(wxSession , bindUser);
		session.setAttribute(WxSession.NAME , wxSession);
		logger.debug("加载Session数据：{}" , wxSession);
		return wxSession;
	}
}
