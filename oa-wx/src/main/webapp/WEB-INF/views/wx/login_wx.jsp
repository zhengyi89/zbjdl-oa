<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>中天房管家</title>
<link rel="stylesheet" href="${def}/wx/css/warehouse.css" media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" href="${def}/wx/css/wxui.css" media="screen" title="no title" charset="utf-8">
</head>
<body>
	<div class="index_bg">
		<form class="login_form" id="loginForm" action="" method="">
			<div class="input_box">
				<p class="icon_tel"></p>
				<input type="text" id="mobile" name="mobile" placeholder="请输入手机号" />
				<p class="tip none" id="mobileTip"></p>
			</div>
			<div class="input_box yzm">
				<p class="icon_yzm"></p>
				<input type="text" id="code" name="code" placeholder="请输入短信验证码" />
				<input type="button" class="getyzm"
					onclick="toggleTime(this);sendMsg();" value="获取验证码" />
				<p class="tip none" id="codeTip"></p>
			</div>
			<div class="submit">
				<input id="loginSubmit" type="button" value="登   录"
					onclick="this.setAttribute('disabled',true);this.value='登录中…';dologin();" />
			</div>
		</form>
	</div>
	<script src="${ext}/js/zepto.min.js"></script>
	<script type="text/javascript">
	
	
		var countdown = 60;
	    function toggleTime(obj){
	      if(countdown == 0){
	        obj.removeAttribute("disabled");
	        obj.value="获取验证码";
	        countdown = 60;
	        return;
	      }else{
	        console.log(countdown);
	        obj.setAttribute("disabled",true);
	        obj.value=countdown+"s";
	        countdown--;
	      }
	      setTimeout(function(){toggleTime(obj)},1000);
	    }
	    
	    function checkMobile(){
			var mobile=$("#mobile").val();
			cssChange("mobileTip", true, "");
			if(mobile.length==0){
				cssChange("mobileTip", false, "手机号不能为空");
				return false;
			} 
			return true;
		}
		
		function checkCode(){
			var code=$("#code").val();
			cssChange("codeTip", true, "");
			if (code.length==0) {
				cssChange("codeTip", false, "验证码不能为空");
				return false;
			}else if(code.length!=6) {
				cssChange("codeTip", false, "验证码位6位");
				return false;
			}
			return true;
		}
		
		function checkInput(){
			
			if (!checkMobile()) {
				return false;
			}
			if (!checkCode()) {
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
				url : "${ctx}/ajax/login",
				method : "POST",
				async: false,
				data : $("#loginForm").serialize(),
				success : function(data) {
					var status = data.status;
					var error = wxconfig.getTip(status) || data.message;
					//原有逻辑不变
					if ("ok" == status) {
						var callUrl = "${ctx}/bind/success?callback=${param.callback}";
						window.location.href = callUrl;
						return;
					}
					cssChange("codeTip", false, "验证码错误");
					resetLogin();
				},
				error : function() {
					alert("系统异常，请稍后重试");
					resetLogin();
				}
			});
					
		}

		function sendMsg() {
			if (!checkMobile()) {
				return;
			}
			$.ajax({
				url : "${ctx}/msg/send?mobile=" + $("#mobile").val(),
				method : "GET",
				success : function(data) {

				},
				error : function() {
					alert("系统异常，请稍后重试");
				}
			});
		}

		function addErrorBorder(id, error) {
			$("#" + id).addClass("color_red").show().html(error);
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
