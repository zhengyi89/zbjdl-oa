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
          	<div class="insert_message">
            	<label>总额</label>
            	<input type="text" id="orderSumAmount" name="orderSumAmount" placeholder="总额" value="${order }"/>
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
