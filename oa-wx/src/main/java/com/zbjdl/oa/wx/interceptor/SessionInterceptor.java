package com.zbjdl.oa.wx.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.alibaba.fastjson.JSON;
import com.zbjdl.common.wx.util.ConfigEnum;
import com.zbjdl.common.wx.util.ConfigUtils;
import com.zbjdl.oa.wx.exception.WxIllegalAccessException;
import com.zbjdl.oa.wx.service.PortalQAService;
import com.zbjdl.oa.wx.service.PortalWxService;
import com.zbjdl.oa.wx.service.SessionService;
import com.zbjdl.oa.wx.service.WxUserInfoService.UserInfoModel;
import com.zbjdl.oa.wx.util.WxUtil;
import com.zbjdl.oa.wx.vo.WxSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 微信Session管理拦截器
 * 用于根据微信的认证信息构建WxSession信息，并放到HttpSession中
 * 拦截 /menu URL ，此URL为微信的入口。
 * 
 * 
 * @since 2014-9-9 14:22:04
 */
public class SessionInterceptor extends HandlerInterceptorAdapter{
	private Logger logger = LoggerFactory.getLogger(SessionInterceptor.class);
	@Autowired
	private SessionService sessionService;
	@Resource
	private PortalQAService portalQAService;
	@Resource
	private PortalWxService portalWxService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		try {
			WxSession session = sessionService.getSession();
			logger.info("session interceptor : {}", session);
			if(session != null && (StringUtils.isNotBlank(session.getOpi()) || StringUtils.isNotBlank(session.getUserId()))){
				logger.info("session interceptor : {}", JSON.toJSONString(session));
				return true;
			} 
			Boolean isWxProduct = (Boolean)ConfigUtils.getSysConfigParam(ConfigEnum.WX_PRODUCT);
			logger.info("is wx product :{}", isWxProduct);
			logger.info("request is {}", request.getHeader("user-agent"));
			if(!isWxProduct){
				String opi = request.getParameter("opi");
				logger.info("测试环境请求地址：[{}] , opi:[{}]" , request.getRequestURI() , opi);
				portalQAService.siginForWx(opi);
				return true;
			} else if(!WxUtil.isWxBrowser(request)){
				sessionService.setSession(new WxSession(false));
				return true;
			} 
			logger.info("微信环境。。。。。。。。。。。。,code:{}", request.getParameter("code"));
			String code = request.getParameter("code");
			if(StringUtils.isNotBlank(code)) {
				logger.info("请求地址,uri:[{}] , code:[{}]" , request.getRequestURI() , code);
				String userInfoModel = request.getParameter("userinfo");
				logger.info("user info is : {}", userInfoModel);
				UserInfoModel userInfo = StringUtils.isBlank(userInfoModel) ? UserInfoModel.BASE : UserInfoModel.valueOf(userInfoModel);
				portalWxService.sigin(code , userInfo);
				return true;
			} else {
				throw new WxIllegalAccessException();
			}
		} catch (Exception e){
			logger.error(e.getMessage() , e);
			throw e;
		}
	}
}
