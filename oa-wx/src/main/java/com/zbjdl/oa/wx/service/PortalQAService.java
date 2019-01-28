package com.zbjdl.oa.wx.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zbjdl.common.utils.CheckUtils;
import com.zbjdl.common.wx.param.WxUserDTO;
import com.zbjdl.common.wx.service.WeixinUserService;
import com.zbjdl.oa.wx.config.Constants;
import com.zbjdl.oa.wx.vo.WxSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * 提供Session相关需要的服务
 * 
 * 
 * @since 2014-9-24 07:43:22
 */
@Service("portalQAService")
public class PortalQAService extends SessionService{
	private Logger logger = LoggerFactory.getLogger(PortalQAService.class);
	
	@Autowired
	private HttpSession session;
	@Autowired
	private WeixinUserService weixinUserService;
	/**
	 * 微信官网：系统验证(QA)
	 */
	public WxSession siginForWx(String openId){
		CheckUtils.notEmpty(openId, "openId不能为空");
		WxSession wxSession = new WxSession();
		wxSession.setOpi(openId);
		WxUserDTO wxUser = weixinUserService.findWxUser(openId);
		if(wxUser != null){
			wxSession.setWxHeadimgurl(wxUser.getPhotoUrl());
			wxSession.setWxNickName(wxUser.getNickName());
		}
		loadUserSession(wxSession, weixinUserService.queryBindUserByOpenId(openId, Constants.SYSTEM_CODE));
		session.setAttribute(WxSession.NAME , wxSession);
		logger.debug("加载Session数据：{}" , wxSession);
		return wxSession;
	}	
	
	}
