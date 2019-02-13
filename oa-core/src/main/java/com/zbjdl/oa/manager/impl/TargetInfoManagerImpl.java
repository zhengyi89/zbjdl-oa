/*
 * Powered By zbjdl-code-generator
 * Web Site: http://www.zbjdl.com
 * Since 2018 - 2022
 */

package com.zbjdl.oa.manager.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zbjdl.oa.repository.TargetInfoRepository;
import com.zbjdl.oa.manager.TargetInfoManager;
import com.zbjdl.oa.model.TargetInfo;

@Component
public class TargetInfoManagerImpl implements TargetInfoManager {
	
	@Autowired
	private TargetInfoRepository targetInfoRepository;
	
	@Override
	public Integer save(TargetInfo targetInfo) {
		return targetInfoRepository.save(targetInfo);
	}
	
	@Override
	public Integer update(TargetInfo targetInfo) {
		return targetInfoRepository.update(targetInfo);
	}
	
	@Override
	public TargetInfo selectById(Long id) {
		return targetInfoRepository.selectById(id);
	}
	
	@Override
	public List<TargetInfo> findList(TargetInfo targetInfo) {
		return targetInfoRepository.findList(targetInfo);
	}

}

