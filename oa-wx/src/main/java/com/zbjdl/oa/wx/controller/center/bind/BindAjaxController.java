package com.zbjdl.oa.wx.controller.center.bind;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zbjdl.common.utils.StringUtils;
import com.zbjdl.common.wx.service.WeixinUserService;
import com.zbjdl.oa.dto.response.BaseRespDto;
import com.zbjdl.oa.enumtype.ReturnEnum;
import com.zbjdl.oa.wx.config.Constants;
import com.zbjdl.oa.wx.controller.BaseController;
import com.zbjdl.oa.wx.vo.WxSession;

/**
 * “账号绑定/解绑”控制器
 * 
 * @since 2014-9-19 08:47:08
 */
@Controller
public class BindAjaxController extends BaseController {
	private Logger logger = LoggerFactory.getLogger(BindAjaxController.class);

	@Autowired
	WeixinUserService weixunUserService;

	/**
	 * 解绑事件
	 */
	@RequestMapping(value = "/ajax/bindAjax/unBind")
	@ResponseBody
	public Object unBind(String code) {
		try {
			if (StringUtils.isBlank(code)) {
				return new BaseRespDto(ReturnEnum.FAILD.getCode(), "验证码错误");
			}

			WxSession session = super.getSession();
			// WxBindUserDto bindUser =
			// weixunUserService.queryBindUserByUserId(session.getUserId(),
			// Constants.SYSTEM_CODE);

			// (1)校验验证码
			// TODO
			boolean valid = true;

			if (!valid) {
				return new BaseRespDto(ReturnEnum.FAILD.getCode(), "验证码错误");
			}
			// (2)进行解绑
			weixunUserService.unBind(session.getUserId(), session.getOpi(), Constants.SYSTEM_CODE);
			super.reloadSession();
		} catch (Exception e) {
			logger.error("系统异常，解绑失败", e);
			return new BaseRespDto(ReturnEnum.FAILD.getCode(), "网络异常，请稍后重试");
		}
		return new BaseRespDto(ReturnEnum.SUCCESS);
	}
}
