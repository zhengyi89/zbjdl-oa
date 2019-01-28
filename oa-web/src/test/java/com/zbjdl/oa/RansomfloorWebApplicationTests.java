package com.zbjdl.oa;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.web.WebAppConfiguration;

import com.zbjdl.oa.RansomfloorWebApplication;

import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = RansomfloorWebApplication.class)
@WebAppConfiguration
public class RansomfloorWebApplicationTests {

	@Test
	public void contextLoads() {
	}

}
