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
   <%--  <%@ include file="/common/taglibs.jsp"%> --%>
   <link rel="stylesheet" href="${def }/css/dxeui.css?version=1.5.0" media="screen" title="no title" charset="utf-8"/>
	<link href="${def }/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="${def }/css/bootstrap-theme.min.css" rel="stylesheet">
  </head>
  <body>
  	<%pageContext.setAttribute("_textResource", new TextResource()); %>
    <div class="top_bar"><a class="return" onclick="window.location.href = '${ctx}/index'"></a>获客渠道表
    	<input class="datecss" type="text" name="orderDate" id="orderDate" value="${date }" placeholder="查询日期"/>
    </div>
    <div class="content_auto_nobg">
      <div class="col-md-12">
      	<table class="table table-bordered">
            <thead>
              <tr>
                <th colspan="2">总计</th>
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
                <th>渠道商</th>
                <th>机会库</th>
                <th>地推</th>
              </tr>
              <tr>
              	<th>城市</th>
              	<th>姓名</th>
                <th>${summary.c3 }</th>
                <th>${summary.c4 }</th>
                <th>${summary.c4 }</th>
                <th>${summary.c5 }</th>
                <th>${summary.c6 }</th>
                <th>${summary.c7 }</th>
                <th>${summary.c8 }</th>
                <th>${summary.c9 }</th>
                <th>${summary.c10 }</th>
                <th>${summary.c11 }</th>
                <th>${summary.c12 }</th>
                <th>${summary.c13 }</th>
                <th>${summary.c14 }</th>
                <th>${summary.c15 }</th>
                <th>${summary.c16 }</th>
                <th>${summary.c17 }</th>
                <th>${summary.c18 }</th>
                <th>${summary.c19 }</th>
                
              </tr>
            </thead>
          </table>
      
      
          <table class="table table-bordered">
            <thead>
              <tr>
                <th rowspan="2">城市</th>
                <th rowspan="2">姓名</th>
                <th rowspan="2">毛利</th>
                <th colspan="7">收入来源</th>
                <th rowspan="2">总订单数</th>
                <th rowspan="2">新增数</th>
                <th colspan="8">客户来源</th>
              </tr>
              <tr>
                <th>注册+代帐</th>
                <th>纯注册</th>
                <th>纯代帐</th>
                <th>纯增值</th>
                <th>高端业务</th>
                <th>资质业务</th>
                <th>HR业务</th>
                
                <th>企大师</th>
                <th>企顺宝</th>
                <th>转介绍</th>
                <th>老客户</th>
                <th>电话</th>
                <th>渠道商</th>
                <th>机会库</th>
                <th>地推</th>
              </tr>
            </thead>
            <tbody>
            	<c:forEach items="${list }"  var="dto">
            		 <tr>
		                <!-- <td>1</td> -->
		                <%-- <td><fmt:formatDate value="${dto.dtoDate }" pattern="yyyy-MM-dd" /></td> --%>
		                <td>${dto.value.c1 }</td>
		                <td>${dto.value.c2 }</td>
		                <td>${dto.value.c3 }</td>
		                <td>${dto.value.c4 }</td>
		                <td>${dto.value.c4 }</td>
		                <td>${dto.value.c5 }</td>
		                <td>${dto.value.c6 }</td>
		                <td>${dto.value.c7 }</td>
		                <td>${dto.value.c8 }</td>
		                <td>${dto.value.c9 }</td>
		                <td>${dto.value.c10 }</td>
		                <td>${dto.value.c11 }</td>
		                <td>${dto.value.c12 }</td>
		                <td>${dto.value.c13 }</td>
		                <td>${dto.value.c14 }</td>
		                <td>${dto.value.c15 }</td>
		                <td>${dto.value.c16 }</td>
		                <td>${dto.value.c17 }</td>
		                <td>${dto.value.c18 }</td>
		                <td>${dto.value.c19 }</td>
		                <%-- <td>${dto.value.c20 }</td> --%>
		              </tr>
            	</c:forEach>
            </tbody>
          </table>
        </div>
    </div>
    <script type="text/javascript" src="${def}/app/js/mobiscroller.js"></script>
	<script type="text/javascript" src="${def}/app/js/dateformat.js"></script>
	<script type="text/javascript" src="${def }/js/easySwipe.js"></script>
    <script type="text/javascript" src="${def }/js/common.js"></script>
    <script type="text/javascript">
	    $(function () {
	        var currYear = (new Date()).getFullYear();
	        var opt={};
	        opt.date = {preset : 'date'};
	        opt.datetime = {preset : 'datetime'};
	        opt.time = {preset : 'time'};
	        opt.default = {
	          theme: 'android-ics light', //皮肤样式
	          display: 'modal', //显示方式
	          mode: 'scroller', //日期选择模式
	          dateFormat: 'yyyy-mm-dd',
	          showNow: true,
	          nowText: "今天",
	          startYear: currYear - 10, //开始年份
	          endYear: currYear + 10 //结束年份
	        };
	        $("#orderDate").mobiscroll($.extend(opt['date'], opt['default']));
	        var optDateTime = $.extend(opt['datetime'], opt['default']);
	        var optTime = $.extend(opt['time'], opt['default']);
	        $("#appDateTime").mobiscroll(optDateTime).datetime(optDateTime);
	        $("#appTime").mobiscroll(optTime).time(optTime);
	      });
	    
	    var date = '${date }';
	    $('#orderDate').bind('input change', function() {
	    	var tmp = $('#orderDate').val();
	    	console.log(tmp);
	    	if(date != tmp){
	    		window.location.href= '${ctx}/report/orderSummary?date='+tmp;
	    	}
	    });	
    </script>
  </body>
</html>
