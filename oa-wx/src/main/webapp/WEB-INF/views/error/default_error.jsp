<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<title>系统异常！</title>
		<link rel="stylesheet" href="${def}/wx/css/warehouse.css" media="screen" title="no title" charset="utf-8" />
		<link rel="stylesheet" href="${def}/wx/css/wxui.css" media="screen" title="no title" charset="utf-8">
	</head>
	<body>
		<div class="err_bg">
			<div style="padding-top: 70px;">
				<p></p>
			<c:choose>
				<c:when test="${error_title != null}">
					<p class="err_title">${error_title}</p>
				</c:when>
				<c:otherwise>
					<p class="err_msg">温馨提示</p>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${error_tip != null}">
					<p class="err_title">${error_tip}</p>
				</c:when>
				<c:otherwise>
					<p class="err_msg">出问题了。。。</p>
				</c:otherwise>
			</c:choose>
			<p class="err_body">
				<span class="">如需人工帮助，请拨打</span>
				<span class="">15210987135</span>
			</p>
			</div>
		</div>
	</body>
</html>