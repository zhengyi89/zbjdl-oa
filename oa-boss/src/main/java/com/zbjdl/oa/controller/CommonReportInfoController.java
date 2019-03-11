package com.zbjdl.oa.controller;

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
public class CommonReportInfoController{
	private static final Logger logger = LoggerFactory.getLogger(CommonReportInfoController.class);
	@Autowired
	private CommonReportInfoService commonReportInfoService;

	/*
	 * 列表页面
	 */
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView commonReportInfoIndex() {
		ModelAndView mav = new ModelAndView("commonReport/commonReportIndex");
		return mav;
	}

	/*
	 * 进入新增页面
	 */
	@RequestMapping(value = "/edit/index", method = RequestMethod.GET)
	public ModelAndView commonReportInfoEditIndex(Long id) {
		ModelAndView mav = new ModelAndView("commonReport/commonReportEdit");
		if (id != null) {
			CommonReportInfoDto commonReportInfoDto = commonReportInfoService.selectById(id);
			mav.addObject("dto", commonReportInfoDto);
		}
		return mav;
	}

	/*
	 * 编辑保存
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public ModelAndView commonReportInfoSave(CommonReportInfoDto commonReportInfoDto) {
		logger.info("save CommonReportInfo, param is : {}", JSON.toJSONString(commonReportInfoDto));
		commonReportInfoService.saveOrUpdate(commonReportInfoDto);
		ModelAndView mav = new ModelAndView("redirect:/commonReport/index");
		return mav;
	}
	
}
