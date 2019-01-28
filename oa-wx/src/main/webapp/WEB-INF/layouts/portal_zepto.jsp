<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
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
	<title><sitemesh:write property='title' /></title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="Cache-Control" content="no-cache,must-revalidate" >
	<meta http-equiv="pragma" content="no-cache" >
	<meta http-equiv="expires" content="0" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=device-dpi"/>
	<meta name="format-detection" content="telephone=no, address=no">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
	<script type="text/javascript" src="${ext}/js/wx.js?version=brd0004"></script>
	<script type="text/javascript" src="${ext}/js/wx/wxconfig.js?version=brd0004"></script>
	<script type='text/javascript' src='${def}/js/zepto/zepto.min.js?version=brd0004'></script>
	<script type='text/javascript' src='${def}/js/zepto/fx.js?version=brd0004'></script>
	<script type='text/javascript' src='${ext}/js/zepto/extend/zepto.wx.js?version=brd0004'></script>
	<script type="text/javascript">
		//关闭Ajax-query对应的自动回写方法，因为zepto库不支持部分jquery选择器
		var query_autoFillParams = false;
		//设置全局默认参数
		var ctx = "${ctx}" , def = "${def}" , ext = "${ext}" , doc = document;
		WeixinApi.ready(function(){
			WeixinApi.hideOptionMenu();
		});
	</script>
	<sitemesh:write property='head' />

</head>
<body onload="setDefaultMenu()">
<sitemesh:write property='body' />

<sitemesh:usePage id="thePage"/>
</body>
</html>