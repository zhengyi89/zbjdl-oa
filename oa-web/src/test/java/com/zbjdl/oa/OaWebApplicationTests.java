package com.zbjdl.oa;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.web.WebAppConfiguration;

import com.zbjdl.oa.OaWebApplication;

import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = OaWebApplication.class)
@WebAppConfiguration
public class OaWebApplicationTests {

	@Test
	public void contextLoads() {
	}

}
