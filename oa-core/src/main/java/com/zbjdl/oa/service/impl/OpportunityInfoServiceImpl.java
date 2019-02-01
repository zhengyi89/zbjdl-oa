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

import com.zbjdl.oa.manager.OpportunityInfoManager;
import com.zbjdl.oa.service.OpportunityInfoService;
import com.zbjdl.oa.model.OpportunityInfo;
import com.zbjdl.oa.dto.OpportunityInfoDto;

@Service("opportunityInfoService")
public class OpportunityInfoServiceImpl implements OpportunityInfoService {
	
	@Autowired
	private OpportunityInfoManager opportunityInfoManager;
	
	@Override
	public Integer saveOrUpdate(OpportunityInfoDto opportunityInfoDto) {
		if (opportunityInfoDto.getId()!=null) {
			OpportunityInfo opportunityInfo = opportunityInfoManager.selectById(opportunityInfoDto.getId());
			BeanUtils.copyProperties(opportunityInfoDto, opportunityInfo);
			return opportunityInfoManager.update(opportunityInfo);
		}else {
			OpportunityInfo opportunityInfo = new OpportunityInfo();
			BeanUtils.copyProperties(opportunityInfoDto, opportunityInfo);
			return opportunityInfoManager.save(opportunityInfo);
		}
	}
	
	@Override
	public OpportunityInfoDto selectById(Long id) {
		OpportunityInfo opportunityInfo = opportunityInfoManager.selectById(id);
		OpportunityInfoDto opportunityInfoDto = new OpportunityInfoDto();
		BeanUtils.copyProperties(opportunityInfo, opportunityInfoDto);
		return opportunityInfoDto;
	}
	
	@Override
	public List<OpportunityInfoDto> findList(OpportunityInfoDto opportunityInfoDto) {
		OpportunityInfo opportunityInfo = new OpportunityInfo();
		BeanUtils.copyProperties(opportunityInfoDto, opportunityInfo);
		List<OpportunityInfo> opportunityInfoList = opportunityInfoManager.findList(opportunityInfo);
		
		List<OpportunityInfoDto> opportunityInfoDtoList = new ArrayList<OpportunityInfoDto>();
		for(OpportunityInfo dto : opportunityInfoList){
			OpportunityInfoDto respDto = new OpportunityInfoDto();
			BeanUtils.copyProperties(dto, respDto);
			opportunityInfoDtoList.add(respDto);
		}
		return opportunityInfoDtoList;
	}
	
}

