package com.zbjdl.oa;

import javax.servlet.MultipartConfigElement;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.embedded.MultipartConfigFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ImportResource;
import org.springframework.stereotype.Controller;

/**
 * 
 * @author yejiyong
 *
 */
@Controller
@SpringBootApplication
@ImportResource({ "classpath:boss-spring/applicationContext-consumer.xml",
		"classpath:boss-spring/applicationContext-ransomfloorboss-query.xml" })
public class OaBossApplication {
	private static final Logger logger = LoggerFactory.getLogger(OaBossApplication.class);
	@Bean
	public MultipartConfigElement multipartConfigElement() {
		MultipartConfigFactory factory = new MultipartConfigFactory();
		factory.setMaxFileSize("3MB");
		factory.setMaxRequestSize("50MB");
		return factory.createMultipartConfig();
	}
	
	public static void main(String[] args) {
		SpringApplication springApplication = new SpringApplication(OaBossApplication.class);
		springApplication.run(args);
		logger.info("Spring boot loaded------------------ransomfloor-boss");
	}

}
