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
          <div class="panel-heading">银行贷款相关资料</div>
          <div class="panel-body">
            <form class="cmxform form-horizontal" id="godownForma" name="godownForma" action="${ctx}/wftask/completeTask" method="post">
              <input id="taskId" name="taskId" type="hidden" value="${taskId }"/>
              	<input id="processId" name="processId" type="hidden" value="${processId }"/>
              	<input id="fp_status" name="fp_status" type="hidden" />
              	<input id="fp_approvalStep" name="fp_approvalStep" type="hidden" />
              	<input id="fp_approvalStatus" name="fp_approvalStatus" type="hidden" />
              	<input id="fp_accountant" name="fp_accountant" type="hidden" value="${userId }"/>
              	<input id="fp_appStatus" name="fp_appStatus" type="hidden" />
              <div class="form-group">
                <div class="col-xs-offset-2 col-xs-3 checkbox">
                  <label>
                       <input type="checkbox" name="fp_isNewOpenBankcard" id="fp_isNewOpenBankcard" checked="checked" value="1" onchange="this.value=(fp_isNewOpenBankcard.checked)?1:0"> 新开银行卡是否收取
                  </label>
                </div>
                <div class="col-xs-1 tip">*</div>
                <div class="col-xs-offset-1 col-xs-3 checkbox">
                  <label>
                    <input type="checkbox" name="fp_isNewOpenUkey" id="fp_isNewOpenUkey" checked="checked" value="1" onchange="this.value=(fp_isNewOpenUkey.checked)?1:0"> 新开UKEY是否收取
                  </label>
                </div>
                <div class="col-xs-1 tip">*</div>
              </div>
              <div class="form-group">
                <label class="col-xs-2 control-label">收取日期</label>
                <div class="col-xs-3">
<!--                   <input type="text" name="fp_newOpenTime" id="fp_newOpenTime" class="form-control" /> -->
                  <div class="input-group">
									<input id="fp_newOpenTime" name="fp_newOpenTime" type="text"
										class="form-control" placeholder=""
										aria-describedby="basic-addon2" onclick="WdatePicker()">
									<span class="input-group-addon"><span
										class="glyphicon glyphicon-calendar"></span></span>
								</div>
                </div>
              </div>
              <div class="form-group selectDepart">
                <label class="col-xs-2 control-label">审批意见</label>
                <div class="col-xs-9">
                  <textarea class="form-control" rows="3" id="fp_suggestion" name="fp_suggestion"></textarea>
                </div>
              </div>
              <div class="col-xs-12 align_center">
                <a class="btn btn-default button" href="${ctx}/wftask/wfTaskInfoIndex">取  消</a>
                <button type="button" class="btn btn-primary submit ml_20" id="buttonAdd1"
                onclick="$('input[name=fp_appStatus]').val('back');$('input[name=fp_status]').val('1');$('input[name=fp_approvalStep]').val('6');$('input[name=fp_approvalStatus]').val('0');javascript:submitGoBack('godownForma');">回  退</button>
                <button type="button" class="btn btn-primary submit ml_20" id="buttonAdd2"
                onclick="$('input[name=fp_appStatus]').val('pass');$('input[name=fp_status]').val('1');$('input[name=fp_approvalStep]').val('8');$('input[name=fp_approvalStatus]').val('0');javascript:submitAudit('godownForma');">提  交</button>
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
        $("#fp_newOpenTime").on("click",function(e){
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
    	  var fp_isNewOpenBankcard = $("#fp_isNewOpenBankcard").val();
    	  if(fp_isNewOpenBankcard == null || fp_isNewOpenBankcard == '' || fp_isNewOpenBankcard == '0'){
    		  alert("请勾选新开银行卡是否收取  ");
    		  return false;
    	  }
    	  var fp_isNewOpenUkey = $("#fp_isNewOpenUkey").val();
    	  if(fp_isNewOpenUkey == null || fp_isNewOpenUkey == '' || fp_isNewOpenUkey == '0'){
    		  alert("请勾选新开UKEY是否收取   ");
    		  return false;
    	  }
    	  /*
    	  var fp_newOpenTime = $("#fp_newOpenTime").val();
    	  if(fp_newOpenTime == null || fp_newOpenTime == '' ){
    		  alert("请填写收取日期");
    		  return false;
    	  }
    	 */
    	 $('#buttonAdd1').attr("disabled","disabled");
    	 $('#buttonAdd2').attr("disabled","disabled");
  		document.getElementById(domId).submit();
      };
      function submitGoBack(domId){
    	  $('#buttonAdd1').attr("disabled","disabled");
     	 $('#buttonAdd2').attr("disabled","disabled");
    	  document.getElementById(domId).action = "rollback";
  		document.getElementById(domId).submit();
      };
    </script>
  </body>
</html>
       