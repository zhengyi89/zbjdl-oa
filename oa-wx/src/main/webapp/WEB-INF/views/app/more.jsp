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
      更多
    </div>
    <div class="showbox">
      <div class="project_list">
        <div class="message" onclick="getUserinfo();">
          <p class="icon bg_5"></p>
          我的资料
        </div>
        <div class="message" onclick="getNotice();">
          <p class="icon bg_6"></p>
          公告
        </div>
        
        <div class="message" onclick="getAbout();">
          <p class="icon bg_6"></p>
          关于
        </div>
        
       <c:if test="${os =='android' || os == 'ios'}">
       	<div class="message" onclick="voice();">
          <p class="icon bg_6"></p>
          开始声连
        </div>
       </c:if>	
        
        <div class="message last" onclick="logout();">
          <p class="icon bg_6"></p>
          注销
        </div>
        
      </div>
    </div>
    <script type="text/javascript" src="${def}/app/js/WebViewJavascriptBridge.js"></script>
    <script type="text/javascript">
	    function getUserinfo(){
	  		window.location.href= "${ctx}/app/userinfo/get";
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
	    
	    function voice(){
	    	if ("${os}"=="ios") {
	    		setupWebViewJavascriptBridge(function(bridge) {
	   				var uniqueId = 1
	   			});
	        	WebViewJavascriptBridge.callHandler('testObjcCallbacka', {'type': '3'}, 
	        			function(response) {log('JS got response', response)});
	    	}
	    	if ("${os}"=="android") {
	    		window.WebViewJavascriptBridge.callHandler(
			            'loginFromWeb'
			            , {"param": {'type':'3'} }
			            , function(responseData) { }
			        ); 
	    	}
	 	  }
    </script>
  </body>
</html>
