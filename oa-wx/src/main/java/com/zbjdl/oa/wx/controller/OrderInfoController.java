package com.zbjdl.oa.wx.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.zbjdl.boss.admin.facade.UserFacade;
import com.zbjdl.boss.admin.user.dto.DepartmentDTO;
import com.zbjdl.boss.admin.user.dto.UserDTO;
import com.zbjdl.common.encrypt.Digest;
import com.zbjdl.common.utils.DateUtils;
import com.zbjdl.common.utils.StringUtils;
import com.zbjdl.common.wx.service.WeixinUserService;
import com.zbjdl.common.wx.util.dto.WxBindUserDto;
import com.zbjdl.oa.dto.OrderInfoDto;
import com.zbjdl.oa.dto.UserInfoDto;
import com.zbjdl.oa.dto.resp.BaseRespDto;
import com.zbjdl.oa.enumtype.ReturnEnum;
import com.zbjdl.oa.service.OrderInfoService;
import com.zbjdl.oa.service.UserInfoService;
import com.zbjdl.oa.wx.config.Constants;
import com.zbjdl.oa.wx.vo.WxSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 订单请求
 * 
 * @author zhengy
 * @date: 2019年1月29日 下午4:06:19
 */
@Controller
@RequestMapping(value = "/order")
public class OrderInfoController extends BaseController {
	private Logger logger = LoggerFactory.getLogger(OrderInfoController.class);
	
	@Autowired
	private OrderInfoService orderInfoService;

	@Autowired
	private UserInfoService userInfoService;

	@Autowired
	private WeixinUserService weixinUserService;

	@Autowired
	private UserFacade userFacade;


	@RequestMapping("/add/index")
	public String save(Model model, Long id) {
		if (id!=null) {
			OrderInfoDto orderInfo = orderInfoService.selectById(id);
			model.addAttribute("order", orderInfo);
		}
		model.addAttribute("sysdate", DateUtils.SHORT_DATE_FORMAT.format(new Date()));
		return "/order/orderAddIndex";
	}

	
	/*
	 * 编辑保存
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public ModelAndView orderInfoSave(OrderInfoDto orderInfoDto) {
		logger.info("save OrderInfo, param is : {}", JSON.toJSONString(orderInfoDto));
		orderInfoService.saveOrUpdate(orderInfoDto);
		ModelAndView mav = new ModelAndView("redirect:/order/index");
		return mav;
	}

	/*
	 * 详情展示
	 */
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public ModelAndView orderInfoDetail(Long id, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("order/orderDetail");
		OrderInfoDto orderInfoDto = orderInfoService.selectById(id);
		mav.addObject("dto", orderInfoDto);
		return mav;
	}

}
