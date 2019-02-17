package com.zbjdl.oa.wx.controller;

import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSON;

public class TestMain {
	public static void main(String[] args) {
		List l = new ArrayList<Integer>();
		for (int i = 0; i < 10; i++) {
			l.add(i);
		}
		l.add(4, 100);
		
		System.out.println(JSON.toJSONString(l));
	}

}
