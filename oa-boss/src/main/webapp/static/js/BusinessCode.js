function BusinessCode() {
};

var codeData;
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
//	alert(selectValue+'---------'+defaultValue);
	commonKey = configKey;
	var html = '<option value=""></option>';
	$.ajax({
		async : false,
		url : "/account-boss/bussinessCode/codeIndex",
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
			url : "/account-boss/bussinessCode/codeIndex",
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



/**
 * 清空表单所有输入项
 * @param formId form表单ID
 */
BusinessCode.clearAllInput = function(formId){
	var form = document.getElementById(formId);
	$(':input', form).not(':button, :submit, :reset, :hidden, :disabled').val('').removeAttr('checked').removeAttr('selected');
//	form.submit();
};