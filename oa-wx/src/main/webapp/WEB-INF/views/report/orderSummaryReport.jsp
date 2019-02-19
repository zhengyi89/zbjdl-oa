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
    <div class="top_bar"><a class="return" onclick="window.location.href = '${ctx}/index'"></a>战报表
    	<input class="datecss" type="text" name="orderDate" id="orderDate" value="${date }" placeholder="查询日期"/>
    </div>
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
		                <td>${dto.finishRate }%</td>
		              </tr>
            	</c:forEach>
            </tbody>
          </table>
          
          
          <table class="table table-striped">
            <tr>
                <td>日业绩总金额</td>
                <td>${sumDay }</td>
              </tr>
              <tr>
              	 <td>月业绩总金额</td>
                 <td>${sumMonth }</td>
              </tr>
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
