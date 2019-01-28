package com.zbjdl.oa.configuration;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

/**
 * Mybatis配置类
 * 
 * @author yejiyong
 *
 */
@Configuration
@MapperScan(basePackages = "com.zbjdl.oa.repository")
public class MybatisConfiguration {

}
