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
    <link rel="stylesheet" href="${def}/app/css/wxui.css" media="screen" title="no title" charset="utf-8">
  </head>
  <body>
    <div class="topbar">
      <a class="return" onclick="history.go(-1)"></a>
      项目审批
    </div>
    <div class="showbox">
      <div class="project_detail">
        <p class="emphasize">需要审核的内容</p>
        <p>1、买卖房人信息真实完整</p>
        <p>2、房屋信息真实，完整</p>
        <p>3、房产证复印件是否已添加并无误</p>
      </div>
      <div class="submit_text">
        <textarea name="name" rows="8" cols="40" placeholder="请输入处理意见或备注"/></textarea>
      </div>
      <div class="submit_box">
        <p class="primary"><input type="button" name="name" value="不通过" onclick="handlingFlow(${taskId }, 0);"></p>
        <p class="submit"><input type="button" name="name" value="通过" onclick="handlingFlow(${taskId }, 1);"></p>
      </div>
    </div>
    <script type="text/javascript">
	    function handlingFlow(id, approve){
			window.location.href= "${ctx}/app/flow/list/"+id+"/"+approve;
		}
	      
    </script>
  </body>
</html>
