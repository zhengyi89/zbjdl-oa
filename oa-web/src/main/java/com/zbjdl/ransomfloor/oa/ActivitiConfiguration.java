package com.zbjdl.ransomfloor.oa;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.activiti.engine.impl.interceptor.SessionFactory;
import org.activiti.spring.SpringProcessEngineConfiguration;
import org.activiti.spring.boot.ProcessEngineConfigurationConfigurer;
import org.springframework.boot.autoconfigure.AutoConfigureBefore;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.zbjdl.oa.activiti.MyGroupManagerFactory;
import com.zbjdl.oa.activiti.MyUserManagerFactory;

/**
 * 采用自定义的User和Group Manager 覆盖Activiti的默认的行为
 * @author yejiyong
 *
 */
@Configuration
@AutoConfigureBefore(org.springframework.boot.autoconfigure.security.SecurityAutoConfiguration.class)
public class ActivitiConfiguration implements ProcessEngineConfigurationConfigurer {

	@Resource(name = "myGroupManagerFactory")
	private SessionFactory groupManagerFactory;

	@Resource(name = "myUserManagerFactory")
	private SessionFactory userManagerFactory;

	public void configure(SpringProcessEngineConfiguration pec) {
		// 权限设置
		pec.setDbIdentityUsed(false); // 禁用activiti默认的权限表
		// 替换activiti的默认权限功能
		List<SessionFactory> customSessionFactories = new ArrayList<SessionFactory>();
		customSessionFactories.add(userManagerFactory);
		customSessionFactories.add(groupManagerFactory);
		if (pec.getCustomSessionFactories() == null) {
			pec.setCustomSessionFactories(customSessionFactories);
		} else {
			pec.getCustomSessionFactories().addAll(customSessionFactories);
		}
	}

	@Bean(name = "myGroupManagerFactory")
	public MyGroupManagerFactory myGroupManagerFactory(){
		return new MyGroupManagerFactory();
	}
	@Bean(name = "myUserManagerFactory")
	public MyUserManagerFactory myUserManagerFactory(){
		return new MyUserManagerFactory();
	}
}