package com.zbjdl.oa.wx.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
@RequestMapping("target")
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
	public ModelAndView targetInfoIndex() {
		ModelAndView mav = new ModelAndView("target/targetAssignIndex");

		UserInfoDto userInfoDto = userInfoService.selectById(Long.parseLong(getSession().getUserId()));
		if (!userInfoDto.getIsAdmin()) {
			return mav;
		}
		// 查询部门员工
		UserInfoDto querDto = new UserInfoDto();
		querDto.setCity(userInfoDto.getCity());
		List<TargetWithUserInfoDto> list = targetInfoService.findListWithUserByCity(querDto.getCity());
		mav.addObject("month", MONTH_FORMAT.format(new Date()));
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping(value = "/init", method = RequestMethod.GET)
	@ResponseBody
	public Object targetInfoEditIndex() {
		BaseRespDto respDto = new BaseRespDto(ReturnEnum.SUCCESS);

		// 判断是否已经初始化
		TargetInfoDto targetInfoDto = new TargetInfoDto();
		targetInfoDto.setTargetMonth(MONTH_FORMAT.format(new Date()));
		targetInfoDto.setUserId(Long.parseLong(getSession().getUserId()));
		List<TargetInfoDto> list = targetInfoService.findList(targetInfoDto);
		if (list != null && list.size() > 0) {
			respDto.setCode(ReturnEnum.FAILD.getCode());
			respDto.setMsg("已初始化");
		}else {
			targetInfoService.monthInit(targetInfoDto.getTargetMonth(), getSession().getCity(), getSession().getUserId());
		}
		return respDto;
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
	@ResponseBody
	public Object targetInfoSave(@RequestBody List<TargetInfoDto> targetInfoLit) {
		BaseRespDto respDto = new BaseRespDto(ReturnEnum.SUCCESS);
		logger.info("save TargetInfo, param is : {}", JSON.toJSONString(targetInfoLit));
		for (TargetInfoDto targetInfoDto : targetInfoLit) {
			targetInfoService.saveOrUpdate(targetInfoDto);
		}
		
		return respDto;
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
