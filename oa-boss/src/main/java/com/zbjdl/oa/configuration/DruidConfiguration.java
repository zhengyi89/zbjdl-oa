package com.zbjdl.oa.configuration;

import java.util.HashMap;
import java.util.Map;

import org.springframework.boot.context.embedded.FilterRegistrationBean;
import org.springframework.boot.context.embedded.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.alibaba.druid.support.http.StatViewServlet;
import com.alibaba.druid.support.http.WebStatFilter;

/**
 * druid配置类
 * 
 * @author MengXiangChao
 * @date 2016年5月12日 下午4:01:33
 */
@Configuration
public class DruidConfiguration {

	@Bean
	public ServletRegistrationBean druidServlet() {

		ServletRegistrationBean servletRegistrationBean = new ServletRegistrationBean(new StatViewServlet(),
				"/druid/*");
		Map<String, String> initParameters = new HashMap<>();
		initParameters.put("loginUsername", "druid");// 登录用户名
		initParameters.put("loginPassword", "druid");// 密码
		initParameters.put("resetEnable", "false");//// 禁用HTML页面上的“Reset All”功能
		servletRegistrationBean.setInitParameters(initParameters);
		return servletRegistrationBean;
	}

	@Bean
	public FilterRegistrationBean filterRegistrationBean() {
		FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();
		filterRegistrationBean.setFilter(new WebStatFilter());
		filterRegistrationBean.addUrlPatterns("/*");
		filterRegistrationBean.addInitParameter("exclusions", "*.js,*.json,*.gif,*.jpg,*.png,*.css,*.ico,/druid/*");
		return filterRegistrationBean;
	}
}
