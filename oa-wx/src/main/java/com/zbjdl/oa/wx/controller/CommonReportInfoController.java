package com.zbjdl.oa.wx.controller;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.zbjdl.common.utils.DateUtils;
import com.zbjdl.common.utils.StringUtils;
import com.zbjdl.oa.dto.CommonReportInfoDto;
import com.zbjdl.oa.dto.response.BaseRespDto;
import com.zbjdl.oa.enumtype.ReturnEnum;
import com.zbjdl.oa.service.CommonReportInfoService;
import com.zbjdl.oa.wx.vo.WxSession;

/**
 * CommonReportInfoController
 * 
 * @author code-generator
 * @date 2019-3-8 11:51:35
 * 
 */
@Controller
@RequestMapping("commonReport")
public class CommonReportInfoController extends BaseController {
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
	@ResponseBody
	public Object commonReportInfoSave(CommonReportInfoDto commonReportInfoDto) {
		BaseRespDto respDto = new BaseRespDto(ReturnEnum.SUCCESS);
		// 设置用户信息
		if (commonReportInfoDto == null || commonReportInfoDto.getId() == null) {
			commonReportInfoDto.setUserId(getSession().getUserId());
			commonReportInfoDto.setUserName(getSession().getUserName());
		}

		logger.info("save CommonReportInfo, param is : {}", JSON.toJSONString(commonReportInfoDto));
		commonReportInfoService.saveOrUpdate(commonReportInfoDto);
		return respDto;
	}

	/**
	 * 登录操作，需要使用Jquery相关框架
	 */
	@RequestMapping("/add/index1")
	public String loginIndex(Model model, String date) {
		if (StringUtils.isBlank(date)) {
			date = DateUtils.sdfDateOnly.format(new Date());
		}

		WxSession wxSession = (WxSession) super.reloadSession();
		// if (wxSession.isBind()) {
		// return "redirect:/menu?" + MenuConfig.INDEX;
		// } else {

		// 查询的当天是否已填写
		CommonReportInfoDto commonReport = commonReportInfoService.selectOneByDate("outwork1", getSession().getUserId(), date);
		model.addAttribute("date", date);
		model.addAttribute("report", commonReport);
		return "/commonReport/outworkAddIndex1";
		// }
	}

	@RequestMapping(value = "/add/index2")
	public String add(Model model, String date) {
		if (StringUtils.isBlank(date)) {
			date = DateUtils.sdfDateOnly.format(new Date());
		}

		// WxSession wxSession = (WxSession) super.reloadSession();
		// if (wxSession.isBind()) {
		// return "redirect:/menu?" + MenuConfig.INDEX;
		// } else {
		// 查询的当天是否已填写
		CommonReportInfoDto commonReport = commonReportInfoService.selectOneByDate("outwork2", getSession().getUserId(), date);
		model.addAttribute("date", date);
		model.addAttribute("report", commonReport);
		return "/commonReport/outworkAddIndex2";
		// }
	}

}
