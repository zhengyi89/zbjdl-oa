/**
 * Copyright: Copyright (c)2011
 * 
 */
package com.zbjdl.oa.wx.exception;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.UnsatisfiedServletRequestParameterException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;
import org.springframework.web.servlet.view.RedirectView;

import com.zbjdl.common.exception.BaseException;
import com.zbjdl.oa.wx.config.MenuConfig;
import com.zbjdl.oa.wx.config.WxScopeConfig;
import com.zbjdl.oa.wx.service.SessionService;
import com.zbjdl.oa.wx.util.WxUtil;
import com.zbjdl.oa.wx.vo.WxSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 微信项目统一异常管理
 * 
 * 
 * @since 2014-9-28 17:52:12
 */
@ControllerAdvice
public class WxExceptionHandler extends ResponseEntityExceptionHandler {
	private Logger logger = LoggerFactory.getLogger(WxExceptionHandler.class);
	@Resource
	private SessionService sessionService;
	
	/**
	 * 处理系统获取OpenId失败的情况
	 * @param request
	 */
	@ExceptionHandler(value={WxIllegalAccessException.class})
	public ModelAndView handleIllegalAccessException(HttpServletRequest request, Exception e){
		try {
			if(!WxUtil.isWxBrowser(request)){
				WxSession wxSession = new WxSession(false);
				sessionService.setSession(wxSession);
				View view = new RedirectView(request.getContextPath() + "/index");
				return new ModelAndView(view);
			} else {
				// TODO 重新定义
				
				String host = WxUtil.OA_WX_HOST + request.getContextPath();
				//重新网页授权openId，重启认证
				return new ModelAndView(new RedirectView(WxUtil.getCode(host + "/menu?"+MenuConfig.INDEX, WxScopeConfig.BASE)));
			}
		} catch (Exception exception){
			logger.error(e.getMessage() , e);
		}
		logger.error("Requested URL:" + request.getRequestURL(), e);
		return new ModelAndView("/error/illegal_access");
	}

	
	/**
	 * 处理系统业务异常
	 * @param request
	 * @param e
	 * @return
	 */
	@ExceptionHandler(value={BaseException.class})
	public ModelAndView handleBizException(HttpServletRequest request, Exception e){
		logger.error("系统业务异常：Requested URL:" + request.getRequestURL(), e);
		request.setAttribute("error_title", "温馨提示");
		request.setAttribute("error_tip", e.getMessage());
		return new ModelAndView("/error/default_error");
	}
	
	
	/**
	 * 处理全局异常
	 * @param request
	 * @param e
	 * @return
	 */
	@ExceptionHandler(value={Exception.class})
	public ModelAndView handleException(HttpServletRequest request, Exception e){
		logger.error("系统异常" ,  e);
		request.setAttribute("error_title", "温馨提示");
		request.setAttribute("error_tip", "系统异常，请稍后重试");
		return new ModelAndView("/error/default_error");
	}

	@ExceptionHandler(value={UnsatisfiedServletRequestParameterException.class})
	public ModelAndView handleUnsatisfiedException(HttpServletRequest request, Exception e){
		logger.error("Requested URL={} , 请求参数={}" , request.getRequestURL() , request.getParameterMap());
		logger.error(e.getMessage() , e);
		request.setAttribute("error_tip", "抱歉！找不到您要的页面...");
		return new ModelAndView("/error/default_error");
	}
	
}
