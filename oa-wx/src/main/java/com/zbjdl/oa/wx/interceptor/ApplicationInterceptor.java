package com.zbjdl.oa.wx.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 应用整体拦截器
 * 
 * 
 * @since 2014-10-28 15:48:04
 */
public class ApplicationInterceptor extends HandlerInterceptorAdapter{
	
	private Logger logger = LoggerFactory.getLogger(ApplicationInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//		String requestURI = request.getRequestURI();
//	
		//判断访问设备
//		try {
//			boolean isWxBrowser = WxUtil.isWxBrowser(request);
//			Device device = DeviceUtils.getCurrentDevice(request);
//			if(device != null && !isWxBrowser && !device.isMobile()){
//				response.sendRedirect("https://www.xxxx.com");
//				logger.info("PC请求转发到官网，源请求地址：{}，浏览器信息：{}" , requestURI , request.getHeader("user-agent"));
//				return false;
//			}
//		} catch(Exception e){
//			logger.error("应用拦截器异常" , e);
//		}
		return true;
	}
	
}
