package com.zbjdl.oa.configuration;

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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.context.embedded.FilterRegistrationBean;
import org.springframework.boot.context.embedded.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.View;

import com.zbjdl.boss.admin.frame.BossSiteMeshFilter;
import com.zbjdl.boss.admin.frame.utils.sso.SSOWebHelper;

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
		filterRegistrationBean.setFilter(new BossSiteMeshFilter());
		filterRegistrationBean.setDispatcherTypes(EnumSet.allOf(DispatcherType.class));
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
		servletRegistrationBean.setInitParameters(initParameters);
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

	@Bean(name = "error")
	public View defaultErrorView() {
		return new View() {

			@Override
			public void render(Map<String, ?> model, HttpServletRequest request, HttpServletResponse response)
					throws Exception {
				Map<String, Object> params = new HashMap<String, Object>();
				params.put("resourcePath", request.getAttribute("resourcePath"));
				params.put("message", model.get("message"));
				String result = SSOWebHelper.getContentFromTemplate("freemarker/exceptiontemplate.ftl", params);
				response.getWriter().append(result);

			}

			@Override
			public String getContentType() {
				return "text/html";
			}
		};
	}

}
