
package com.zbjdl.oa.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.zbjdl.boss.admin.facade.SecurityConfigFacade;
import com.zbjdl.boss.admin.role.dto.RoleDTO;
import com.zbjdl.boss.admin.user.dto.UserDTO;
import com.zbjdl.common.utils.config.ConfigurationUtils;

/**
 * 字典项翻译查询
 * 
 * @date 2016年7月19日 上午9:13:08
 */
@Controller
@RequestMapping("/bussinessCode")
public class BussinessCodeController {

	private static final Logger logger = LoggerFactory.getLogger(BussinessCodeController.class);

	@Autowired
	private SecurityConfigFacade securityConfigFacade;

	/*
	 * 根据 配置键 得到下拉框的KEY和VALUE
	 * 
	 * @param configKey
	 * 
	 * @return
	 */
	@RequestMapping(value = "/codeIndex", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public @org.springframework.web.bind.annotation.ResponseBody Object memberInfoIndex(
			@RequestParam("configKey") String configKey) {

		Map<String, String> param = (Map<String, String>) ConfigurationUtils
				.getMapConfigParam(ConfigurationUtils.CONFIG_TYPE_SYS, configKey, String.class).getValue();
		/*
		 * if (param != null) { Iterator<String> iter =
		 * param.keySet().iterator(); while (iter.hasNext()) { String key =
		 * iter.next(); logger.info(key + ":" + param.get(key)); } }
		 */
		return param;
	}

	/**
	 * 获取部门下所有角色信息
	 * 
	 * @param departmentId部门ID
	 * @return Map
	 */
	@RequestMapping(value = "/roleInfoIndex", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public @org.springframework.web.bind.annotation.ResponseBody Object roleInfoIndex(
			@RequestParam("departmentId") Long departmentId) {

		Map<String, String> param = new HashMap<String, String>();

		List<RoleDTO> roleList = securityConfigFacade.queryRolesByDeparment(departmentId);
		if (!roleList.isEmpty()) {
			for (int i = 0; i < roleList.size(); i++) {
				RoleDTO role = roleList.get(i);
				param.put(role.getRoleId().toString(), role.getRoleName());
			}
		}
		return param;
	}

	/**
	 * 根据角色ID获取对应人的信息
	 * 
	 * @param roleId
	 * @return Map
	 */
	@RequestMapping(value = "/userInfoIndex", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public @org.springframework.web.bind.annotation.ResponseBody Object userInfoIndex(
			@RequestParam("roleId") Long roleId) {

		Map<String, String> userParam = new HashMap<String, String>();

		List<UserDTO> userList = securityConfigFacade.queryUsersByRole(roleId);
		if (!userList.isEmpty()) {
			for (int i = 0; i < userList.size(); i++) {
				UserDTO user = userList.get(i);
				userParam.put(user.getUserId().toString(), user.getUserName() + ">>>" + user.getMobile());
			}
		}
		return userParam;
	}

	@RequestMapping(value = "/getAmountStateNoSelect", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public @org.springframework.web.bind.annotation.ResponseBody Object getMemberInfoMap(
			@RequestParam("amountstate") String amountstate) {

		Map<String, String> param = (Map<String, String>) ConfigurationUtils
				.getMapConfigParam(ConfigurationUtils.CONFIG_TYPE_SYS, amountstate, String.class).getValue();
		return param;
	}

	@RequestMapping(value = "/exportExcel", method = RequestMethod.GET)
	public void exportExcel(HttpServletRequest request, HttpServletResponse response) throws IOException {
	}
}
