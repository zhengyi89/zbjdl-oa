package com.zbjdl.oa;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ImportResource;
import org.springframework.stereotype.Controller;

@Controller
@SpringBootApplication
@ImportResource({ "classpath*:applicationContext-provider.xml", "classpath*:applicationContext-consumer.xml" })
public class OaWebApplication {

	private static final Logger logger = LoggerFactory.getLogger(OaWebApplication.class);

	public static void main(String[] args) {

		SpringApplication.run(OaWebApplication.class, args);
		logger.info("Spring boot loaded------------------oa-web");
	}

}
