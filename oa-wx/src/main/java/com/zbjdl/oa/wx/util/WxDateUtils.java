package com.zbjdl.oa.wx.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TreeSet;

import com.zbjdl.common.utils.DateUtils;

public class WxDateUtils {
	
	static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");

	public static List<String> getDayListByMonth(String month) throws ParseException {
		Calendar begin = Calendar.getInstance();// 得到一个Calendar的实例
		begin.setTime(DateUtils.getMonthStart(sdf.parse(month))); // 设置时间为当前时间
		// begin.add(Calendar.MONTH, -1);// 月份减1
		// begin.add(Calendar.DATE, +1);// 日期加1
		Calendar end = Calendar.getInstance();
		// 如果是当前月份，截止时间为当日
		if (sdf.format(new Date()).equals(month)) {
			end.setTime(new Date());
		} else {
			end.setTime(DateUtils.getMonthEnd(sdf.parse(month)));
		}
		Long startTime = begin.getTimeInMillis();
		Long endTime = end.getTimeInMillis();
		Long oneDay = 1000 * 60 * 60 * 24l;// 一天的时间转化为ms
		List<String> dates = new ArrayList<>();
		Long time = startTime;
		int i = 0;
		while (time <= endTime) {
			Date d = new Date(time);
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			dates.add(i, df.format(d));
			i++;
			time += oneDay;
		}
		return dates;
		// for (int j = 0; j < dates.size(); j++) {
		// System.err.println(dates.get(j));
		// }
	}

	public static TreeSet<String> genDateSet(String startDate, String endDate) {
		TreeSet<String> set = new TreeSet<String>();
		List<String> list = getBetweenMonth(startDate, endDate);
		for (String string : list) {
			set.add(string);
		}
		return set;
	}

	public static List<String> getBetweenMonth(String startDate, String endDate) {
		List<String> resultList = new ArrayList<String>();
		try {
			Date d1 = sdf.parse(startDate);// 定义起始日期
			Date d2 = sdf.parse(endDate);// 定义结束日期 可以去当前月也可以手动写日期。
			Calendar dd = Calendar.getInstance();// 定义日期实例
			dd.setTime(d1);// 设置日期起始时间
			while (dd.getTime().before(d2)) {// 判断是否到结束日期
				String str = sdf.format(dd.getTime());
				resultList.add(str);
				dd.add(Calendar.MONTH, 1);// 进行当前日期月份加1
			}
			resultList.add(endDate);
		} catch (Exception e) {
			System.out.println("异常" + e.getMessage());
		}
		return resultList;
	}
}
