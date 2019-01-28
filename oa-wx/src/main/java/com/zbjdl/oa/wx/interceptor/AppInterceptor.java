package com.zbjdl.oa.wx.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.zbjdl.oa.wx.config.Constants;
import com.zbjdl.oa.wx.service.SessionService;
import com.zbjdl.oa.wx.util.CookieUtils;
import com.zbjdl.oa.wx.util.DESUtil;
import com.zbjdl.oa.wx.vo.WxSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 拦截app端的请求，验证session,自动登录
 * 
 * @author zhengy
 * @date 2016/07/19
 */
public class AppInterceptor extends HandlerInterceptorAdapter {
	private Logger logger = LoggerFactory.getLogger(AppInterceptor.class);

	@Autowired
	private SessionService sessionService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		try {
			String requestURI = request.getRequestURI();
			String loginPage = request.getContextPath() + "/app/login";
			String flowListPage = request.getContextPath() + "/app/flow/list";
			boolean flag = false;

			WxSession session = sessionService.getSession();
			// session时效，使用cookie登录
			if (session == null || StringUtils.isEmpty(session.getUserId())) {
				// os类型ios、android,自动登录
				Cookie cookie = CookieUtils.getCookieByName(request, Constants.APP_COOKIE_NAME);
				if (cookie != null) {
					if (cookie.getName() != null && Constants.APP_COOKIE_NAME.equals(cookie.getName())) {
						// 拿到cookie值,解密
						String token = DESUtil.decrypt(cookie.getValue());
						logger.info("cookie token:{}", token);
						String[] values = token.split(";");
						// pos不支持自动登录
						if (values.length > 1 && (StringUtils.isEmpty(values[4]) || "ios".equals(values[4])
								|| "android".equals(values[4]))) {
							// 设置session
							WxSession wxSession = new WxSession(false);
							wxSession.setUserId(values[0]);
							wxSession.setLoginName(values[1]);
							wxSession.setUserName(values[2]);
							wxSession.setDepartmentId(values[3]);
							wxSession.setOs(values[4]);
							sessionService.setSession(wxSession);
							flag = true;
							logger.info("自动登录-------请求地址,uri:[{}] , userid:[{}], os：[{}]", requestURI, values[0],
									values[4]);
						}
					}
				}
			} else {
				flag = true;
			}

			String os = "";
			if (session != null && session.getOs() != null) {
				os = session.getOs();
			}

			if (!flag) {
				// 身份验证失败，回到登陆页面
				response.sendRedirect(loginPage + "?os=" + os);
				return false;
			} else {
				// 访问登陆页面，session或cookie有效，跳到列表页
				if ("/oa-wx/app/login".equals(requestURI)) {
					response.sendRedirect(flowListPage);
				}
			}
			return true;

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw e;
		}
	}
}
