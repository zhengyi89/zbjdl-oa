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
<link rel="stylesheet" href="${def}/wx/css/wxui.css" media="screen" title="no title" charset="utf-8">
</head>
<body>
	<div class="index_bg">
		<form class="login_form" id="loginForm" action="" method="">
			<div class="input_box">
				<p class="icon_tel"></p>
					<input type="text" id="userName" name="userName" placeholder="请输入用户名" />
				<p class="tip none" id="userNameTip"></p>
			</div>
			<div class="input_box yzm">
				<p class="icon_yzm"></p>
					<input type="password" id="password" name="password" placeholder="请输入密码" />
				<p class="tip none" id="passwordTip"></p>
			</div>
			<div class="submit">
				<input id="loginSubmit" type="button" value="登   录"
					onclick="this.setAttribute('disabled',true);this.value='激活中…';dologin();" />
			</div>
			<div align="right" style="padding-top: 20px;">
				<a href="${ctx}/user/activate/index">账号激活</a>
			</div>
		</form>
	</div>
	<script src="${ext}/js/zepto.min.js"></script>
	<script type="text/javascript">
	    function checkUserName(){
			var userName=$("#userName").val();
			cssChange("userNameTip", true, "");
			if(userName.length==0){
				cssChange("userNameTip", false, "用户名不能为空");
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
			if (!checkUserName()) {
				return false;
			}
			if (!checkPassword()) {
				return false;
			}
			return true;
		}

		function resetLogin(){
	    	$("#loginSubmit").removeAttr("disabled");
	    	$("#loginSubmit").val("登   录");
	    }
		
		function dologin() {
			if (!checkInput()) {
				resetLogin();
				return;
			}
			$.ajax({
				url : "${ctx}/user/login",
				method : "POST",
				async: false,
				data : $("#loginForm").serialize(),
				success : function(data) {
					var code = data.code;
					var error = data.message;
					console.log('code:'+code);
					//原有逻辑不变
					if ("0000" == code) {
						var callUrl = "${ctx}/bind/success?callback=${param.callback}";
						console.log('url:'+callUrl);
						window.location.href = callUrl;
						//return;
					}
					cssChange("passwordTip", false, "用户名或密码错误");
					resetLogin();
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
