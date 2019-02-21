<%@page import="com.zbjdl.common.utils.config.TextResource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
  <head>
    <title>大连八戒财税</title>
   	<style type="text/css">
	   .datecss {
		    position: absolute;
		    top: 0px;
		    right: 0px;
		    display: block;
		    width: 10rem;
		    height: 4rem;
		    background-size: 100%;
		}
		
		.table>thead>tr>th {
			    vertical-align: middle;
			    text-align: center;
			    /* border-bottom: 100px; */
			    border-left: 2px;
			    border: 1px;
		}
	</style>   
   <link rel="stylesheet" href="${def }/css/dxeui.css?version=1.5.0" media="screen" title="no title" charset="utf-8"/>
   <link rel="stylesheet" href="${def }/css/iosSelect.css?version=1.5.0" media="screen" title="no title">
	<link rel="stylesheet" href="${def }/css/animate.min.css?version=1.5.0" media="screen" title="no title">
	<link rel="stylesheet" href="${def }/css/hashChange.css?version=1.5.0" media="screen" title="no title">
	<link rel="stylesheet" href="${def}/app/css/warehouse.css" media="screen" title="no title" charset="utf-8" />
	<link rel="stylesheet" href="${def}/app/css/wxui.css" media="screen" title="no title" charset="utf-8">
	<link rel="stylesheet" href="${def}/app/css/mobiscroll.css" media="screen" title="no title" charset="utf-8">
	<link href="${def }/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="${def }/css/bootstrap-theme.min.css" rel="stylesheet">
  </head>
  <body>
    <div class="top_bar"><a class="return" onclick="window.location.href = '${ctx}/index'"></a>商机列表
    </div>
    <div class="content_auto">
    <p><p>
    <p>
      <div class="col-md-12">
          <table class="table table-bordered">
            <tbody>
            	<c:forEach items="${list }"  var="dto" varStatus="index">
            		<%-- <c:if test="${dto.value =='总计'}"><tr style="background-color: #ffc800b8;"></c:if>
            		<c:if test="${dto.value.c2 !='总计' }"><tr></c:if> --%>
            		<c:if test="${index.count == 1 }">
            			<tr style="background-color: #fe9941;">
            		</c:if>
            		<c:if test="${index.count > 1  && dto.value[1]!='总计'}">
            			<tr>
            		</c:if>
            		<c:if test="${index.count > 1 && dto.value[1]=='总计'}">
            			<tr style="background-color: #ffc800b8;">
            		</c:if>
            			<c:forEach items="${dto.value }"  var="item" >
            				<td>${item }</td>
            			</c:forEach>
		              </tr>
            	</c:forEach>
            </tbody>
          </table>
        </div>
    </div>
    
   
	    
    </script>
  </body>
</html>
