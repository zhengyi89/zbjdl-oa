package com.zbjdl.oa.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zbjdl.common.utils.BeanUtils;
import com.zbjdl.oa.model.Userinfo;
import com.zbjdl.oa.repository.UserinfoRepository;
import com.zbjdl.oa.dto.UserDto;
import com.zbjdl.oa.service.UserinfoService;

/** 
 * @author  zhengy
 * @date 2016/07/12
 */
@Service("userinfoService")
public class UserinfoServiceImpl implements UserinfoService{
	@Autowired
	private UserinfoRepository userinfoRepository;

	@Override
	public UserDto selectById(long id) {
		return userinfoRepository.selectById(id);
	}

	@Override
	public UserDto findByNo(String no) {
		Userinfo userinfo = userinfoRepository.findByNo(no);
		UserDto userDto = new UserDto();
		BeanUtils.copyProperties(userinfo, userDto);
		return userDto;
	}

	@Override
	public List<UserDto> findList(UserDto userinfo) {
		return userinfoRepository.findList(userinfo);
	}

	@Override
	public void save(UserDto userinfo) {
		userinfoRepository.save(userinfo);
	}

	@Override
	public void update(UserDto userinfo) {
		userinfoRepository.update(userinfo);
	}

	@Override
	public UserDto findByMobile(String mobile) {
		Userinfo userinfo = userinfoRepository.findByMobile(mobile);
		UserDto userDto = new UserDto();
		if (userinfo != null) {
			BeanUtils.copyProperties(userinfo, userDto);
		}
		return userDto;
	}

}
