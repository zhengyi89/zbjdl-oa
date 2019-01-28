package com.zbjdl.oa.wx.util;

import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.util.Iterator;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.core.io.ClassPathResource;

import com.zbjdl.oa.wx.exception.WxIllegalAccessException;


public class Configuration {
	private static final Log logger = LogFactory.getLog(Configuration.class);

	public static final String ELEMENT_BEAN = "bean";

	public static final String ELEMENT_PARAM = "param";
	
	public static final String ELEMENT_DECRYPE = "decrype";

	public static final String ELEMENT_GLOBAL_PARAMS = "global-params";

	public static final String ELEMENT_GLOBAL_VALIDATORS = "global-validators";

	public static final String ELEMENT_VALIDATOR = "validator";

	public static BeanFactoryConfig configure(String[] files){
		if(files != null && files.length>0){
			BeanFactoryConfig factory = new BeanFactoryConfig();
			for(int i=0; i<files.length; i++){
				configure(files[i], factory);
			}
			return factory;
		}
		return null;
	}
	
	public static BeanFactoryConfig configure(String fileName) {
		BeanFactoryConfig factory = new BeanFactoryConfig();
		configure(fileName, factory);
		return factory;
	}
	
	public static void configure(String filName, BeanFactoryConfig factory) {
		try {
			Element root = readFile(filName);
			Iterator elementIterator = root.elementIterator(ELEMENT_BEAN);
			while (elementIterator.hasNext()) {
				ParamBeanConfig paramBeanConfig = parseParamBean((Element) elementIterator.next());
				if (!factory.addParamBean(paramBeanConfig)) {
					throw new WxIllegalAccessException("系统异常");
				}
			}
		} catch (Exception e) {
			logger.error("configure error : " + e.getMessage());
			logger.error(e.getMessage(), e);
		}
	}

	private static ParamBeanConfig parseParamBean(Element bean) throws IllegalAccessException, InvocationTargetException {
		ParamBeanConfig beanConfig = new ParamBeanConfig();
		autoSet(beanConfig, bean);
		Element ed = bean.element(ELEMENT_DECRYPE);
		autoSet(beanConfig, ed);
		Iterator elementIterator = bean.elementIterator(ELEMENT_PARAM);
		while (elementIterator.hasNext()) {
			ParamConfig paramConfig = parseParam((Element) elementIterator.next());
			beanConfig.addParam(paramConfig);
		}

		return beanConfig;
	}

	private static ParamConfig parseParam(Element param) throws IllegalAccessException, InvocationTargetException {
		ParamConfig p = new ParamConfig();
		autoSet(p, param);
		return p;
	}

	private static void autoSet(Object target, Element element) throws IllegalAccessException, InvocationTargetException {
		for (Iterator i = element.attributeIterator(); i.hasNext();) {
			Attribute attr = (Attribute) i.next();
			BeanUtils.setProperty(target, attr.getName(), attr.getValue());
		}
	}

	public static Element readFile(String fileName) throws DocumentException, IOException {
		SAXReader reader = new SAXReader();
		ClassPathResource res = new ClassPathResource("/" + fileName);
		InputStream is = res.getInputStream();
		Document document = reader.read(is);
		return document.getRootElement();
	}
}