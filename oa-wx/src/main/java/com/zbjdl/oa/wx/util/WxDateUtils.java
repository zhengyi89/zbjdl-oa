package com.zbjdl.oa.wx.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

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
		}else {
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
//		for (int j = 0; j < dates.size(); j++) {
//			System.err.println(dates.get(j));
//		}
	}
//
//	public static void main(String[] args) {
//		// DateUtils.
//		try {
//			test3("2019-02");
//			System.out.println(DateUtils.getMonthStart(sdf.parse("2019-02")));
//			System.out.println(DateUtils.getMonthEnd(sdf.parse("2019-02")));
//			System.out.println(DateUtils.getMonthEnd(new Date()));
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
}
