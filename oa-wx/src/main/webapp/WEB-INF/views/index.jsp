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
    <%-- <link rel="stylesheet" href="${def }/css/dxeui.css?version=1.5.0" media="screen" title="no title" charset="utf-8"/> --%>
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
          <p class="icon bg_1"></p>
          新建订单
        </div>
        <div class="message" onclick="window.location.href= '${ctx}/opportunity/add/index';">
          <p class="icon bg_4"></p>
          每日商机
        </div>
        <div class="message" onclick="window.location.href= '${ctx}/order/list';">
          <p class="icon bg_1"></p>
          订单列表
        </div>
        <div class="message" onclick="window.location.href= '${ctx}/report/bussAnalyze';">
          <p class="icon bg_4"></p>
          商机数表
        </div>
        <div class="message" onclick="window.location.href= '${ctx}/report/customerChannel';">
          <p class="icon bg_1"></p>
          获客渠道表
        </div>
        <div class="message" onclick="window.location.href= '${ctx}/report/orderSummary';">
          <p class="icon bg_1"></p>
          战报表
        </div>
        <div class="message" onclick="window.location.href= '${ctx}/opportunity/list';">
          <p class="icon bg_1"></p>
          销售月表
        </div>
        <c:if test="${_wxSession.isAdmin }">
        	<div class="message" onclick="setTarget();">
	          <p class="icon bg_6"></p>
	          设置业绩目标
	        </div>
        </c:if>
        
        <div class="message" onclick="window.location.href= '${ctx}/user/info';">
          <p class="icon bg_5"></p>
          我的资料
        </div>
       <%--  <div class="message last" onclick="window.location.href= '${ctx}/user/unbind/index';">
          <p class="icon bg_6"></p>
          解绑
        </div> --%>
        
        <div class="message last" onclick="window.location.href= '${ctx}/user/logout';">
          <p class="icon bg_6"></p>
          退出登录
        </div>
        
      </div>
    </div>
    <script type="text/javascript" src="${def}/app/js/WebViewJavascriptBridge.js"></script>
    <script type="text/javascript">
    	function setTarget(){
    		$.ajax({
				type : 'GET',
				url : '${pageContext.request.contextPath}/target/init',
				async: false,
				success : function(data) {
					window.location.href= '${ctx}/target/assign/index';
				}
			});
  			
 	  	}
    </script>
  </body>
</html>
