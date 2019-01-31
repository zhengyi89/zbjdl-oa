<%@page import="com.zbjdl.common.utils.config.TextResource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <title>大连八戒财税</title>
   <%--  <%@ include file="/common/taglibs.jsp"%> --%>
   <link rel="stylesheet" href="${def }/css/dxeui.css?version=1.5.0" media="screen" title="no title" charset="utf-8"/>
<link rel="stylesheet" href="${def }/css/iosSelect.css?version=1.5.0" media="screen" title="no title">
<link rel="stylesheet" href="${def }/css/animate.min.css?version=1.5.0" media="screen" title="no title">
<link rel="stylesheet" href="${def }/css/hashChange.css?version=1.5.0" media="screen" title="no title">
<link rel="stylesheet" href="${def}/app/css/warehouse.css" media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" href="${def}/app/css/wxui.css" media="screen" title="no title" charset="utf-8">
<link rel="stylesheet" href="${def}/app/css/mobiscroll.css" media="screen" title="no title" charset="utf-8">
  </head>
  <body>
  	<%pageContext.setAttribute("_textResource", new TextResource()); %>
    <div class="top_bar"><a class="return" onclick="go_page('${ctx}/order/creditIndex?type=${type }')"></a>订单填写</div>
    <div class="content_auto">
      <form id="formId">
        <input type="hidden" id="id" name="id" value="${order.id }"/>
        <div class="insert_team bottom">
        	<div class="insert_message">
            	<label>订单日期</label>
            	<input type="text" name="orderDate" id="orderDate" value="${sysdate }" placeholder="订单日期"/>
          	</div>
        	<div class="insert_option">
            	<label>产品类型</label>
            	<select class="" name="productType" id="productType" >
                	<c:forEach var="type" items="${_textResource.getSysTextMap('OA_PRODUCT_TYPE')}">
						<option value="${type.key}" <c:if test="${type.key == order.productType }">selected</c:if>>${type.value}</option>
                	</c:forEach> 
    	    	</select>
          	</div>
        	<div class="insert_option">
            	<label>客户类型</label>
            	<select class="" name="customerType" id="customerType" >
                	<c:forEach var="type" items="${_textResource.getSysTextMap('OA_SELL_TYPE')}">
						<option value="${type.key}" <c:if test="${type.key == order.customerType }">selected</c:if>>${type.value}</option>
                	</c:forEach> 
    	    	</select>
          	</div>
        	<div class="insert_option">
            	<label>获客渠道</label>
            	<select class="" name="customerChannel" id="customerChannel" >
                	<c:forEach var="type" items="${_textResource.getSysTextMap('OA_CUSTOMER_CHANNEL')}">
						<option value="${type.key}" <c:if test="${type.key == order.customerChannel }">selected</c:if>>${type.value}</option>
                	</c:forEach> 
    	    	</select>
          	</div>
          	<div class="insert_option">
            	<label>产品细分</label>
            	<select class="" name="productDetailType" id="productDetailType" >
                	<c:forEach var="type" items="${_textResource.getSysTextMap('OA_PRODUCT_DETAIL_TYPE')}">
						<option value="${type.key}" <c:if test="${type.key == order.productDetailType }">selected</c:if>>${type.value}</option>
                	</c:forEach> 
    	    	</select>
          	</div>
          	<div class="insert_option">
            	<label>产品内容</label>
            	<select class="" name="productContext" id="productContext" >
                	<c:forEach var="type" items="${_textResource.getSysTextMap('OA_CUSTOMER_TYPE')}">
						<option value="${type.key}" <c:if test="${type.key == order.productContext }">selected</c:if>>${type.value}</option>
                	</c:forEach> 
    	    	</select>
          	</div>
          	<div class="insert_option">
            	<label>套餐类型</label>
            	<select class="" name="productPackage" id="productPackage" >
                	<c:forEach var="type" items="${_textResource.getSysTextMap('OA_PACKAGE_TYPE')}">
						<option value="${type.key}" <c:if test="${type.key == order.productContext }">selected</c:if>>${type.value}</option>
                	</c:forEach> 
    	    	</select>
          	</div>
         	<div class="insert_message">
            	<label>服务详情</label>
            	<input type="text" id="serverDetails" name="serverDetails" placeholder="服务详情" value="${order.serverDetails }"/>
          	</div>
         	<div class="insert_message">
            	<label>公司名称</label>
            	<input type="text" id="companyName" name="companyName" placeholder="公司名称" value="${order.companyName }"/>
          	</div>
         	<div class="insert_message">
            	<label>客户名称</label>
            	<input type="text" id="customerName" name="customerName" placeholder="客户名称" value="${order.customerName }"/>
          	</div>
         	<div class="insert_message last">
            	<label>联系方式</label>
            	<input type="text" id="mobile" name="mobile" placeholder="联系方式" value="${order.mobile }"/>
          	</div>
        </div>
        <p class="insert_title" style="background: #f5f5f5;">订单金额</p>
        <div class="insert_team bottom">
          	<div class="insert_message">
            	<label>总额</label>
            	<input type="text" id="orderSumAmount" name="orderSumAmount" placeholder="总额" value="${order.orderSumAmount }"/>
          	</div>
          	<div class="insert_message">
            	<label>实收</label>
            	<input type="text" id="orderRealAmount" name="orderRealAmount" placeholder="实收" value="${order.orderRealAmount }"/>
          	</div>
          	<div class="insert_message last">
            	<label>尾款</label>
            	<input type="text" id="orderRetailAmount" name="orderRetailAmount" placeholder="尾款" value="${order.orderRetailAmount }"/>
          	</div>
        </div>
        
        <p class="insert_title" style="background: #f5f5f5;">成本</p>
        <div class="insert_team">
          	<div class="insert_message">
            	<label>刻章</label>
            	<input type="text" id="cost1" name="cost1" placeholder="刻章" value="${order.cost1 }"/>
          	</div>
          	<div class="insert_message">
            	<label>税控器</label>
            	<input type="text" id="cost2" name="cost2" placeholder="税控器及软件" value="${order.cost2 }"/>
          	</div>
          	<div class="insert_message">
            	<label>地址</label>
            	<input type="text" id="cost3" name="cost3" placeholder="地址" value="${order.cost3 }"/>
          	</div>
          	<div class="insert_message">
            	<label>开户</label>
            	<input type="text" id="cost4" name="cost4" placeholder="开户" value="${order.cost4 }"/>
          	</div>
          	<div class="insert_message">
            	<label>加急费用</label>
            	<input type="text" id="cost5" name="cost5" placeholder="加急费用" value="${order.cost5 }"/>
          	</div>
          	<div class="insert_message">
            	<label>资质成本</label>
            	<input type="text" id="cost6" name="cost6" placeholder="资质成本" value="${order.cost6 }"/>
          	</div>
          	<div class="insert_message">
            	<label>保证金</label>
            	<input type="text" id="cost7" name="cost7" placeholder="保证金" value="${order.cost7 }"/>
          	</div>
          	<div class="insert_message last">
            	<label>其他成本</label>
            	<input type="text" id="costOther" name="costOther" placeholder="其他成本" value="${order.costOther }"/>
          	</div>
        </div>
        
        <p class="insert_title" style="background: #f5f5f5;">毛利</p>
        <div class="insert_team bottom">
          	<div class="insert_message">
            	<label>其他收入</label>
            	<input type="text" id="profitOther" name="profitOther" placeholder="其他收入" value="${order.profitOther }"/>
          	</div>
          	<div class="insert_message">
            	<label>代帐收入</label>
            	<input type="text" id="profitAccount" name="profitAccount" placeholder="代帐收入" value="${order.profitAccount }"/>
          	</div>
          	<div class="insert_message last">
            	<label>总额</label>
            	<input type="text" id="profitAmount" name="profitAmount" placeholder="总额" value="${order.profitAmount }"/>
          	</div>
        </div>
        
        <p class="insert_title" style="background: #f5f5f5;">其他信息</p>
        <div class="insert_team">
          	<div class="insert_message">
            	<label>猪八戒ID</label>
            	<input type="text" id="zbjId" name="zbjId" placeholder="猪八戒ID" value="${order.zbjId }" />
          	</div>
          	<div class="insert_message">
            	<label>订单ID</label>
            	<input type="text" id="orderNo" name="orderNo" placeholder="订单ID" value="${order.orderNo }"/>
          	</div>
          	<div class="insert_message">
            	<label>合同号</label>
            	<input type="text" id="contractNo" name="contractNo" placeholder="合同号" value="${order.contractNo }"/>
          	</div>
          	<div class="insert_message last">
            	<label>付款方式</label>
            	<input type="text" id="payChannel" name="payChannel" placeholder="付款方式" value="${order.payChannel }"/>
          	</div>
        </div>
        <div class="btn_team bg_register">
          	<p class="submit_btn">
            	<input class="" type="button" id="submit_btn" value="保   存" onclick="do_submit();"/>
          	</p>
        </div>
      </form>
    </div>
    <div id="errBox" class="animated vnone">
    		<div class="tiperrorCover"></div>
    		<div class="tiperrorMsg">信息错误</div>
    </div>
	<script type="text/javascript" src="${def }/js/iscroll.js"></script>
	<script type="text/javascript" src="${def }/js/iosSelect.js"></script>
	<script type="text/javascript" src="${def }/js/easySwipe.js"></script>
    <script type="text/javascript" src="${def }/js/common.js"></script>
    <script type="text/javascript" src="${def}/app/js/mobiscroller.js"></script>
	<script type="text/javascript" src="${def}/app/js/dateformat.js"></script>
    <script>
    function errtip(msg){
    	$('#errBox').find(".tiperrorMsg").html(msg);
        $('#errBox').removeClass("vnone");
        setTimeout("$('#errBox').addClass('fadeOut')",2000);
        setTimeout("$('#errBox').removeClass('fadeOut').addClass('vnone')",3000);
    }
    
    function do_submit() {
    	console.log($("#formId").serialize());
    	$.ajax({
    		url : "${ctx}/order/save",
    		type : "POST",
    		//async : false,
    		data : $("#formId").serialize(),
    		contentType : "application/x-www-form-urlencoded",
    		success : function(data) {
    			console.log('result:'+data.code);
    			if (data.code == '0000') {
    				$("#message12").html("填写成功");
    				$("#errBox12").show();
    				toggleTime();
    			} else {
    				if(data.msg == undefined){
    					errtip("信息输入有误");
    				}else{
    					errtip(data.msg);
    				}
    			}
    		},
    		error : function() {
    			alert(11);
    			errtip("信息错误，请稍后重试");
    		}
    	});
    	//reset_button();
    }

    var countdown = 2;

    function toggleTime(obj) {
    	if (countdown == 0) {
    		countdown = 2;
    		return;
    	} else {
    		console.log(countdown);
    		errtip("提交成功")
    		countdown--;
    	}
    	setTimeout(function() {
    		toggleTime(obj);
    		window.location.href = "${ctx}/index";
    	}, 2000);
    	
    }
    function checkIsAdd(){
    	var mobile1 ='${order.mobile1}';
    	if(mobile1==null || mobile1==''){
    		return true;
    	}
    	return false;
    }
    
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
        $("#selectDate").mobiscroll($.extend(opt['date'], opt['default']));
        var optDateTime = $.extend(opt['datetime'], opt['default']);
        var optTime = $.extend(opt['time'], opt['default']);
        $("#appDateTime").mobiscroll(optDateTime).datetime(optDateTime);
        $("#appTime").mobiscroll(optTime).time(optTime);
        //$("#selectDate").val(today());
      });
    
	 	//获取当前的时间
	    function today(){
	      var today=new Date();
	      var h=today.getFullYear();
	      var m=today.getMonth()+1;
	      var d=today.getDate();
	      return h+"-"+m+"-"+d;
	    }
    </script>
    <div id="errBox12" class="vnone">
		<div class="tipCover"></div>
		<div class="tipMsg">
			<p class="message" id="message12">保存成功</p>
			<p class="btnbox">
				<input class="submit" type="button" value="确定" onclick="window.location.href='${ctx}/index'">
			</p>
		</div>
	</div>
  </body>
</html>
