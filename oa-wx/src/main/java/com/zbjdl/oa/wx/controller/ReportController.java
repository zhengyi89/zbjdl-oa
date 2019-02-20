package com.zbjdl.oa.wx.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.zbjdl.common.amount.Amount;
import com.zbjdl.common.utils.BeanUtils;
import com.zbjdl.common.utils.DateUtils;
import com.zbjdl.common.utils.StringUtils;
import com.zbjdl.oa.dto.OrderInfoDto;
import com.zbjdl.oa.dto.OrderWithUserInfoDto;
import com.zbjdl.oa.dto.UserInfoDto;
import com.zbjdl.oa.dto.request.ReportBaseReqDto;
import com.zbjdl.oa.dto.response.BussAnalyzeReportRespDto;
import com.zbjdl.oa.dto.response.OrderSummaryReportRespDto;
import com.zbjdl.oa.service.OrderInfoService;
import com.zbjdl.oa.service.UserInfoService;
import com.zbjdl.oa.wx.dto.response.CustomerChannelReportRespDto;

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
	public String customerChannel(Model model, String date) {

		if (StringUtils.isBlank(date)) {
			date = DateUtils.sdfDateOnly.format(new Date());
		}

		Map<Long, CustomerChannelReportRespDto> map = new LinkedHashMap<Long, CustomerChannelReportRespDto>();
		
		// 查询所有订单
		OrderInfoDto orderInfoDto = new OrderInfoDto();
		try {
			orderInfoDto.setOrderDate(DateUtils.sdfDateOnly.parse(date));
		} catch (ParseException e) {
			e.printStackTrace();
			throw new RuntimeException();
		}

		if (getSession().getIsSuperAdmin() != null && getSession().getIsSuperAdmin()) {

		} else if (getSession().getIsAdmin() != null && getSession().getIsAdmin()) { // 如果是管理员，显示当前城市所有
			orderInfoDto.setCity(getSession().getCity());
		} else { // 普通员工，显示自己
			orderInfoDto.setUserId(Long.parseLong(getSession().getUserId()));
		}

		
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
			cdto.c3 = cdto.c3 == null ? new Amount() : cdto.c3;
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
			if ("4".equals(order.getProductDetailType()) || "6".equals(order.getProductDetailType())) {
				cdto.c11 += 1;
			}

			if ("1".equals(order.getCustomerChannel())) {
				cdto.c12 += 1;
			} else if ("2".equals(order.getCustomerChannel())) {
				cdto.c13 += 1;
			} else if ("3".equals(order.getCustomerChannel())) {
				cdto.c14 += 1;
			} else if ("4".equals(order.getCustomerChannel())) {
				cdto.c15 += 1;
			} else if ("5".equals(order.getCustomerChannel())) {
				cdto.c16 += 1;
			} else if ("6".equals(order.getCustomerChannel())) {
				cdto.c17 += 1;
			} else if ("7".equals(order.getCustomerChannel())) {
				cdto.c18 += 1;
			} else if ("9".equals(order.getCustomerChannel())) {
				cdto.c19 += 1;
			}
		}
		
		/*
		 * 汇总
		 */
		CustomerChannelReportRespDto total = new CustomerChannelReportRespDto();
		total.c3 = new Amount();
		CustomerChannelReportRespDto summary = new CustomerChannelReportRespDto();
		summary.c3 = new Amount();
		int i = 0;
		Map<Long, CustomerChannelReportRespDto> resultMap = new LinkedHashMap<Long, CustomerChannelReportRespDto>();
		for (Map.Entry<Long, CustomerChannelReportRespDto> entry : map.entrySet()) {
			CustomerChannelReportRespDto tmp = entry.getValue();
			/*
			 *  总汇总
			 */
			summary.c3 = summary.c3.add(tmp.c3);
			summary.c4 += tmp.c4;
			summary.c5 += tmp.c5;
			summary.c6 += tmp.c6;
			summary.c7 += tmp.c7;
			summary.c8 += tmp.c8;
			summary.c9 += tmp.c9;
			summary.c10 += tmp.c10;
			summary.c11 += tmp.c11;
			summary.c12 += tmp.c12;
			summary.c13 += tmp.c13;
			summary.c14 += tmp.c14;
			summary.c15 += tmp.c15;
			summary.c16 += tmp.c16;
			summary.c17 += tmp.c17;
			summary.c18 += tmp.c18;
			summary.c19 += tmp.c19;

			/*
			 * 地区汇总
			 */
			if (StringUtils.isBlank(total.c1)) {
				resultMap.put(entry.getKey(), tmp);
				BeanUtils.copyProperties(tmp, total);
				total.setC2("总计");
			}else if (!total.c1.equals(tmp.c1)) {
				resultMap.put((long)i, total);
				resultMap.put(entry.getKey(), tmp);
				total = new CustomerChannelReportRespDto();
				total.c3 = new Amount();
				BeanUtils.copyProperties(tmp, total);
				total.setC2("总计");
			}else {
				total.c3 = total.c3.add(tmp.c3);
				total.c4 += tmp.c4;
				total.c5 += tmp.c5;
				total.c6 += tmp.c6;
				total.c7 += tmp.c7;
				total.c8 += tmp.c8;
				total.c9 += tmp.c9;
				total.c10 += tmp.c10;
				total.c11 += tmp.c11;
				total.c12 += tmp.c12;
				total.c13 += tmp.c13;
				total.c14 += tmp.c14;
				total.c15 += tmp.c15;
				total.c16 += tmp.c16;
				total.c17 += tmp.c17;
				total.c18 += tmp.c18;
				total.c19 += tmp.c19;
				resultMap.put(entry.getKey(), tmp);
			}
			
			if (++i==map.size()) {
				resultMap.put((long)i, total);
			}
		}

		// List<CustomerChannelReportRespDto>
		model.addAttribute("date", date);
		model.addAttribute("list", resultMap);
		model.addAttribute("summary", summary);

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
		if (StringUtils.isBlank(date)) {
			date = DateUtils.sdfDateOnly.format(new Date());
		}
		// 查询当月
		List<OrderSummaryReportRespDto> list = orderInfoService.findOrderSummaryReport(date);

		Amount sumDay = new Amount();
		Amount sumMonth = new Amount();
		for (OrderSummaryReportRespDto orderSummaryReportRespDto : list) {
			sumDay = sumDay.add(orderSummaryReportRespDto.getDayAmount());
			sumMonth = sumMonth.add(orderSummaryReportRespDto.getMonthAmount());
		}
		model.addAttribute("sumDay", sumDay);
		model.addAttribute("sumMonth", sumMonth);
		model.addAttribute("date", date);
		model.addAttribute("list", list);
		return "/report/orderSummaryReport";
	}

	/**
	 * 商机数表
	 * 
	 * @param model
	 * @param date
	 * @return
	 */
	@RequestMapping("/bussAnalyze")
	public String bussAnalyze(Model model, String date) {
		if (StringUtils.isBlank(date)) {
			date = DateUtils.sdfDateOnly.format(new Date());
		}

		ReportBaseReqDto dto = new ReportBaseReqDto();
		dto.setDate(date);
		// 不同权限用户查询不同数据
		if (getSession().getIsSuperAdmin() != null && getSession().getIsSuperAdmin()) { // 如果是超级管理员，显示当月所有

		} else if (getSession().getIsAdmin() != null && getSession().getIsAdmin()) { // 如果是管理员，显示当前城市所有
			dto.setCity(getSession().getCity());
		} else { // 普通员工，显示自己
			dto.setUserId(Long.parseLong(getSession().getUserId()));
		}
		logger.info("查询订单列表，参数为：{}", JSON.toJSONString(dto));

		// 查询当月
		List<BussAnalyzeReportRespDto> list = orderInfoService.findBussAnalyzeReport(dto);
		BussAnalyzeReportRespDto total = new BussAnalyzeReportRespDto();
		
		List<BussAnalyzeReportRespDto> resultList = new ArrayList<BussAnalyzeReportRespDto>();
		// 总计
		for (int i = 0; i < list.size(); i++) {
			BussAnalyzeReportRespDto bussAnalyzeReportRespDto = list.get(i);
			
			if (StringUtils.isBlank(total.getCity())) {
				total.setCity(bussAnalyzeReportRespDto.getCity());
				total.setUserName("总计");
			}
			if (!total.getCity().equals(bussAnalyzeReportRespDto.getCity())) {
				resultList.add(i, total);
				total = new BussAnalyzeReportRespDto();
				total.setCity(bussAnalyzeReportRespDto.getCity());
				total.setUserName("总计");
			}
			total.setBossDay(total.getBossDay()+bussAnalyzeReportRespDto.getBossDay());
			total.setBossMonth(total.getBossMonth()+bussAnalyzeReportRespDto.getBossMonth());
			total.setDayOpp1(total.getDayOpp1()+bussAnalyzeReportRespDto.getDayOpp1());
			total.setDayOpp2(total.getDayOpp2()+bussAnalyzeReportRespDto.getDayOpp2());
			total.setDayOpp3(total.getDayOpp3()+bussAnalyzeReportRespDto.getDayOpp3());
			total.setMonthOpp1(total.getMonthOpp1()+bussAnalyzeReportRespDto.getMonthOpp1());
			total.setMonthOpp2(total.getMonthOpp2()+bussAnalyzeReportRespDto.getMonthOpp2());
			total.setMonthOpp3(total.getMonthOpp3()+bussAnalyzeReportRespDto.getMonthOpp3());
			total.setQdsDay(total.getQdsDay()+bussAnalyzeReportRespDto.getQdsDay());
			total.setQdsMonth(total.getQdsMonth()+bussAnalyzeReportRespDto.getQdsMonth());
			total.setQsbDay(total.getQsbDay()+bussAnalyzeReportRespDto.getQsbDay());
			total.setQsbMonth(total.getQsbMonth()+bussAnalyzeReportRespDto.getQsbMonth());
			resultList.add(bussAnalyzeReportRespDto);
			if (i==list.size()-1) {
				resultList.add(total);
			}
		}
		
		
		model.addAttribute("date", date);
		model.addAttribute("list", resultList);
		return "/report/bussAnalyzeReport";
	}

}
