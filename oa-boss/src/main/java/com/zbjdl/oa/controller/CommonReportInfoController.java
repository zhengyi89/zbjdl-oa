package com.zbjdl.oa.controller;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.zbjdl.common.utils.DateUtils;
import com.zbjdl.common.utils.StringUtils;
import com.zbjdl.oa.dto.CommonReportInfoDto;
import com.zbjdl.oa.dto.CommonReportWithUserDto;
import com.zbjdl.oa.dto.request.CommonReportQueryReqDto;
import com.zbjdl.oa.service.CommonReportInfoService;

/**
 * CommonReportInfoController
 * 
 * @author code-generator
 * @date 2019-3-8 11:51:35
 * 
 */
@Controller
@RequestMapping("commonReport")
public class CommonReportInfoController {
	private static final Logger logger = LoggerFactory.getLogger(CommonReportInfoController.class);
	@Autowired
	private CommonReportInfoService commonReportInfoService;

	/*
	 * 列表页面
	 */
	@RequestMapping(value = "/index1", method = RequestMethod.GET)
	public ModelAndView commonReportInfoIndex1(String date, String city) {
		ModelAndView mav = new ModelAndView("report/commonReportIndex1");

		if (StringUtils.isBlank(date)) {
			date = DateUtils.sdfDateOnly.format(new Date());
		}
		if (StringUtils.isBlank(city)) {
			city = "大连";
		}

		CommonReportQueryReqDto dto = new CommonReportQueryReqDto();
		dto.setDate(date);
		dto.setCity(city);
		dto.setType("outwork1");
		List<CommonReportWithUserDto> list = commonReportInfoService.findReport(dto);
		mav.addObject("list", list);
		mav.addObject("city", city);
		try {
			mav.addObject("date", DateUtils.sdfDateOnly.parse(date));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "/index2", method = RequestMethod.GET)
	public ModelAndView commonReportInfoIndex2(String date, String city) {
		ModelAndView mav = new ModelAndView("report/commonReportIndex2");
		if (StringUtils.isBlank(date)) {
			date = DateUtils.sdfDateOnly.format(new Date());
		}
		if (StringUtils.isBlank(city)) {
			city = "大连";
		}
		CommonReportQueryReqDto dto = new CommonReportQueryReqDto();
		dto.setDate(date);
		dto.setCity(city);
		dto.setType("outwork2");
		List<CommonReportWithUserDto> list = commonReportInfoService.findReport(dto);
		mav.addObject("list", list);
		mav.addObject("city", city);
		try {
			mav.addObject("date", DateUtils.sdfDateOnly.parse(date));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return mav;
	}

}
