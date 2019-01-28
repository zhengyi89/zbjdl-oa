package com.zbjdl.oa.wx.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.BufferedHttpEntity;
import org.apache.http.entity.StringEntity;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.params.CoreConnectionPNames;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.Gson;

/**
 * 发送HTTP请求 API
 * 
 * @author zhengy
 * @date 2016/05/16
 */
public class HttpUtil {
	private static final Logger logger = LoggerFactory.getLogger(HttpUtil.class);
	public static int connectionTimeout = 30000;
	public static int readDataTimeOut = 30000;

	public static int timeout = 30000;
	public static String charset = "UTF-8";
	private static final String APPLICATION_JSON = "application/json";

	/**
	 * 执行HTTP GET方法，返回json字符串
	 * 
	 * @param url
	 * @return
	 * @throws IOException
	 */
	public static String executeGet(String url) throws IOException {
		return executeGet(connectionTimeout, readDataTimeOut, url, null);
	}

	/**
	 * 执行HTTP GET方法，返回json字符串
	 * 
	 * @param url
	 *            请求地址
	 * @param map
	 *            请求参数
	 * @return
	 * @throws IOException
	 */
	public static String executeGet(String url, Map<String, String> map) throws IOException {
		return executeGet(connectionTimeout, readDataTimeOut, url, map);
	}

	/**
	 * 执行HTTP GET方法，返回JSON字符串
	 * 
	 * @param connectTimeOut
	 * @param readDataTimeOut
	 * @param url
	 * @param params
	 * @return
	 * @throws IOException
	 */
	public static String executeGet(int connectTimeOut, int readDataTimeOut, String url, Map<String, String> params)
			throws IOException {

		StringBuffer urlBuffer = new StringBuffer(url);

		boolean flag = url.contains("?");
		if (params != null) {
			for (String key : params.keySet()) {
				String value = params.get(key);
				if (StringUtils.isEmpty(value))
					continue;
				if (flag) {
					urlBuffer.append("&");
				} else {
					urlBuffer.append("?");
					flag = true;
				}
				urlBuffer.append(key).append("=").append(URLEncoder.encode(params.get(key), "UTF-8"));
			}
		}

		HttpClient httpClient = HttpClientBuilder.create().build();
		RequestConfig config = RequestConfig.custom().setConnectTimeout(connectTimeOut)
				.setConnectionRequestTimeout(readDataTimeOut).build();
		HttpGet httpGet = new HttpGet(urlBuffer.toString());

		httpGet.setConfig(config);
		httpGet.getRequestLine();

		long start = System.currentTimeMillis();
		HttpResponse response = null;
		String result = "";
		response = httpClient.execute(httpGet);
		int statusCode = response.getStatusLine().getStatusCode();
		logger.debug("visit url :{}, request status : {}", urlBuffer.toString(), statusCode);

		HttpEntity respEntity = response.getEntity();
		if (respEntity != null) {
			respEntity = new BufferedHttpEntity(respEntity);

			InputStream in = respEntity.getContent();
			result = IOUtils.toString(in);
			in.close();
		}
		long cost = System.currentTimeMillis() - start;
		logger.info("Cost:{},URL={}", cost, urlBuffer.toString());

		return result;
	}

	/**
	 * 执行HTTP POST方法，返回json字符串
	 * 
	 * @param url
	 * @return
	 * @throws IOException
	 */
	public static String executePost(String url) throws IOException {
		return executePost(connectionTimeout, readDataTimeOut, url, null);
	}

	public static String executePost(String url, Map<String, String> map) throws IOException {
		return executePost(connectionTimeout, readDataTimeOut, url, map);
	}

	/**
	 * 
	 * 执行HTTP POST方法，返回json字符串
	 * 
	 * @param connectTimeOut
	 * @param readDataTimeOut
	 * @param url
	 * @param params
	 * @return
	 * @throws IOException
	 */
	public static String executePost(int connectTimeOut, int readDataTimeOut, String url, Map<String, String> params)
			throws IOException {
		HttpClient httpClient = HttpClientBuilder.create().build();
		RequestConfig config = RequestConfig.custom().setConnectTimeout(connectTimeOut)
				.setConnectionRequestTimeout(readDataTimeOut).build();
		MultipartEntityBuilder multipartEntityBuilder = MultipartEntityBuilder.create();
		if (params != null) {
			for (String key : params.keySet()) {
				multipartEntityBuilder.addTextBody(key, params.get(key));
			}
		}

		HttpPost httppost = new HttpPost(url);
		httppost.setEntity(multipartEntityBuilder.build());
		httppost.setConfig(config);

		HttpResponse response = null;
		String result = "";
		long start = System.currentTimeMillis();
		response = httpClient.execute(httppost);
		int statusCode = response.getStatusLine().getStatusCode();

		HttpEntity respEntity = response.getEntity();
		if (respEntity != null) {
			respEntity = new BufferedHttpEntity(respEntity);

			InputStream in = respEntity.getContent();
			result = IOUtils.toString(in);
			in.close();
		}
		if (statusCode != 200) {
			throw new IOException("调用URL返回错误状态。statusCode=" + statusCode + ";URL=" + url + ";result=" + result);
		}
		long cost = System.currentTimeMillis() - start;
		logger.info("Cost:{},URL={}", cost, url);
		return result;
	}

	/**
	 * 发送 json 请求
	 * 
	 * @param url
	 * @param obj
	 * @return
	 */
	public static String postJson(String url, Object obj) {
		return postJson(url, new Gson().toJson(obj));
	}

	/**
	 * 发送 json 请求
	 * 
	 * @param url
	 * @param str
	 * @return
	 */
	@SuppressWarnings({ "deprecation", "resource", "finally" })
	public static String postJson(String url, String str) {
		logger.info("URL={},req={}", url, str);
		long start = System.currentTimeMillis();
		DefaultHttpClient client = new DefaultHttpClient();
		client.getParams().setParameter(CoreConnectionPNames.CONNECTION_TIMEOUT, connectionTimeout);
		client.getParams().setParameter(CoreConnectionPNames.SO_TIMEOUT, timeout);

		HttpPost post = new HttpPost(url);
		StringBuffer ret = new StringBuffer();
		try {
			StringEntity sentity = new StringEntity(str, "UTF-8");
			sentity.setContentEncoding(charset);
			sentity.setContentType(APPLICATION_JSON);
			post.setEntity(sentity);

			HttpResponse res = client.execute(post);

			int statusCode = res.getStatusLine().getStatusCode();
			logger.debug("visit url :{}, request status : {}", url.toString(), statusCode);

			HttpEntity entity = res.getEntity();
			String returnCharSet = EntityUtils.getContentCharSet(entity);
			if (StringUtils.isBlank(returnCharSet)) {
				returnCharSet = "UTF-8";
			}
			InputStreamReader read = new InputStreamReader(entity.getContent(), returnCharSet);
			BufferedReader bufr = new BufferedReader(read);// 缓冲
			String line = null;
			while ((line = bufr.readLine()) != null) {
				ret.append(line);
			}
			read.close();
		} catch (Exception e) {
			e.printStackTrace();
			long end = System.currentTimeMillis();
			logger.info("Cost:{},URL={},results={}", end - start, url, e.getMessage());
			throw new RuntimeException(e);
		} finally {
			long end = System.currentTimeMillis();
			logger.info("Cost:{},URL={},req={},results={}", end - start, url, str, ret.toString());
			return ret.toString();
		}
	}
	
	/**
	 * 发送 json 请求
	 * 
	 * @param url
	 * @param obj
	 * @return
	 */
	public static Map<String, String> postJsonReturnWithStatus(String url, Object obj) {
		return postJsonReturnWithStatus(url, new Gson().toJson(obj));
	}
	
	/**
	 * 发送 json 请求
	 * 
	 * @param url
	 * @param str
	 * @return
	 */
	@SuppressWarnings({ "deprecation", "resource", "finally" })
	public static Map<String, String> postJsonReturnWithStatus(String url, String str) {
		Map<String, String> map = new HashMap<>();
		logger.info("URL={},req={}", url, str);
		long start = System.currentTimeMillis();
		DefaultHttpClient client = new DefaultHttpClient();
		client.getParams().setParameter(CoreConnectionPNames.CONNECTION_TIMEOUT, connectionTimeout);
		client.getParams().setParameter(CoreConnectionPNames.SO_TIMEOUT, timeout);

		HttpPost post = new HttpPost(url);
		StringBuffer ret = new StringBuffer();
		try {
			StringEntity sentity = new StringEntity(str, "UTF-8");
			sentity.setContentEncoding(charset);
			sentity.setContentType(APPLICATION_JSON);
			post.setEntity(sentity);

			HttpResponse res = client.execute(post);

			int statusCode = res.getStatusLine().getStatusCode();
			map.put("status", String.valueOf(statusCode));
			logger.debug("visit url :{}, request status : {}", url.toString(), statusCode);

			HttpEntity entity = res.getEntity();
			String returnCharSet = EntityUtils.getContentCharSet(entity);
			if (StringUtils.isBlank(returnCharSet)) {
				returnCharSet = "UTF-8";
			}
			InputStreamReader read = new InputStreamReader(entity.getContent(), returnCharSet);
			BufferedReader bufr = new BufferedReader(read);// 缓冲
			String line = null;
			while ((line = bufr.readLine()) != null) {
				ret.append(line);
			}
			read.close();
		} catch (Exception e) {
			e.printStackTrace();
			long end = System.currentTimeMillis();
			logger.info("Cost:{},URL={},results={}", end - start, url, e.getMessage());
			throw new RuntimeException(e);
		} finally {
			long end = System.currentTimeMillis();
			logger.info("Cost:{},URL={},req={},results={}", end - start, url, str, ret.toString());
			map.put("body", ret.toString());
			return map;
		}
	}
}
