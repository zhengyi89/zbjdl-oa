package com.zbjdl.oa.wx.controller.center.bind;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zbjdl.common.encrypt.Base64;
import com.zbjdl.common.utils.StringUtils;
import com.zbjdl.oa.wx.config.MenuConfig;
import com.zbjdl.oa.wx.controller.BaseController;
import com.zbjdl.oa.wx.util.WxUtil;
import com.zbjdl.oa.wx.vo.WxSession;

/**
 * “账号绑定/解绑”控制器
 * 
 * 
 * @since 2014-9-19 08:47:08
 */
@Controller
public class BindController extends BaseController {
	private Logger logger = LoggerFactory.getLogger(BindController.class);


	
	/**
	 * 绑定成功
	 */
	@RequestMapping("/bind/success")
	public String bindSuccess(HttpServletRequest request, String flag, Model model, String callback) throws UnsupportedEncodingException {
		logger.info("绑定成功，跳转地址为{}", callback);
//		String contexPath = request.getContextPath();
//		if (StringUtils.isNotBlank(callback)) {
//			model.addAttribute("callBackUrl", callback);
//		} else {
//			callback = Base64.encode(contexPath + "/menu");
//			model.addAttribute("callBackUrl", callback);
//		}
//		callback = Base64.decode(callback);
//		if (callback.startsWith(contexPath)) {
//			callback = callback.replace(contexPath, "");
//		}
//
//		if (WxUtil.isWxBrowser(request)) {
			return "/index";
//		} else {
//			return ("redirect:/" + callback).replace("//", "/");
//		}
	}

}
