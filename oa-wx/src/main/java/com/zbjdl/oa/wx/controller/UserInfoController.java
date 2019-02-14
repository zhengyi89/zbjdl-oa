package com.zbjdl.oa.wx.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.zbjdl.boss.admin.facade.UserFacade;
import com.zbjdl.boss.admin.user.dto.DepartmentDTO;
import com.zbjdl.boss.admin.user.dto.UserDTO;
import com.zbjdl.common.encrypt.Digest;
import com.zbjdl.common.utils.StringUtils;
import com.zbjdl.common.wx.service.WeixinUserService;
import com.zbjdl.common.wx.util.dto.WxBindUserDto;
import com.zbjdl.oa.dto.UserInfoDto;
import com.zbjdl.oa.dto.response.BaseRespDto;
import com.zbjdl.oa.enumtype.ReturnEnum;
import com.zbjdl.oa.service.UserInfoService;
import com.zbjdl.oa.wx.config.Constants;
import com.zbjdl.oa.wx.config.MenuConfig;
import com.zbjdl.oa.wx.vo.WxSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 用户请求
 * 
 * @author zhengy
 * @date: 2019年1月29日 下午4:06:19
 */
@Controller
@RequestMapping(value = "/user")
public class UserInfoController extends BaseController {
	private Logger logger = LoggerFactory.getLogger(UserInfoController.class);

	@Autowired
	private UserInfoService userInfoService;

	@Autowired
	private WeixinUserService weixinUserService;

	@Autowired
	private UserFacade userFacade;
	
	/**
	 * 登录操作，需要使用Jquery相关框架
	 */
	@RequestMapping("/login/index")
	public String loginIndex(Model model) {
		WxSession wxSession = (WxSession)super.reloadSession();
		if(wxSession.isBind()){
			return "redirect:/menu?"+MenuConfig.INDEX;
		} else {
			return "/user/login";
		}
	}

	/**
	 * 用户登录接口，有验证码
	 */
	@RequestMapping("/login")
	@ResponseBody
	public BaseRespDto login(UserInfoDto userVo, HttpSession session, HttpServletRequest request, Model model) {
		logger.info("user login , param is {}", JSON.toJSONString(userVo));
		String loginName = userVo.getLoginName();
		String password = userVo.getPassword();

		if (StringUtils.isBlank(loginName) || StringUtils.isBlank(password)) {
			return new BaseRespDto(ReturnEnum.FAILD.getCode(), "请输入登录信息");
		}

		// TODO 根据手机号，取得用户标识id：user Id 或user 编码
		UserInfoDto userDto = userInfoService.login(loginName, Digest.md5Digest(password));
		logger.info("用户登录返回结果：{}", JSON.toJSONString(userDto));
		if (userDto == null) {
			return new BaseRespDto(ReturnEnum.FAILD.getCode(), "用户名或密码错误");
		}

		// 绑定账号、设定session
		logger.info("开始获取session信息");
		WxSession wxSession = null;
		try {
			wxSession = super.getSession();
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}
		
		logger.info("wxsession为：{}", JSON.toJSONString(wxSession));
		wxSession.setUserId(String.valueOf(userDto.getId()));
		if (wxSession.isWxBrowser()) {
			// 如果是微信浏览器，则直接建立openId 和当前用户的绑定关系
			WxBindUserDto wxBindUserDto = new WxBindUserDto();
			wxBindUserDto.setUserId(String.valueOf(userDto.getId()));
			wxBindUserDto.setLoginName(loginName);
			wxBindUserDto.setOpenId(wxSession.getOpi());
			wxBindUserDto.setSystemCode(Constants.SYSTEM_CODE);
			logger.info("微信绑定用户信息：用户id:{},openId:{},system_code:{},loginName:{}", userDto.getId(), wxSession.getOpi(),
					Constants.SYSTEM_CODE, loginName);
			weixinUserService.bind(wxBindUserDto);
		}
		wxSession.setLoginName(loginName);
		sessionService.setSession(wxSession);
		super.reloadSession();
		logger.info("登录成功，返回");
		return new BaseRespDto(ReturnEnum.SUCCESS);

	}

	/**
	 * 用户登录接口，有验证码
	 */
	@RequestMapping("/activate")
	@ResponseBody
	public BaseRespDto activate(UserInfoDto userVo) {

		String loginName = userVo.getLoginName();
		String password = userVo.getPassword();

		if (StringUtils.isBlank(loginName) || StringUtils.isBlank(password)) {
			return new BaseRespDto(ReturnEnum.FAILD.getCode(), "请输入登录信息");
		}

		// 判断是否已激活
		UserInfoDto queryDto = new UserInfoDto();
		queryDto.setLoginName(userVo.getLoginName());
		List<UserInfoDto> userList = userInfoService.findList(queryDto);
		if (userList != null && userList.size() > 0) {
			return new BaseRespDto(ReturnEnum.FAILD.getCode(), "此账号已激活");
		}
		UserDTO bossUserDto;
		try {
			bossUserDto = userFacade.userLoginValidate(loginName, password);
		} catch (Exception e) {
			return new BaseRespDto(ReturnEnum.FAILD.getCode(), "用户名或密码错误");
		}

		UserInfoDto user;
		if (bossUserDto != null) {
			// 判断是否已经同步
			user = userInfoService.selectById(bossUserDto.getUserId());
			if (user == null) {
				user = new UserInfoDto();
				user.setBossUserId(bossUserDto.getUserId());
				user.setUserName(bossUserDto.getUserName());
				user.setLoginName(loginName);
				user.setMobile(bossUserDto.getMobile());
				DepartmentDTO department = userFacade.queryDepartmentById(bossUserDto.getPrimaryDepartmentId());
				user.setCity(getCityByDepartment(department.getDepartmentName()));
				user.setPassword(Digest.md5Digest(password));
				user.setId(bossUserDto.getUserId());
				user.setIsAdmin(bossUserDto.getIsAdmin());
				userInfoService.save(user);
			}

		} else {
			return new BaseRespDto(ReturnEnum.FAILD.getCode(), "用户名或密码错误");
		}

		// 绑定账号、设定session
		WxSession wxSession = super.getSession();
		wxSession.setUserId(String.valueOf(user.getId()));
		if (wxSession.isWxBrowser()) {
			// 如果是微信浏览器，则直接建立openId 和当前用户的绑定关系
			WxBindUserDto wxBindUserDto = new WxBindUserDto();
			wxBindUserDto.setUserId(String.valueOf(user.getId()));
			wxBindUserDto.setLoginName(loginName);
			wxBindUserDto.setOpenId(wxSession.getOpi());
			wxBindUserDto.setSystemCode(Constants.SYSTEM_CODE);
			logger.info("微信绑定用户信息：用户id:{},openId:{},system_code:{},loginName:{}", user.getId(), wxSession.getOpi(), Constants.SYSTEM_CODE,
					loginName);
			weixinUserService.bind(wxBindUserDto);
		}
		wxSession.setLoginName(loginName);
		wxSession.setUserName(user.getUserName());
		wxSession.setCity(user.getCity());
		sessionService.setSession(wxSession);
		super.reloadSession();

		return new BaseRespDto(ReturnEnum.SUCCESS);

	}

	@RequestMapping("/activate/index")
	public String login(Model model) {
		WxSession wxSession = (WxSession)super.reloadSession();
		if(wxSession.isBind()){
			return "redirect:/menu?"+MenuConfig.INDEX;
		} else {
			return "/user/activateIndex";
		}
	}

	@RequestMapping("/edit/index")
	public String editIndex(Model model) {
		Long userId = Long.parseLong(getSessionSafe().getUserId());
		UserInfoDto userDto = userInfoService.selectById(userId);
		model.addAttribute("user", userDto);
		return "/user/userEditIndex";
	}

	@RequestMapping("/info")
	public String info(Model model) {
		Long userId = Long.parseLong(getSessionSafe().getUserId());
		UserInfoDto userDto = userInfoService.selectById(userId);
		model.addAttribute("user", userDto);
		return "/user/userInfo";
	}

	@RequestMapping("/save")
	public String save(UserInfoDto userDto) {
		UserInfoDto user = userInfoService.selectById(userDto.getId());
		user.setJobNo(userDto.getJobNo());
		userInfoService.update(user);
		return "redirect:/index";
	}
	
	
	
	
	/**
	 * 用户解绑
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/unbind/index")
	public Object unbind(Model model) {
		WxSession wxSession = (WxSession) super.reloadSession();
		if (wxSession.isBind()) {
			return "/user/unbind";
		} else {
			return "redirect:/login";
		}
	}
	
	
	/**
	 * 解绑事件
	 */
	@RequestMapping(value = "/unBind")
	@ResponseBody
	public Object unBind(String code) {
		try {
			// if (StringUtils.isBlank(code)) {
			// return new BaseRespDto(ReturnEnum.FAILD.getCode(), "验证码错误");
			// }

			WxSession session = super.getSession();
			// WxBindUserDto bindUser =
			// weixunUserService.queryBindUserByUserId(session.getUserId(),
			// Constants.SYSTEM_CODE);

			// (1)校验验证码
			// boolean valid = true;
			// if (!valid) {
			// return new BaseRespDto(ReturnEnum.FAILD.getCode(), "验证码错误");
			// }
			// (2)进行解绑
			weixinUserService.unBind(session.getUserId(), session.getOpi(), Constants.SYSTEM_CODE);
			super.reloadSession();
		} catch (Exception e) {
			logger.error("系统异常，解绑失败", e);
			return new BaseRespDto(ReturnEnum.FAILD.getCode(), "网络异常，请稍后重试");
		}
		return new BaseRespDto(ReturnEnum.SUCCESS);
	}

	/**
	 * 解绑成功
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/unbind/success")
	public Object unbindSuccess(HttpSession session) {
		session.removeAttribute(WxSession.NAME);
		return "/user/unbind_success";
	}

	/**
	 * 解绑失败
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/unbind/failed")
	public Object unbindFailed(HttpServletRequest request, Model model) {
		return "/user/unbind_failed";
	}
	
	
	/**
	 * 退出
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String loginOut(HttpSession session) {
		session.removeAttribute(WxSession.NAME);
		return "redirect:/login";
	}


	private String getCityByDepartment(String department) {
		if (StringUtils.isBlank(department)) {
			return "";
		}
		if (department.indexOf("哈尔滨") > -1) {
			return "哈尔滨";
		} else if (department.indexOf("大连") > -1) {
			return "大连";
		} else if (department.indexOf("长春") > -1) {
			return "长春";
		} else if (department.indexOf("大连") > -1) {
			return "大连";
		} else if (department.indexOf("北京") > -1) {
			return "北京";
		}
		return "无";
	}

}
