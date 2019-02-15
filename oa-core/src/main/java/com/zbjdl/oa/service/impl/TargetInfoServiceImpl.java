/*
 * Powered By zbjdl-code-generator
 * Web Site: http://www.zbjdl.com
 * Since 2018 - 2022
 */

package com.zbjdl.oa.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zbjdl.common.utils.BeanUtils;
import com.zbjdl.common.utils.DateUtils;
import com.zbjdl.oa.manager.TargetInfoManager;
import com.zbjdl.oa.repository.TargetInfoRepository;
import com.zbjdl.oa.service.TargetInfoService;
import com.zbjdl.oa.model.TargetInfo;
import com.zbjdl.oa.dto.TargetInfoDto;
import com.zbjdl.oa.dto.TargetWithUserInfoDto;

@Service("targetInfoService")
public class TargetInfoServiceImpl implements TargetInfoService {

	@Autowired
	private TargetInfoManager targetInfoManager;

	@Autowired
	private TargetInfoRepository targetInfoRepository;

	public static final SimpleDateFormat MONTH_FORMAT = new SimpleDateFormat("yyyy-MM");

	@Override
	public Integer saveOrUpdate(TargetInfoDto targetInfoDto) {
		if (targetInfoDto.getId() != null) {
			TargetInfo targetInfo = targetInfoManager.selectById(targetInfoDto.getId());
			BeanUtils.copyProperties(targetInfoDto, targetInfo);
			return targetInfoManager.update(targetInfo);
		} else {
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
		for (TargetInfo dto : targetInfoList) {
			TargetInfoDto respDto = new TargetInfoDto();
			BeanUtils.copyProperties(dto, respDto);
			targetInfoDtoList.add(respDto);
		}
		return targetInfoDtoList;
	}

	@Override
	public List<TargetWithUserInfoDto> findListWithUserByCity(String city) {
		String month = MONTH_FORMAT.format(new Date());
		return targetInfoRepository.findListWithUserByCity(city, month);
	}

	@Override
	public void monthInit(String targetMonth, String city, String userId) {
		targetInfoRepository.monthInit(targetMonth, city, userId);
	}

	@Override
	public Integer selectUnInit(String month, String city) {
		return targetInfoRepository.selectUnInit(month, city);
	}

}
