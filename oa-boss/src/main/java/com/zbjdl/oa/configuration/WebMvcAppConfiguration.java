package com.zbjdl.oa.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.zbjdl.boss.admin.frame.interceptor.springmvc.AuditInterceptor;
import com.zbjdl.boss.admin.frame.interceptor.springmvc.AuthorityInterceptor;
import com.zbjdl.boss.admin.frame.interceptor.springmvc.AvoidDuplicateSubmissionInterceptor;
import com.zbjdl.boss.admin.frame.interceptor.springmvc.MenuInterceptor;
import com.zbjdl.boss.admin.frame.interceptor.springmvc.OperationLogInterceptor;
import com.zbjdl.boss.admin.frame.interceptor.springmvc.ParametersInterceptor;
import com.zbjdl.boss.admin.frame.interceptor.springmvc.SSOInterceptor;
import com.zbjdl.common.utils.queryview.interceptor.DataTablesHandlerInterceptor;
import com.zbjdl.common.utils.queryview.interceptor.ExportDataHandlerInterceptor;

/**
 * Spring MVC Java Config
 * 
 * @author yejiyong do not annotate this with @EnableWebMvc, if you want to keep
 *         Spring Boots auto configuration for mvc.
 */
@Configuration
public class WebMvcAppConfiguration extends WebMvcConfigurerAdapter {

	/**
	 * 配置拦截器
	 * 
	 * @author lance
	 * @param registry
	 */
	public void addInterceptors(InterceptorRegistry registry) {
		// If we do not add path pattern for an interceptor, that will be
		// available for every request.

		registry.addInterceptor(new ExportDataHandlerInterceptor());
		registry.addInterceptor(new ParametersInterceptor());
		// registry.addInterceptor(new ExceptionInterceptor());

		registry.addInterceptor(new SSOInterceptor());//MEXC
		registry.addInterceptor(new MenuInterceptor());
		registry.addInterceptor(new AuditInterceptor());
		registry.addInterceptor(new AuthorityInterceptor());
		registry.addInterceptor(new DataTablesHandlerInterceptor());
		registry.addInterceptor(new OperationLogInterceptor());
		registry.addInterceptor(new AvoidDuplicateSubmissionInterceptor());
	}
}
