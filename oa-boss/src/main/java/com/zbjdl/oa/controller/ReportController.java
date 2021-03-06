package com.zbjdl.oa.controller;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.zbjdl.boss.admin.frame.BaseController;
import com.zbjdl.common.amount.Amount;
import com.zbjdl.common.utils.BeanUtils;
import com.zbjdl.common.utils.DateUtils;
import com.zbjdl.common.utils.StringUtils;
import com.zbjdl.oa.dto.OrderInfoDto;
import com.zbjdl.oa.dto.OrderWithUserInfoDto;
import com.zbjdl.oa.dto.UserInfoDto;
import com.zbjdl.oa.dto.request.ReportBaseReqDto;
import com.zbjdl.oa.dto.response.BussAnalyzeReportRespDto;
import com.zbjdl.oa.dto.response.CustomerChannelReportRespDto;
import com.zbjdl.oa.dto.response.OrderSummaryReportRespDto;
import com.zbjdl.oa.dto.response.SalePerformanceReportRespDto;
import com.zbjdl.oa.service.OrderInfoService;
import com.zbjdl.oa.service.UserInfoService;
import com.zbjdl.oa.util.WxDateUtils;

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

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

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

		if (getCurrentUser().getPrimaryDepartmentId() == 144L) { // 综合部

		} else if (getCurrentUser().getIsAdmin() != null && getCurrentUser().getIsAdmin()) { // 如果是管理员，显示当前城市所有
			UserInfoDto userDto = userInfoService.selectById(getCurrentUser().getUserId());
			if (userDto != null) {
				orderInfoDto.setCity(userDto.getCity());
			}
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
			 * 总汇总
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
			} else if (!total.c1.equals(tmp.c1)) {
				resultMap.put((long) i, total);
				resultMap.put(entry.getKey(), tmp);
				total = new CustomerChannelReportRespDto();
				total.c3 = new Amount();
				BeanUtils.copyProperties(tmp, total);
				total.setC2("总计");
			} else {
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

			if (++i == map.size()) {
				resultMap.put((long) i, total);
			}
		}

		// List<CustomerChannelReportRespDto>
		try {
			model.addAttribute("date", dateFormat.parse(date));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
		try {
			model.addAttribute("date", dateFormat.parse(date));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
		if (getCurrentUser().getPrimaryDepartmentId() == 144L) { // 综合部

		} else if (getCurrentUser().getIsAdmin() != null && getCurrentUser().getIsAdmin()) { // 如果是管理员，显示当前城市所有
			UserInfoDto userDto = userInfoService.selectById(getCurrentUser().getUserId());
			if (userDto != null) {
				dto.setCity(userDto.getCity());
			}
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
			total.setBossDay(total.getBossDay() + bussAnalyzeReportRespDto.getBossDay());
			total.setBossMonth(total.getBossMonth() + bussAnalyzeReportRespDto.getBossMonth());
			total.setDayOpp1(total.getDayOpp1() + bussAnalyzeReportRespDto.getDayOpp1());
			total.setDayOpp2(total.getDayOpp2() + bussAnalyzeReportRespDto.getDayOpp2());
			total.setDayOpp3(total.getDayOpp3() + bussAnalyzeReportRespDto.getDayOpp3());
			total.setMonthOpp1(total.getMonthOpp1() + bussAnalyzeReportRespDto.getMonthOpp1());
			total.setMonthOpp2(total.getMonthOpp2() + bussAnalyzeReportRespDto.getMonthOpp2());
			total.setMonthOpp3(total.getMonthOpp3() + bussAnalyzeReportRespDto.getMonthOpp3());
			total.setQdsDay(total.getQdsDay() + bussAnalyzeReportRespDto.getQdsDay());
			total.setQdsMonth(total.getQdsMonth() + bussAnalyzeReportRespDto.getQdsMonth());
			total.setQsbDay(total.getQsbDay() + bussAnalyzeReportRespDto.getQsbDay());
			total.setQsbMonth(total.getQsbMonth() + bussAnalyzeReportRespDto.getQsbMonth());
			resultList.add(bussAnalyzeReportRespDto);
			if (i == list.size() - 1) {
				resultList.add(total);
			}
		}

		try {
			model.addAttribute("date", dateFormat.parse(date));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		model.addAttribute("list", resultList);
		return "/report/bussAnalyzeReport";
	}

	/**
	 * 销售业绩
	 * 
	 * @param model
	 * @param date
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping("/salePerformance")
	public String s(Model model, String date) throws ParseException {
		if (StringUtils.isBlank(date)) {
			date = sdf.format(new Date());
		}

		// 获取日期集合
		List<String> dayList = WxDateUtils.getDayListByMonth(date);

		ReportBaseReqDto param = new ReportBaseReqDto();
		param.setDate(date);
		// 不同权限用户查询不同数据
		if (getCurrentUser().getPrimaryDepartmentId() == 144L) { // 综合部

		} else if (getCurrentUser().getIsAdmin() != null && getCurrentUser().getIsAdmin()) { // 如果是管理员，显示当前城市所有
			UserInfoDto userDto = userInfoService.selectById(getCurrentUser().getUserId());
			if (userDto != null) {
				param.setCity(userDto.getCity());
			}
		}
		logger.info("查询订单列表，参数为：{}", JSON.toJSONString(param));

		// 查询当月
		// Map<String, Amount> map = new HashMap<String, Amount>();
		List<SalePerformanceReportRespDto> list = orderInfoService.findSalePerformanceReport(param);
		Map<String, List<String>> map = new LinkedHashMap<String, List<String>>();
		// 设置表头
		List<String> title = new ArrayList<String>();
		title.add("城市");
		title.add("姓名");
		title.add("目标");
		title.add("毛利");
		title.add("完成率");
		for (String string : dayList) {
			title.add(string.substring(string.indexOf("-") + 1));
		}
		map.put("title", title);
		for (SalePerformanceReportRespDto dto1 : list) {
			if (map.get(String.valueOf(dto1.getUserId())) == null) {
				List<String> l = new ArrayList<String>();
				// list初始化
				for (int i = 0; i < dayList.size() + 5; i++) {
					l.add("");
				}
				l.set(0, dto1.getCity());
				l.set(1, dto1.getUserName());
				l.set(2, dto1.getTargetAmount() == null ? "0" : dto1.getTargetAmount().toString());
				// l.set(3, dto1.getCity());
				// l.set(4, dto1.getCity());
				map.put(String.valueOf(dto1.getUserId()), l);
			}

			List<String> row = map.get(String.valueOf(dto1.getUserId()));
			// 根据日期，对应到具体单元格
			String day = dto1.getOrderDate().split("-")[2];
			row.set(Integer.parseInt(day) + 4, dto1.getProfitAmount().toString());

		}

		int i = 0;

		List<String> cityList = new ArrayList<String>();
		List<String> totalList = new ArrayList<String>();

		for (int k = 0; k < dayList.size() + 5; k++) {
			totalList.add("");
		}
		totalList.set(0, "总计");
		totalList.set(1, "总计");
		/*
		 * 汇总
		 */
		Map<String, List<String>> resultMap = new LinkedHashMap<String, List<String>>();
		for (Map.Entry<String, List<String>> entry : map.entrySet()) {
			/*
			 * 总汇总
			 */
			List<String> tmpList = entry.getValue();

			if (i == 0) {
				i++;
				resultMap.put(entry.getKey(), tmpList);
				resultMap.put("zongji", totalList);
				continue;
			}

			/*
			 * 地区汇总
			 */
			if (cityList.size() == 0) {
				resultMap.put(entry.getKey(), tmpList);
				cityList.addAll(tmpList);
				cityList.set(1, "总计");
			} else if (!cityList.get(0).equals(tmpList.get(0))) {
				resultMap.put(i + "", cityList);
				resultMap.put(entry.getKey(), tmpList);
				cityList = new ArrayList<String>();
				cityList.addAll(tmpList);
				cityList.set(1, "总计");
			} else {
				for (int j = 2; j < cityList.size(); j++) {
					if (j == 4) {
						continue;
					}
					String b1 = StringUtils.isBlank(cityList.get(j)) ? "0" : cityList.get(j);
					String b2 = tmpList.get(j);
					if (StringUtils.isNotBlank(b2)) {
						cityList.set(j, new BigDecimal(b1).add(new BigDecimal(b2)).toString());
					}
				}
				resultMap.put(entry.getKey(), tmpList);
			}

			// 计算汇总
			for (int j = 2; j < cityList.size(); j++) {
				if (j == 4) {
					continue;
				}
				String b2 = tmpList.get(j);
				String b3 = StringUtils.isBlank(totalList.get(j)) ? "0" : totalList.get(j);
				if (StringUtils.isNotBlank(b2)) {
					totalList.set(j, new BigDecimal(b3).add(new BigDecimal(b2)).toString());
				}
			}

			if (++i == map.size()) {
				resultMap.put(i + "", cityList);
			}
		}

		if (list.size() > 1) {
			// 汇总
			for (Map.Entry<String, List<String>> entry : resultMap.entrySet()) {
				if ("城市".equals(entry.getValue().get(0))) {
					continue;
				}
				List<String> l = entry.getValue();
				BigDecimal totalAmount = new BigDecimal(0);
				for (int ii = 5; ii < l.size(); ii++) {
					if (StringUtils.isNotBlank(l.get(ii))) {
						totalAmount = totalAmount.add(new BigDecimal(l.get(ii).toString()));
					}
				}
				l.set(3, totalAmount.toString());
				if (StringUtils.isBlank(l.get(2)) || "0.00".equals(l.get(2))) {
					l.set(4, "");
				} else {
					l.set(4, totalAmount.multiply(new BigDecimal(100)).divide(new BigDecimal(l.get(2)), 2, BigDecimal.ROUND_HALF_EVEN)
							.toString()
							+ "%");
				}

			}

		}

		model.addAttribute("date", date);
		model.addAttribute("list", resultMap);

		TreeSet<String> dateSet = WxDateUtils.genDateSet("2019-01", sdf.format(new Date()));
		model.addAttribute("dateSet", dateSet);

		return "/report/salePerformanceReport";
	}

	@RequestMapping("/orderList")
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
		if (getCurrentUser().getPrimaryDepartmentId() == 144L) { // 综合部

		} else if (getCurrentUser().getIsAdmin() != null && getCurrentUser().getIsAdmin()) { // 如果是管理员，显示当前城市所有
			UserInfoDto userDto = userInfoService.selectById(getCurrentUser().getUserId());
			if (userDto != null) {
				orderInfoDto.setCity(userDto.getCity());
			}
		}
		logger.info("查询订单列表，参数为：{}", JSON.toJSONString(orderInfoDto));
		list = orderInfoService.findListWithUser(orderInfoDto);
		model.addAttribute("list", list);
		try {
			model.addAttribute("date", dateFormat.parse(date));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("row", 1);
		return "/report/orderList";
	}
}
