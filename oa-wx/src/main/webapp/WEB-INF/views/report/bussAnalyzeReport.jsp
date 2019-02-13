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
    <div class="top_bar"><a class="return" onclick="window.location.href = '${ctx}/index'"></a>商机列表</div>
    <div class="content_auto">
    <p><p>
    <p>
      <div class="col-md-12">
          <table class="table table-striped">
            <thead>
              <tr>
                <th>城市</th>
                <th>姓名</th>
                <th>日领取商机数</th>
                <th>日成交商机数</th>
                <th>月累计领取商机数</th>
                <th>月累计成交商机数</th>
                <th>月累计成交百分比</th>
                <th>日领取商机数</th>
                <th>日成交商机数</th>
                <th>月累计领取商机数</th>
                <th>月累计成交商机数</th>
                <th>月累计成交百分比</th>
                <th>日领取商机数</th>
                <th>日成交商机数</th>
                <th>月累计领取商机数</th>
                <th>月累计成交商机数</th>
                <th>月累计成交百分比</th>
              </tr>
            </thead>
            <tbody>
            	<c:forEach items="${list }"  var="dto">
            		 <tr>
		                <td>${dto.city }</td>
		                <td>${dto.userName }</td>
		                <td>${dto.dayOpp1 }</td>
		                <td>${dto.bossDay }</td>
		                <td>${dto.monthOpp1 }</td>
		                <td>${dto.bossMonth }</td>
		                <td>${dto.bossMonth/dto.monthOpp1 }</td>
		                <td>${dto.dayOpp2 }</td>
		                <td>${dto.qdsDay }</td>
		                <td>${dto.monthOpp2 }</td>
		                <td>${dto.qdsMonth }</td>
		                <td>${dto.qdsMonth/dto.monthOpp2 }</td>
		                <td>${dto.dayOpp3 }</td>
		                <td>${dto.qsbDay }</td>
		                <td>${dto.monthOpp3 }</td>
		                <td>${dto.qsbMonth }</td>
		                <td>${dto.qsbMonth/dto.monthOpp3 }</td>
		              </tr>
            	</c:forEach>
            </tbody>
          </table>
        </div>
    </div>
  </body>
</html>
