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
    <title>中天房管家</title>
    <link rel="stylesheet" href="${def}/wx/css/warehouse.css" media="screen" title="no title" charset="utf-8"/>
    <link rel="stylesheet" href="${def}/wx/css/wxui.css" media="screen" title="no title" charset="utf-8">
  </head>
  <body>
    <div class="topbar">
      <a class="return" onclick="history.go(-1)"></a>
      买房人信息
    </div>
    <div class="showbox">
      <div class="mydata">
        <div class="box">
          <p>姓名 <span>${wfTask.buyerWfUserInfo.nameA }</span></p>
          <p>身份证号 <span>${wfTask.buyerWfUserInfo.idCardA }</span></p>
          <p>手机号 <span>${wfTask.buyerWfUserInfo.phoneA }</span></p>
        </div>
        
        <c:if test="${wfTask.buyerWfUserInfo.nameB != null && wfTask.buyerWfUserInfo.nameB != ''}">
	       	<p class="title">附属买房人信息</p>
	        <div class="box bottom">
	          <p>姓名 <span>${wfTask.buyerWfUserInfo.nameB }</span></p>
	          <p>身份证号 <span>${wfTask.buyerWfUserInfo.idCardB }</span></p>
	        </div>
        </c:if>
      </div>
    </div>
  </body>
</html>
