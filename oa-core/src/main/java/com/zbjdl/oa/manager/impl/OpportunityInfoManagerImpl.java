/*
 * Powered By zbjdl-code-generator
 * Web Site: http://www.zbjdl.com
 * Since 2018 - 2022
 */

package com.zbjdl.oa.manager.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zbjdl.oa.repository.OpportunityInfoRepository;
import com.zbjdl.oa.manager.OpportunityInfoManager;
import com.zbjdl.oa.model.OpportunityInfo;

@Component
public class OpportunityInfoManagerImpl implements OpportunityInfoManager {
	
	@Autowired
	private OpportunityInfoRepository opportunityInfoRepository;
	
	@Override
	public Integer save(OpportunityInfo opportunityInfo) {
		return opportunityInfoRepository.save(opportunityInfo);
	}
	
	@Override
	public Integer update(OpportunityInfo opportunityInfo) {
		return opportunityInfoRepository.update(opportunityInfo);
	}
	
	@Override
	public OpportunityInfo selectById(Long id) {
		return opportunityInfoRepository.selectById(id);
	}
	
	@Override
	public List<OpportunityInfo> findList(OpportunityInfo opportunityInfo) {
		return opportunityInfoRepository.findList(opportunityInfo);
	}

}

