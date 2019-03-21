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
import com.zbjdl.oa.manager.CommonReportInfoManager;
import com.zbjdl.oa.repository.CommonReportInfoRepository;
import com.zbjdl.oa.service.CommonReportInfoService;
import com.zbjdl.oa.model.CommonReportInfo;
import com.zbjdl.oa.dto.CommonReportInfoDto;
import com.zbjdl.oa.dto.CommonReportWithUserDto;
import com.zbjdl.oa.dto.request.CommonReportQueryReqDto;
import com.zbjdl.oa.dto.request.ReportBaseReqDto;

@Service("commonReportInfoService")
public class CommonReportInfoServiceImpl implements CommonReportInfoService {

	@Autowired
	private CommonReportInfoManager commonReportInfoManager;
	
	@Autowired
	private CommonReportInfoRepository commonReportInfoRepository;

	@Override
	public Integer saveOrUpdate(CommonReportInfoDto commonReportInfoDto) {
		if (commonReportInfoDto.getId() != null) {
			CommonReportInfo commonReportInfo = commonReportInfoManager.selectById(commonReportInfoDto.getId());
			BeanUtils.copyProperties(commonReportInfoDto, commonReportInfo);
			return commonReportInfoManager.update(commonReportInfo);
		} else {
			CommonReportInfo commonReportInfo = new CommonReportInfo();
			BeanUtils.copyProperties(commonReportInfoDto, commonReportInfo);
			return commonReportInfoManager.save(commonReportInfo);
		}
	}

	@Override
	public CommonReportInfoDto selectById(Long id) {
		CommonReportInfo commonReportInfo = commonReportInfoManager.selectById(id);
		CommonReportInfoDto commonReportInfoDto = new CommonReportInfoDto();
		BeanUtils.copyProperties(commonReportInfo, commonReportInfoDto);
		return commonReportInfoDto;
	}

	@Override
	public List<CommonReportInfoDto> findList(CommonReportInfoDto commonReportInfoDto) {
		CommonReportInfo commonReportInfo = new CommonReportInfo();
		BeanUtils.copyProperties(commonReportInfoDto, commonReportInfo);
		List<CommonReportInfo> commonReportInfoList = commonReportInfoManager.findList(commonReportInfo);

		List<CommonReportInfoDto> commonReportInfoDtoList = new ArrayList<CommonReportInfoDto>();
		for (CommonReportInfo dto : commonReportInfoList) {
			CommonReportInfoDto respDto = new CommonReportInfoDto();
			BeanUtils.copyProperties(dto, respDto);
			commonReportInfoDtoList.add(respDto);
		}
		return commonReportInfoDtoList;
	}

	@Override
	public CommonReportInfoDto selectOneByDate(String type, String userId, String date) {
		CommonReportInfoDto commonReportInfoDto = new CommonReportInfoDto();
		commonReportInfoDto.setType(type);
		commonReportInfoDto.setUserId(userId);
		commonReportInfoDto.setCol1(date);
		List<CommonReportInfoDto> list = findList(commonReportInfoDto);
		return list == null || list.size() < 1 ? null : list.get(0);
	}

	@Override
	public List<CommonReportWithUserDto> findReport(CommonReportQueryReqDto reqDto) {
		return commonReportInfoRepository.findReport(reqDto);
	}

}
