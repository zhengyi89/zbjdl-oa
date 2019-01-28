package com.zbjdl.oa.wx.controller.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zbjdl.common.wechat.dto.js_sdk.SignDto;
import com.zbjdl.common.wechat.service.JsApiService;
import com.zbjdl.oa.wx.controller.BaseController;
import com.zbjdl.oa.wx.vo.WxSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
public class CommonController extends BaseController {
	private Logger logger = LoggerFactory.getLogger(CommonController.class);
	
	/**
	 * 添加微信签名，用于页面进行微信浏览器控制使用
	 * 由于目前所有微信端的页面，都需要调用此方法，暂时把该方法放到拦截器中
	 * 如果，需求变化为部分页面，不需要使用微信JS-SDK的话，则把此方法移动到controller中，前台使用ajax调用
	 */
	@RequestMapping(value = "/jsSign")
	@ResponseBody
	public SignDto jsSign(String url){
		try {
			WxSession wxSession = super.getSession();
			if(wxSession.isWxBrowser()){
				return JsApiService.sign(url);
			}
		} catch(Exception e){
			logger.error("应用拦截器异常" , e);
		}
		return null;
	}
}
