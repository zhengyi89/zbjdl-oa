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
	</head>
	<body>
		<div class="wp_100 pt20 pb20 mt15 bg_white bt_gray_1 bb_gray_1 clearfix">
			<c:choose>
				<c:when test="${error_title != null}">
					<p class="cdd_fail bc f18 color_red tc">${error_title}</p>
				</c:when>
				<c:otherwise>
					<p class="cdd_fail bc f18 color_red tr">温馨提示</p>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${error_tip != null}">
					<p class="wp_s3 pb20 bc mt10 bb_gray_1 color_gray_2 f15 tc">${error_tip}</p>
				</c:when>
				<c:otherwise>
					<p class="wp_s3 pb20 bc mt10 bb_gray_1 color_gray_2 f15 tc">出问题了。。。</p>
				</c:otherwise>
			</c:choose>
			<p class="chongzhi_tel bc mt15 clearfix">
				<span class="fl color_gray_3">如需人工帮助，请拨打</span>
				<span class="fr f15 color_orange">010-6542 2684</span>
			</p>
		</div>
	</body>
</html>