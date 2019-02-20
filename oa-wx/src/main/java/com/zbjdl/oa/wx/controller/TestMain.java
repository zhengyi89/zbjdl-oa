package com.zbjdl.oa.wx.controller;

import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSON;

public class TestMain {
	public static void main(String[] args) {
		List l = new ArrayList<Integer>(20);
//		for (int i = 0; i < 10; i++) {
//			l.add(i);
//		}
//		System.out.println(l.size());
//		l.set(1, 100);
//		l.set(10, 100);
//		
//		System.out.println(JSON.toJSONString(l));
		
		String s = "2019-02-01";
		s = s.substring(s.indexOf("-")+1);
		
//		System.out.println(s.replaceAll("0", ""));
	}

}
