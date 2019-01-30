package com.zbjdl.oa.wx.service;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zbjdl.common.wx.util.dto.WxBindUserDto;
import com.zbjdl.oa.wx.exception.WxIllegalAccessException;
import com.zbjdl.oa.wx.vo.WxSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * 提供Session相关需要的服务
 * 
 * 
 * @since 2014-9-24 07:43:22
 */
@Component("sessionService")
public class SessionService {
	private Logger logger = LoggerFactory.getLogger(SessionService.class);
	
	@Autowired
	protected HttpSession session;
	@Resource
	protected WxUserInfoService wxUserInfoService;
	
	@Resource
	private PortalPhoneService portalPhoneService;
	@Resource
	private PortalWxService portalWxService;
	/**
	 * 获取微信Sesison
	 */
	public WxSession getSession(){
		return (WxSession)session.getAttribute(WxSession.NAME);
	}
	
	/**
	 * 设置微信Sesison
	 */
	public void setSession(WxSession wxSession){
		session.setAttribute(WxSession.NAME , wxSession);
	}
	
		
	/**
	 * session重新加载
	 * @param wxSession
	 * @return
	 */
	public WxSession reLoad(){
		WxSession oldSession = getSession();
		if(oldSession == null){
			throw new WxIllegalAccessException("重新加载Session时，Session不存在");
		}
		WxSession newSession = null;
		if(!oldSession.isWxBrowser()){
			logger.info("reload session phone");
			newSession = portalPhoneService.reLoad(oldSession.getUserId(), oldSession.getLoginName());
		} else if(StringUtils.isBlank(oldSession.getOpi())){
			throw new WxIllegalAccessException("重新加载Session时，Session不存在");
		} else {
			logger.info("reload session wx");
			newSession = portalWxService.reLoad(oldSession.getOpi());
		}
		return newSession;
	}

	/**
	 * 加载会员和账户信息
	 */
	protected void loadUserSession(WxSession wxSession , WxBindUserDto wxBindUserDto){
		if(wxBindUserDto != null){
			//会员信息
			wxSession.setOpi(wxBindUserDto.getOpenId());
			wxSession.setLoginName(wxBindUserDto.getLoginName());
			wxSession.setUserId(wxBindUserDto.getUserId());
		}
	}
	
}
