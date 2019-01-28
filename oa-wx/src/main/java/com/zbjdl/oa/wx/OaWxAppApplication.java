package com.zbjdl.oa.wx;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ImportResource;
import org.springframework.session.data.redis.config.annotation.web.http.EnableRedisHttpSession;
import org.springframework.stereotype.Controller;

/**
 * 
 *
 */
@Controller
@SpringBootApplication
@ImportResource({"classpath:spring/applicationContext-consumer.xml"})

@EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})
@EnableRedisHttpSession
public class RansomfloorWxAppApplication  {
	private static final Logger logger = LoggerFactory
			.getLogger(RansomfloorWxAppApplication.class);
    
	public static void main(String[] args) {
		SpringApplication springApplication = new SpringApplication(RansomfloorWxAppApplication.class);
        springApplication.run(args);
        logger.info("Spring boot loaded");
	}

    @Bean
    public StartupRunner schedulerRunner() {
        return new StartupRunner();
    }	
}
