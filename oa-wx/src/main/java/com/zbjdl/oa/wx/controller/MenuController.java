package com.zbjdl.oa.wx.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zbjdl.oa.wx.vo.WxVo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * Open API父类控制器
 * 
 * 
 * @since 2014-9-17 21:35:10
 */
@Controller
public class MenuController extends BaseController{
	private Logger logger = LoggerFactory.getLogger(MenuController.class);
	
	/**
	 * 菜单处理时间
	 */
	@RequestMapping(value = "menu" , params="type=\"\"")
	protected Object process(WxVo wx){
		logger.error("不支持的操作:{}" , wx);
		throw new UnsupportedOperationException(wx.toString());
	}
	
	
	/**
	 * 首页
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/index")
	public String about(Model model) {
		return "/index";
	}

}
