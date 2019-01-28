package com.zbjdl.oa.wx;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.embedded.ServletContextInitializer;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Configuration;

import com.zbjdl.common.utils.queryview.QueryViewApplicationContextHelper;
/**
 * 容器在初始化阶段调用 ServletContextInitializer的onStartup 
 * 可以在此方法中去做一些程序设置
 * 
 *
 */
@Configuration
public class WebServletContextInitializer  implements ServletContextInitializer{
	private static Logger logger = LoggerFactory.getLogger(WebServletContextInitializer.class);
	@Autowired
	private ApplicationContext context;

	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {

		try {
			QueryViewApplicationContextHelper.setContext(context);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		
	}

}
