package com.zbjdl.oa.wx.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zbjdl.oa.wx.config.MenuConfig;
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
public class MenuController extends BaseController {
	private Logger logger = LoggerFactory.getLogger(MenuController.class);

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

	/**
	 * 菜单处理时间
	 */
	@RequestMapping(value = "menu", params = "type=\"\"")
	protected Object process(WxVo wx) {
		logger.error("不支持的操作:{}", wx);
		throw new UnsupportedOperationException(wx.toString());
	}

	/**
	 * 登录
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "menu", params = MenuConfig.LOGIN)
	public String buy(Model model) {
		return "redirect:/user/login/index";
	}

	/**
	 * 每日商机
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "menu", params = MenuConfig.ADD_OPP)
	public String addOpp(Model model) {
		return "redirect:/opportunity/add/index";
	}

	/**
	 * 新建订单
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "menu", params = MenuConfig.ADD_ORDER)
	public String addOrder(Model model) {
		return "redirect:/order/add/index";
	}

	/**
	 * 首页
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "menu", params = MenuConfig.INDEX)
	public String index(Model model) {
		return "redirect:/index";
	}
	
	/**
	 * 解绑
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "menu", params = MenuConfig.UNBIND)
	public String unbind(Model model) {
		return "redirect:/user/unbind/index";
	}

}
