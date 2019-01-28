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
      <p id="list_11" name="projectList">项目列表</p>
    </div>
    
    <div class="showbox">
      <div id="list_12" name="projectDetail" class="mylist checked" >
      	<c:forEach items="${wfTaskList}" var="item">
      	  <div class="list_detail" onclick="flowDetails(${item.wfTaskInfo.id }, ${item.type });">
           <h2>业务编号：${item.wfTaskInfo.taskNo }</h2>
           <h4>经办员：${item.wfTaskInfo.userName }</h4>
           <h4>正在进行：<span class="emphasize">${item.wfTaskInfo.approvalStep }</span>
           <span class="blank_2r"></span>跟进人：${item.wfTaskInfo.mediationName }</h4>
          </div>
	    </c:forEach>
      </div>
    </div>
    <script type="text/javascript">
      
      function flowDetails(id, type){
  		window.location.href= "${ctx}/app/flow/details/"+id+"/"+type;
 	  }
    </script>
  </body>
</html>
