package com.zbjdl.oa.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;

import com.zbjdl.common.RedisIdGenerator;

/**
 * Bean 配置类
 * 
 * @author yejiyong
 *
 */
@Configuration
public class BeansConfiguration {

	@Bean
	public RedisTemplate redisTemplate(RedisConnectionFactory factory) {
		final RedisTemplate template = new StringRedisTemplate(factory);
		return template;
	}

	@Bean
	public RedisIdGenerator redisIdGenerator() {
		return new RedisIdGenerator();
	}

	// @Bean
	// public ConfigurationUtils configurationUtils(){
	// ConfigurationUtils cfg = new ConfigurationUtils();
	// cfg.init();
	// return cfg;
	// }

}
