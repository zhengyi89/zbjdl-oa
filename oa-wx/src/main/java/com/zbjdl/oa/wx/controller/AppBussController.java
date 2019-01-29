package com.zbjdl.oa.wx.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.zbjdl.common.json.JSONException;
import com.zbjdl.common.json.JSONObject;
import com.zbjdl.oa.wx.config.Constants;
import com.zbjdl.oa.wx.util.CookieUtils;
import com.zbjdl.oa.wx.util.DESUtil;
import com.zbjdl.oa.wx.util.HttpUtil;
import com.zbjdl.oa.wx.vo.WxSession;

/**
 * @author zhengy
 * @date 2016/07/11
 */
@RequestMapping("/app")
@Controller
public class AppBussController extends BaseController {
	private Logger logger = LoggerFactory.getLogger(AppBussController.class);

	// "http://boss.yunpal.in:8080/admin-boss/";
	@Value("${server.admin-boss.url}")
	private String ADMIN_BOSS_URL;

	/**
	 * 登录
	 * 
	 * @param req
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView showLogin(HttpServletRequest req) {
		String os = request.getParameter("os") == null ? "" : request.getParameter("os");
		WxSession session = new WxSession(false);
		sessionService.setSession(session);
		ModelAndView mav = new ModelAndView("app/login");
		mav.addObject("os", os);
		return mav;
	}

	/**
	 * 登录
	 * 
	 * @param req
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/login/do", method = { RequestMethod.POST, RequestMethod.GET })
	public String login(HttpServletRequest req, HttpServletResponse resp) {
		String mobile = req.getParameter("mobile");
		String password = req.getParameter("password");

		if (mobile == null || "".equals(mobile) || password == null || "".equals(password)) {
			return null;
		}

		Map<String, String> paramMap = new HashMap<>();
		paramMap.put("loginName", mobile);
		paramMap.put("password", password);
		String result = "";
		try {
			result = HttpUtil.executePost(ADMIN_BOSS_URL + "/api/login", paramMap);
			logger.info("admin-boss登录返回结果：[{}]", result);

			try {
				JSONObject jsonObject = new JSONObject(result);
				// 登录成功
				if ("ok".equals(jsonObject.get("flag"))) {
					WxSession session = super.getSession();
					// 生成token
					Object userId = jsonObject.get("userId");
					Object userName = jsonObject.get("userName");
					Object os = session.getOs();
					Object departmentId = jsonObject.get("primaryDepartmentId");
					String token = DESUtil.encrypt(userId + ";" + mobile + ";" + userName + ";" + departmentId + ";"
							+ os + ";" + System.currentTimeMillis());
					jsonObject.put("token", token);
					result = jsonObject.toString();
					// 设置cookie
					CookieUtils.addCookie(resp, Constants.APP_COOKIE_NAME, token, 60 * 60 * 24 * 30 * 6);

					// userId写入session
					session.setUserId(userId.toString());
					session.setUserName(userName.toString());
					session.setDepartmentId(departmentId.toString());
					session.setLoginName(mobile);
					sessionService.setSession(session);

				}
			} catch (JSONException e) {
				logger.error("admin-boss返回数据解析系统异常：{}", result);
				e.printStackTrace();
				return null;
			}
		} catch (IOException e) {
			logger.error("请求admin-boss系统异常：{}", e.getMessage());
			e.printStackTrace();
			return null;
		}
		return result;
	}

	/**
	 * 个人资料
	 * 
	 * @throws JSONException
	 */
	@RequestMapping(value = "/userinfo/get", method = RequestMethod.GET)
	public ModelAndView getUserinfo(HttpServletRequest req) throws JSONException {
		// 获取个人资料
		String result = "";
		String userId = String.valueOf(super.getSession().getUserId());
		String url = ADMIN_BOSS_URL + "/api/user/get/" + userId;
		try {
			result = HttpUtil.executeGet(url);
			logger.info("admin-boss 返回用户资料信息：{}", result);
		} catch (IOException e) {
			logger.error("访问 {} 异常", url);
			e.getStackTrace();
		}
		JSONObject obj = new JSONObject(result);
		ModelAndView mav = new ModelAndView("app/userinfo");
		mav.addObject("userName", obj.get("userName"));
		mav.addObject("primaryDepartmentId", obj.get("password"));
		mav.addObject("mobile", obj.get("mobile"));
		return mav;
	}

	/**
	 * 关于
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/about")
	public String about(Model model) {
		return "app/about";
	}




}
