package com.zbjdl.oa.wx.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class WxContextListener implements ServletContextListener{
	@Override
	public void contextInitialized(ServletContextEvent contextEvent) {
		ServletContext context = contextEvent.getServletContext();
		String contextPath = context.getContextPath();
		context.setAttribute("ctx", contextPath);
		context.setAttribute("def", new StringBuilder(contextPath).append("/static/default"));
		context.setAttribute("ext", new StringBuilder(contextPath).append("/static/extend"));
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		
	}

}
