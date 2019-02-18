package com.zbjdl.oa.wx.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Field;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.httpclient.HttpException;
import org.slf4j.Logger;

import com.zbjdl.common.httpclient.HttpClientUtil;
import com.zbjdl.common.httpclient.MethodType;
import com.zbjdl.common.json.JsonMapper;
import com.zbjdl.common.utils.CheckUtils;
import com.zbjdl.common.utils.StringUtils;
import com.zbjdl.common.utils.config.ConfigRepository;
import com.zbjdl.common.utils.config.ConfigurationUtils;
import com.zbjdl.common.utils.config.dao.ConfigDao;
import com.zbjdl.common.utils.config.entity.Config;
import com.zbjdl.common.utils.config.enumtype.ValueDataTypeEnum;
import com.zbjdl.common.utils.config.enumtype.ValueTypeEnum;
import com.zbjdl.common.utils.config.impl.DefaultConfigRepository;
import com.zbjdl.oa.wx.exception.WxIllegalAccessException;
import com.zbjdl.oa.wx.util.dto.OAuthAccessTokenDto;
import com.zbjdl.oa.wx.util.dto.WeiXinUserInfoDto;
import org.slf4j.LoggerFactory;

/**
 * 微信工具类
 * 
 * 
 * @since 2014-9-11 10:39:19
 */
public class WxUtil {
	private static final Logger LOGGER = LoggerFactory.getLogger(WxUtil.class);
	/**
	 * 签名Token
	 */
	private static final String TOKEN = "f2250dd75f54b9b61fbf5bee7fc4c7ae";

//	public static final String WX_APPID = "wx159708199306b751";
//	public static final String WX_SECRET = "b884e1077a37a8460a64c73573cecc88";
	public static final String WX_APPID = "wxe61f6e7dc9d70a1e";
	public static final String WX_SECRET = "0bbca271406b994c0648bf053ab028ce";
	public static final String WX_API_SYSTEM_HOST = "https://api.weixin.qq.com";
	public static final String WX_ACCESS_TOKEN = "jvNlpxePHPjU0Bs7Pzu5xLjloGWl65-LPiPVxi7yVkX0jV";
	public static final String OA_WX_HOST = "http://188.131.144.112";

	/**
	 * 命名空间
	 */
	private static String NAME_SPACE;
	private static ConfigDao configDao;

	/**
	 * 判断是否为微信浏览器
	 */
	public static boolean isWxBrowser(HttpServletRequest request) {
		if (request.getHeader("user-agent") != null) {
			String ua = request.getHeader("user-agent").toLowerCase();
			return (ua.indexOf("micromessenger") > 0);
		}
		return false;

	}

	/**
	 * 获取Code
	 */
	public static String getCode(String redirectUrl, String scope) {
		String url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=%s&redirect_uri=%s&response_type=code&scope=%s&state=STATE#wechat_redirect";
		try {
			return String.format(url, WX_APPID, URLEncoder.encode(redirectUrl, "UTF-8"), scope);
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException(e.getMessage(), e);
		}
	}

	/**
	 * 获取命名空间
	 */
	public static String getNameSpace() {
		try {
			if (StringUtils.isBlank(NAME_SPACE)) {
				if (!ConfigurationUtils.initialized()) {
					ConfigurationUtils.init();
				}
				ConfigRepository configRepository = (ConfigRepository) ConfigurationUtils.getContext()
						.getBean("defaultConfigRepository");
				Field field = DefaultConfigRepository.class.getDeclaredField("configNamespace");
				field.setAccessible(true);
				NAME_SPACE = (String) field.get(configRepository);
			}
			return NAME_SPACE;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 获取配置Dao
	 */
	public static ConfigDao getConfigDao() {
		if (configDao == null) {
			configDao = (ConfigDao) ConfigurationUtils.getContext().getBean("configDao");
		}
		return configDao;
	}

	/**
	 * 获取用户丰富信息(UnionID机制)，需要用户已经关注服务号
	 */
	public static WeiXinUserInfoDto getUserInfoByUnionId(String openId) {
		try {
			LOGGER.info("获取用户详细信息(unionId)，OpenId:{}", openId);
			String url_userinfo = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=%s&openid=%s&lang=zh_CN";

			// 全局AccessToken机制：超时则重新获取，否则既使用
			WeiXinUserInfoDto dto = sendToWx(url_userinfo, WeiXinUserInfoDto.class, getAccessToken(false), openId);
			// 如果Access_token超时
			if (WeiXinUserInfoDto.ERROR_INVALID.equals(dto.getErrcode())) {
				dto = sendToWx(url_userinfo, WeiXinUserInfoDto.class, getAccessToken(true), openId);
			}
			return dto;
		} catch (Exception e) {
			LOGGER.error("获取用户详细信息失败", e);
		}
		return null;
	}

	/**
	 * 获取用户丰富信息(网页授权方式)，用户可以未关注公众号
	 */
	public static WeiXinUserInfoDto getUserInfoByOAuth(String code) {
		try {
			String url_access_token = "%s/sns/oauth2/access_token?appid=%s&secret=%s&code=%s&grant_type=authorization_code";
			OAuthAccessTokenDto accessToken = sendToWx(url_access_token, OAuthAccessTokenDto.class, WX_API_SYSTEM_HOST,
					WX_APPID, WX_SECRET, code);
			String url_userinfo = "%s/sns/userinfo?access_token=%s&openid=%s&lang=zh_CN";
			return sendToWx(url_userinfo, WeiXinUserInfoDto.class, WX_API_SYSTEM_HOST, accessToken.getAccess_token(),
					accessToken.getOpenid());
		} catch (Exception e) {
			throw new WxIllegalAccessException("获取微信user_info错误", e);
		}
	}

	/**
	 * 获取微信OpenId
	 */
	public static WeiXinUserInfoDto getUserBase(String code) throws WxIllegalAccessException {
		try {
			CheckUtils.notEmpty(code, "code");
			String url = "%s/sns/oauth2/access_token?grant_type=authorization_code&code=%s&appid=%s&secret=%s";
			return sendToWx(url, WeiXinUserInfoDto.class, WX_API_SYSTEM_HOST, code, WX_APPID, WX_SECRET);
		} catch (IOException e) {
			throw new WxIllegalAccessException("获取微信Openid错误", e);
		}
	}

	/**
	 * 将消息发送到微信
	 */
	@SuppressWarnings({ "unchecked" })
	public static Map<String, Object> sendToWx(String url, Object... params) throws HttpException, IOException {
		url = String.format(url, params);
		HttpClientUtil util = new HttpClientUtil();
		String response = util.doRequest(MethodType.GET, url, "UTF-8");
		LOGGER.info("微信接口返回信息:{}", response);
		return JsonMapper.toMap(response);
	}

	/**
	 * 将消息发送到微信
	 */
	public static <T> T sendToWx(String url, Class<T> clazz, Object... params) throws HttpException, IOException {
		url = String.format(url, params);
		LOGGER.info("调用微信接口:{}", url);
		HttpClientUtil util = new HttpClientUtil();
		String response = util.doRequest(MethodType.GET, url, "UTF-8");
		LOGGER.info("微信接口返回信息:{}", response);
		JsonMapper mapper = new JsonMapper();
		return mapper.fromJson(response, clazz);
	}

	/**
	 * 验证签名
	 * 
	 * @param signature
	 *            微信加密签名
	 * @param timestamp
	 *            时间戳
	 * @param nonce
	 *            随机数
	 * @return
	 * @throws NoSuchAlgorithmException
	 */
	public static boolean checkSignature(String signature, String timestamp, String nonce)
			throws NoSuchAlgorithmException {
		if (StringUtils.isBlank(signature) || StringUtils.isBlank(timestamp) || StringUtils.isBlank(nonce)) {
			return false;
		}

		String[] arr = new String[] { TOKEN, timestamp, nonce };// 将token、timestamp、nonce三个参数进行字典序排序
		Arrays.sort(arr);
		StringBuilder content = new StringBuilder();
		for (int i = 0; i < arr.length; i++) {
			content.append(arr[i]);
		}
		MessageDigest md = MessageDigest.getInstance("SHA-1");
		// 将三个参数字符串拼接成一个字符串进行sha1加密
		byte[] digest = md.digest(content.toString().getBytes());
		String tmpStr = byteToStr(digest);
		// 将sha1加密后的字符串可与signature对比，标识该请求来源于微信
		return signature.toUpperCase().equals(tmpStr);
	}

	/**
	 * 获取新的Access_token
	 * 
	 * @throws IOException
	 * @throws HttpException
	 */
	private static String getAccessToken(boolean isAnyCase) throws HttpException, IOException {
		ConfigDao configDao = getConfigDao();
		String nameSpace = getNameSpace();
		Config config = new Config();
		config.setNamespace(nameSpace);
		config.setType(ConfigurationUtils.CONFIG_TYPE_APP);
		config.setConfigKey(WX_ACCESS_TOKEN);

		List<Config> configList = configDao.queryConfig(config);
		if (configList == null || configList.size() == 0) {
			config = new Config();
			config.setNamespace(nameSpace);
			config.setType(ConfigurationUtils.CONFIG_TYPE_APP);
			config.setConfigKey(WX_ACCESS_TOKEN);
			config.setUpdatable(true);
			config.setDeletable(true);
			config.setUpdateDate(new Date());
			config.setCreateDate(new Date());
			config.setValueType(ValueTypeEnum.VALUE);
			config.setValueDataType(ValueDataTypeEnum.STRING);
			configDao.add(config);
		} else {
			config = configList.get(0);
		}
		long outTime = System.currentTimeMillis() - config.getUpdateDate().getTime();
		if (isAnyCase || (outTime > 7000000 || StringUtils.isBlank(config.getValue()))) {
			LOGGER.info("AccessToken过期，开始重新查询:更新时间:{} , 时间差:{}", config.getUpdateDate(), outTime);
			String url_access_token = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=%s&secret=%s";
			OAuthAccessTokenDto accessToken = sendToWx(url_access_token, OAuthAccessTokenDto.class, WX_APPID,
					WX_SECRET);
			if (accessToken == null || StringUtils.isBlank(accessToken.getAccess_token())) {
				LOGGER.error("获取AccessToken失败");
				return null;
			}
			config.setValue(accessToken.getAccess_token());
			config.setUpdateDate(new Date());
			configDao.update(config);
		}
		return config.getValue();
	}

	/**
	 * 将字节数组转换为十六进制字符串
	 * 
	 * @param byteArray
	 * @return
	 */
	private static String byteToStr(byte[] byteArray) {
		String strDigest = "";
		for (int i = 0; i < byteArray.length; i++) {
			strDigest += byteToHexStr(byteArray[i]);
		}
		return strDigest;
	}

	/**
	 * 将字节转换为十六进制字符串
	 * 
	 * @param mByte
	 * @return
	 */
	private static String byteToHexStr(byte mByte) {
		char[] Digit = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };
		char[] tempArr = new char[2];
		tempArr[0] = Digit[(mByte >>> 4) & 0X0F];
		tempArr[1] = Digit[mByte & 0X0F];
		String s = new String(tempArr);
		return s;
	}
}
