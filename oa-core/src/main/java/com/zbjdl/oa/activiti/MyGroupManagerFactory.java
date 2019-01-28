package com.zbjdl.oa.activiti;

import org.activiti.engine.impl.interceptor.Session;
import org.activiti.engine.impl.interceptor.SessionFactory;
import org.activiti.engine.impl.persistence.entity.GroupIdentityManager;
import org.springframework.beans.factory.annotation.Autowired;
/**
 * 自定义Activiti GroupManagerFactory
 * @author yejiyong
 *
 */
public class MyGroupManagerFactory implements SessionFactory {

	@Autowired 
	MyCompanyGroupManager myCompanyGroupManager;
	
	@Override
	public Class<?> getSessionType() {
		return GroupIdentityManager.class;
	}

	@Override
	public Session openSession() {
		return myCompanyGroupManager;
	}

}