package com.zbjdl.oa.wx.controller.common.dto;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.ArrayUtils;

/**
 * @author zhengy
 * @date 2016/07/11
 */
@SuppressWarnings("serial")
public class BaseRespDto implements Serializable {

	protected String code; // 应用ID

	protected String msg; // 客户端id

	public BaseRespDto() {
	};

	public BaseRespDto(String code) {
		this.code = code;
	}

	public BaseRespDto(String code, String msg) {
		this.code = code;
		this.msg = msg;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	final public Map<String, Object> toMap() {
		Map<String, Object> map = new HashMap<String, Object>();
		Field[] fields = this.getClass().getDeclaredFields();
		Field[] fieldsThis = this.getClass().getSuperclass().getDeclaredFields();
		fields = ArrayUtils.addAll(fields, fieldsThis);
		for (Field field : fields) {
			Object obj;
			try {
				obj = field.get(this);
				if (obj != null) {
					map.put(field.getName(), obj);
				}
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
		}
		return map;
	}

}