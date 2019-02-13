function checkMobile(str) {
	var re = /^1[3|4|5|7|8]\d{9}$/;
	if (re.test(str)) {
		return true;
	} else {
		return false;
	}
}
function checkPwd(str) {
	var re = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$/;
	if (re.test(str)) {
		return true;
	} else {
		return false;
	}
}

function go_page(page) {
	window.location.href = page;
}

// 借款
function index(ctx) {
	window.location.href = ctx + "/index";
}

// 还款，目前写的是 借款记录的url，需要替换成 还款的url
function repay(ctx){
	window.location.href = ctx + "/product/index";
}

// 发现
function discovry(ctx) {
	window.location.href = ctx + "/discovry/index";
}

// 我的
function home(ctx) {
	window.location.href = ctx + "/member/home";
}

function do_submit() {
	$("#submit_btn").attr("disabled", true);
	$("#submit_btn").css("background", "#fead82");
	setTimeout(submit, 300);
}

function reset_button() {
	$("#submit_btn").removeAttr("disabled");
	$("#submit_btn").css("background", "#fe703b");
}

function JTrim(s) {
	return s.replace(/(^\s*)|(\s*$)/g, "");
}
function showError(message){
	$('#error').html(message);
	$("#loginLoading").css("display","block");
	$('#loginLoading').find('.tiperrorCover').css("left","50%");
	$('#loginLoading').find('.tiperrorMsg').css("left","50%");
    setTimeout(hideErrorAll,2000);
}
function hideErrorAll(){
	$('#loginLoading').css('display','none');
	$('#loginLoading').find('.tiperrorCover').css("left","-10000px");
	$('#loginLoading').find('.tiperrorMsg').css("left","-10000px");
}

//数秒
var countdown = 90;
function toggleTime(obj){
	if(countdown == 0){
	     obj.removeAttribute("disabled");
	     obj.style.backgroundColor="#fe7441";
	     obj.value="获取验证码";
	     countdown = 90;
	     return;
	}else{
	    obj.setAttribute("disabled",true);
	    obj.style.backgroundColor="#d6d6d6";
	    obj.value=countdown+"s";
	    countdown--;
	}
	setTimeout(function(){toggleTime(obj)},1000);
}
