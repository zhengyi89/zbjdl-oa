/*
 * Powered By zbjdl-code-generator
 * Web Site: http://www.zbjdl.com
 * Since 2018 - 2022
 */

package com.zbjdl.oa.manager;

import java.util.List;

import com.zbjdl.oa.model.TargetInfo;

public interface TargetInfoManager {

	Integer save(TargetInfo targetInfo);
	
	Integer update(TargetInfo targetInfo);
	
	TargetInfo selectById(Long id);
	
	List<TargetInfo> findList(TargetInfo targetInfo);
	
}
