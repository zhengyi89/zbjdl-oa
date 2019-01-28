package com.zbjdl.oa.wx.controller.common;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zbjdl.common.encrypt.Base64;
import com.zbjdl.common.utils.StringUtils;
import com.zbjdl.oa.wx.controller.BaseController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 系统全局请求控制器
 * 
 * 
 * @since 2014-9-7 21:47:07
 */
@Controller
@RequestMapping(value = "/general")
public class WxGeneralController extends BaseController{
	private Logger logger = LoggerFactory.getLogger(WxGeneralController.class);
	public static final String REDIRECT_KEY = "_WX_REDIRECT_KEY";
	
	/**
	 * 重定向到指定视图
	 */
	@RequestMapping("/toView")
	public String toView(HttpSession session , Model model){
		String view = (String)session.getAttribute(REDIRECT_KEY);
		session.removeAttribute(REDIRECT_KEY);
		try {
			if(StringUtils.isNotBlank(view)){
				view = Base64.decode(view);
				return view;
			}
		} catch (Exception e) {
			logger.error("系统转发页面失败" , e);
		}
		return "/error/default_error";
	}
	
	/**
	 * 定向页面跳转，通过地址栏传递参数
	 * 重定向到指定视图
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/gotoView")
	public String gotoView(String toView) throws UnsupportedEncodingException{
		return URLDecoder.decode(toView , "UTF-8");
	}
	
	/**
	 * 全局错误页面跳转，为以后预留处理空间
	 * @return
	 */
	@RequestMapping("/error")
	public String error(@RequestParam(defaultValue="" , value="code") String code , Model model){
		if("404".equals(code)){
			model.addAttribute("error_tip", "抱歉！找不到您要的页面...");
		} 
		return "/error/default_error";
	}
}
