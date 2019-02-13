package com.zbjdl.oa.wx.configuration;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mobile.device.DeviceResolverHandlerInterceptor;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.zbjdl.oa.wx.interceptor.ApplicationInterceptor;
import com.zbjdl.oa.wx.interceptor.SecurityInterceptor;
import com.zbjdl.oa.wx.interceptor.SessionInterceptor;

/**
 * Spring MVC Java Config
 * @author yejiyong
 * do not annotate this with @EnableWebMvc, if you want to keep Spring Boots auto configuration for mvc.
 */
@Configuration
public class WebMvcAppConfiguration extends WebMvcConfigurerAdapter{

	@Bean 
	public ApplicationInterceptor applicationInterceptor(){
		return new ApplicationInterceptor();
	}
	@Bean
	public SecurityInterceptor securityInterceptor(){
		SecurityInterceptor securityInterceptor =  new SecurityInterceptor();
		
		List<String> noBind = new ArrayList<>();
		noBind.add("/menu?type=bind");
		noBind.add("/wx/sign/*");
		noBind.add("/login/*");
		noBind.add("/logout");
		noBind.add("/msg/send");
		noBind.add("/nologin/*");
		noBind.add("/pay/notify");
		securityInterceptor.setNoBind(noBind );
		return securityInterceptor;
	}
	@Bean 
	public SessionInterceptor sessionInterceptor(){
		return new SessionInterceptor();
	}
	
    /** 
     * 配置拦截器 
     * @param registry 
     */  
    public void addInterceptors(InterceptorRegistry registry) {  
    	// If we do not add path pattern for an interceptor, that will be available for every request.

    	registry.addInterceptor(new DeviceResolverHandlerInterceptor())
    	.addPathPatterns("/**")
    	.excludePathPatterns("/static/**");  
    	//Session 拦截
    	registry.addInterceptor(sessionInterceptor())
    	.addPathPatterns("/menu")
    	;  
    	//权限拦截
    	registry.addInterceptor(securityInterceptor())
    	.addPathPatterns("/**")
    	.excludePathPatterns("/wx/mpapi.action")
    	.excludePathPatterns("/user/**")
    	.excludePathPatterns("/static/**")
    	.excludePathPatterns("/**/error");  


    } 
}
