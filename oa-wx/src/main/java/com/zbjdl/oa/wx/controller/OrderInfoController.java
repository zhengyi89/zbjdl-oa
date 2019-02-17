package com.zbjdl.oa.wx.controller;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.zbjdl.boss.admin.facade.UserFacade;
import com.zbjdl.common.utils.DateUtils;
import com.zbjdl.common.utils.StringUtils;
import com.zbjdl.common.wx.service.WeixinUserService;
import com.zbjdl.oa.dto.OrderInfoDto;
import com.zbjdl.oa.dto.OrderWithUserInfoDto;
import com.zbjdl.oa.dto.response.BaseRespDto;
import com.zbjdl.oa.enumtype.ReturnEnum;
import com.zbjdl.oa.service.OrderInfoService;
import com.zbjdl.oa.service.UserInfoService;

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
	public String addIndex(Model model, Long id) {
		if (id != null) {
			OrderInfoDto orderInfo = orderInfoService.selectById(id);
			model.addAttribute("order", orderInfo);
		}
		model.addAttribute("sysdate", DateUtils.SHORT_DATE_FORMAT.format(new Date()));
		return "/order/orderAddIndex";
	}

	@RequestMapping("/list")
	public String addIndex(Model model, String date) {
		if (StringUtils.isBlank(date)) {
			date = DateUtils.sdfDateOnly.format(new Date());
		}

		OrderInfoDto orderInfoDto = new OrderInfoDto();
		try {
			orderInfoDto.setOrderDate(DateUtils.sdfDateOnly.parse(date));
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		List<OrderWithUserInfoDto> list;

		// 不同权限用户查询不同数据
		if (getSession().getIsSuperAdmin() != null && getSession().getIsSuperAdmin()) { // 如果是超级管理员，显示当月所有

		} else if (getSession().getIsAdmin() != null && getSession().getIsAdmin()) { // 如果是管理员，显示当前城市所有
			orderInfoDto.setCity(getSession().getCity());
		} else { // 普通员工，显示自己
			orderInfoDto.setUserId(Long.parseLong(getSession().getUserId()));
		}
		logger.info("查询订单列表，参数为：{}", JSON.toJSONString(orderInfoDto));
		list = orderInfoService.findListWithUser(orderInfoDto);
		model.addAttribute("list", list);
		model.addAttribute("date", date);
		model.addAttribute("row", 1);
		return "/order/orderList";
	}

	/*
	 * 编辑保存
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@ResponseBody
	public Object orderInfoSave(OrderInfoDto orderInfoDto, BindingResult bindingResult) {
		logger.info("save OrderInfo, param is : {}", JSON.toJSONString(orderInfoDto));
		orderInfoDto.setUserId(Long.parseLong(getSession().getUserId()));
		orderInfoDto.setCity(getSession().getCity());
		orderInfoService.saveOrUpdate(orderInfoDto);
		BaseRespDto respDto = new BaseRespDto(ReturnEnum.SUCCESS);
		return respDto;
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
