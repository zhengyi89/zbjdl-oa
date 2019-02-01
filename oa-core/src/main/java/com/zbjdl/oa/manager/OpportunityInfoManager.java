/*
 * Powered By zbjdl-code-generator
 * Web Site: http://www.zbjdl.com
 * Since 2018 - 2022
 */

package com.zbjdl.oa.manager;

import java.util.List;

import com.zbjdl.oa.model.OpportunityInfo;

public interface OpportunityInfoManager {

	Integer save(OpportunityInfo opportunityInfo);
	
	Integer update(OpportunityInfo opportunityInfo);
	
	OpportunityInfo selectById(Long id);
	
	List<OpportunityInfo> findList(OpportunityInfo opportunityInfo);
	
}
