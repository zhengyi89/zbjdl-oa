/*
 * Powered By zbjdl-code-generator
 * Web Site: http://www.zbjdl.com
 * Since 2018 - 2022
 */

package com.zbjdl.oa.manager;

import java.util.List;

import com.zbjdl.oa.model.CommonReportInfo;

public interface CommonReportInfoManager {

	Integer save(CommonReportInfo commonReportInfo);
	
	Integer update(CommonReportInfo commonReportInfo);
	
	CommonReportInfo selectById(Long id);
	
	List<CommonReportInfo> findList(CommonReportInfo commonReportInfo);
	
}
