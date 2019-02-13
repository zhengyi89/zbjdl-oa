package com.zbjdl.oa;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.web.WebAppConfiguration;

import com.alibaba.fastjson.JSON;
import com.zbjdl.oa.OaWebApplication;
import com.zbjdl.oa.dto.response.OrderSummaryReportRespDto;
import com.zbjdl.oa.service.OrderInfoService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = OaWebApplication.class)
@WebAppConfiguration
public class OaWebApplicationTests {

	@Autowired
	OrderInfoService os;
	@Test
	public void contextLoads() {
		List<OrderSummaryReportRespDto> list = os.findOrderSummaryReport("2019-01-31");
		System.out.println("-----------"+JSON.toJSONString(list));
	}

}
