package com.zbjdl.oa.wx.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.zbjdl.boss.admin.facade.UserFacade;
import com.zbjdl.boss.admin.user.dto.DepartmentDTO;
import com.zbjdl.boss.admin.user.dto.UserDTO;
import com.zbjdl.common.encrypt.Digest;
import com.zbjdl.common.utils.StringUtils;
import com.zbjdl.common.wx.service.WeixinUserService;
import com.zbjdl.common.wx.util.dto.WxBindUserDto;
import com.zbjdl.oa.dto.UserInfoDto;
import com.zbjdl.oa.dto.response.BaseRespDto;
import com.zbjdl.oa.enumtype.ReturnEnum;
import com.zbjdl.oa.service.UserInfoService;
import com.zbjdl.oa.wx.config.Constants;
import com.zbjdl.oa.wx.config.MenuConfig;
import com.zbjdl.oa.wx.vo.WxSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 用户请求
 * 
 * @author zhengy
 * @date: 2019年1月29日 下午4:06:19
 */
@Controller
@RequestMapping(value = "/outwork")
public class OutworkInfoController extends BaseController {
	private Logger logger = LoggerFactory.getLogger(OutworkInfoController.class);

	@Autowired
	private UserInfoService userInfoService;

	@Autowired
	private WeixinUserService weixinUserService;

	@Autowired
	private UserFacade userFacade;

	/**
	 * 登录操作，需要使用Jquery相关框架
	 */
	@RequestMapping("/add/index")
	public String loginIndex(Model model) {
		WxSession wxSession = (WxSession) super.reloadSession();
//		if (wxSession.isBind()) {
//			return "redirect:/menu?" + MenuConfig.INDEX;
//		} else {
			return "/outwork/outworkAddIndex";
//		}
	}
	
	@RequestMapping(value="/add/index1")
	public String add(Model model) {
//		WxSession wxSession = (WxSession) super.reloadSession();
//		if (wxSession.isBind()) {
//			return "redirect:/menu?" + MenuConfig.INDEX;
//		} else {
			return "/outwork/outworkAddIndex1";
//		}
	}


}
