package com.zbjdl.oa.wx.service;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zbjdl.common.wx.param.WxUserDTO;
import com.zbjdl.common.wx.service.WeixinUserService;
import com.zbjdl.common.wx.util.dto.WxBindUserDto;
import com.zbjdl.oa.wx.config.Constants;
import com.zbjdl.oa.wx.exception.WxIllegalAccessException;
import com.zbjdl.oa.wx.service.UserInfoService.UserInfoModel;
import com.zbjdl.oa.wx.util.dto.WeiXinUserInfoDto;
import com.zbjdl.oa.wx.vo.WxSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * 提供Session相关需要的服务
 * 
 * 
 * @since 2014-9-24 07:43:22
 */
@Service("portalWxService")
public class PortalWxService extends SessionService{
	private Logger logger = LoggerFactory.getLogger(PortalWxService.class);
	@Autowired
	private WeixinUserService weixinUserService;
	
	/**
	 * 微信官网登录：系统验证
	 */
	public WxSession sigin(String code , UserInfoModel userInfoModel){
		if(StringUtils.isBlank(code) || userInfoService == null){
			throw new WxIllegalAccessException();
		}
		WeiXinUserInfoDto wxUserInfo = userInfoService.getUserInfo(userInfoModel, code);
		WxSession wxSession = new WxSession(wxUserInfo);
		String openId = wxSession.getOpi();
		logger.info("openId:"+openId);
		if(StringUtils.isBlank(openId)){
			throw new WxIllegalAccessException();
		}
		//组织Session，注册WxUser		
		logger.info("bindWxInfo:"+openId+";"+wxUserInfo.getHeadimgurl()+";"+wxUserInfo.getNickname());

		weixinUserService.bindWxInfo(new WxUserDTO(openId, wxUserInfo.getHeadimgurl(), wxUserInfo.getNickname()));
		logger.info("findWxUser:");

		WxUserDTO wxUser = weixinUserService.findWxUser(openId);
		wxSession.setWxHeadimgurl(wxUser.getPhotoUrl());
		wxSession.setWxNickName(wxUser.getNickName());
		WxBindUserDto wxBindUserDto = weixinUserService.queryBindUserByOpenId(openId, Constants.SYSTEM_CODE);
		
		//加载
		loadUserSession(wxSession, wxBindUserDto);
		session.setAttribute(WxSession.NAME , wxSession);
		logger.debug("加载Session数据：{}" , wxSession);
		return wxSession;
	}
	
	
	/**
	 * 微信官网：session重新加载
	 * @param openId
	 * @return
	 */
	public WxSession reLoad(String openId){
		WxSession wxSession = new WxSession();
		if(StringUtils.isBlank(openId)){
			return wxSession;
		}
		wxSession.setOpi(openId);
		WxUserDTO wxUser = weixinUserService.findWxUser(openId);
		if(wxUser != null){
			wxSession.setWxHeadimgurl(wxUser.getPhotoUrl());
			wxSession.setWxNickName(wxUser.getNickName());
		}
		//加载
		loadUserSession(wxSession, weixinUserService.queryBindUserByOpenId(openId, Constants.SYSTEM_CODE));
		session.setAttribute(WxSession.NAME , wxSession);
		logger.debug("加载Session数据：{}" , wxSession);
		return wxSession;
	}
}
