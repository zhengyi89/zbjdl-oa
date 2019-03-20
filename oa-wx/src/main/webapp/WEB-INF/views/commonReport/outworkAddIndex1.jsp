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
    	外勤看板
    	<a class="submit" onclick="javascript:doSubmit();">提交</a>
    </div>
    <div class="content_auto">
      <form id="formId">
        <input type="hidden" id="id" name="id" value="${report.id }"/>
        <input type="hidden" name="type" id="type" value="outwork1"/>
        <div class="insert_team bottom">
        	<div class="insert_message">
            	<label>日期</label>
            	<input type="text" name="col1" id="date0" value="${date }" placeholder="订单日期"/>
          	</div>
          	<div class="insert_message">
            	<label>客户姓名</label>
            	<input type="text" id="col2" name="col2" placeholder="客户姓名" value="${report.col2 }"/>
          	</div>
          	<div class="insert_message last">
            	<label>客户电话</label>
            	<input type="text" id="col3" name="col3" placeholder="客户电话" value="${report.col3 }"/>
          	</div>
        </div>
        <p class="insert_title" style="background: #f5f5f5;">服务项目</p>
        <div class="insert_team bottom">
          	<div class="insert_option">
            	<label>注册</label>
            	<select name="col4" id="col4" >
                	<option value="0" <c:if test="${report.col4 == 0}">selected</c:if>>否</option>
                	<option value="1" <c:if test="${report.col4 == 1}">selected</c:if>>是</option>
    	    	</select>
          	</div>
          	<div class="insert_option">
            	<label>代账</label>
            	<select name="col5" id="col5" >
                	<option value="0" <c:if test="${report.col5 == 0}">selected</c:if>>否</option>
                	<option value="1" <c:if test="${report.col5 == 1}">selected</c:if>>是</option>
    	    	</select>
          	</div>
          	<div class="insert_option last">
            	<label>增值</label>
            	<select name="col6" id="col6" >
                	<option value="0" <c:if test="${report.col6 == 0}">selected</c:if>>否</option>
                	<option value="1" <c:if test="${report.col6 == 1}">selected</c:if>>是</option>
    	    	</select>
          	</div>
        </div>
        <p class="insert_title" style="background: #f5f5f5;">核名预审</p>
        <div class="insert_team bottom">
          	<div class="insert_message">
            	<label>核名日期</label>
            	<input type="text" id="date1" name="col7" value="${report.col7 }"/>
          	</div>
          	<div class="insert_message">
            	<label>负责人</label>
            	<input type="text" id="col8" name="col8" placeholder="负责人" value="${report.col8 }"/>
          	</div>
          	<div class="insert_message">
            	<label>通过日期</label>
            	<input type="text" id="date2" name="col9" value="${report.col9 }"/>
          	</div>
          	<div class="insert_message">
            	<label>负责人</label>
            	<input type="text" id="col10" name="col10" placeholder="负责人" value="${report.col10 }"/>
          	</div>
          	<div class="insert_message">
            	<label>领取日期</label>
            	<input type="text" id="date3" name="col11" value=""/>
          	</div>
          	<div class="insert_message">
            	<label>负责人</label>
            	<input type="text" id="col12" name="col12" placeholder="负责人" value="${report.col12 }"/>
          	</div>
          	<div class="insert_message last">
            	<label>注册名称</label>
            	<input type="text" id="col13" name="col13" placeholder="注册名称（全称）" value="${report.col13 }"/>
          	</div>
        </div>
        <p class="insert_title" style="background: #f5f5f5;">提交材料</p>
        <div class="insert_team bottom">
          	<div class="insert_message">
            	<label>日期</label>
            	<input type="text" id="date4" name="col14" value=""/>
          	</div>
          	<div class="insert_message last">
            	<label>负责人</label>
            	<input type="text" id="col15" name="col15" placeholder="负责人" value="${report.col15 }"/>
          	</div>
        </div>
        <p class="insert_title" style="background: #f5f5f5;">执照领取</p>
        <div class="insert_team bottom">
          	<div class="insert_message">
            	<label>日期</label>
            	<input type="text" id="date5" name="col16" value=""/>
          	</div>
          	<div class="insert_message last">
            	<label>负责人</label>
            	<input type="text" id="col17" name="col17" placeholder="负责人" value="${report.col17 }"/>
          	</div>
        </div>
        <p class="insert_title" style="background: #f5f5f5;">刻章</p>
        <div class="insert_team bottom">
          	<div class="insert_message">
            	<label>日期</label>
            	<input type="text" id="date6" name="col18" value=""/>
          	</div>
          	<div class="insert_message last">
            	<label>负责人</label>
            	<input type="text" id="col19" name="col19" placeholder="负责人" value="${report.col19 }"/>
          	</div>
        </div>
        <p class="insert_title" style="background: #f5f5f5;">取章</p>
        <div class="insert_team bottom">
          	<div class="insert_message">
            	<label>日期</label>
            	<input type="text" id="date7" name="col20" value=""/>
          	</div>
          	<div class="insert_message last">
            	<label>负责人</label>
            	<input type="text" id="col21" name="col21" placeholder="负责人" value="${report.col21 }"/>
          	</div>
        </div>
        
        <p class="insert_title" style="background: #f5f5f5;">税务报到</p>
        <div class="insert_team bottom">
          	<div class="insert_message">
            	<label>日期</label>
            	<input type="text" id="date8" name="col22" value=""/>
          	</div>
          	<div class="insert_message last">
            	<label>负责人</label>
            	<input type="text" id="col23" name="col23" placeholder="负责人" value="${report.col23 }"/>
          	</div>
        </div>
        <p class="insert_title" style="background: #f5f5f5;">银行开户</p>
        <div class="insert_team bottom">
          	<div class="insert_message">
            	<label>日期</label>
            	<input type="text" id="date9" name="col24" value=""/>
          	</div>
          	<div class="insert_message last">
            	<label>负责人</label>
            	<input type="text" id="col25" name="col25" placeholder="负责人" value="${report.col25 }"/>
          	</div>
        </div>
        <p class="insert_title" style="background: #f5f5f5;">领取开户许可证网银</p>
        <div class="insert_team bottom">
          	<div class="insert_message">
            	<label>日期</label>
            	<input type="text" id="date10" name="col26" value=""/>
          	</div>
          	<div class="insert_message">
            	<label>代办事项</label>
            	<input type="text" id="col27" name="col27" placeholder="代办事项" value="${report.col27 }"/>
          	</div>
          	<div class="insert_message">
            	<label>负责人</label>
            	<input type="text" id="col28" name="col28" placeholder="负责人" value="${report.col28 }"/>
          	</div>
          	<div class="insert_message last">
            	<label>备注</label>
            	<input type="text" id="col29" name="col29" placeholder="备注" value="${report.col29 }"/>
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
	    		window.location.href= '${ctx}/commonReport/add/index1?date='+v_date;
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
