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
    <div class="top_bar">
    	<a class="return" onclick="go_page('${ctx}/index')"></a>
    	外勤展板
    	<a class="submit" onclick="javascript:doSubmit();">提交</a>
    </div>
    <div class="content_auto">
      <form id="formId">
        <input type="hidden" id="id" name="id" value="${report.id }"/>
        <input type="hidden" name="type" id="type" value="outwork2"/>
        <div class="insert_team bottom">
        	<div class="insert_message">
            	<label>订单日期</label>
            	<input type="text" name="col1" id="date0" value="${date }" placeholder="订单日期"/>
          	</div>
        </div>
        <p class="insert_title" style="background: #f5f5f5;">注册类</p>
        <div class="insert_team bottom">
          	<div class="insert_message">
            	<label>总件数</label>
            	<input type="text" id="col2" name="col2" placeholder="总件数" value="${report.col2 }"/>
          	</div>
          	<div class="insert_message">
            	<label>已完成</label>
            	<input type="text" id="col3" name="col3" placeholder="已完成" value="${report.col3 }"/>
          	</div>
          	<div class="insert_message">
            	<label>正常</label>
            	<input type="text" id="col4" name="col4" placeholder="未完成(正常)" value="${report.col4 }"/>
          	</div>
          	<div class="insert_message">
            	<label>延期</label>
            	<input type="text" id="col5" name="col5" placeholder="未完成(延期)" value="${report.col5 }"/>
          	</div>
        </div>
        <p class="insert_title" style="background: #f5f5f5;">变更类</p>
        <div class="insert_team bottom">
          	<div class="insert_message">
            	<label>总件数</label>
            	<input type="text" id="col6" name="col6" placeholder="总件数" value="${report.col6 }"/>
          	</div>
          	<div class="insert_message">
            	<label>已完成</label>
            	<input type="text" id="col7" name="col7" placeholder="已完成" value="${report.col7 }"/>
          	</div>
          	<div class="insert_message">
            	<label>正常</label>
            	<input type="text" id="col8" name="col8" placeholder="未完成(正常)" value="${report.col8 }"/>
          	</div>
          	<div class="insert_message">
            	<label>延期</label>
            	<input type="text" id="col9" name="col9" placeholder="未完成(延期)" value="${report.col9 }"/>
          	</div>
        </div>
        
        <p class="insert_title" style="background: #f5f5f5;">税务类</p>
        <div class="insert_team bottom">
          	<div class="insert_message">
            	<label>总件数</label>
            	<input type="text" id="col10" name="col10" placeholder="总件数" value="${report.col10 }"/>
          	</div>
          	<div class="insert_message">
            	<label>已完成</label>
            	<input type="text" id="col11" name="col11" placeholder="已完成" value="${report.col11 }"/>
          	</div>
          	<div class="insert_message">
            	<label>正常</label>
            	<input type="text" id="col12" name="col12" placeholder="未完成(正常)" value="${report.col12 }"/>
          	</div>
          	<div class="insert_message">
            	<label>延期</label>
            	<input type="text" id="col13" name="col13" placeholder="未完成(延期)" value="${report.col13 }"/>
          	</div>
        </div>
        <p class="insert_title" style="background: #f5f5f5;">注销类</p>
        <div class="insert_team bottom">
          	<div class="insert_message">
            	<label>总件数</label>
            	<input type="text" id="col14" name="col14" placeholder="总件数" value="${report.col14 }"/>
          	</div>
          	<div class="insert_message">
            	<label>已完成</label>
            	<input type="text" id="col15" name="col15" placeholder="已完成" value="${report.col15 }"/>
          	</div>
          	<div class="insert_message">
            	<label>正常</label>
            	<input type="text" id="col16" name="col16" placeholder="未完成(正常)" value="${report.col16 }"/>
          	</div>
          	<div class="insert_message">
            	<label>延期</label>
            	<input type="text" id="col17" name="col17" placeholder="未完成(延期)" value="${report.col17 }"/>
          	</div>
        </div>
        <p class="insert_title" style="background: #f5f5f5;">资质、社保、公积金类</p>
        <div class="insert_team bottom">
          	<div class="insert_message">
            	<label>总件数</label>
            	<input type="text" id="col18" name="col18" placeholder="总件数" value="${report.col18 }"/>
          	</div>
          	<div class="insert_message">
            	<label>已完成</label>
            	<input type="text" id="col19" name="col19" placeholder="已完成" value="${report.col19 }"/>
          	</div>
          	<div class="insert_message">
            	<label>正常</label>
            	<input type="text" id="col20" name="col20" placeholder="未完成(正常)" value="${report.col20 }"/>
          	</div>
          	<div class="insert_message">
            	<label>延期</label>
            	<input type="text" id="col21" name="col21" placeholder="未完成(延期)" value="${report.col21 }"/>
          	</div>
        </div>
        
        <p class="insert_title" style="background: #f5f5f5;">工商年报</p>
        <div class="insert_team bottom">
          	<div class="insert_message">
            	<label>总件数</label>
            	<input type="text" id="col22" name="col22" placeholder="总件数" value="${report.col22 }"/>
          	</div>
          	<div class="insert_message">
            	<label>已完成</label>
            	<input type="text" id="col23" name="col23" placeholder="已完成" value="${report.col23 }"/>
          	</div>
          	<div class="insert_message">
            	<label>正常</label>
            	<input type="text" id="col24" name="col24" placeholder="未完成(正常)" value="${report.col24 }"/>
          	</div>
          	<div class="insert_message">
            	<label>延期</label>
            	<input type="text" id="col25" name="col25" placeholder="未完成(延期)" value="${report.col25 }"/>
          	</div>
        </div>
        
        <p class="insert_title" style="background: #f5f5f5;">核名</p>
        <div class="insert_team bottom">
          	<div class="insert_message">
            	<label>总件数</label>
            	<input type="text" id="col26" name="col26" placeholder="总件数" value="${report.col26 }"/>
          	</div>
          	<div class="insert_message">
            	<label>已完成</label>
            	<input type="text" id="col27" name="col27" placeholder="已完成" value="${report.col27 }"/>
          	</div>
          	<div class="insert_message">
            	<label>正常</label>
            	<input type="text" id="col28" name="col28" placeholder="未完成(正常)" value="${report.col28 }"/>
          	</div>
          	<div class="insert_message">
            	<label>延期</label>
            	<input type="text" id="col29" name="col29" placeholder="未完成(延期)" value="${report.col29 }"/>
          	</div>
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
    
    function doSubmit() {
    	console.log($("#formId").serialize());
    	$.ajax({
    		url : "${ctx}/commonReport/save",
    		type : "POST",
    		//async : false,
    		data : $("#formId").serialize(),
    		contentType : "application/x-www-form-urlencoded",
    		success : function(data) {
    			console.log('result:'+data.code);
    			if (data.code == '0000') {
    				/* $("#message12").html("填写成功"); */
    				/* $("#errBox12").show(); */
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
    	}, 500);
    	
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
        $("#date0").mobiscroll($.extend(opt['date'], opt['default']));
        $("#date1").mobiscroll($.extend(opt['date'], opt['default']));
        $("#date2").mobiscroll($.extend(opt['date'], opt['default']));
        $("#date3").mobiscroll($.extend(opt['date'], opt['default']));
        $("#date4").mobiscroll($.extend(opt['date'], opt['default']));
        $("#date5").mobiscroll($.extend(opt['date'], opt['default']));
        $("#date6").mobiscroll($.extend(opt['date'], opt['default']));
        $("#date7").mobiscroll($.extend(opt['date'], opt['default']));
        $("#date8").mobiscroll($.extend(opt['date'], opt['default']));
        $("#date9").mobiscroll($.extend(opt['date'], opt['default']));
        $("#date10").mobiscroll($.extend(opt['date'], opt['default']));
        var optDateTime = $.extend(opt['datetime'], opt['default']);
        var optTime = $.extend(opt['time'], opt['default']);
        $("#appDateTime").mobiscroll(optDateTime).datetime(optDateTime);
        $("#appTime").mobiscroll(optTime).time(optTime);
        //$("#selectDate").val(today());
        
        
        
        $("input").focus(function(){
    		console.log(2222);
    		this.select();
    	});
      });
    
	 	//获取当前的时间
	    function today(){
	      var today=new Date();
	      var h=today.getFullYear();
	      var m=today.getMonth()+1;
	      var d=today.getDate();
	      return h+"-"+m+"-"+d;
	    }
	 	
	    var date = '${date }';
	    $('#date0').bind('input change', function() {
	    	var v_date = $('#date0').val();
	    	if(date != v_date){
	    		window.location.href= '${ctx}/commonReport/add/index2?date='+v_date;
	    	}
	    });	
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
