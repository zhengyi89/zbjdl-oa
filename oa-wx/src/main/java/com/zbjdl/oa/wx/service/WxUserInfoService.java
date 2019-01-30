package com.zbjdl.oa.wx.service;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zbjdl.common.wx.param.WxUserDTO;
import com.zbjdl.common.wx.service.WeixinUserService;
import com.zbjdl.oa.wx.exception.WxIllegalAccessException;
import com.zbjdl.oa.wx.util.WxUtil;
import com.zbjdl.oa.wx.util.dto.WeiXinUserInfoDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Service("wxUserInfoService")
public class WxUserInfoService {
	private Logger logger = LoggerFactory.getLogger(WxUserInfoService.class);
	@Resource
	private PortalWxService portalWxService;
	
	@Autowired
	private WeixinUserService weixinUserService;
	/**
	 * 获取用户信息
	 */
	public WeiXinUserInfoDto getUserInfo(UserInfoModel userInfoModel , String code){
		WeiXinUserInfoDto dto = userInfoModel.getUserInfo(code);
		if(userInfoModel.isCreateWxUser()){
			if(dto != null && weixinUserService.bindWxInfo(new WxUserDTO(dto.getOpenid(), dto.getHeadimgurl(), dto.getNickname()))){
				portalWxService.reLoad(dto.getOpenid());
			}
		}
		return dto;
	}
	
	/**
	 * 获取用户信息
	 */
	public WeiXinUserInfoDto getUserInfoByOpenId(UserInfoModel userInfoModel , String openId){
		try {
			WeiXinUserInfoDto dto = WxUtil.getUserInfoByUnionId(openId);
			if(userInfoModel.isCreateWxUser()){
				if(dto != null && weixinUserService.bindWxInfo(new WxUserDTO(dto.getOpenid(), dto.getHeadimgurl(), dto.getNickname()))){
					portalWxService.reLoad(dto.getOpenid());
				}
			}
			return dto;
		} catch (Exception e){
			logger.error("获取用户详细信息失败" , e);
		}
		return null;
	}

	
	public enum UserInfoModel{
		/**
		 * 获取用户基本信息
		 */
		BASE {
			@Override
			public WeiXinUserInfoDto getUserInfo(String code) {
				WeiXinUserInfoDto info = WxUtil.getUserBase(code);
				if(info == null || StringUtils.isBlank(info.getOpenid())){
					throw new WxIllegalAccessException();
				}
				return info;
			}

			@Override
			public boolean isCreateWxUser() {
				return false;
			}
		},
		/**
		 * 获取用户丰富信息(网页授权方式)
		 */
		RICH_OAUTH {
			@Override
			public WeiXinUserInfoDto getUserInfo(String code) {
				WeiXinUserInfoDto info = WxUtil.getUserInfoByOAuth(code);
				if(info == null || StringUtils.isBlank(info.getOpenid())){
					throw new WxIllegalAccessException();
				}
				return info;
			}

			@Override
			public boolean isCreateWxUser() {
				return true;
			}
		},
		/**
		 * 获取用户丰富信息(UnionID机制)，需要用户已经关注服务号
		 */
		RICH_UNION_ID{
			@Override
			WeiXinUserInfoDto getUserInfo(String openId) {
				WeiXinUserInfoDto info = WxUtil.getUserInfoByUnionId(openId);
				if(info == null || StringUtils.isBlank(info.getOpenid())){
					throw new WxIllegalAccessException();
				}
				return info;
			}

			@Override
			boolean isCreateWxUser() {
				return true;
			}
		};
		
		/**
		 * 获取微信用户信息
		 */
		abstract WeiXinUserInfoDto getUserInfo(String param);
		/**
		 * 判断是否需要创建用户信息
		 */
		abstract boolean isCreateWxUser();
	}
}
