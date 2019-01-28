<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ page import="com.zbjdl.common.utils.config.TextResource" %>
<html>
  <head>
    <title>中天房管家</title>
	<script type="text/javascript" src="${ctx}/static/js/BusinessCode.js"></script>
  </head>
<body>
    <div id="content_2" class="content_wrapper">
      <div class="content_main">
      
        <jsp:include page="includeCredit.jsp"></jsp:include>
        
        <div class="panel panel-default">
          <div class="panel-heading">审核事项及审核意见</div>
          <div class="panel-body">
            <form class="cmxform form-horizontal" id="godownForma" name="godownForma" action="${ctx}/wftask/completeTask" method="post">
              	<input id="taskId" name="taskId" type="hidden" value="${taskId }"/>
              	<input id="processId" name="processId" type="hidden" value="${processId }"/>
              	<input id="fp_sellerSolutionAmount" name="fp_sellerSolutionAmount" type="hidden" value="${wfTaskBo.sellerWfUserInfo.sellerSolutionAmount }"/>
              	<input id="fp_sellerBussinessType" name="fp_sellerBussinessType" type="hidden" value="${wfTaskBo.sellerWfUserInfo.sellerBussinessType }"/>
              	<input id="fp_isSpecialBusiness" name="fp_isSpecialBusiness" type="hidden" value="${wfTaskBo.wfTaskInfo.isSpecialBusiness }"/>
              	<input id="fp_status" name="fp_status" type="hidden" />
              	<input id="fp_approvalStep" name="fp_approvalStep" type="hidden" />
              	<input id="fp_approvalStatus" name="fp_approvalStatus" type="hidden" />
              	<input id="fp_appStatus" name="fp_appStatus" type="hidden" />
              <div class="form-group">
                <div class="col-xs-offset-1 col-xs-2 checkbox">
                  <label>
                    <input type="checkbox" name="fp_isCreditinvest" id="fp_isCreditinvest" checked="checked" value="1" onchange="this.value=(fp_isCreditinvest.checked)?1:0"> 资信调查通过
                  </label>
                </div>
                <div class="col-xs-1 tip">*</div>
                <div class="col-xs-2 checkbox">
                  <label>
                    <input type="checkbox" name="fp_isIntermStandard" id="fp_isIntermStandard" checked="checked" value="1" onchange="this.value=(fp_isIntermStandard.checked)?1:0"> 中介已约定收费标准
                  </label>
                </div>
                <div class="col-xs-1 tip">*</div>
                <div class="col-xs-3 addSpan">
                  <input type="text" class="form-control" placeholder="" name="fp_intermStandardFee" id="fp_intermStandardFee">
                  <span>元</span>
                </div>
              </div>
              <div class="form-group selectDepart">
                <label class="col-xs-2 control-label">审核意见</label>
                <div class="col-xs-8">
                  <textarea class="form-control" rows="3" id="fp_suggestion" name="fp_suggestion"></textarea>
                </div>
              </div>
              <input id="fp_isApproved" name="fp_isApproved" type="hidden"/>
              <div class="col-xs-12 align_center">
                <button type="button" class="btn btn-primary submit ml_20" id="buttonAdd1"
                onclick="$('input[name=fp_appStatus]').val('nopass');$('input[name=fp_isApproved]').val('false');$('input[name=fp_status]').val('7');$('input[name=fp_approvalStep]').val('1');$('input[name=fp_approvalStatus]').val('2');javascript:submitAuditNoPass('godownForma');">不通过</button>
                <button type="button" class="btn btn-primary submit ml_20"  id="buttonAdd2"
                onclick="$('input[name=fp_appStatus]').val('pass');$('input[name=fp_isApproved]').val('true');$('input[name=fp_status]').val('1');$('input[name=fp_approvalStep]').val('4');$('input[name=fp_approvalStatus]').val('0');javascript:submitAudit('godownForma');">通过</button>
              </div>
            </form>
          </div>
        </div>
      
  <jsp:include page="includeProcessHistory.jsp"></jsp:include>    
      <jsp:include page="includeWfRemark.jsp"></jsp:include> 
      </div>
    </div>
    <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
            <h4 class="modal-title" id="myLargeModalLabel"></h4>
          </div>
          <div class="modal-body align_center">
            <img src=""/>
          </div>
        </div>
      </div>
    </div>
    <script type="text/javascript">
      $("a.in_table").on("click",function(){
        $("h4.modal-title").text($(this).attr("data-title"));
        if($(this).attr("data-src") == null || $(this).attr("data-src") == ''){
        	alert("没有上传图片");
        	return false;
        }else{
        	$("div.modal-body").find("img").attr("src",$(this).attr("data-src"));
        }
      });
      
      function submitAudit(domId){
    	  var isCreditinvest = $("#fp_isCreditinvest").val();
    	  if(isCreditinvest == null || isCreditinvest == '' || isCreditinvest == '0'){
    		  alert("请勾选资信调查通过");
    		  return false;
    	  }
    	  var isIntermStandard = $("#fp_isIntermStandard").val();
    	  if(isIntermStandard == null || isIntermStandard == '' || isIntermStandard == '0'){
    		  alert("请勾选中介已约定收费标准");
    		  return false;
    	  }
    	  
    	  var intermStandardFee = $("#fp_intermStandardFee").val();
    	  
    	  if(intermStandardFee != null && intermStandardFee != ''){
    		  var regexAmount = /^(([1-9]\d*)|0)(\.(\d){1,2})?$/;// 校验金额两位小数
      		  if(!regexAmount.test(intermStandardFee)){
      			 alert("金额格式不正确");
      		     return false;
      		  }
    	  }
    	  
    	  //判断流程流转的步骤
    	  var fp_sellerSolutionAmount = $("#fp_sellerSolutionAmount").val();
    	  var fp_sellerBussinessType = $("#fp_sellerBussinessType").val();
    	  var fp_isSpecialBusiness = $("#fp_isSpecialBusiness").val();
    	  var fp_isApproved = $("#fp_isApproved").val();
    	  if(fp_isApproved == 'true' && (fp_isSpecialBusiness == '1' || fp_sellerBussinessType == '0' || ( fp_sellerSolutionAmount >= 1000000 && fp_sellerBussinessType == '1'))){
    		  $("#fp_approvalStep").val("3");
    	  }
    	  $('#buttonAdd2').attr("disabled","disabled");
    	  $('#buttonAdd1').attr("disabled","disabled");
  		document.getElementById(domId).submit();
      };
      
      function submitAuditNoPass(domId){
    	  $('#buttonAdd1').attr("disabled","disabled");
    	  $('#buttonAdd2').attr("disabled","disabled");
  		document.getElementById(domId).submit();
      };
      
      function download(value){
    	  if(value == null || value == ''){
    		alert("没有上传文件");
    	  }else{
    		  window.location = "${ctx}/wftask/download?fileName=" + value;
    	  }
      }
    </script>
  </body>
</html>
  