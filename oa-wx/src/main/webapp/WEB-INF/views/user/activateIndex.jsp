<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>大连八戒财税</title>
<link rel="stylesheet" href="${def}/wx/css/warehouse.css" media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" href="${def}/css/wxui.css" media="screen" title="no title" charset="utf-8">


</head>
<body>
	<div class="index_bg">
		<form class="login_form" id="loginForm" action="" method="">
			<h1 align="center" style="padding-bottom: 20px">账号激活</h1>
			<div class="input_box">
				<p class="icon_tel"></p>
					<input type="text" id="loginName" name="loginName" placeholder="boss系统用户名" />
				<p class="tip none" id="loginNameTip"></p>
			</div>
			<div class="input_box yzm">
				<p class="icon_yzm"></p>
					<input type="password" id="password" name="password" placeholder="请输入密码" />
				<p class="tip none" id="passwordTip"></p>
			</div>
			<div class="submit">
				<input id="loginSubmit" type="button" value="激   活"
					onclick="this.setAttribute('disabled',true);this.value='激活中…';dologin();" />
			</div>
			<div align="right" style="padding-top: 20px;">
				<a href="${ctx}/user/login/index">去登录</a>
			</div>
		</form>
	</div>
	<script src="${ext}/js/zepto.min.js"></script>
	<script type="text/javascript">
	    function checkloginName(){
			var loginName=$("#loginName").val();
			cssChange("loginNameTip", true, "");
			if(loginName.length==0){
				cssChange("loginNameTip", false, "用户名不能为空");
				return false;
			} 
			return true;
		}
		
		function checkPassword(){
			var password=$("#password").val();
			cssChange("passwordTip", true, "");
			if (password.length==0) {
				cssChange("passwordTip", false, "密码不能为空");
				return false;
			}
			return true;
		}
		
		function checkInput(){
			if (!checkloginName()) {
				return false;
			}
			if (!checkPassword()) {
				return false;
			}
			return true;
		}

		function resetLogin(){
	    	$("#loginSubmit").removeAttr("disabled");
	    	$("#loginSubmit").val("激   活");
	    }
		
		function dologin() {
			if (!checkInput()) {
				resetLogin();
				return;
			}
			$.ajax({
				url : "${ctx}/user/activate",
				method : "POST",
				async: true,
				data : $("#loginForm").serialize(),
				success : function(data) {
					console.log(data.code+"---"+data.msg);
					var error = wxconfig.getTip(status) || data.msg;
					//原有逻辑不变
					if ("0000" == data.code) {
						window.location.href = "${ctx}/user/edit/index";
						return;
					}else{
						alert(data.msg);
						resetLogin();
					}
					
				},
				error : function() {
					alert("系统异常，请稍后重试");
					resetLogin();
				}
			});
					
		}

		function cssChange(inputId, type, message) {
			if (type == false) {
				$("#" + inputId).html(message).attr("class", "tip err");
			} else {
				$("#" + inputId).html("").attr("class", "tip none");
			}
		}
	</script>
</body>
</html>
