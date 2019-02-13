/*
 * Powered By zbjdl-code-generator
 * Web Site: http://www.zbjdl.com
 * Since 2018 - 2022
 */

package com.zbjdl.oa.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zbjdl.common.utils.BeanUtils;

import com.zbjdl.oa.manager.TargetInfoManager;
import com.zbjdl.oa.service.TargetInfoService;
import com.zbjdl.oa.model.TargetInfo;
import com.zbjdl.oa.dto.TargetInfoDto;

@Service("targetInfoService")
public class TargetInfoServiceImpl implements TargetInfoService {
	
	@Autowired
	private TargetInfoManager targetInfoManager;
	
	@Override
	public Integer saveOrUpdate(TargetInfoDto targetInfoDto) {
		if (targetInfoDto.getId()!=null) {
			TargetInfo targetInfo = targetInfoManager.selectById(targetInfoDto.getId());
			BeanUtils.copyProperties(targetInfoDto, targetInfo);
			return targetInfoManager.update(targetInfo);
		}else {
			TargetInfo targetInfo = new TargetInfo();
			BeanUtils.copyProperties(targetInfoDto, targetInfo);
			return targetInfoManager.save(targetInfo);
		}
	}
	
	@Override
	public TargetInfoDto selectById(Long id) {
		TargetInfo targetInfo = targetInfoManager.selectById(id);
		TargetInfoDto targetInfoDto = new TargetInfoDto();
		BeanUtils.copyProperties(targetInfo, targetInfoDto);
		return targetInfoDto;
	}
	
	@Override
	public List<TargetInfoDto> findList(TargetInfoDto targetInfoDto) {
		TargetInfo targetInfo = new TargetInfo();
		BeanUtils.copyProperties(targetInfoDto, targetInfo);
		List<TargetInfo> targetInfoList = targetInfoManager.findList(targetInfo);
		
		List<TargetInfoDto> targetInfoDtoList = new ArrayList<TargetInfoDto>();
		for(TargetInfo dto : targetInfoList){
			TargetInfoDto respDto = new TargetInfoDto();
			BeanUtils.copyProperties(dto, respDto);
			targetInfoDtoList.add(respDto);
		}
		return targetInfoDtoList;
	}
	
}

