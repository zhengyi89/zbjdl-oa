package com.zbjdl.oa.wx.controller.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zbjdl.common.utils.StringUtils;
import com.zbjdl.common.utils.ValidateUtils;
import com.zbjdl.common.wx.service.WeixinUserService;
import com.zbjdl.common.wx.util.dto.WxBindUserDto;
import com.zbjdl.oa.dto.UserDto;
import com.zbjdl.oa.service.UserinfoService;
import com.zbjdl.oa.wx.config.Constants;
import com.zbjdl.oa.wx.controller.BaseController;
import com.zbjdl.oa.wx.controller.common.vo.UserVo;
import com.zbjdl.oa.wx.vo.CaPatchResponseMessage;
import com.zbjdl.oa.wx.vo.WxSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 系统Ajax请求控制器
 * 
 * 
 * @since 2014-9-7 21:47:07
 */
@Controller
@RequestMapping(value = "/ajax")
public class AjaxController extends BaseController {
	private Logger logger = LoggerFactory.getLogger(AjaxController.class);

	private static final String LOGIN_ERROR_COUNT = "login_mistakeTimes";
	@Autowired
	private UserinfoService userinfoService;
	
	@Autowired
	private WeixinUserService weixinUserService;
	
	/**
	 * 用户登录接口，有验证码
	 */
	@RequestMapping("/login")
	@ResponseBody
	public CaPatchResponseMessage login(UserVo userVo, HttpSession session, HttpServletRequest request, Model model) {

		String mobile = userVo.getMobile();
		String password = userVo.getPassword();

		try {
			if (StringUtils.isBlank(mobile) || StringUtils.isBlank(password)) {
				return new CaPatchResponseMessage("error", "请输入登录信息");
			}
			if (!ValidateUtils.isMobile(mobile)) {
				return new CaPatchResponseMessage("login_phone_mistake", "请输入正确的手机号");
			}
			

			// TODO 根据手机号，取得用户标识id：user Id 或user 编码
			UserDto userDto = userinfoService.findByMobile(mobile);
			String userId = userDto.getUserNo();
			
			//用户不存在，创建用户
			if (userId == null || "".equals(userId)) {
//				WfTaskRequestDto dto = new WfTaskRequestDto();
//				dto.setPhone(mobile);
//				userDto = wfTaskInfoService.createUserInfo(dto);
//				userId = userDto.getUserNo();
			}
//			String userId = "19891215";
			// ==
			// 绑定账号、设定session
			WxSession wxSession = super.getSession();
			wxSession.setUserId(userId);
			if (wxSession.isWxBrowser()) {
				// 如果是微信浏览器，则直接建立openId 和当前用户的绑定关系
				WxBindUserDto wxBindUserDto = new WxBindUserDto();
				wxBindUserDto.setUserId(userId);
				wxBindUserDto.setLoginName(mobile);
				wxBindUserDto.setOpenId(wxSession.getOpi());
				wxBindUserDto.setSystemCode(Constants.SYSTEM_CODE);
				logger.info("微信绑定用户信息：用户id:{},openId:{},system_code:{},loginName:{}",
						userId, wxSession.getOpi(), Constants.SYSTEM_CODE, mobile);
				weixinUserService.bind(wxBindUserDto);
			}
			wxSession.setUserId(userId);
			wxSession.setLoginName(mobile);
			sessionService.setSession(wxSession);
			super.reloadSession();
			session.removeAttribute(LOGIN_ERROR_COUNT);
			return new CaPatchResponseMessage("ok", "ok");
			
		} catch (Exception e) {
			// TODO 根据具体的错误码，返回错误信息
			logger.error("登录失败, mobile:" + mobile, e);
			return new CaPatchResponseMessage("error", "登录失败");
		}
	}

}
