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
    <title>大连八戒财税</title>
    <link rel="stylesheet" href="${def}/app/css/warehouse.css" media="screen" title="no title" charset="utf-8"/>
    <link rel="stylesheet" href="${def}/app/css/wxui.css" media="screen" title="no title" charset="utf-8">
  </head>
  <body>
    <div class="topbar">
      <a class="return" onclick="history.go(-1)"></a>
      卖房人信息
    </div>
    <div class="showbox">
      <div class="mydata">
        <div class="box">
          <p>姓名 <span>${wfTask.sellerWfUserInfo.nameA }</span></p>
          <p>身份证号 <span>${wfTask.sellerWfUserInfo.idCardA }</span></p>
          <p>手机号 <span>${wfTask.sellerWfUserInfo.phoneA }</span></p>
        </div>
        
        <c:if test="${wfTask.sellerWfUserInfo.nameB != ''}">
        	<p class="title">附属卖房人信息</p>
	        <div class="box bottom">
	          <p>姓名 <span>${wfTask.sellerWfUserInfo.nameB }</span></p>
	          <p>身份证号 <span>${wfTask.sellerWfUserInfo.idCardB }</span></p>
	        </div>
        </c:if>
      </div>
    </div>
  </body>
</html>
