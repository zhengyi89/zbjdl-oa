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
    <style type="text/css">
    	.tipCover{position:fixed;top:0px;bottom:0px;left:0px;right:0px;background:#000;opacity:0.6;filter:alpha(opacity=60);z-index:215;}
		.tipMsg{position:fixed;top:40%;left:50%;margin-left:-12rem;margin-top:-6.25rem;width:24rem;background:#fff;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;z-index:216;}
		.tipMsg .title{width:100%;padding-top:2rem;line-height:2.5rem;color:#4c4c4c;font-size:1.75rem;text-align:center;}
		.tipMsg .detail{width:100%;line-height:2.5rem;text-align:center;font-size:1rem;color:#7e7e7e;}
		.tipMsg .detail span{color:#fe7441;}
		.tipMsg .message{width:100%;padding:3rem 1.5rem 0px 1.5rem;line-height:3rem;text-align:center;font-size:1.2rem;color:#7e7e7e;}
		.tipMsg .btnbox{width:100%;padding:1rem 1.5rem;}
		.tipMsg .btnbox input{width:10rem;height:3.5rem;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;}
		.tipMsg .btnbox input.premary{float:left;background:#ebebeb;color:#fe7441;font-size:1.3rem;}
		.tipMsg .btnbox input.normal{float:right;background:#fe7441;color:#fff;font-size:1.3rem;}
		.tipMsg .btnbox input.submit{width:100%;height:3.5rem;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;background:#fe7441;color:#fff;font-size:1.3rem;}
    </style>
    
    <link rel="stylesheet" href="${def}/app/css/warehouse.css" media="screen" title="no title" charset="utf-8"/>
    <link rel="stylesheet" href="${def}/app/css/wxui.css" media="screen" title="no title" charset="utf-8"/>
  </head>
  <body>
    <div class="topbar">
      首页
    </div>
    <div class="showbox">
      <div class="project_list">
      	<c:if test="${!_wxSession.isSuperAdmin }">
      		<div class="message" onclick="window.location.href= '${ctx}/order/add/index';">
	          <p class="icon bg_1"></p>
	          新建订单
	        </div>
	        <div class="message" onclick="window.location.href= '${ctx}/opportunity/add/index';">
	          <p class="icon bg_4"></p>
	          每日商机
	        </div>
      	</c:if>
        
        
        <div class="message" onclick="window.location.href= '${ctx}/order/list';">
          <p class="icon bg_1"></p>
          订单列表
        </div>
        <c:if test="${_wxSession.isAdmin || _wxSession.isSuperAdmin }">
        	<div class="message" onclick="window.location.href= '${ctx}/report/bussAnalyze';">
	          <p class="icon bg_4"></p>
	          商机数表
	        </div>
        </c:if>
        
        <div class="message" onclick="window.location.href= '${ctx}/report/customerChannel';">
          <p class="icon bg_1"></p>
          获客渠道表
        </div>
        
        <c:if test="${_wxSession.isAdmin || _wxSession.isSuperAdmin }">
        	<div class="message" onclick="window.location.href= '${ctx}/report/orderSummary';">
	          <p class="icon bg_1"></p>
	          战报表
	        </div>
        </c:if>
        <c:if test="${_wxSession.isAdmin || _wxSession.isSuperAdmin }">
        	<div class="message" onclick="window.location.href= '${ctx}/report/salePerformance';">
	          <p class="icon bg_1"></p>
	          销售业绩表
	        </div>
        </c:if>
        
       <%--  <div class="message" onclick="window.location.href= '${ctx}/opportunity/list';">
          <p class="icon bg_1"></p>
          销售月表
        </div> --%>
        <c:if test="${_wxSession.isAdmin }">
        	<div class="message" onclick="setTarget();">
	          <p class="icon bg_6"></p>
	          设置业绩目标
	        </div>
        </c:if>
        
        <div class="message" onclick="window.location.href= '${ctx}/user/edit/index';">
          <p class="icon bg_5"></p>
          我的资料
        </div>
       <%--  <div class="message last" onclick="window.location.href= '${ctx}/user/unbind/index';">
          <p class="icon bg_6"></p>
          解绑
        </div> --%>
        
       <%--  <div class="message last" onclick="window.location.href= '${ctx}/user/logout';">
          <p class="icon bg_6"></p>
          退出登录
        </div> --%>
        
       <div id="errBox12" class="vnone">
			<div class="tipCover"></div>
			<div class="tipMsg">
				<p class="message" id="message12">存在未分配业绩目标</p>
				<p class="btnbox">
					<input class="submit" type="button" value="去设置" onclick="setTarget();">
				</p>
			</div>
		</div> 
      </div>
    </div>
    
    <script type="text/javascript">
    	$(function(){
    		if(${_wxSession.isAdmin }){
    			$.ajax({
    				type : 'GET',
    				url : '${pageContext.request.contextPath}/target/hasinit',
    				async: false,
    				success : function(data) {
    					if(data.code=="0000"){
    						//window.location.href= '${ctx}/target/assign/index';
    						$("#errBox12").show();
    					}
    				}
    			});    		
    		}
    		
    	})
    	
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
