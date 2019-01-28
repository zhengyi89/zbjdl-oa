package com.zbjdl.oa.wx;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;

import com.zbjdl.common.redis.RedisClientTemplate;
import com.zbjdl.common.redis.RedisClientUtils;


public class StartupRunner implements CommandLineRunner {
    protected final Logger logger = LoggerFactory.getLogger(StartupRunner.class);
    @Override
    public void run(String... strings) throws Exception {
    	RedisClientUtils.init();
    }
}