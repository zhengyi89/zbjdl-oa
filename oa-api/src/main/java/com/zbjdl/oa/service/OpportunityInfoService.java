/*
 * Powered By zbjdl-code-generator
 * Web Site: http://www.zbjdl.com
 * Since 2018 - 2022
 */

package com.zbjdl.oa.service;

import java.util.List;

import com.zbjdl.oa.dto.OpportunityInfoDto;

public interface OpportunityInfoService {
	Integer saveOrUpdate(OpportunityInfoDto opportunityInfoDto);

	OpportunityInfoDto selectById(Long id);
	
	List<OpportunityInfoDto> findList(OpportunityInfoDto opportunityInfoDto);
	
}
