/*
 * Powered By chanjetpay-code-generator
 * Web Site: http://www.chanjetpay.com
 * Since 2014 - 2016
 */

package com.zbjdl.oa.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.zbjdl.common.utils.config.TextResource;

/**
 * 客户管理
 * 
 * @author MengXiangChao
 * @date 2016年7月22日 上午10:21:24
 */
@Controller
@RequestMapping("/customerInfo")
public class UserInfoController {
//	@Autowired
//	@Qualifier("userInfoService")
//	private UserinfoService userInfoService;

	private static final Logger logger = LoggerFactory.getLogger(UserInfoController.class);

	/**
	 * 列表页面
	 */
	@RequestMapping(value = "/customerIndex", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView smsInfoIndex(@RequestParam(required = false, value = "pageNo", defaultValue = "1") int pageNo,
			@RequestParam(required = false, value = "pageSize", defaultValue = "10") int pageSize) {
		ModelAndView mav = new ModelAndView("customerInfo/CustomerInfoIndex");
		mav.addObject("_textResource", new TextResource());
		return mav;
	}

}
