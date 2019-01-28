function BusinessCode() {
};

var codeData;
var roleData;
var userData;
var userData26;
var userData17;
var member1Data;//资金平台数据
var member2Data;//资产平台数据
var proData;
var commonKey;
/**
 * 获取CONFIG_TYPE_SYS下面的字典配置.获取上游渠道信息的
 * 
 * @param configKey配置键
 * @param domId
 *            页面select ID
 * @param selectValue
 *            要选中的下拉选项对应的key
 * @param defaultValue
 *            默认选中值、需要的情况下传入即可，默认不传入此参数
 */
BusinessCode.getSysConfigCode = function(configKey, domId, selectValue,defaultValue) {
	commonKey = configKey;
	var html = '<option value=""></option>';
	$.ajax({
		async : false,
		url : "/oa-boss/bussinessCode/codeIndex",
		type : "POST",
		data : {
			"configKey" : configKey
		},
		dataType : "json",
		success : function(data) {
			codeData = data;
		}
	});
	for ( var key in codeData) {
//		alert(selectValue);
		if (key === selectValue) {//选中值
			html += "<option value=" + key + " class='select active' selected=true>" + codeData[key] + "</option>"
		} else if(key === defaultValue && selectValue===""){//默认值
			html += "<option value=" + key + " class='select active' selected=true>" + codeData[key] + "</option>"
		}else {
			html += "<option value=" + key + " class='select'>" + codeData[key] + "</option>"
		}
		// console.log("属性：" + key + ",值："+ codeData[key]);
		// console.log(html);
	}
	$(document.getElementById(domId)).append(html);
};



/**
 * 获取CONFIG_TYPE_SYS下面的字典配置 获取对账状态的 
 * 
 * @param configKey配置键
 * @param domId
 *            页面select ID
 * @param selectValue
 *            要选中的下拉选项对应的key
 * @param defaultValue
 *            默认选中值、需要的情况下传入即可，默认不传入此参数
 */
BusinessCode.getAmountState = function(configKey, domId, selectValue,defaultValue) {
	commonKey = configKey;
	var html = '<option value=""></option>';
	$.ajax({
		async : false,
		url : "/oa-boss/bussinessCode/codeIndex",
		type : "POST",
		data : {
			"configKey" : configKey
		},
		dataType : "json",
		success : function(data) {
			codeData = data;
		}
	});
	for ( var key in codeData) {
//		alert(selectValue);
		if (key === selectValue) {//选中值
			html += "<option value=" + key + " class='select active' selected=true>" + codeData[key] + "</option>"
		} else if(key === defaultValue && selectValue===""){//默认值
			html += "<option value=" + key + " class='select active' selected=true>" + codeData[key] + "</option>"
		}else {
			html += "<option value=" + key + " class='select'>" + codeData[key] + "</option>"
		}
		// console.log("属性：" + key + ",值："+ codeData[key]);
		// console.log(html);
	}
	$(document.getElementById(domId)).append(html);
};



/**
 * 
 * @param configKey配置键
 * @param codeKey
 *            表格数据中翻译项
 */
BusinessCode.transGirdData = function(configKey, codeKey, eleId) {
	var result = null;
	if (commonKey === configKey) {
		for ( var opt in codeData) {
			if (opt == codeKey) {
				result = codeData[opt];
			}
		}
	} else {
		$.ajax({
			async : false,
			url : "/oa-boss/bussinessCode/codeIndex",
			type : "POST",
			data : {
				"configKey" : configKey
			},
			dataType : "json",
			success : function(data) {
				for ( var key in data) {
					if (key == codeKey) {
						result = data[key];
					}
				}
			}
		});
	}
	if (result == null) {
		$(document.getElementById(eleId)).append(codeKey);
	} else {
		$(document.getElementById(eleId)).append(result);
	}
	return result;
};

BusinessCode.getRoleSelect = function(departmentId, domId, selectValue,defaultValue){
	var html = '<option value=""></option>';
	if(departmentId == ''){
		return;
	}
	$.ajax({
		async : false,
		url : "/oa-boss/bussinessCode/roleInfoIndex",
		type : "POST",
		data : {
			"departmentId" : departmentId
		},
		dataType : "json",
		success : function(data) {
			roleData = data;
		}
	});
	for ( var key in roleData) {
		if (key === selectValue) {//选中值
			html += "<option value=" + key + " class='select active' selected=true>" + roleData[key] + "</option>"
		} else if(key === defaultValue && selectValue===""){//默认值
			html += "<option value=" + key + " class='select active' selected=true>" + roleData[key] + "</option>"
		}else {
			html += "<option value=" + key + " class='select'>" + roleData[key] + "</option>"
		}
	}
	$(document.getElementById(domId)).append(html);
};


BusinessCode.getUserSelect = function(roleId, domId, selectValue,defaultValue){
	var html = '<option value=""></option>';
	$.ajax({
		async : false,
		url : "/oa-boss/bussinessCode/userInfoIndex",
		type : "POST",
		data : {
			"roleId" : roleId
		},
		dataType : "json",
		success : function(data) {
			userData = data;
		}
	});
	for ( var key in userData) {
		if (key === selectValue) {//选中值
			html += "<option value=" + key + " class='select active' selected=true>" + userData[key].toString().split(">>>")[0] + "</option>"
		} else if(key === defaultValue && selectValue===""){//默认值
			html += "<option value=" + key + " class='select active' selected=true>" + userData[key].toString().split(">>>")[0] + "</option>"
		}else {
			html += "<option value=" + key + " class='select'>" + userData[key].toString().split(">>>")[0] + "</option>"
		}
	}
	$(document.getElementById(domId)).append(html);
};

BusinessCode.getUserSelect26 = function(roleId, domId, selectValue,defaultValue){
	var html = '<option value=""></option>';
	$.ajax({
		async : false,
		url : "/oa-boss/bussinessCode/userInfoIndex",
		type : "POST",
		data : {
			"roleId" : roleId
		},
		dataType : "json",
		success : function(data) {
			userData26 = data;
		}
	});
	for ( var key in userData26) {
		if (key === selectValue) {//选中值
			html += "<option value=" + key + " class='select active' selected=true>" + userData26[key].toString().split(">>>")[0] + "</option>"
		} else if(key === defaultValue && selectValue===""){//默认值
			html += "<option value=" + key + " class='select active' selected=true>" + userData26[key].toString().split(">>>")[0] + "</option>"
		}else {
			html += "<option value=" + key + " class='select'>" + userData26[key].toString().split(">>>")[0] + "</option>"
		}
	}
	$(document.getElementById(domId)).append(html);
};

BusinessCode.displayMobil = function(userId, domId, selectValue,defaultValue){
	for ( var key in userData) {
		if (key === userId) {//选中值
			var value= userData[key].split(">>>")[1].toString();
			var html = '<input type="text" class="form-control" id="mediationPhone" name="mediationPhone" value='+value+'>';
			$(domId).html(html);
		} 
	}
};

BusinessCode.displaySalesMobil = function(userId, domId, selectValue,defaultValue){
	for ( var key in userData26) {
		if (key === userId) {//选中值
			var value= userData26[key].split(">>>")[1].toString();
			var html = '<input type="text" class="form-control" id="salesmanPhone" name="salesmanPhone" value='+value+'>';
			$(domId).html(html);
		} 
	}
};

BusinessCode.getUserSelect17 = function(roleId, domId, selectValue,defaultValue){
	var html = '<option value=""></option>';
	$.ajax({
		async : false,
		url : "/oa-boss/bussinessCode/userInfoIndex",
		type : "POST",
		data : {
			"roleId" : roleId
		},
		dataType : "json",
		success : function(data) {
			userData17 = data;
		}
	});
	for ( var key in userData17) {
		if (key === selectValue) {//选中值
			html += "<option value=" + key + " class='select active' selected=true>" + userData17[key].toString().split(">>>")[0] + "</option>"
		} else if(key === defaultValue && selectValue===""){//默认值
			html += "<option value=" + key + " class='select active' selected=true>" + userData17[key].toString().split(">>>")[0] + "</option>"
		}else {
			html += "<option value=" + key + " class='select'>" + userData17[key].toString().split(">>>")[0] + "</option>"
		}
	}
	$(document.getElementById(domId)).append(html);
};

BusinessCode.displayUserMobil = function(userId, domId, selectValue,defaultValue){
	for ( var key in userData17) {
		if (key === userId) {//选中值
			var value= userData17[key].split(">>>")[1].toString();
			var html = '<input type="text" class="form-control" id="userPhone" name="userPhone" value='+value+'>';
			$(domId).html(html);
		} 
	}
};

/**
 * 清空表单所有输入项
 * @param formId form表单ID
 */
BusinessCode.clearAllInput = function(formId){
	var form = document.getElementById(formId);
	$(':input', form).not(':button, :submit, :reset, :hidden, :disabled').val('').removeAttr('checked').removeAttr('selected');
//	form.submit();
};