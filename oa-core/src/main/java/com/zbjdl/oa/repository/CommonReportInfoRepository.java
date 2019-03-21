/*
 * Powered By zbjdl-code-generator
 * Web Site: http://www.zbjdl.com
 * Since 2018 - 2022
 */

package com.zbjdl.oa.repository;

import java.util.List;

import com.zbjdl.common.respository.mybatis.GenericRepository;
import com.zbjdl.oa.dto.CommonReportWithUserDto;
import com.zbjdl.oa.dto.request.CommonReportQueryReqDto;

import org.springframework.stereotype.Repository;

/**
 * CommonReportInfo
 * @author code-generator
 *
 */
@Repository
public interface CommonReportInfoRepository extends GenericRepository {

	List<CommonReportWithUserDto> findReport(CommonReportQueryReqDto reqDto);
	
}