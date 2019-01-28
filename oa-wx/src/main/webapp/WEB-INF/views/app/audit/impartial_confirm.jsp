<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html>
  <head>
    <title>中天房管家</title>
    <link rel="stylesheet" href="${def}/app/css/warehouse.css" media="screen" title="no title" charset="utf-8"/>
    <link rel="stylesheet" href="${def}/app/css/wxui.css" media="screen" title="no title" charset="utf-8">
    <link rel="stylesheet" href="${def}/app/css/mobiscroll.css" media="screen" title="no title" charset="utf-8">
  </head>
  <body>
    <div class="topbar">
      <a class="return" onclick="history.go(-1)"></a>
     公正确认
    </div>
    <div class="showbox">
    	<form class="cmxform form-horizontal" id="godownForma" name="godownForma" action="${ctx}/app/completeTask" method="post">
    	<div class="submit_input">
            <input id="taskId" name="taskId" type="hidden" value="${wfTask.wfTaskInfo.id }"/>
           	<input id="processId" name="processId" type="hidden" value="${wfTask.wfTaskInfo.workflowId }"/>
           	<input id="fp_status" name="fp_status" type="hidden" />
           	<input id="fp_approvalStep" name="fp_approvalStep" type="hidden" />
           	<input id="fp_approvalStatus" name="fp_approvalStatus" type="hidden" />
            <input id="fp_isNotary" name="fp_isNotary" value="1" type="hidden" />
            <input id="fp_appStatus" name="fp_appStatus" type="hidden" />
            
			<p class="selectRadio ed" name="fp_isNotary1" id="fp_isNotary1" selected="selected" onclick="toggleRadio(this);">委托公证*</p>
            <p id="optionSelect" class="selectInput" onclick="$('#fp_notaryOffice').show();">请选择公证处</p>
            <p><input type="text" name="fp_notaryTime" id="fp_notaryTime" placeholder="请选择公证时间"/></p>
            <p><input type="text" name="fp_notaryFee" id="fp_notaryFee" placeholder="公证金额"/></p>
      	</div>	 
        <div class="submit_text">
			<textarea id="fp_suggestion" name="fp_suggestion" rows="8" cols="40" placeholder="请输入处理意见或备注" /></textarea>
		</div>
		<div class="submit_box">
			<p class="submit">
				<input type="button" value="提  交" onclick="$('input[name=fp_appStatus]').val('pass');$('input[name=fp_status]').val('1');$('input[name=fp_approvalStep]').val('6');$('input[name=fp_approvalStatus]').val('0');javascript:submitAudit('godownForma');">
			</p>
		</div>
		<div name="fp_notaryOffice" id="fp_notaryOffice" class="optionMsg">
	      <div class="submit_input">
		    <c:forEach var="notaryOffice" items="${_textResource.getSysTextMap('NOTARY_OFFICE')}">
		        <p class="selectRadio" name="${notaryOffice.key}">${notaryOffice.value}</p>
		    </c:forEach>
	      </div>
	    </div>
        </form>
	</div>
    <script type="text/javascript" src="${def}/app/js/mobiscroller.js"></script>
    <script type="text/javascript" src="${def}/app/js/dateformat.js"></script>
    <script type="text/javascript">
	    function toggleRadio(obj) {
			if ($(obj).hasClass("ed")) {
				$("#fp_isNotary").val("0");
				$(obj).removeClass("ed");
				$(obj).removeAttr("selected");
			} else {
				$("#fp_isNotary").val("1");
				$(obj).addClass("ed");
				$(obj).attr("selected", "selected");
			}
		}
    
	    $("#fp_notaryOffice").find("p.selectRadio").on("click",function(){
	        $("#fp_notaryOffice").find("p.selectRadio").each(function(index){
	          $(this).removeClass("ed");
	        });
	        $(this).addClass("ed");
	        $("#optionSelect").text($(this).text());
	        $("#fp_notaryOffice").hide();
	      });
    
	      function submitAudit(domId){
	    	  var fp_isNotary = $("#fp_isNotary").val();
	    	  if(fp_isNotary == null || fp_isNotary == '' || fp_isNotary == '0'){
	    		  alert("请勾选委托公证  ");
	    		  return false;
	    	  }
	    	  var fp_notaryFee = $("#fp_notaryFee").val();
	    	  if(fp_notaryFee != null && fp_notaryFee != ''){
	    		  var regexAmount = /^(([1-9]\d*)|0)(\.(\d){1,2})?$/;// 校验金额两位小数
		  		  if(!regexAmount.test(fp_notaryFee)){
		  			 alert("金额格式不正确");
		  		     return false;
		  		  }
	    	  }
	  		document.getElementById(domId).submit();
	      };
    </script>
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
	        $("#fp_notaryTime").mobiscroll($.extend(opt['date'], opt['default']));
	        var optDateTime = $.extend(opt['datetime'], opt['default']);
	        var optTime = $.extend(opt['time'], opt['default']);
	        $("#appDateTime").mobiscroll(optDateTime).datetime(optDateTime);
	        $("#appTime").mobiscroll(optTime).time(optTime);
	        //获取当前的时间
	        function today(){
	          var today=new Date();
	          var h=today.getFullYear();
	          var m=today.getMonth()+1;
	          var d=today.getDate();
	          return h+"-"+m+"-"+d;
	        }
	      });
    </script>
  </body>
</html>
