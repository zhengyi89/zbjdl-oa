package com.zbjdl.oa.service;

import java.util.List;

import com.zbjdl.oa.dto.UserDto;

/**
 * 买房卖房用户
 * 
 * @author zhengy
 * @date 2016/07/12
 */
public interface UserinfoService {
	/**
	 * 查询用户信息
	 * 
	 * @param id
	 * @return
	 */
	UserDto selectById(long id);

	/**
	 * 根据用户编码查询
	 * 
	 * @param no
	 * @return
	 */
	UserDto findByNo(String no);

	/**
	 * 根据手机号查询
	 * 
	 * @param no
	 * @return
	 */
	UserDto findByMobile(String mobile);

	/**
	 * 查询列表
	 * 
	 * @param UserDto
	 * @return
	 */
	List<UserDto> findList(UserDto userinfo);

	/**
	 * 保存
	 * 
	 * @param UserDto
	 */
	void save(UserDto userinfo);

	/**
	 * 更新业务
	 * 
	 * @param UserDto
	 */
	void update(UserDto userinfo);

}
