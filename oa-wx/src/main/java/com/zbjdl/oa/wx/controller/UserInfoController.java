package com.zbjdl.oa.wx.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
import com.zbjdl.oa.dto.resp.BaseRespDto;
import com.zbjdl.oa.enumtype.ReturnEnum;
import com.zbjdl.oa.service.UserInfoService;
import com.zbjdl.oa.wx.config.Constants;
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
		return "/wx/login_wx";
	}

	/**
	 * 用户登录接口，有验证码
	 */
	@RequestMapping("/login")
	@ResponseBody
	public BaseRespDto login(UserInfoDto userVo, HttpSession session, HttpServletRequest request, Model model) {
		logger.info("user login , param is {}", JSON.toJSONString(userVo));
		String userName = userVo.getUserName();
		String password = userVo.getPassword();

		if (StringUtils.isBlank(userName) || StringUtils.isBlank(password)) {
			return new BaseRespDto(ReturnEnum.FAILD.getCode(), "请输入登录信息");
		}

		// TODO 根据手机号，取得用户标识id：user Id 或user 编码
		UserInfoDto userDto = userInfoService.login(userName, Digest.md5Digest(password));

		if (userDto==null) {
			return new BaseRespDto(ReturnEnum.FAILD.getCode(), "用户名或密码错误");
		}
		
		// 绑定账号、设定session
		WxSession wxSession = super.getSession();
		wxSession.setUserId(String.valueOf(userDto.getId()));
		if (wxSession.isWxBrowser()) {
			// 如果是微信浏览器，则直接建立openId 和当前用户的绑定关系
			WxBindUserDto wxBindUserDto = new WxBindUserDto();
			wxBindUserDto.setUserId(String.valueOf(userDto.getId()));
			wxBindUserDto.setLoginName(userName);
			wxBindUserDto.setOpenId(wxSession.getOpi());
			wxBindUserDto.setSystemCode(Constants.SYSTEM_CODE);
			logger.info("微信绑定用户信息：用户id:{},openId:{},system_code:{},loginName:{}", userDto.getId(), wxSession.getOpi(),
					Constants.SYSTEM_CODE, userName);
			weixinUserService.bind(wxBindUserDto);
		}
		wxSession.setLoginName(userName);
		sessionService.setSession(wxSession);
		super.reloadSession();
		return new BaseRespDto(ReturnEnum.SUCCESS);

	}

	/**
	 * 用户登录接口，有验证码
	 */
	@RequestMapping("/activate")
	@ResponseBody
	public BaseRespDto activate(UserInfoDto userVo) {

		String username = userVo.getUserName();
		String password = userVo.getPassword();

		if (StringUtils.isBlank(username) || StringUtils.isBlank(password)) {
			return new BaseRespDto(ReturnEnum.FAILD.getCode(), "请输入登录信息");
		}

		UserDTO userDto = userFacade.userLoginValidate(username, password);
		UserInfoDto user;
		if (userDto != null) {

			// 判断是否已经同步
			user = userInfoService.selectById(userDto.getUserId());
			if (user == null) {
				user = new UserInfoDto();
				user.setBossUserId(userDto.getUserId());
				user.setUserName(username);
				user.setMobile(userDto.getMobile());
				DepartmentDTO department = userFacade.queryDepartmentById(userDto.getPrimaryDepartmentId());
				user.setCity(department.getDepartmentName());
				user.setPassword(Digest.md5Digest(password));
				user.setId(userDto.getUserId());
				userInfoService.save(user);
			}

		} else {
			return new BaseRespDto(ReturnEnum.FAILD.getCode(), "用户名或密码错误");
		}
		return new BaseRespDto(ReturnEnum.SUCCESS);

	}

	@RequestMapping("/activate/index")
	public String login(Model model) {
		return "/wx/activateIndex";
	}
	
	
	@RequestMapping("/edit/index")
	public String editIndex(Model model) {
		Long userId = Long.parseLong(getSessionSafe().getUserId());
		UserInfoDto userDto = userInfoService.selectById(userId);
		model.addAttribute("user", userDto);
		return "/user/userEditIndex";
	}
	
	@RequestMapping("/save")
	public String save(UserInfoDto userDto) {
		
		return "/wx/activateIndex";
	}
	

}
