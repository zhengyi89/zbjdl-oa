package com.zbjdl.oa.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.zbjdl.oa.dto.CommonReportInfoDto;
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
	public ModelAndView commonReportInfoIndex1(String date) {
		ModelAndView mav = new ModelAndView("report/commonReportIndex1");
		return mav;
	}

	@RequestMapping(value = "/index2", method = RequestMethod.GET)
	public ModelAndView commonReportInfoIndex2() {
		ModelAndView mav = new ModelAndView("report/commonReportIndex2");
		return mav;
	}

}
