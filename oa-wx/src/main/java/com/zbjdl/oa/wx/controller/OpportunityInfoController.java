package com.zbjdl.oa.wx.controller;

import java.util.Date;
import java.util.List;

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
import com.zbjdl.oa.dto.OpportunityInfoDto;
import com.zbjdl.oa.dto.UserInfoDto;
import com.zbjdl.oa.dto.response.BaseRespDto;
import com.zbjdl.oa.enumtype.ReturnEnum;
import com.zbjdl.oa.service.OpportunityInfoService;
import com.zbjdl.oa.service.UserInfoService;
import com.zbjdl.oa.wx.config.Constants;
import com.zbjdl.oa.wx.vo.WxSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 订单请求
 * 
 * @author zhengy
 * @date: 2019年1月29日 下午4:06:19
 */
@Controller
@RequestMapping(value = "/opportunity")
public class OpportunityInfoController extends BaseController {
	private Logger logger = LoggerFactory.getLogger(OpportunityInfoController.class);

	@Autowired
	private OpportunityInfoService opportunityInfoService;

	@Autowired
	private UserInfoService userInfoService;

	@RequestMapping("/add/index")
	public String addIndex(Model model, String date) {
		if (StringUtils.isBlank(date)) {
			date = DateUtils.SHORT_DATE_FORMAT.format(new Date());
		}
		OpportunityInfoDto opportunityInfoDto = new OpportunityInfoDto();
		opportunityInfoDto.setOppDate(date);
		opportunityInfoDto.setUserId(Long.parseLong(getSession().getUserId()));
		List<OpportunityInfoDto> list = opportunityInfoService.findList(opportunityInfoDto);
		model.addAttribute("opportunity", list == null || list.size() < 1 ? null : list.get(0));
		model.addAttribute("date", date);
		return "/opportunity/opportunityAddIndex";
	}

	@RequestMapping("/list")
	public String addIndex(Model model) {
		OpportunityInfoDto opportunityInfoDto = new OpportunityInfoDto();
		List<OpportunityInfoDto> list = opportunityInfoService.findList(opportunityInfoDto);
		model.addAttribute("list", list);
		return "/opportunity/opportunityList";
	}

	/*
	 * 编辑保存
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@ResponseBody
	public Object opportunityInfoSave(OpportunityInfoDto opportunityInfoDto, BindingResult bindingResult) {
		logger.info("save OpportunityInfo, param is : {}", JSON.toJSONString(opportunityInfoDto));
		opportunityInfoDto.setUserId(Long.parseLong(getSession().getUserId()));
		opportunityInfoService.saveOrUpdate(opportunityInfoDto);
		BaseRespDto respDto = new BaseRespDto(ReturnEnum.SUCCESS);
		return respDto;
	}

	/*
	 * 详情展示
	 */
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public ModelAndView opportunityInfoDetail(Long id, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("opportunity/opportunityDetail");
		OpportunityInfoDto opportunityInfoDto = opportunityInfoService.selectById(id);
		mav.addObject("dto", opportunityInfoDto);
		return mav;
	}

}
