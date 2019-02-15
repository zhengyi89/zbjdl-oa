<%@page import="com.zbjdl.common.utils.config.TextResource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
  <head>
    <title>大连八戒财税</title>
   <%--  <%@ include file="/common/taglibs.jsp"%> --%>
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
	<link href="${def }/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="${def }/css/bootstrap-theme.min.css" rel="stylesheet">

    <link rel="stylesheet" href="${def }/css/iosSelect.css?version=1.5.0" media="screen" title="no title">
	<link rel="stylesheet" href="${def }/css/animate.min.css?version=1.5.0" media="screen" title="no title">
	<link rel="stylesheet" href="${def }/css/hashChange.css?version=1.5.0" media="screen" title="no title">
	<link rel="stylesheet" href="${def}/app/css/warehouse.css" media="screen" title="no title" charset="utf-8" />
	<link rel="stylesheet" href="${def}/app/css/wxui.css" media="screen" title="no title" charset="utf-8">
	<link rel="stylesheet" href="${def}/app/css/mobiscroll.css" media="screen" title="no title" charset="utf-8">
  </head>
  <body>
  	<%pageContext.setAttribute("_textResource", new TextResource()); %>
    <div class="top_bar"><a class="return" onclick="window.location.href = '${ctx}/index'"></a>订单列表
       	<input class="datecss" type="text" name="orderDate" id="orderDate" value="${date }" placeholder="查询日期"/>
    </div>
    <div class="content_auto">
    <!-- <p><p>
    <p> -->
      <div class="col-md-12">
          <table class="table table-striped">
            <thead>
              <tr>
                <th>序号</th>
                <th>日期</th>
                <th>工号</th>
                <th>姓名</th>
                <th>城市</th>
                <th>产品类型</th>
                <th>客户类型</th>
                <th>获客渠道</th>
                <th>产品细分</th>
                <th>产品内容</th>
                <th>套餐类型</th>
                <th>服务详情</th>
                <th>公司名称</th>
                <th>客户姓名</th>
                <th>联系方式</th>
                <th>总额</th>
                <th>实收</th>
                <th>尾款</th>
                <th>刻章</th>
                <th>税控器</th>
                <th>地址</th>
                <th>开户</th>
                <th>加急费用</th>
                <th>资质成本</th>
                <th>保证金</th>
                <th>其他成本</th>
                <th>其他收入</th>
                <th>代帐费用</th>
                <th>总额</th>
                <th>猪八戒ID</th>
                <th>订单ID</th>
                <th>合同号</th>
                <th>付款方式</th>
              </tr>
            </thead>
            <tbody>
            	<c:forEach items="${list }"  var="order">
            		 <tr>
		                <td>1</td>
		                <td><fmt:formatDate value="${order.orderDate }" pattern="yyyy-MM-dd" /></td>
		                <td>${order.jobNo }</td>
		                <td>${order.userName }</td>
		                <td>${order.city }</td>
		                <td>${_textResource.getSysText('OA_PRODUCT_TYPE', order.productType)}</td>
		                <td>${_textResource.getSysText('OA_SELL_TYPE', order.customerType)}</td>
		                <td>${_textResource.getSysText('OA_CUSTOMER_CHANNEL', order.customerChannel)}</td>
		                <td>${_textResource.getSysText('OA_PRODUCT_DETAIL_TYPE', order.productDetailType)}</td>
		                <td>${_textResource.getSysText('OA_CUSTOMER_TYPE', order.productContext)}</td>
		                <td>${_textResource.getSysText('OA_PACKAGE_TYPE', order.productPackage)}</td>
		                <td>${order.serverDetails }</td>
		                <td>${order.companyName }</td>
		                <td>${order.customerName }</td>
		                <td>${order.mobile }</td>
		                <td>${order.orderSumAmount }</td>
		                <td>${order.orderRealAmount }</td>
		                <td>${order.orderRetailAmount }</td>
		                <td>${order.cost1 }</td>
		                <td>${order.cost2 }</td>
		                <td>${order.cost3 }</td>
		                <td>${order.cost4 }</td>
		                <td>${order.cost5 }</td>
		                <td>${order.cost6 }</td>
		                <td>${order.cost7 }</td>
		                <td>${order.costOther }</td>
		                <td>${order.profitOther }</td>
		                <td>${order.profitAccount }</td>
		                <td>${order.profitAmount }</td>
		                <td>${order.zbjId }</td>
		                <td>${order.orderNo }</td>
		                <td>${order.contractNo }</td>
		                <td>${order.payChannel }</td>
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
	    		window.location.href= '${ctx}/order/list?date='+tmp;
	    	}
	    });	
	    
    </script>
  </body>
</html>
