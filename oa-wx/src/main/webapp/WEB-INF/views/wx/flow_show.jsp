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
<% int i = 1; %>
<!DOCTYPE html>
<html>
  <head>
    <title>中天房管家</title>
    <link rel="stylesheet" href="${def}/wx/css/warehouse.css" media="screen" title="no title" charset="utf-8"/>
    <link rel="stylesheet" href="${def}/wx/css/wxui.css" media="screen" title="no title" charset="utf-8">
  </head>
  <body>
	<div class="topbar">
		<a class="return" onclick="history.go(-1)"></a> 进度列表
	</div>
	<div class="showbox">
      <div class="schedule">
        <div class="head_portrait"></div>
        <h2>${userName }</h2>
        <h4>您是：${role }</h4>
      </div>
      <div class="schedule_list">
        <p class="title">当前流程进度：<span class="emphasize">${wfTask.wfTaskInfo.approvalStep }</span></p>
        <c:forEach items="${wfTaskList}" var="item">
        	<%if(i==1){ %>
        	 <%-- <c:if test="${item.suggestion == '' || item.suggestion == null}"> --%>
        		<div class="step">
		          <div class="state">
		            <p class="date"><fmt:formatDate value="${item.handelDate }" pattern="yyyy.MM.dd" /></p>
		            <p>（${item.status }）</p>
		          </div>
		          <div class="number"><%=i++ %></div>
		          <div class="text">
		            <h2>${item.approvalNode }</h2>
		          </div>
		        </div>
		     <%} else { %>
        	<%-- </c:if> --%>
        	<%--<c:if test="${item.suggestion != '' && item.suggestion != null}"> --%>
        		<div class="step">
		          <div class="state">（${item.status }）</div>
		          <div class="number"><%=i++ %></div>
		          <div class="text checked">
		            <h2>${item.approvalNode }</h2>
		            <h4>操作人：${item.userName }</h4>
		            <h4>时间：<fmt:formatDate value="${item.handelDate }" pattern="yyyy.MM.dd" /></h4>
		            <h4>审批意见：${item.suggestion }</h4>
		          </div>
		        </div>
		        <%} %>
        	<%-- </c:if> --%>
        </c:forEach>
        
        <%if(i>=16){%>
        	<div class="step end">
        		<div class="state">（完结）</div>
	          	<div class="number"></div>
	        </div>
        <% } %>
      </div>
    </div>
  </body>
</html>
