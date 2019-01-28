<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ page import="com.zbjdl.common.utils.config.TextResource" %>
<html>
  <head>
    <title>中天房管家</title>
	<script type="text/javascript" src="${ctx}/static/js/BusinessCode.js"></script>
	    <link rel="stylesheet" type="text/css" href="${ctx}/common/easyDatetime/easyDatetime.css"/>
	<script type="text/javascript" src="${ctx}/common/easyDatetime/easyDatetime.js"></script>
			<script language="javascript" type="text/javascript" src="http://bossres.yunpal.cn:9002/static/DatePicker/WdatePicker.js"></script>
  </head>
<body>
    <div id="content_2" class="content_wrapper">
      <div class="content_main">
        <jsp:include page="includeAudit.jsp"></jsp:include>    
       <div class="panel panel-default">
          <div class="panel-heading">公正确认</div>
          <div class="panel-body">
            <form class="cmxform form-horizontal" id="godownForma" name="godownForma" action="${ctx}/wftask/completeTask" method="post">
             <input id="taskId" name="taskId" type="hidden" value="${taskId }"/>
              	<input id="processId" name="processId" type="hidden" value="${processId }"/>
              	<input id="fp_status" name="fp_status" type="hidden" />
              	<input id="fp_approvalStep" name="fp_approvalStep" type="hidden" />
              	<input id="fp_approvalStatus" name="fp_approvalStatus" type="hidden" />
              	<input id="fp_appStatus" name="fp_appStatus" type="hidden" />
              <div class="form-group">
                <div class="col-xs-offset-2 col-xs-2 checkbox">
                  <label>
                    <input type="checkbox" name="fp_isNotary" id="fp_isNotary" checked="checked" value="1" onchange="this.value=(fp_isNotary.checked)?1:0"> 委托公证
                  </label>
                </div>
                <div class="col-xs-1 tip">*</div>
                <label class="col-xs-2 control-label">公证处</label>
                <div class="col-xs-3">
                  <select class="form-control" name="fp_notaryOffice" id="fp_notaryOffice">
                     	<option value=""></option>
					    <c:forEach var="notaryOffice" items="${_textResource.getSysTextMap('NOTARY_OFFICE')}">
					        <option value="${notaryOffice.key}">${notaryOffice.value}</option>
					    </c:forEach>
                  </select>
                </div>
                <div class="col-xs-1 tip"></div>
              </div>
              <div class="form-group">
                <label class="col-xs-2 control-label">公证时间</label>
                <div class="col-xs-3">
<!--                   <input type="text" name="fp_notaryTime" id="fp_notaryTime" class="form-control" /> -->
								<div class="input-group">
									<input id="fp_notaryTime" name="fp_notaryTime" type="text"
										class="form-control" placeholder=""
										aria-describedby="basic-addon2" onclick="WdatePicker()">
									<span class="input-group-addon"><span
										class="glyphicon glyphicon-calendar"></span></span>
								</div>
							</div>
                <label class="col-xs-2 control-label">公证金额（元）</label>
                <div class="col-xs-3">
                  <input type="text" class="form-control" name="fp_notaryFee" id="fp_notaryFee"/>
                </div>
                <div class="col-xs-1 tip"></div>
              </div>
              <div class="form-group selectDepart">
                <label class="col-xs-2 control-label">审核意见</label>
                <div class="col-xs-8">
                     <textarea class="form-control" rows="3" id="fp_suggestion" name="fp_suggestion"></textarea>
                </div>
              </div>
              <div class="col-xs-12 align_center">
                <a class="btn btn-default button" href="${ctx}/wftask/wfTaskInfoIndex">取  消</a>
                <button type="button" class="btn btn-primary submit ml_20" id="buttonAdd"
                onclick="$('input[name=fp_appStatus]').val('pass');$('input[name=fp_status]').val('1');$('input[name=fp_approvalStep]').val('6');$('input[name=fp_approvalStatus]').val('0');javascript:submitAudit('godownForma');">提交</button>
              </div>
            </form>
          </div>
        </div>
          <jsp:include page="includeProcessHistory.jsp"></jsp:include>    
        <jsp:include page="includeWfRemark.jsp"></jsp:include> 
      </div>
    </div>
    <script type="text/javascript">
    /*
      $(function(){
        $("#fp_notaryTime").on("click",function(e){
          e.stopPropagation();
          $(this).easyDatetime({
            css : 'easyDay',
            dateType : 'D',
            selectback : function(){}
          });
        });
      });
    */
      function submitAudit(domId){
    	  var fp_isNotary = $("#fp_isNotary").val();
    	  if(fp_isNotary == null || fp_isNotary == '' || fp_isNotary == '0'){
    		  alert("请勾选委托公证  ");
    		  return false;
    	  }
    	  /*
    	  var fp_notaryTime = $("#fp_notaryTime").val();
    	  if(fp_notaryTime == null || fp_notaryTime == '' ){
    		  alert("请填写公证时间");
    		  return false;
    	  }
    	  */
    	  var fp_notaryFee = $("#fp_notaryFee").val();
    	  if(fp_notaryFee != null && fp_notaryFee != ''){
    		  var regexAmount = /^(([1-9]\d*)|0)(\.(\d){1,2})?$/;// 校验金额两位小数
      		  if(!regexAmount.test(fp_notaryFee)){
      			 alert("金额格式不正确");
      		     return false;
      		  }
    	  }
    	  
  		$('#buttonAdd').attr("disabled","disabled");
  		document.getElementById(domId).submit();
      };
    </script>
  </body>
</html>
        