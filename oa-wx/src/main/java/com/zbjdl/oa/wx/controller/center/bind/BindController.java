package com.zbjdl.oa.wx.controller.center.bind;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zbjdl.common.encrypt.Base64;
import com.zbjdl.common.utils.StringUtils;
import com.zbjdl.oa.wx.config.MenuConfig;
import com.zbjdl.oa.wx.controller.BaseController;
import com.zbjdl.oa.wx.vo.WxSession;


/**
 * “账号绑定/解绑”控制器
 * 
 * 
 * @since 2014-9-19 08:47:08
 */
@Controller
public class BindController extends BaseController{
	/**
	 * 账号绑定
	 */
	@RequestMapping(value = "menu" , params=MenuConfig.BIND)
	public Object bind(Model model){
		WxSession wxSession = (WxSession)super.reloadSession();
		if(wxSession.isBind()){
			return "redirect:/menu?"+MenuConfig.FLOW_LIST;
		} else {
			return "redirect:/login";
		}
	}
	
	/**
	 * 账户解绑
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/unbind")
	public Object unbind(Model model){
		WxSession wxSession = (WxSession)super.reloadSession();
		if(wxSession.isBind()){
			return "/wx/unbind";
		} else {
			return "redirect:/login";
		}
	}
	
	/**
	 * 退出
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String loginOut(HttpSession session){
		session.removeAttribute(WxSession.NAME);
		return "redirect:/login";
	}
	/**
	 * 绑定成功
	 */
	@RequestMapping("/bind/success")
	public String bindSuccess(HttpServletRequest request, String flag, Model model, String callback)
			throws UnsupportedEncodingException {
		String contexPath = request.getContextPath();
		if (StringUtils.isNotBlank(callback)) {
			model.addAttribute("callBackUrl", callback);
		} else {
//			callback = Base64.encode(contexPath + "/menu?" + MenuConfig.FLOW_LIST);
			callback=contexPath+"/index";
			model.addAttribute("callBackUrl", callback);
		}
		//callback = Base64.decode(callback);
		if (callback.startsWith(contexPath)) {
			callback = callback.replace(contexPath, "");
		}

//		if (WxUtil.isWxBrowser(request)) {
//			model.addAttribute("callBackUrl", callback);
//			return "/user/login_success";
//		} else {
			return ("redirect:/" + callback).replace("//", "/");
//		}
	}
	
	/**
	 * 解绑成功
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/nologin/unbind/success")
	public Object unbindSuccess(HttpSession session) {
		session.removeAttribute(WxSession.NAME);
		return "/wx/unbind_success";
	}

	/**
	 * 解绑失败
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/unbind/failed")
	public Object unbindFailed(HttpServletRequest request, Model model) {
		return "/wx/unbind_failed";
	}
}
