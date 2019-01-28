package com.zbjdl.oa.wx.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.zbjdl.common.wx.util.ConfigEnum;
import com.zbjdl.common.wx.util.ConfigUtils;
import com.zbjdl.oa.wx.exception.WxIllegalAccessException;
import com.zbjdl.oa.wx.service.SessionService;
import com.zbjdl.oa.wx.util.URLUtil;
import com.zbjdl.oa.wx.vo.WxSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * 父类控制器
 * 
 * 
 * @since 2014-9-9 16:13:06
 */
public class BaseController {
	private Logger logger = LoggerFactory.getLogger(BaseController.class);
	/**
	 * 每页显示数量
	 */
	protected static final String PAGE_SIZE = "10";
	/**
	 * 注册用户短信模板
	 * Constant.MEMBER_ACTIVE_LOGINNAME
	 */
	public static String MEMBER_ACTIVE_LOGINNAME = "member_active_loginname";
	
	public static  final String VISIT_NO_SESSION_KEY = "visit_no_session_key";
	
	protected static final String MEMBER_VERIFY_COMPLETE_TARGET = "MEMBER_VERIFY_COMPLETE_TARGET";
	
	@Autowired
	protected HttpSession session;
	@Autowired
	protected HttpServletRequest request;
	@Resource
	protected SessionService sessionService;

	
	/**
	 * 获取系统Session对象
	 * @return
	 */
	protected WxSession getSession(){
		WxSession wxSession = (WxSession)session.getAttribute(WxSession.NAME);
		if(wxSession == null){
			throw new WxIllegalAccessException("Session访问超时，请退出重试");
		}
		return wxSession;
	}
	
	/**
	 * 获取系统Session对象
	 * 如果为空，则返回空值
	 * @return
	 */
	protected WxSession getSessionSafe(){
		WxSession wxSession = (WxSession)session.getAttribute(WxSession.NAME);
		if(wxSession == null){
			return null;
		}
		return wxSession;
	}
	
	protected String getOpi(){
		return this.getSession().getOpi();
	}
	
	/**
	 * 安全获取Opi
	 */
	protected String getOpiSalf(){
		WxSession wxSession = getSession();
		if(wxSession != null){
			return wxSession.getOpi();
		}
		return null;
	}
	
	protected String getUserId(){
		WxSession wxSession = getSession();
		if(wxSession != null){
			return wxSession.getUserId();
		}
		return null;
	}
	
	/**
	 * 必要时候，重新加载Session对象
	 */
	protected WxSession reloadSession(){
		return sessionService.reLoad();
	}
	

	/**
	 * 判断是否为微信验证模式
	 */
	protected boolean isWxProduction() {
		Boolean isProduction = (Boolean)ConfigUtils.getSysConfigParam(ConfigEnum.WX_PRODUCT);
		logger.info("判断是否为微信生产环境：{}" , isProduction);
		return isProduction;
	}
	
	
	
	/**
	 * 获取当前完整地址信息
	 * @return
	 */
	public String getCallBackUri(HttpServletRequest request){
		return URLUtil.getCallBackUri(request);
	}
	
	public String getReferer(){
		String reffer = request.getHeader("referer");
		return reffer;
	}
	
	/**
	 * 获取重定向的URL
	 * @return
	 */
	public String redirect(String url){
		return new StringBuffer(InternalResourceViewResolver.REDIRECT_URL_PREFIX).append(url).toString();
	}
	
			
}
