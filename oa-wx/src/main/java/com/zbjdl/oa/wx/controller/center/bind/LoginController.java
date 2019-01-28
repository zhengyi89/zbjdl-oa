package com.zbjdl.oa.wx.controller.center.bind;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zbjdl.oa.wx.config.MenuConfig;
import com.zbjdl.oa.wx.controller.BaseController;
import com.zbjdl.oa.wx.vo.WxSession;

/**
 * 登录
 * 
 * 
 * @since 2014-9-7 21:47:07
 */
@Controller
public class LoginController extends BaseController{

	/**
	 * 登录操作，需要使用Jquery相关框架
	 */
	@RequestMapping("/login")
	public String login(Model model){
		WxSession wxSession = (WxSession)super.reloadSession();
		if(wxSession.isBind()){
			return "redirect:/menu?"+MenuConfig.FLOW_LIST;
		} else {
			return "/wx/login_wx";
		}
	}
	
	
	/**
	 * 登录操作，显示验证码
	 */
	@RequestMapping("/login/cp")
	public String loginCp(Model model , String phone){
		WxSession wxSession = (WxSession)super.reloadSession();
		if(wxSession.isBind()){
			return "redirect:/menu?"+MenuConfig.FLOW_LIST;
		} else {
			model.addAttribute("phone", phone);
			return "/wx/login_wx";
		}
	}
}
