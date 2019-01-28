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
      楼盘信息
    </div>
    <div class="showbox">
      <div class="datatitle">
        <img src="${def}/images/mydata.png" alt="楼盘信息"/>
      </div>
      <div class="mydata">
        <div class="box bottom">
          <p>房产证号 <span>${wfTask.sellerWfUserInfo.sellerCertificateNo }</span></p>
          <p>地址 <span>${wfTask.sellerWfUserInfo.sellerCertificateAdress }</span></p>
          <p>成交额 <span class="emphasize">${wfTask.sellerWfUserInfo.sellerAmount } </span></p>
          <p class="last">解压额 <span class="emphasize">${wfTask.sellerWfUserInfo.sellerSolutionAmount }</span></p>
        </div>
      </div>
    </div>
  </body>
</html>
