package com.zbjdl.oa.wx.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.zbjdl.boss.admin.user.dto.DepartmentDTO;
import com.zbjdl.boss.admin.user.dto.UserDTO;
import com.zbjdl.common.encrypt.Digest;
import com.zbjdl.common.utils.DateUtils;
import com.zbjdl.common.utils.StringUtils;
import com.zbjdl.common.wx.service.WeixinUserService;
import com.zbjdl.common.wx.util.dto.WxBindUserDto;
import com.zbjdl.oa.dto.OrderInfoDto;
import com.zbjdl.oa.dto.OrderWithUserInfoDto;
import com.zbjdl.oa.dto.UserInfoDto;
import com.zbjdl.oa.dto.response.BaseRespDto;
import com.zbjdl.oa.dto.response.BussAnalyzeReportRespDto;
import com.zbjdl.oa.dto.response.OrderSummaryReportRespDto;
import com.zbjdl.oa.enumtype.ReturnEnum;
import com.zbjdl.oa.service.OrderInfoService;
import com.zbjdl.oa.service.UserInfoService;
import com.zbjdl.oa.wx.config.Constants;
import com.zbjdl.oa.wx.dto.response.CustomerChannelReportRespDto;
import com.zbjdl.oa.wx.vo.WxSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 报表
 * 
 * @author zhengy
 * @date: 2019年1月29日 下午4:06:19
 */
@Controller
@RequestMapping(value = "/report")
public class ReportController extends BaseController {
	private Logger logger = LoggerFactory.getLogger(ReportController.class);

	@Autowired
	private OrderInfoService orderInfoService;

	@Autowired
	private UserInfoService userInfoService;

	@RequestMapping("/customerChannel")
	public String customerChannel(Model model) {

		Map<Long, CustomerChannelReportRespDto> map = new HashMap<Long, CustomerChannelReportRespDto>();
		// 查询所有订单
		OrderInfoDto orderInfoDto = new OrderInfoDto();
		List<OrderInfoDto> list = orderInfoService.findList(orderInfoDto);
		for (OrderInfoDto order : list) {
			if (map.get(order.getUserId()) == null) {
				UserInfoDto user = userInfoService.selectById(order.getUserId());
				CustomerChannelReportRespDto cdto = new CustomerChannelReportRespDto();
				cdto.c1 = user.getCity();
				cdto.c2 = user.getUserName();
				map.put(order.getUserId(), cdto);
			}
			CustomerChannelReportRespDto cdto = map.get(order.getUserId());
			cdto.c3 = cdto.c3.add(order.getProfitAmount());
			if ("4".equals(order.getProductDetailType())) {
				cdto.c4 += 1;
			} else if ("1".equals(order.getProductDetailType())) {
				cdto.c5 += 1;
			} else if ("2".equals(order.getProductDetailType())) {
				cdto.c6 += 1;
			} else if ("3".equals(order.getProductDetailType())) {
				cdto.c6 += 1;
			} else if ("3".equals(order.getProductType())) {
				cdto.c7 += 1;
			} else if ("2".equals(order.getProductType())) {
				cdto.c8 += 1;
			} else if ("5".equals(order.getProductType())) {
				cdto.c9 += 1;
			}
			cdto.c10 += 1;
			
			// 新户：代帐、注册＋代帐  
			if ("4".equals(order.getProductDetailType())||"6".equals(order.getProductDetailType())) {
				cdto.c11 += 1;
			}
			
			
			if ("1".equals(order.getCustomerChannel())) {
				cdto.c12 += 1;
			}else if ("2".equals(order.getCustomerChannel())) {
				cdto.c13 += 1;
			}else if ("3".equals(order.getCustomerChannel())) {
				cdto.c14 += 1;
			}else if ("4".equals(order.getCustomerChannel())) {
				cdto.c15 += 1;
			}else if ("5".equals(order.getCustomerChannel())) {
				cdto.c16 += 1;
			}else if ("5".equals(order.getCustomerChannel())) {
				cdto.c17 += 1;
			}else if ("6".equals(order.getCustomerChannel())) {
				cdto.c18 += 1;
			}else if ("7".equals(order.getCustomerChannel())) {
				cdto.c19 += 1;
			}else if ("9".equals(order.getCustomerChannel())) {
				cdto.c20 += 1;
			}
		}

		return "/report/customerChannelReport";
	}

	@RequestMapping("/list")
	public String addIndex(Model model) {
		OrderInfoDto orderInfoDto = new OrderInfoDto();
		List<OrderWithUserInfoDto> list = orderInfoService.findListWithUser(orderInfoDto);
		model.addAttribute("list", list);
		return "/order/orderList";
	}
	
	@RequestMapping("/orderSummary")
	public String orderSummary(Model model, String date) {
		// 查询当月
		List<OrderSummaryReportRespDto> list = orderInfoService.findOrderSummaryReport(date);
		
		model.addAttribute("list", list);
		return "/report/orderSummaryReport";
	}
	
	
	@RequestMapping("/bussAnalyze")
	public String bussAnalyze(Model model, String date) {
		// 查询当月
		List<BussAnalyzeReportRespDto> list = orderInfoService.findBussAnalyzeReport(date);
		
		model.addAttribute("list", list);
		return "/report/bussAnalyzeReport";
	}

}
