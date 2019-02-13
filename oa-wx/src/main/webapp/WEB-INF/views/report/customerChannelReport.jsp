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
  	<%pageContext.setAttribute("_textResource", new TextResource()); %>
    <div class="top_bar"><a class="return" onclick="window.location.href = '${ctx}/index'"></a>获客渠道表</div>
    <div class="content_auto">
    <p><p>
    <p>
      <div class="col-md-12">
          <table class="table table-striped">
            <thead>
              <tr>
                <th>城市</th>
                <th>姓名</th>
                <th>毛利</th>
                <th>注册+代帐</th>
                <th>纯注册</th>
                <th>纯代帐</th>
                <th>纯增值</th>
                <th>高端业务</th>
                <th>资质业务</th>
                <th>HR业务</th>
                <th>总订单数</th>
                <th>新增数</th>
                <th>企大师</th>
                <th>企顺宝</th>
                <th>转介绍</th>
                <th>老客户</th>
                <th>电话</th>
                <th>尾款</th>
                <th>渠道商</th>
                <th>机会库</th>
                <th>地推</th>
              </tr>
            </thead>
            <tbody>
            	<c:forEach items="${list }"  var="dto">
            		 <tr>
		                <td>1</td>
		                <td><fmt:formatDate value="${dto.dtoDate }" pattern="yyyy-MM-dd" /></td>
		                <td>${dto.c1 }</td>
		                <td>${dto.c2 }</td>
		                <td>${dto.c3 }</td>
		                <td>${dto.c4 }</td>
		                <td>${dto.c4 }</td>
		                <td>${dto.c5 }</td>
		                <td>${dto.c6 }</td>
		                <td>${dto.c7 }</td>
		                <td>${dto.c8 }</td>
		                <td>${dto.c9 }</td>
		                <td>${dto.c10 }</td>
		                <td>${dto.c11 }</td>
		                <td>${dto.c12 }</td>
		                <td>${dto.c13 }</td>
		                <td>${dto.c14 }</td>
		                <td>${dto.c15 }</td>
		                <td>${dto.c16 }</td>
		                <td>${dto.c17 }</td>
		                <td>${dto.c18 }</td>
		                <td>${dto.c19 }</td>
		                <td>${dto.c20 }</td>
		              </tr>
            	</c:forEach>
            </tbody>
          </table>
        </div>
    </div>
    <script type="text/javascript" src="${def}/app/js/mobiscroller.js"></script>
	<script type="text/javascript" src="${def}/app/js/dateformat.js"></script>
    
  </body>
</html>
