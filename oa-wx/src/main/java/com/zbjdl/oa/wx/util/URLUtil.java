package com.zbjdl.oa.wx.util;

import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;


/**
 * 解析URL工具类
 */
public class URLUtil {
	/**
	 * 判断URL中是否存在指定参数
	 * @param url	地址
	 * @param param	参数名称
	 * @return
	 */
	public static boolean containsParam(String url , String param){
		return (url.indexOf("&"+param+"=") > 0 || url.indexOf("?"+param+"=") > 0);
	}
	
	/**
	 * 替换URL中所有相同名称的参数
	 * @param url	地址
	 * @param param	参数名称
	 * @return
	 */
	public static String replaceParams(String url , String param){
		while(containsParam(url , param)){
			url = replaceParam(url, param);
		}
		return url;
	}
	
	/**
	 * 替换URL中第一个参数
	 * @param url	地址
	 * @param param	参数名称
	 * @return
	 */
	public static String replaceParam(String url , String param){
		int sIndex = url.indexOf("&"+param+"=");
		if(sIndex > 0){
			int eIndex = url.indexOf("&", sIndex + 1);
			return(url.substring(0, sIndex) + (eIndex > 0 ? url.subSequence(eIndex, url.length()) : ""));
		}
		sIndex = url.indexOf("?"+param+"=");
		if(sIndex > 0){
			int eIndex = url.indexOf("&", sIndex + 1);
			return(url.substring(0, sIndex) + (eIndex > 0 ? url.subSequence(eIndex, url.length()) : ""));
		}
		return url;
	}
	
	/**
	 * 获取请求的完整地址
	 */
	@SuppressWarnings("unchecked")
	public static String getCallBackUri(HttpServletRequest request){
		Map<String , String[]> paramMap = request.getParameterMap();
		Iterator<Entry<String, String[]>> iterator = paramMap.entrySet().iterator();
		StringBuffer param = new StringBuffer("?1=1");
		while(iterator.hasNext()){
			Entry<String , String[]> entry = iterator.next();
			String key = entry.getKey();
			String[] valArray = entry.getValue();
			for(String val : valArray){
				param.append("&").append(key).append("=").append(val);
			}
		}
		return request.getRequestURI().concat(param.toString());
	}
	
	/**
	 * 获取URL中的指定参数值
	 * @param url	地址
	 * @param param	参数名称
	 */
	public static String getParam(String url , String param){
		if(StringUtils.isBlank(url)){
			return null;
		}
		String exp = "&"+param+"=";
		int sIndex = url.indexOf(exp);
		if(sIndex > 0){
			int eIndex = url.indexOf("&", sIndex + 1);
			return url.substring(sIndex + exp.length() , eIndex > 0 ? eIndex : url.length());
		}
		sIndex = url.indexOf("?"+param+"=");
		if(sIndex > 0){
			int eIndex = url.indexOf("&", sIndex + 1);
			return url.substring(sIndex + exp.length() , eIndex > 0 ? eIndex : url.length());
		}
		return url;
	}
}
