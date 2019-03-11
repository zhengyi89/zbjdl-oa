/*
 * Powered By zbjdl-code-generator
 * Web Site: http://www.zbjdl.com
 * Since 2018 - 2022
 */

package com.zbjdl.oa.manager.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zbjdl.oa.repository.CommonReportInfoRepository;
import com.zbjdl.oa.manager.CommonReportInfoManager;
import com.zbjdl.oa.model.CommonReportInfo;

@Component
public class CommonReportInfoManagerImpl implements CommonReportInfoManager {
	
	@Autowired
	private CommonReportInfoRepository commonReportInfoRepository;
	
	@Override
	public Integer save(CommonReportInfo commonReportInfo) {
		return commonReportInfoRepository.save(commonReportInfo);
	}
	
	@Override
	public Integer update(CommonReportInfo commonReportInfo) {
		return commonReportInfoRepository.update(commonReportInfo);
	}
	
	@Override
	public CommonReportInfo selectById(Long id) {
		return commonReportInfoRepository.selectById(id);
	}
	
	@Override
	public List<CommonReportInfo> findList(CommonReportInfo commonReportInfo) {
		return commonReportInfoRepository.findList(commonReportInfo);
	}

}

