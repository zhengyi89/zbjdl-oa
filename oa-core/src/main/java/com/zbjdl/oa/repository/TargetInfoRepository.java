/*
 * Powered By zbjdl-code-generator
 * Web Site: http://www.zbjdl.com
 * Since 2018 - 2022
 */

package com.zbjdl.oa.repository;

import java.util.List;

import com.zbjdl.common.respository.mybatis.GenericRepository;
import com.zbjdl.oa.dto.TargetWithUserInfoDto;

import org.springframework.stereotype.Repository;

/**
 * TargetInfo
 * 
 * @author code-generator
 *
 */
@Repository
public interface TargetInfoRepository extends GenericRepository {

	List<TargetWithUserInfoDto> findListWithUserByCity(String city, String month);

	void monthInit(String targetMonth, String city, String userId);

	Integer selectUnInit(String month, String city);

}