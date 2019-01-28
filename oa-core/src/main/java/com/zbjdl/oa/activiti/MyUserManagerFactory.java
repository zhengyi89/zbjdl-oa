package com.zbjdl.oa.activiti;

import org.activiti.engine.impl.interceptor.Session;
import org.activiti.engine.impl.interceptor.SessionFactory;
import org.activiti.engine.impl.persistence.entity.UserIdentityManager;
import org.springframework.beans.factory.annotation.Autowired;
/**
 * 自定义Activiti GroupUserFactory
 * @author yejiyong
 *
 */
public class MyUserManagerFactory implements SessionFactory {

	@Autowired
	MyCompanyUserManager myCompanyUserManager;
	@Override
	public Class<?> getSessionType() {
		return UserIdentityManager.class;
	}

	@Override
	public Session openSession() {
		return myCompanyUserManager;
	}

}