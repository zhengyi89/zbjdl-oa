package com.zbjdl.oa.wx.util;

import java.util.HashMap;
import java.util.Map;

public class BeanFactoryConfig {
	private Map<String, ParamBeanConfig> paramBeans = new HashMap<String, ParamBeanConfig>();
	
	public boolean addParamBean(ParamBeanConfig bean){
		if(paramBeans.containsKey(bean.getId())){
			return false;
		}
		paramBeans.put(bean.getId(), bean);
		return true;
	}
	
	public ParamBeanConfig getParamBean(String id){
		return (ParamBeanConfig)paramBeans.get(id);
	}

	public Map<String, ParamBeanConfig> getParamBeans() {
		return paramBeans;
	}
}
