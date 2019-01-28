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
    <link rel="stylesheet" href="${def}/app/css/warehouse.css" media="screen" title="no title" charset="utf-8"/>
    <link rel="stylesheet" href="${def}/app/css/wxui.css" media="screen" title="no title" charset="utf-8"/>
  </head>
  <body>
    <div class="topbar">
      <a class="return" onclick="history.go(-1)"></a>
      公告
    </div>
    <div class="showbox">
      <div class="project_list">
      
      	<c:forEach items="${notices }" var="item">
      	
      		<div class="list_detail" onclick="getNotice(${item.id });">
	           <h2>${item.title }</h2>
           <%-- <h4>${item.content }</h4> --%>
           <h4><fmt:formatDate value="${item.createTime }" pattern="yyyy.MM.dd HH:mm:ss" /></h4>
	          </div>
	    </c:forEach>
      </div>
    </div>
    <script type="text/javascript">
	    function getNotice(id){
	  		window.location.href= "${ctx}/app/notice/"+id;
	 	  }
    </script>
  </body>
</html>
