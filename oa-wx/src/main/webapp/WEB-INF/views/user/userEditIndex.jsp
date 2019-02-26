<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html>
<head>
<title>大连八戒财税</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/default/css/weui.css" />
<link rel="stylesheet" href="${def}/app/css/warehouse.css" media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" href="${def}/app/css/wxui.css" media="screen" title="no title" charset="utf-8">
<link rel="stylesheet" href="${def}/app/css/mobiscroll.css" media="screen" title="no title" charset="utf-8">
<style type="text/css">
	.submit_input p input {
	    width: 80%;
	    font-size: 1.25rem;
	}
</style>
</head>
<body>
	<div class="topbar">
		 <a class="return" href="javascript:window.history.go(-1);"></a>个人信息 <a class="submit" onclick="javascript:doSubmit();">提交</a>
	</div>
	<form action="${ctx}/user/save" id="form1" method="post">
		<div class="showbox">
		<div class="submit_input">
			<input type="hidden" name="id" id="id" value="${user.id }"/>
			<p>
				工号：<input type="text" placeholder="请填写您的工号" name="jobNo" id="jobNo" value="${user.jobNo }"/>
			</p>
			<p>
				手机号：<input type="text" placeholder="请填写您的手机号" name="mobile" id="mobile" value="${user.mobile }"/>
			</p>
			<p>账号：<span>${user.loginName }</span></p>
			<p>姓名：<span>${user.userName }</span></p>
			<%-- <p>所属大区：<span>${user.region }</span></p> --%>
			<p>城市：<span>${user.city }</span></p>
			<%-- <p>职位：<span>${user.city }</span></p> --%>
		</div>
	</form>
	<script type="text/javascript">
		function doSubmit() {
			var v_jobno = $("input[name='jobNo']").val().replace(/\s+/g,"");
			if (v_jobno == null || v_jobno == "") {
				alert("请输工号");
				return false;
			}
			var v_mobile = $("input[name='mobile']").val().replace(/\s+/g,"");
			if (v_mobile == null || v_mobile == "") {
				alert("请输手机号");
				return false;
			}
			$("#form1").submit();
		}

	</script>
</body>
</html>
