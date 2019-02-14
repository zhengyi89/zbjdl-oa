package com.zbjdl.oa.wx.interceptor;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.zbjdl.common.encrypt.Base64;
import com.zbjdl.common.utils.StringUtils;
import com.zbjdl.oa.wx.service.SessionService;
import com.zbjdl.oa.wx.vo.WxSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 微信权限拦截器
 * 
 * 
 * @since 2014-10-12 21:24:41
 */
public class SecurityInterceptor extends HandlerInterceptorAdapter{
	private Logger logger = LoggerFactory.getLogger(SecurityInterceptor.class);
	
	/**
	 * 微信权限拦截器，回调专用key
	 */
	public static final String CALL_BACK_KEY = "CALL_BACK_KEY";
	/**
	 * 微信权限拦截器，判断是否为回调拦截
	 */
	private static final String IS_CALL_BACK = "_call_back_url";
	
	/**
	 * 不需要绑定
	 */
	private List<String> noBind;
	
	@Resource
	private SessionService sessionService;
	
	@Autowired
	private HttpServletRequest request;
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		try {
			HttpSession session = request.getSession();
			
			String contextPath = request.getContextPath();
			String uri = request.getRequestURI().replace(contextPath, "");
			WxSession wxSession = (WxSession)session.getAttribute(WxSession.NAME);
			if(wxSession == null){
				logger.warn("系统未检测到微信Session,url:{}" , uri);
				response.sendRedirect(contextPath + "/user/login/index");
				return false;
			} else {
				String userId  = wxSession.getUserId();
				logger.info("-------------用户id：{},手机号：{}", userId, wxSession.getLoginName());
				if(StringUtils.isBlank(userId) && !noCheck(uri , this.noBind)){
					String callBackUrl = getCallBackUri(request);
					String callBackUrlBase64 = Base64.encode(callBackUrl);
					session.setAttribute(CALL_BACK_KEY, callBackUrl);
					response.sendRedirect(contextPath + "/user/login/index?callback=" + callBackUrlBase64);
					return false;
				}
		
			}
			return true;
		} catch (Exception e){
			logger.error(e.getMessage() , e);
			throw e;
		}
	}
	
	@Override  
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex) throws Exception {  
		request.getSession().removeAttribute(CALL_BACK_KEY);
	}
	
	
	//判断是否为回调地址
	public boolean isCallBack(HttpServletRequest request){
		String isCallBack = request.getParameter(IS_CALL_BACK);
		if(StringUtils.isNotBlank(isCallBack)){
			return true;
		}
		return false;
	}
	
	public String getCurrentUri(HttpServletRequest request){
		String contextPath = request.getContextPath();
		String uri = request.getRequestURI().replace(contextPath, "");
		Map<String , String[]> paramMap = request.getParameterMap();
		Iterator<Entry<String, String[]>> iterator = paramMap.entrySet().iterator();
		StringBuffer param = new StringBuffer();
		while(iterator.hasNext()){
			Entry<String , String[]> entry = iterator.next();
			String key = entry.getKey();
			if(!"type".equals(key)){
				continue;
			}
			String[] valArray = entry.getValue();
			for(String val : valArray){
				param.append("&").append(key).append("=").append(val);
			}
		}
		if(param != null && param.length() > 1){
			uri = uri + "?" + param.substring(1);
		}
		return uri;
	}
	
	//获取请求参数
	@SuppressWarnings("unchecked")
	public String getCallBackUri(HttpServletRequest request){
		String uri = request.getRequestURI();
		Map<String , String[]> paramMap = request.getParameterMap();
		Iterator<Entry<String, String[]>> iterator = paramMap.entrySet().iterator();
		StringBuffer param = new StringBuffer("?").append(IS_CALL_BACK).append("=1");
		while(iterator.hasNext()){
			Entry<String , String[]> entry = iterator.next();
			String key = entry.getKey();
			String[] valArray = entry.getValue();
			for(String val : valArray){
				param.append("&").append(key).append("=").append(val);
			}
		}
		String callBackUri = uri.concat(param.toString());
		logger.debug("回调地址：{}" , callBackUri);
		return callBackUri;
	}
	
	/**
	 * 不需要检查
	 * @param uri
	 * @return
	 */
	private boolean noCheck(String uri , List<String> checkList){
		for(String bindUri : checkList){
			if(bindUri.indexOf("/*") > 0){
				bindUri = bindUri.replace("/*", "").replace("*", "");
				if(uri.indexOf(bindUri) >= 0){
					logger.debug("权限拦截器识别uri:【{}】为无需绑定即可访问的链接" , bindUri);
					return true;
				}
			} else if(bindUri.indexOf("?") >= 0){
				if(uri.equals(bindUri.substring(0, bindUri.indexOf("?")))){
					int index1 = bindUri.indexOf("?");
					int index2 = bindUri.indexOf("=", index1);
					String paramKey = bindUri.substring(index1 + 1, index2);
					String paramVal = bindUri.substring(index2 + 1, bindUri.length());
					
					String value = request.getParameter(paramKey);
					if(StringUtils.isNotBlank(value) && value.equals(paramVal)){
						logger.debug("权限拦截器识别uri:【{}】为无需绑定即可访问的链接" , bindUri);
						return true;
					}
				}
				
			} else if(bindUri.indexOf(uri) >= 0) {
				logger.debug("权限拦截器识别uri:【{}】为无需绑定即可访问的链接" , bindUri);
				return true;
			}
		}
		return false;
	}
	
	public List<String> getNoBind() {
		return noBind;
	}

	public void setNoBind(List<String> noBind) {
		this.noBind = noBind;
	}

	
}
