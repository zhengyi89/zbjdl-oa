<%@page import="com.zbjdl.common.utils.config.TextResource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
  <head>
    <title>大连八戒财税</title>
   <%--  <%@ include file="/common/taglibs.jsp"%> --%>
   <link rel="stylesheet" href="${def }/css/dxeui.css?version=1.5.0" media="screen" title="no title" charset="utf-8"/>
	<link href="${def }/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="${def }/css/bootstrap-theme.min.css" rel="stylesheet">
  </head>
  <body>
    <div class="top_bar"><a class="return"></a>订单列表</div>
    <div class="content_auto">
    <p><p>
    <p>
      <div class="col-md-12">
          <table class="table table-striped">
            <thead>
              <tr>
                <th>城市</th>
                <th>日业绩</th>
                <th>月业绩</th>
                <th>目标业绩</th>
                <th>未完成业绩</th>
                <th>完成率</th>
              </tr>
            </thead>
            <tbody>
            	<c:forEach items="${list }"  var="dto">
            		 <tr>
		                <td>${dto.city }</td>
		                <td>${dto.dayAmount }</td>
		                <td>${dto.monthAmount }</td>
		                <td>${dto.targetAmount }</td>
		                <td>${dto.unsellAmount }</td>
		                <td>${dto.finishRate }</td>
		              </tr>
            	</c:forEach>
            </tbody>
          </table>
        </div>
    </div>
  </body>
</html>
