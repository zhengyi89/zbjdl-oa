package com.zbjdl.oa.repository;

import org.springframework.stereotype.Repository;

import com.zbjdl.common.respository.mybatis.GenericRepository;
import com.zbjdl.oa.model.Userinfo;

@Repository
public interface UserinfoRepository extends GenericRepository{
	public Userinfo findByNo(String no);

	public Userinfo findByMobile(String mobile);
}
