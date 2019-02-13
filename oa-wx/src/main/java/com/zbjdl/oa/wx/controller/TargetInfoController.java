package com.zbjdl.oa.wx.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;

import com.zbjdl.oa.dto.TargetInfoDto;
import com.zbjdl.oa.service.TargetInfoService;

/**
 * TargetInfoController
 * 
 * @author code-generator
 * @date 2019-2-12 9:39:41 
 * 
 */
@Controller
@RequestMapping("target")
public class TargetInfoController{
	private static final Logger logger = LoggerFactory.getLogger(TargetInfoController.class);
	@Autowired
	private TargetInfoService targetInfoService;

	/*
	 * 列表页面
	 */
	@RequestMapping(value = "/assign/index", method = RequestMethod.GET)
	public ModelAndView targetInfoIndex() {
		ModelAndView mav = new ModelAndView("target/targetAssignIndex");
		return mav;
	}

	/*
	 * 进入新增页面
	 */
	@RequestMapping(value = "/edit/index", method = RequestMethod.GET)
	public ModelAndView targetInfoEditIndex(Long id) {
		ModelAndView mav = new ModelAndView("target/targetEdit");
		if (id != null) {
			TargetInfoDto targetInfoDto = targetInfoService.selectById(id);
			mav.addObject("dto", targetInfoDto);
		}
		return mav;
	}

	/*
	 * 编辑保存
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public ModelAndView targetInfoSave(TargetInfoDto targetInfoDto) {
		logger.info("save TargetInfo, param is : {}", JSON.toJSONString(targetInfoDto));
		targetInfoService.saveOrUpdate(targetInfoDto);
		ModelAndView mav = new ModelAndView("redirect:/target/index");
		return mav;
	}

	/*
	 * 详情展示
	 */
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public ModelAndView targetInfoDetail(Long id, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("target/targetDetail");
		TargetInfoDto targetInfoDto = targetInfoService.selectById(id);
		mav.addObject("dto", targetInfoDto);
		return mav;
	}
	
	
}
