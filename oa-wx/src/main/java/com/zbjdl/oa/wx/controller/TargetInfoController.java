package com.zbjdl.oa.wx.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.zbjdl.oa.dto.TargetInfoDto;
import com.zbjdl.oa.dto.TargetWithUserInfoDto;
import com.zbjdl.oa.dto.UserInfoDto;
import com.zbjdl.oa.dto.response.BaseRespDto;
import com.zbjdl.oa.enumtype.ReturnEnum;
import com.zbjdl.oa.service.TargetInfoService;
import com.zbjdl.oa.service.UserInfoService;

/**
 * TargetInfoController
 * 
 * @author code-generator
 * @date 2019-2-12 9:39:41
 * 
 */
@Controller
@RequestMapping("/target")
public class TargetInfoController extends BaseController {
	private static final Logger logger = LoggerFactory.getLogger(TargetInfoController.class);
	@Autowired
	private TargetInfoService targetInfoService;

	@Autowired
	private UserInfoService userInfoService;

	public static final SimpleDateFormat MONTH_FORMAT = new SimpleDateFormat("yyyy-MM");

	/*
	 * 列表页面
	 */
	@RequestMapping(value = "/assign/index", method = RequestMethod.GET)
	public String targetInfoIndex(Model model) {
		UserInfoDto userInfoDto = userInfoService.selectById(Long.parseLong(getSession().getUserId()));
		if (!userInfoDto.getIsAdmin()) {
			return "target/targetAssignIndex";
		}
		// 查询部门员工
		UserInfoDto querDto = new UserInfoDto();
		querDto.setCity(userInfoDto.getCity());
		List<TargetWithUserInfoDto> list = targetInfoService.findListWithUserByCity(querDto.getCity());
		model.addAttribute("month", MONTH_FORMAT.format(new Date()));
		model.addAttribute("list", list);
		logger.info("返回list ： {}", JSON.toJSONString(list));
		return "/target/targetAssignIndex";
	}

	@RequestMapping(value = "/init", method = RequestMethod.GET)
	@ResponseBody
	public Object targetInfoEditIndex() {
		BaseRespDto respDto = new BaseRespDto(ReturnEnum.SUCCESS);
		String month = MONTH_FORMAT.format(new Date());
		String city = getSession().getCity();
		logger.info("开始初始化业绩目标， month:{}, city:{}", month, city);
		// 判断是否存在未初始化
		Integer i = targetInfoService.selectUnInit(month, city);
		logger.info("存在未初始化：{}", i);
		if (i > 0) {
			targetInfoService.monthInit(month, city, getSession().getUserId());
		}
		return respDto;
	}

	@RequestMapping(value = "/hasinit", method = RequestMethod.GET)
	@ResponseBody
	public Object hasinit() {
		BaseRespDto respDto = new BaseRespDto(ReturnEnum.FAILD);
		String month = MONTH_FORMAT.format(new Date());
		String city = getSession().getCity();
		logger.info("开始初始化业绩目标， month:{}, city:{}", month, city);
		// 判断是否存在未初始化
		Integer i = targetInfoService.selectUnInit(month, city);
		logger.info("存在未初始化：{}", i);
		if (i > 0) {
			respDto.setCode(ReturnEnum.SUCCESS.getCode());
		}
		return respDto;
	}

	/*
	 * 编辑保存
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@ResponseBody
	public Object targetInfoSave(@RequestBody List<TargetInfoDto> targetInfoLit) {
		BaseRespDto respDto = new BaseRespDto(ReturnEnum.SUCCESS);
		logger.info("save TargetInfo, param is : {}", JSON.toJSONString(targetInfoLit));
		for (TargetInfoDto targetInfoDto : targetInfoLit) {
			targetInfoService.saveOrUpdate(targetInfoDto);
		}

		return respDto;
	}

}
