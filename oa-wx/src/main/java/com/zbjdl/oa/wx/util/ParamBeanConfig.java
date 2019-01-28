package com.zbjdl.oa.wx.util;

import java.util.ArrayList;
import java.util.List;

public class ParamBeanConfig {

	private String id;
	private String output;
	private List<ParamConfig> params = new ArrayList<ParamConfig>();
	private List<Validator> validators = new ArrayList();
	private String decrypeParams;
	private String merchantKey;
	
	public void addParam(ParamConfig p){
		this.params.add(p);
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOutput() {
		return output;
	}
	public void setOutput(String output) {
		this.output = output;
	}
	public List<ParamConfig> getParams() {
		return params;
	}
	public void setParams(List<ParamConfig> params) {
		this.params = params;
	}
	public List<Validator> getValidators() {
		return validators;
	}
	public void setValidators(List<Validator> validators) {
		this.validators = validators;
	}

	public String getDecrypeParams() {
		return decrypeParams;
	}

	public void setDecrypeParams(String decrypeParams) {
		this.decrypeParams = decrypeParams;
	}

	public String getMerchantKey() {
		return merchantKey;
	}

	public void setMerchantKey(String merchantKey) {
		this.merchantKey = merchantKey;
	}
	
}
