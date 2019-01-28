package com.zbjdl.oa.wx.controller.plugin;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zbjdl.common.wx.service.WeixinUserService;
import com.zbjdl.common.wx.util.dto.WxBindUserDto;
import com.zbjdl.oa.wx.config.Constants;
import com.zbjdl.oa.wx.controller.BaseController;


/**
 * 微信多客服插件应用
 * 
 * 
 * @since 2014-9-7 21:47:07
 */
@Controller
@RequestMapping(value = "/static/mcs/plugin")
public class PluginController extends BaseController{
	
	@Autowired 
	private WeixinUserService weixinUserService;
	/**
	 * 用户详细信息插件：
	 * 登录名、用户姓名、绑定手机号
	 */
	@RequestMapping("/userInfo")
	public String index(Model model , HttpServletRequest request){
		String url = request.getRequestURL().toString().replace(request.getRequestURI() , "") + request.getContextPath();
		model.addAttribute("host", url);
		return "/plugin/userInfo";
	}
	
	/**
	 * 根据用户OpenId，查询用户具体信息
	 */
	@RequestMapping("/ajax/userInfo")
	@ResponseBody
	public Map<String , Object> userInfo(String opi){
		Map<String , Object> map = new HashMap<String , Object>();
		if(StringUtils.isBlank(opi)){
			return map;
		}
		WxBindUserDto bindUser = weixinUserService.queryBindUserByOpenId(opi, Constants.SYSTEM_CODE);
		//TODO 取得用户信息
//		if(bindUser != null){
//			map.put("realName" , member.getRealName());
//			map.put("loginName", member.getLoginName());
//			map.put("bindMobileNo", member.getBindMobileNo());
//		}
		return map;
	}
}
