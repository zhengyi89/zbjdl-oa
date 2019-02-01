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
    <link rel="stylesheet" href="${def}/app/css/wxui.css" media="screen" title="no title" charset="utf-8"/>
  </head>
  <body>
    <div class="topbar">
      首页
    </div>
    <div class="showbox">
      <div class="project_list">
        <div class="message" onclick="window.location.href= '${ctx}/order/add/index';">
          <p class="icon bg_5"></p>
          每日订单
        </div>
        <div class="message" onclick="window.location.href= '${ctx}/opportunity/add/index';">
          <p class="icon bg_5"></p>
          每日商机
        </div>
        <div class="message" onclick="window.location.href= '${ctx}/order/list';">
          <p class="icon bg_6"></p>
          订单汇总
        </div>
        <div class="message" onclick="window.location.href= '${ctx}/opportunity/list';">
          <p class="icon bg_6"></p>
          商机数表
        </div>
        <div class="message" onclick="window.location.href= '${ctx}/opportunity/list';">
          <p class="icon bg_6"></p>
          获客渠道表
        </div>
        <div class="message" onclick="window.location.href= '${ctx}/opportunity/list';">
          <p class="icon bg_6"></p>
          战报表
        </div>
        <div class="message" onclick="window.location.href= '${ctx}/opportunity/list';">
          <p class="icon bg_6"></p>
          销售月表
        </div>
        <div class="message" onclick="getUserinfo();">
          <p class="icon bg_6"></p>
          我的资料
        </div>
        <div class="message" onclick="getAbout();">
          <p class="icon bg_6"></p>
          关于
        </div>
        <div class="message last" onclick="logout();">
          <p class="icon bg_6"></p>
          注销
        </div>
        
      </div>
    </div>
    <script type="text/javascript" src="${def}/app/js/WebViewJavascriptBridge.js"></script>
    <script type="text/javascript">
	    function getUserinfo(){
	  		window.location.href= "${ctx}/user/edit/index";
	 	  }
	    
	    function getAbout(){
	  		window.location.href= "${ctx}/app/about";
	 	  }
	    
	    function logout(){
	  		window.location.href= "${ctx}/app/logout";
	 	  }
	    
	    function getNotice(){
	  		window.location.href= "${ctx}/app/notice";
	 	  }
	    
    </script>
  </body>
</html>
