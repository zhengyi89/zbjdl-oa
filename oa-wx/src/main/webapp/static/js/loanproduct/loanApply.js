function loanApply() {
};

/**
 * 进入申请页面
 */
function toApply(){
	var type = $("#type").val();
	var merchant = $("#merchant").val();
	window.location = contextPath + "/product/toAdd?type="+type+"&merchant="+merchant;
}

/**
 * 进入每个产品的详细信息页面
 * @param type
 */
function toProduct(type){
	var merchant = $("#merchant").val();
	window.location = contextPath + "/product/productInfoIndex?type="+type+"&merchant="+merchant;
}

/**
 * 返回
 */
function goback() {
	var merchant = $("#merchant").val();
	window.location = contextPath + "/product/index?merchant="+merchant;
};

/**
 * 提交数据
 */
function doSubmit() {
	
	if(!checkData()){
		return;
	}
	//提交
	document.getElementById("godownForma").submit();
};

function checkData(){
	//姓名
	var userName= $("#userName").val();
	if(userName.length==0){
		showError('userName','null');
		return false;
	}
	
	//手机号
	var mobilePhone = $("#mobilePhone").val();
	if(mobilePhone.length==0){
		showError('mobilePhone','null');
		return false;
	}
	var phoneReg = /^1[3-9]\d{9}$/;
	if (!phoneReg.test(mobilePhone)) {
		showError('mobilePhone','reg');
		return false;
	}
	
	//性别
	var sex = $("#sex").val();
	if(sex.length==0){
		showError('sex','null');
		return false;
	}

	//婚姻状况
	var marriage = $("#marriage").val();
	if(marriage.length==0){
		showError('marriage','null');
		return false;
	}
	
	//所在区域
	var provinceCode = $("#provinceCode").val();
	if(provinceCode.length==0){
		showError('provinceCode','null');
		return false;
	}
	var cityCode = $("#cityCode").val();
	if(cityCode.length==0){
		showError('cityCode','null');
		return false;
	}
	
	//贷款金额
	var payAmount = $("#payAmount").val();
	if(payAmount.length==0){
		showError('payAmount','null');
		return false;
	}
	if(!checkAmount(payAmount)){
		return false;
	}
	
	//贷款期限
	var loanLimit = $("#loanLimit").val();
	if(loanLimit.length==0){
		showError('loanLimit','null');
		return false;
	}
	
	//贷款用途
	var loanPurpose = $("#loanPurpose").val();
	if(loanPurpose.length==0){
		showError('loanPurpose','null');
		return false;
	}
	
	//是否有本地房产
	var localHouse = $("#localHouse").val();
	if(localHouse.length==0){
		showError('localHouse','null');
		return false;
	}
	/*
	//房产类型
	var type = $("#type").val();
	if(type != 'weixinMortgage'){
		var houseType = $("#houseType").val();
		if(houseType.length==0){
			showError('houseType','null');
			return false;
		}
		
		//楼盘地址
		var houseAddress = $("#houseAddress").val();
		if(houseAddress.length==0){
			showError('houseAddress','null');
			return false;
		}
		
		//房屋面积
		var houseArea = $("#houseArea").val();
		if(houseArea.length==0){
			showError('houseArea','null');
			return false;
		}
	}
	*/
	return true;
}

function showError(strName, type){
	var str1 = '#'+ strName;
	var str2 = '#'+ strName + '_div_' + type;
	$(str2).show().on('click', function() {
		$(str2).off('click').hide();
	});
	$(str1).on('click', function() {
		$(str2).off('click').hide();
	});
}

function checkAmount(value){
	var regexAmount = /^\d{0,8}\.{0,1}(\d{1,2})?$/;
	if(Number(value) > Number(9999.99)){
		showError('payAmount', 'greater');
		return false;
	}
	if(!regexAmount.test(value)){
		showError('payAmount', 'reg');
		return false;
	}
	return true;
}

function checkPhone(value){
	var regexAmount = /^1[3-9]\d{9}$/;
	if(!regexAmount.test(value)){
		showError('mobilePhone', 'reg');
		return false;
	}
}

/** 城市级联js **/

var cityData = new Array();
/** 初始化数据 **/
function DataInit(superCityCode, cityLevel){
	$.ajax({
		type : "post",
		url: contextPath+'/product/getCityData',  
		data : {superCityCode : superCityCode,
			cityLevel : cityLevel
		},
		dataType : "json",
        async : false,
		success : function(data) {
			cityData = data;
		},
		error :
			function(data) {
		}
	});
}

/** 获取省份列表 **/
function getProvince(){
	var html = '<option selected="selected" value=""></option>';
	DataInit("00","2");
	for(var j = 0;j < cityData.length;j ++){
		html += "<option value=" + cityData[j][0] + ">" + cityData[j][1] + "</option>";
	}
	
	$(document.getElementById("provinceCode")).append(html);
}

/** 根据选择的省份获取城市列表 **/
function getCity(data){
	var html = '<option selected="selected" value=""></option>';
	cityData = new Array();
	if(data.length!=0){
		DataInit(data,"3");
	}
	var cityList = document.getElementById("cityCode");
	cityList.options.length = 0;
	for(var j = 0;j < cityData.length;j ++){
		html += "<option value=" + cityData[j][0] + " >" + cityData[j][1] + "</option>";
	}
	$(document.getElementById("cityCode")).append(html);
}

/** 城市级联js **/