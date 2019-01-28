function task() {
};

var checkForm = null;
function jqueryChecksatge() {
	checkForm = $("#godownForma").validate({ // 为表单绑定校验事件
		onfocus:true,
		rules : {
			"isSpecialBusiness" : {
				required : true
			},
			"businessSource" : {
				required : true
			},
			"salesmanName" : {
				required : true
			},
			"buyerPhoneA" : {
				phone : "phone"
			},
			
			"buyerPhoneB" : {
				phone : "phone"
			},
			"buyerIdCardA" : {
				idCard : "idCard"
			},
			"buyerIdCardB" : {
				idCard : "idCard"
			},
			"nameA" : {
				required : true
			},
			"phoneA" : {
				required : true,
				phone : "phone"
			},
			"phoneB" : {
				phone : "phone"
			},
			"idCardA" : {
				required : true,
				idCard : "idCard"
			},
			"idCardB" : {
				idCard : "idCard"
			},
			"sellerAmount" : {
				required : true,
				rate : "rate"
			},
			"sellerBussinessType" : {
				required : true
			},
			
			"sellerBussinessSub" : {
				busiRate : "busiRate"
			},
			
			"salesmanPhone" : {
				phone : "phone"
			},
			"mediationPhone" : {
				phone : "phone"
			},
			
			"sewf_extend1" : {
				rate : "rate"
			},
			"sewf_extend2" : {
				rate : "rate"
			},
			"wf_extend4" : {
				percent : "percent"
			},
			"wf_extend5" : {
				percent : "percent"
			},
			"guaranteeFeeOther" : {
				percent : "percent"
			},
			"guaranteeType" : {
				required : true,
			},
			"userId" : {
				required : true,
			},
			"userPhone" : {
				phone : "phone",
			},
		},
		messages : {
			isSpecialBusiness : {
				required : "是否特殊业务不能为空",
			},
			businessSource : {
				required : "业务来源不能为空",
			},
			salesmanName : {
				required : "业务员不能为空",
			},
			nameA : {
				required : "卖方姓名A不能为空",
			},
			phoneA : {
				required : "卖方电话A不能为空",
			},
			idCardA : {
				required : "卖方身份证A不能为空",
			},
			sellerSolutionAmount : {
				required : "解押金额不能为空",
			},
			sellerAmount : {
				required : "成交金额不能为空",
			},
			sellerBussinessType : {
				required : "业务品种不能为空",
			},
			guaranteeType : {
				required : "担保费支付方式不能为空",
			},
			userId : {
				required : "指定经办员不能为空",
			},
		},
		errorPlacement : function(error, element) {
			if (element.parent("div").hasClass("input-group")) {
				error.insertAfter(element.parent("div"));
			} else {
				error.appendTo(element.parent("div"));
			}
		}
	});
	jQuery.validator.addMethod("rate", function(value, element) {
		var regexAmount = /^(([1-9]\d*)|0)(\.(\d){1,2})?$/;// 校验金额两位小数
		return this.optional(element) || (regexAmount.test(value));
	}, "金额格式不正确");
	jQuery.validator.addMethod("phone", function(value, element) {
		var myreg = /^1[345678]\d{9}$/; 
		return this.optional(element) || (myreg.test(value));
	}, "手机号格式不正确");
	jQuery.validator.addMethod("idCard", function(value, element) {
		var pattern = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/; 
		return this.optional(element) || (pattern.test(value));
	}, "身份证格式不正确");
	jQuery.validator.addMethod("busiRate", function(value, element) {
		var sellerBussinessType = $("#sellerBussinessType").val();
		if(sellerBussinessType == '1' && (value =='' || value == null)){
			return false;
		}else{
			return true;
		}
	}, "业务细分不能空");
	jQuery.validator.addMethod("percent", function(value, element) {
		var regexAmount = /^\d+(.\d{1,1})?$/;// 校验
		return this.optional(element) || (regexAmount.test(value));
	}, "格式不正确，例：10.1");
};
function submitAdd(domId) {
	jqueryChecksatge();
	if (!checkForm.form()) {
		return false;
	}
	//校验
	var sewf_extend1 = $("#sewf_extend1").val();
	var sewf_extend2 = $("#sewf_extend2").val();
	if(sewf_extend1 == '' && sewf_extend2 == ''){
		alert("当日赎楼解押金额和当日现金解押金额，两项中至少填一项");
		return false;
	}
	
	var wf_extend4 = $("#wf_extend4").val();
	var wf_extend5 = $("#wf_extend5").val();
	if(wf_extend4 == '' && wf_extend5 == ''){
		alert("担保费百分比赎楼和现金百分比至少填一项");
		return false;
	}
	
	var sum = Number(sewf_extend1) + Number(sewf_extend2);
	$("#sellerSolutionAmount").val(sum);
	$('#buttonAdd').attr("disabled","disabled");
	document.getElementById(domId).submit();
}

function submitSellerFileAdd(domId) {
	jqueryCheckSellerFile();
	if (!checkForm.form()) {
		return false;
	}
	$('#buttonAdd').attr("disabled","disabled");
	document.getElementById(domId).submit();
}

function jqueryCheckSellerFile() {
	checkForm = $("#godownForma").validate({ // 为表单绑定校验事件
		onfocus:true,
		rules : {
			"idCardA" : {
				notnull : "notnull",
				image : "image",
				checkLimit : "checkLimit"
			},
			"extend1" : {
				notnull : "notnull",
				image : "image",
				checkLimit : "checkLimit"
			},
			"idCardB" : {
				image : "image",
				checkLimit : "checkLimit"
			},
			"extend2" : {
				image : "image",
				checkLimit : "checkLimit"
			},
			"residence" : {
				notnull : "notnull",
				image : "image",
				checkLimit : "checkLimit"
			},
			"extend3" : {
				notnull : "notnull",
				image : "image",
				checkLimit : "checkLimit"
			},
			"extend4" : {
				notnull : "notnull",
				image : "image",
				checkLimit : "checkLimit"
			},
			"sellerCertificate" : {
				checkLimit : "checkLimit",
				ziprar : "ziprar"
			},
			"sellerBussinessContract" : {
				checkLimit : "checkLimit",
				ziprar : "ziprar"
			},
			"sellerCreditReport" : {
				checkLimit : "checkLimit",
				ziprar : "ziprar"
			},
			"marry" : {
				checkLimit : "checkLimit",
				ziprar : "ziprar"
			},
			"divorce" : {
				checkLimit : "checkLimit",
				ziprar : "ziprar"
			},
			"otherFile" : {
				checkLimit : "checkLimit",
				ziprar : "ziprar"
			},
		},
		messages : {
			
		},
		errorPlacement : function(error, element) {
			if (element.parent("div").hasClass("input-group")) {
				error.insertAfter(element.parent("div"));
			} else {
				error.appendTo(element.parent("a").parent("div"));//.css("color", "red"));
			}
		}
	});
	jQuery.validator.addMethod("ziprar", function(value, element) {
		var arr = new Array();
		arr = value.split(".");
		var photo = arr[arr.length-1];
		var regexAmount = /.+(.ZIP|.zip|.RAR|.rar)$/;// 压缩包格式
		return this.optional(element) || (regexAmount.test(value));
	}, "压缩包格式不正确");
	jQuery.validator.addMethod("image", function(value, element) {
		var arr = new Array();
		arr = value.split(".");
		var photo = arr[arr.length-1];
		var regexAmount = /.+(.JPEG|.jpeg|.JPG|.jpg|.GIF|.gif|.BMP|.bmp|.PNG|.png)$/;// 图片格式
		return this.optional(element) || (regexAmount.test(value));
	}, "图片格式不正确");
	jQuery.validator.addMethod("notnull", function(value, element) {
		if(element.defaultValue != '' || value != ''){
			return true;
		}else{
			return false;
		}
	}, "不能为空");
	jQuery.validator.addMethod("checkLimit", function(value, element) {
		return true;
	}, "上传的附件文件不能超过3M");
};

function submitBuyerFileAdd(domId) {
	jqueryCheckBuyerFile();
	if (!checkForm.form()) {
		return false;
	}
	$('#buttonAdd').attr("disabled","disabled");
	$('#buttonAdd1').attr("disabled","disabled");
	document.getElementById(domId).submit();
}

function jqueryCheckBuyerFile() {
	checkForm = $("#godownForma").validate({ // 为表单绑定校验事件
		onfocus:true,
		rules : {
			"idCardA" : {
				image : "image",
				checkLimit : "checkLimit"
			},
			"extend1" : {
				image : "image",
				checkLimit : "checkLimit"
			},
			"idCardB" : {
				image : "image",
				checkLimit : "checkLimit"
			},
			"extend2" : {
				image : "image",
				checkLimit : "checkLimit"
			},
			"residence" : {
				image : "image",
				checkLimit : "checkLimit"
			},
			"extend3" : {
				image : "image",
				checkLimit : "checkLimit"
			},
			"extend4" : {
				image : "image",
				checkLimit : "checkLimit"
			},
			"marry" : {
				checkLimit : "checkLimit",
				ziprar : "ziprar"
			},
			"divorce" : {
				checkLimit : "checkLimit",
				ziprar : "ziprar"
			},
			"otherFile" : {
				checkLimit : "checkLimit",
				ziprar : "ziprar"
			},
		},
		messages : {
			
		},
		errorPlacement : function(error, element) {
			if (element.parent("div").hasClass("input-group")) {
				error.insertAfter(element.parent("div"));
			} else {
				error.appendTo(element.parent("a").parent("div"));//.css("color", "red"));
			}
		}
	});
	jQuery.validator.addMethod("image", function(value, element) {
		var arr = new Array();
		arr = value.split(".");
		var photo = arr[arr.length-1];
		var regexAmount = /.+(.JPEG|.jpeg|.JPG|.jpg|.GIF|.gif|.BMP|.bmp|.PNG|.png)$/;// 图片格式
		return this.optional(element) || (regexAmount.test(value));
	}, "图片格式不正确");
	jQuery.validator.addMethod("ziprar", function(value, element) {
		var arr = new Array();
		arr = value.split(".");
		var photo = arr[arr.length-1];
		var regexAmount = /.+(.ZIP|.zip|.RAR|.rar)$/;// 压缩包格式
		return this.optional(element) || (regexAmount.test(value));
	}, "压缩包格式不正确");
	jQuery.validator.addMethod("checkLimit", function(value, element) {
		
		return true;
	}, "上传的附件文件不能超过3M");
	jQuery.validator.addMethod("notnull", function(value, element) {
		if(element.defaultValue != '' || value != ''){
			return true;
		}else{
			return false;
		}
	}, "不能为空");
	
};

var isIE = /msie/i.test(navigator.userAgent) && !window.opera; 
var filemaxsize = 1024*3;//3M 
function fileChange(target) {     
    var fileSize = 0;          
    if (isIE && !target.files) {      
      var filePath = target.value;      
      var fileSystem = new ActiveXObject("Scripting.FileSystemObject");         
      var file = fileSystem.GetFile (filePath);      
      fileSize = file.Size;     
    } else {     
     fileSize = target.files[0].size;      
     }    
     var size = fileSize / 1024;     
     if(size>filemaxsize){   
      alert("文件不能大于3M");   
      if(target.outerHTML){
    	  target.outerHTML = target.outerHTML;
      }else{
    	  target.value = "";
      }
        return false;
     }   
}  

function jqueryEditChecksatge() {
	checkForm = $("#godownForma").validate({ // 为表单绑定校验事件
		onfocus:true,
		rules : {
			"buyerPhoneA" : {
				phone : "phone"
			},
			
			"buyerPhoneB" : {
				phone : "phone"
			},
			"buyerIdCardA" : {
				idCard : "idCard"
			},
			"buyerIdCardB" : {
				idCard : "idCard"
			},
			"phoneA" : {
				phone : "phone"
			},
			"phoneB" : {
				phone : "phone"
			},
			"idCardA" : {
				idCard : "idCard"
			},
			"idCardB" : {
				idCard : "idCard"
			},
			"sellerSolutionAmount" : {
				rate : "rate"
			},
			"sellerAmount" : {
				rate : "rate"
			},
			
			"salesmanPhone" : {
				phone : "phone"
			},
			"mediationPhone" : {
				phone : "phone"
			},
		},
		messages : {
			
		},
		errorPlacement : function(error, element) {
			if (element.parent("div").hasClass("input-group")) {
				error.insertAfter(element.parent("div"));
			} else {
				error.appendTo(element.parent("div"));//.css("color", "red"));
			}
		}
	});
	jQuery.validator.addMethod("rate", function(value, element) {
		var regexAmount = /^(([1-9]\d*)|0)(\.(\d){1,2})?$/;// 校验金额两位小数
		return this.optional(element) || (regexAmount.test(value));
	}, "金额格式不正确");
	jQuery.validator.addMethod("phone", function(value, element) {
		var myreg = /^1[345678]\d{9}$/; 
		return this.optional(element) || (myreg.test(value));
	}, "手机号格式不正确");
	jQuery.validator.addMethod("idCard", function(value, element) {
		var pattern = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/; 
		return this.optional(element) || (pattern.test(value));
	}, "身份证格式不正确");
	
};
function submitEdit(domId) {
	jqueryEditChecksatge();
	if (!checkForm.form()) {
		return false;
	}
	//校验
	var sewf_extend1 = $("#sewf_extend1").val();
	var sewf_extend2 = $("#sewf_extend2").val();
	if(sewf_extend1 == '' && sewf_extend2 == ''){
		alert("当日赎楼解押金额和当日现金解押金额，两项中至少填一项");
		return false;
	}
	
	var wf_extend4 = $("#wf_extend4").val();
	var wf_extend5 = $("#wf_extend5").val();
	if(wf_extend4 == '' && wf_extend5 == ''){
		alert("担保费百分比赎楼和现金百分比至少填一项");
		return false;
	}
	
	var sum = Number(sewf_extend1) + Number(sewf_extend2);
	$("#sellerSolutionAmount").val(sum);
	
	$('#buttonAdd').attr("disabled","disabled");
	document.getElementById(domId).action = "saveEditWfTaskInfo";
	document.getElementById(domId).submit();
}

function submitSellerFileEdit(domId) {
	jqueryCheckEditSellerFile();
	if (!checkForm.form()) {
		return false;
	}
	$('#buttonAdd').attr("disabled","disabled");
	document.getElementById(domId).action = "saveEditSellerFile";
	document.getElementById(domId).submit();
}

function jqueryCheckEditSellerFile() {
	checkForm = $("#godownForma").validate({ // 为表单绑定校验事件
		onfocus:true,
		rules : {
			"idCardB" : {
				image : "image",
				checkLimit : "checkLimit"
			},
			"extend2" : {
				image : "image",
				checkLimit : "checkLimit"
			},
			"sellerCertificate" : {
				checkLimit : "checkLimit",
				ziprar : "ziprar"
			},
			"sellerBussinessContract" : {
				checkLimit : "checkLimit",
				ziprar : "ziprar"
			},
			"sellerCreditReport" : {
				checkLimit : "checkLimit",
				ziprar : "ziprar"
			},
			"marry" : {
				checkLimit : "checkLimit",
				ziprar : "ziprar"
			},
			"divorce" : {
				checkLimit : "checkLimit",
				ziprar : "ziprar"
			},
			"otherFile" : {
				checkLimit : "checkLimit",
				ziprar : "ziprar"
			},
		},
		messages : {
			
		},
		errorPlacement : function(error, element) {
			if (element.parent("div").hasClass("input-group")) {
				error.insertAfter(element.parent("div"));
			} else {
				error.appendTo(element.parent("a").parent("div"));//.css("color", "red"));
			}
		}
	});
	jQuery.validator.addMethod("ziprar", function(value, element) {
		var arr = new Array();
		arr = value.split(".");
		var photo = arr[arr.length-1];
		var regexAmount = /.+(.ZIP|.zip|.RAR|.rar)$/;// 压缩包格式
		return this.optional(element) || (regexAmount.test(value));
	}, "压缩包格式不正确");
	jQuery.validator.addMethod("image", function(value, element) {
		var arr = new Array();
		arr = value.split(".");
		var photo = arr[arr.length-1];
		var regexAmount = /.+(.JPEG|.jpeg|.JPG|.jpg|.GIF|.gif|.BMP|.bmp|.PNG|.png)$/;// 图片格式
		return this.optional(element) || (regexAmount.test(value));
	}, "图片格式不正确");
	jQuery.validator.addMethod("notnull", function(value, element) {
		if(element.defaultValue != '' || value != ''){
			return true;
		}else{
			return false;
		}
	}, "不能为空");
	jQuery.validator.addMethod("checkLimit", function(value, element) {
		
		return true;
	}, "上传的附件文件不能超过3M");
};

function saveEditBuyerFileAdd(domId) {
	jqueryCheckEditBuyerFile();
	if (!checkForm.form()) {
		return false;
	}
	$('#buttonAdd').attr("disabled","disabled");
	document.getElementById(domId).action = "saveEditBuyerFile";
	document.getElementById(domId).submit();
}

function jqueryCheckEditBuyerFile() {
	checkForm = $("#godownForma").validate({ // 为表单绑定校验事件
		onfocus:true,
		rules : {
			"idCardA" : {
				image : "image",
				checkLimit : "checkLimit"
			},
			"extend1" : {
				image : "image",
				checkLimit : "checkLimit"
			},
			"idCardB" : {
				image : "image",
				checkLimit : "checkLimit"
			},
			"extend2" : {
				image : "image",
				checkLimit : "checkLimit"
			},
			"residence" : {
				image : "image",
				checkLimit : "checkLimit"
			},
			"extend3" : {
				image : "image",
				checkLimit : "checkLimit"
			},
			"extend4" : {
				image : "image",
				checkLimit : "checkLimit"
			},
			"marry" : {
				checkLimit : "checkLimit",
				ziprar : "ziprar"
			},
			"divorce" : {
				checkLimit : "checkLimit",
				ziprar : "ziprar"
			},
			"otherFile" : {
				checkLimit : "checkLimit",
				ziprar : "ziprar"
			},
		},
		messages : {
			
		},
		errorPlacement : function(error, element) {
			if (element.parent("div").hasClass("input-group")) {
				error.insertAfter(element.parent("div"));
			} else {
				error.appendTo(element.parent("a").parent("div"));//.css("color", "red"));
			}
		}
	});
	jQuery.validator.addMethod("image", function(value, element) {
		var arr = new Array();
		arr = value.split(".");
		var photo = arr[arr.length-1];
		var regexAmount = /.+(.JPEG|.jpeg|.JPG|.jpg|.GIF|.gif|.BMP|.bmp|.PNG|.png)$/;// 图片格式
		return this.optional(element) || (regexAmount.test(value));
	}, "图片格式不正确");
	jQuery.validator.addMethod("ziprar", function(value, element) {
		var arr = new Array();
		arr = value.split(".");
		var photo = arr[arr.length-1];
		var regexAmount = /.+(.ZIP|.zip|.RAR|.rar)$/;// 压缩包格式
		return this.optional(element) || (regexAmount.test(value));
	}, "压缩包格式不正确");
	jQuery.validator.addMethod("checkLimit", function(value, element) {
		return true;
	}, "上传的附件文件不能超过3M");
	jQuery.validator.addMethod("notnull", function(value, element) {
		if(element.defaultValue != '' || value != ''){
			return true;
		}else{
			return false;
		}
	}, "不能为空");
	
};

function addAmount (value){
	var sewf_extend1 = $("#sewf_extend1").val();
	var sewf_extend2 = $("#sewf_extend2").val();
	var sum = Number(sewf_extend1) + Number(sewf_extend2);
	if(!isNaN(sum) && sum != undefined){
		$("#sellerSolutionAmount_temp").val(sum);
	}
}