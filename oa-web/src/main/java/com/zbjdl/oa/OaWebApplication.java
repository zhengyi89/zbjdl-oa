package com.zbjdl.oa;

import java.util.List;

import org.activiti.engine.RepositoryService;
import org.activiti.engine.IdentityService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ImportResource;
import org.springframework.stereotype.Controller;

@Controller
@SpringBootApplication
@ImportResource({ "classpath*:applicationContext-provider.xml", "classpath*:applicationContext-consumer.xml", "classpath:common/applicationContext-common.xml" })
public class RansomfloorWebApplication {

	private static final Logger logger = LoggerFactory.getLogger(RansomfloorWebApplication.class);

	public static void main(String[] args) {

		SpringApplication.run(RansomfloorWebApplication.class, args);
		logger.info("Spring boot loaded------------------ransomfloor-web");
	}

	@Bean
	CommandLineRunner init(final RepositoryService IdentityService,final IdentityService identityService ) {

		return new CommandLineRunner() {

			public void run(String... strings) throws Exception {

				//系统启动后自动执行的逻辑
			}
		};
	}
}
