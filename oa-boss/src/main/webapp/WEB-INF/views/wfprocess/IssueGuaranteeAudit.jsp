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
          <div class="panel-heading">出具保函相关信息</div>
          <div class="panel-body">
            <form class="cmxform form-horizontal" id="godownForma" name="godownForma" action="${ctx}/wftask/completeTask" method="post">
              <input id="taskId" name="taskId" type="hidden" value="${taskId }"/>
              	<input id="processId" name="processId" type="hidden" value="${processId }"/>
              	<input id="fp_status" name="fp_status" type="hidden" />
              	<input id="fp_approvalStep" name="fp_approvalStep" type="hidden" />
              	<input id="fp_approvalStatus" name="fp_approvalStatus" type="hidden" />
              	<input id="fp_appStatus" name="fp_appStatus" type="hidden" />
              	<input id="sellerBussinessType_hidden" type="hidden" value="${wfTaskBo.sellerWfUserInfo.sellerBussinessType}"/>
              <div class="form-group">
                <div class="col-xs-offset-2 col-xs-3 checkbox">
                  <label>
                  	<c:if test="${wfTaskBo.sellerWfUserInfo.sellerBussinessType == '1'}">
                  		<input type="checkbox" name="fp_isIssueGuarantee" id="fp_isIssueGuarantee" checked="checked" value="1" onchange="this.value=(fp_isIssueGuarantee.checked)?1:0"> 是否出具保函
                  	</c:if>
                  	<c:if test="${wfTaskBo.sellerWfUserInfo.sellerBussinessType != '1'}">
                  		<input type="checkbox" name="fp_isIssueGuarantee" id="fp_isIssueGuarantee" value="0" onchange="this.value=(fp_isIssueGuarantee.checked)?1:0"> 是否出具保函
                  	</c:if>
                  </label>
                </div>
                <div class="col-xs-1 tip">*</div>
              </div>
              <div class="form-group">
                <label class="col-xs-2 control-label">出具时间</label>
                <div class="col-xs-3">
<!--                   <input type="text" name="fp_issueGuaranteeTime" id="fp_issueGuaranteeTime" class="form-control" /> -->
                    <div class="input-group">
									<input id="fp_issueGuaranteeTime" name="fp_issueGuaranteeTime" type="text"
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
                <button type="button" class="btn btn-primary submit ml_20" id="buttonAdd"
                onclick="$('input[name=fp_appStatus]').val('pass');$('input[name=fp_status]').val('1');$('input[name=fp_approvalStep]').val('10');$('input[name=fp_approvalStatus]').val('0');javascript:submitAudit('godownForma');">提  交</button>
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
        $("#fp_issueGuaranteeTime").on("click",function(e){
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
    	  
    	  var sellerBussinessType_hidden = $("#sellerBussinessType_hidden").val();
    	  var fp_isIssueGuarantee = $("#fp_isIssueGuarantee").val();
    	  if(sellerBussinessType_hidden == '1' && (fp_isIssueGuarantee == null || fp_isIssueGuarantee == '' || fp_isIssueGuarantee == '0')) {
    		  alert("请勾选是否出具保函   ");
    		  return false;
    	  }
    	  
    	  /*
    	  var fp_isIssueGuarantee = $("#fp_isIssueGuarantee").val();
    	  var fp_issueGuaranteeTime = $("#fp_issueGuaranteeTime").val();
    	  if(fp_isIssueGuarantee == '1' && (fp_issueGuaranteeTime == null || fp_issueGuaranteeTime == '') ){
    		  alert("请填写出具时间");
    		  return false;
    	  }
    	 */
    	 $('#buttonAdd').attr("disabled","disabled");
  		document.getElementById(domId).submit();
      };
    </script>
  </body>
</html>