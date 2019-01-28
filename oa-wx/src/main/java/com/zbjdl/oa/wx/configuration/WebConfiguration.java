package com.zbjdl.oa.wx.configuration;

import java.io.IOException;
import java.util.ArrayList;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.context.embedded.FilterRegistrationBean;
import org.springframework.boot.context.embedded.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.web.filter.CharacterEncodingFilter;

import com.zbjdl.oa.wx.listener.WxContextListener;

import freemarker.ext.servlet.FreemarkerServlet;


@Configuration
public class WebConfiguration {
	private static final Logger logger = LoggerFactory.getLogger(WebConfiguration.class);

	/**
	 * sitemesh filter
	 *
	 * @return sitemesh filter
	 */
	@Bean
	public FilterRegistrationBean siteMeshFilter() {
		FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();
		filterRegistrationBean.setFilter(new ConfigurableSiteMeshFilter() {
			protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {

				builder.addDecoratorPath("/*", "/WEB-INF/layouts/decorator_default.jsp")
				.addExcludedPath("/*.json*")
				.addExcludedPath("/static/*")
				.addExcludedPath("/test/wx.action")
				.addExcludedPath("/jsSign")
				.addExcludedPath("/wx/mpapi.action");

				builder.addDecoratorPath("/login*", "/WEB-INF/layouts/portal_zepto.jsp");
	

			}
		});
		filterRegistrationBean.setDispatcherTypes(EnumSet.allOf(DispatcherType.class));
		filterRegistrationBean.addUrlPatterns("/*");
		filterRegistrationBean.setName("sitemeshFilter");
		return filterRegistrationBean;
	}
	@Bean
	public ServletRegistrationBean freemarkerServlet() {
		ServletRegistrationBean servletRegistrationBean = new ServletRegistrationBean();
		FreemarkerServlet servlet = new FreemarkerServlet();
	
		servletRegistrationBean.setServlet(servlet);
	    ArrayList<String> list = new ArrayList<>();
	    list.add("*.ftl");
	    servletRegistrationBean.setUrlMappings(list); 	
	    Map<String, String> initParameters = new HashMap<>();
	    initParameters.put("default_encoding", "UTF-8");
	    initParameters.put("ObjectWrapper", "beans");
		servletRegistrationBean.setInitParameters(initParameters );
	    return servletRegistrationBean;
	}	
	
	
	
	
	@Bean
	@Order(Ordered.HIGHEST_PRECEDENCE)
	public FilterRegistrationBean characterEncodingFilter() {
		FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();
		CharacterEncodingFilter filter = new CharacterEncodingFilter();
		filter.setEncoding("UTF-8");
		filter.setForceEncoding(true);
		filterRegistrationBean.setFilter(filter);
		filterRegistrationBean.setDispatcherTypes(EnumSet.allOf(DispatcherType.class));
		return filterRegistrationBean;
	}

	@Bean
    @ConditionalOnMissingBean(WxContextListener.class)
    public WxContextListener requestContextListener() {
        return new WxContextListener();
    }
	
	@Bean
	Filter myCharsetEncodingFilter() {

		return new Filter() {
			public void init(FilterConfig filterConfig) throws ServletException {
			}

			public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
					FilterChain filterChain) throws IOException, ServletException {

				servletRequest.setCharacterEncoding("UTF-8");
				servletResponse.setContentType("text/html;charset=UTF-8");

				filterChain.doFilter(servletRequest, servletResponse);
			}

			public void destroy() {
			}

		};
	}


//	@Bean
//	public EmbeddedServletContainerCustomizer containerCustomizer() {
//
//	    return new EmbeddedServletContainerCustomizer() {
//	        @Override
//	        public void customize(ConfigurableEmbeddedServletContainer container) {
//
//	            ErrorPage error400Page = new ErrorPage(HttpStatus.BAD_REQUEST, "/exceptiontemplate.html");
//	            ErrorPage error401Page = new ErrorPage(HttpStatus.UNAUTHORIZED, "/exceptiontemplate.html");
//	            ErrorPage error404Page = new ErrorPage(HttpStatus.NOT_FOUND, "/exceptiontemplate.html");
//	            ErrorPage error500Page = new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR, "/exceptiontemplate.html");
//	            container.addErrorPages(error400Page,error401Page, error404Page, error500Page);
//
//	        }
//	    };
//	}


}

