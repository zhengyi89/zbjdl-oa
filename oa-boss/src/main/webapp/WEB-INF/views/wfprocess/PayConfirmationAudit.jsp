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
		<script language="javascript" type="text/javascript" src="http://resource.yunpal.in:8080/static/DatePicker/WdatePicker.js"></script>
  <script type="text/javascript">
  	$(function(){
  		//计算担保费
  		var fp_guaranteeFee = ${empty newwfTaskBo.sellerWfUserInfo.extend1 ? 0 : newwfTaskBo.sellerWfUserInfo.extend1} 
  							  * ${empty newwfTaskBo.wfTaskInfo.extend4 ? 0 : newwfTaskBo.wfTaskInfo.extend4} / 100
  							+ ${empty newwfTaskBo.sellerWfUserInfo.extend2 ? 0 : newwfTaskBo.sellerWfUserInfo.extend2} 
  							  * ${empty newwfTaskBo.wfTaskInfo.extend5 ? 0 : newwfTaskBo.wfTaskInfo.extend5} / 100;
  		$("#fp_guaranteeFee").val(fp_guaranteeFee.toFixed(0)); 
  	});
  </script>
  </head>
<body>
    <div id="content_2" class="content_wrapper">
      <div class="content_main">
        					<jsp:include page="includeAudit.jsp"></jsp:include>    

        <div class="panel panel-default">
          <div class="panel-heading">解押、费用收取确认相关信息</div>
          <div class="panel-body">
            <form class="cmxform form-horizontal" id="godownForma" name="godownForma" action="${ctx}/wftask/completeTask" method="post">
              <input id="taskId" name="taskId" type="hidden" value="${taskId }"/>
              	<input id="processId" name="processId" type="hidden" value="${processId }"/>
              	<input id="fp_status" name="fp_status" type="hidden" />
              	<input id="fp_approvalStep" name="fp_approvalStep" type="hidden" />
              	<input id="fp_approvalStatus" name="fp_approvalStatus" type="hidden" />
              	<input id="fp_appStatus" name="fp_appStatus" type="hidden" />
            <div class="form-group">
              <label class=" col-xs-2 control-label">当日总解押金额（元）</label>
                <div class="col-xs-3 addSpan">

                	<input type="hidden" name="fp_sellerSolutionAmount" id="fp_sellerSolutionAmount" />
                <input type="text" disabled="disabled" style="border: none;background: white;" class="form-control" id="fp_sellerSolutionAmount_temp" readonly="readonly"  placeholder="0" value="${newwfTaskBo.sellerWfUserInfo.sellerSolutionAmount }"/>
                	<span >元</span>
                </div>
                <div class="col-xs-1 tip">*</div>
                <label class=" col-xs-2 control-label">当日赎楼解押金额（元）</label>
                <div class="col-xs-3 addSpan">
                   <input type="text" class="form-control" onkeyup="javascript:addAmount(this.value);" placeholder="" value="${newwfTaskBo.sellerWfUserInfo.extend1 }" id="fp_sewfextend1" name="fp_sewfextend1"/>
                <span >元</span>
                </div>
                <div class="col-xs-1 tip"></div>
              </div>
              <div class="form-group">

              <label class=" col-xs-2 control-label">当日现金解押金额（元）</label>
                <div class="col-xs-3 addSpan">

                  <input type="text" class="form-control" onkeyup="javascript:addAmount(this.value);" placeholder="" value="${newwfTaskBo.sellerWfUserInfo.extend2 }" id="fp_sewfextend2" name="fp_sewfextend2"/>
                  <span>元</span>
                </div>
                <div class="col-xs-1 tip"></div>
                <label class=" col-xs-2 control-label checkbox">
                    <input type="checkbox" name="fp_isGuaranteeFee" id="fp_isGuaranteeFee" value="0" onchange="this.value=(fp_isGuaranteeFee.checked)?1:0"> 
                  </label>
                <div class=" col-xs-3 ">
                  <label >担保费用是否已收</label>
                </div>
                <div class="col-xs-1 tip">*</div>
              </div>
              <div class="form-group">

              <label class=" col-xs-2 control-label">担保费金额（元）</label>
                <div class="col-xs-3">
                  <input type="text" class="form-control" placeholder=""  name="fp_guaranteeFee" id="fp_guaranteeFee"/>

                </div>
                <div class="col-xs-1 tip"></div>
                <label class="col-xs-2 control-label">担保费收款日期</label>
                <div class="col-xs-3">
                  <div class="input-group">
						<input id="fp_guaranteeFeeTime" name="fp_guaranteeFeeTime" type="text"
							class="form-control" placeholder=""
							aria-describedby="basic-addon2" onclick="WdatePicker()">
						<span class="input-group-addon"><span
							class="glyphicon glyphicon-calendar"></span></span>
					</div>
                </div>
              </div>
              <div class="form-group">
              <label class=" col-xs-2 control-label checkbox">
                    <input type="checkbox" name="fp_isLoanAgreementReceived" id="fp_isLoanAgreementReceived" checked="checked" value="1" onchange="this.value=(fp_isLoanAgreementReceived.checked)?1:0"> 
                  </label>
              	<div class=" col-xs-3 ">
                  <label>借款协议是否收到</label>
                </div>
                <div class="col-xs-1 tip">*</div>
                <label class=" col-xs-2 control-label checkbox">
                    <input type="checkbox" name="fp_isReceiptReceived" id="fp_isReceiptReceived" checked="checked" value="1" onchange="this.value=(fp_isReceiptReceived.checked)?1:0"> 
                  </label>
                <div class=" col-xs-3 ">
                  <label >收条是否收到</label>
                </div>
                <div class="col-xs-1 tip">*</div>
              </div>
              <div class="form-group">
              <label class=" col-xs-2 control-label checkbox">
                    <input type="checkbox" name="fp_isBankcardReceived" id="fp_isBankcardReceived" checked="checked" value="1" onchange="this.value=(fp_isBankcardReceived.checked)?1:0"> 
                  </label>
              <div class=" col-xs-3 ">
                  <label >解押银行卡、密码、网银是否收取</label>
                </div>
                <div class="col-xs-1 tip">*</div>
                <label class="col-xs-2 control-label">收取日期</label>
                <div class="col-xs-3">
                   <div class="input-group">
						<input id="fp_loanReceivedTime" name="fp_loanReceivedTime" type="text"
							class="form-control" placeholder=""
							aria-describedby="basic-addon2" onclick="WdatePicker()">
						<span class="input-group-addon"><span
							class="glyphicon glyphicon-calendar"></span></span>
					</div>
                </div>
              </div>
              <div class="form-group">
              <label class=" col-xs-2 control-label checkbox">
                    <input type="checkbox" name="fp_isPaymentConfirm" id="fp_isPaymentConfirm" checked="checked" value="1" onchange="this.value=(fp_isPaymentConfirm.checked)?1:0"> 
                  </label>
              <div class=" col-xs-3 ">
                  <label >解押出款已确认、已确认还款时间</label>
                </div>
                <div class="col-xs-1 tip">*</div>
                <label class="col-xs-2 control-label">还款日期</label>
                <div class="col-xs-3">
                   <div class="input-group">
						<input id="fp_paymentConfirmTime" name="fp_paymentConfirmTime" type="text"
							class="form-control" placeholder=""
							aria-describedby="basic-addon2" onclick="WdatePicker()">
						<span class="input-group-addon"><span
							class="glyphicon glyphicon-calendar"></span></span>
					</div>
                </div>
                <div class="col-xs-1 tip">*</div>
              </div>
              <div class="form-group">
              <label class=" col-xs-2 control-label checkbox">
                    <input type="checkbox" name="fp_isBalanceAmount" id="fp_isBalanceAmount" value="0" onchange="this.value=(fp_isBalanceAmount.checked)?1:0"> 
                  </label>
               <div class=" col-xs-3 ">
                  <label >差额款是否已收取</label>
                </div>
                <div class="col-xs-1 tip"></div>

                 <label class="col-xs-2 control-label">差额款收款日期</label>

                <div class="col-xs-3">
                  <div class="input-group">
						<input id="fp_balanceTime" name="fp_balanceTime" type="text"
							class="form-control" placeholder=""
							aria-describedby="basic-addon2" onclick="WdatePicker()">
						<span class="input-group-addon"><span
							class="glyphicon glyphicon-calendar"></span></span>
					</div>
                </div>
              </div>
              <div class="form-group">
              <label class="col-xs-2 control-label">差额款（元）</label>
                <div class="col-xs-3">
                  <label class="control-label">
                    	${wfTaskBo.wfTaskInfo.balanceAmount }元
                  </label>
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
                onclick="$('input[name=fp_appStatus]').val('pass');$('input[name=fp_status]').val('1');$('input[name=fp_approvalStep]').val('14');$('input[name=fp_approvalStatus]').val('0');javascript:submitAudit('godownForma');">确认出款</button>
              </div>
            </form>
          </div>
        </div>
                          <jsp:include page="includeProcessHistory.jsp"></jsp:include>    
<jsp:include page="includeWfRemark.jsp"></jsp:include> 
      </div>
    </div>
    <script type="text/javascript">
      function submitAudit(domId){
    	  if(checkNull($("#fp_isLoanAgreementReceived").val())){
    		 alert("请勾选借款协议是否收到"); 
    		 return false;
    	  }
    	  if(checkNull($("#fp_isReceiptReceived").val())){
     		 alert("请勾选收条是否收到"); 
     		 return false;
     	  }
    	  if(checkNull($("#fp_isBankcardReceived").val())){
     		 alert("请勾选解押银行卡、密码、网银是否收取"); 
     		 return false;
     	  }
    	  if(checkNull($("#fp_isPaymentConfirm").val())){
     		 alert("请勾选解押出款已确认、已确认还款时间"); 
     		 return false;
     	  }
    	  if(checkNull($("#fp_isGuaranteeFee").val())){
     		 alert("请勾选担保费用是否已收"); 
     		 return false;
     	  }
    	  if(checkNull($("#fp_paymentConfirmTime").val())){
      		 alert("还款日期不能为空"); 
      		 return false;
      	  }
    	  
    	  var fp_guaranteeFee = $("#fp_guaranteeFee").val();
    	  if(fp_guaranteeFee != null && fp_guaranteeFee != ''){
    		  var regexAmount = /^(([1-9]\d*)|0)(\.(\d){1,2})?$/;// 校验金额两位小数
      		  if(!regexAmount.test(fp_guaranteeFee)){
      			 alert("担保费格式不正确");
      		     return false;
      		  }
    	  }
    	  
    	  var fp_sewfextend1 = $("#fp_sewfextend1").val();
    	  if(fp_sewfextend1 != null && fp_sewfextend1 != ''){
    		  var regexAmount = /^(([1-9]\d*)|0)(\.(\d){1,2})?$/;// 校验金额两位小数
      		  if(!regexAmount.test(fp_sewfextend1)){
      			 alert("当日赎楼解押金额格式不正确");
      		     return false;
      		  }
    	  }
    	  
    	  var fp_sewfextend2 = $("#fp_sewfextend2").val();
    	  if(fp_sewfextend2 != null && fp_sewfextend2 != ''){
    		  var regexAmount = /^(([1-9]\d*)|0)(\.(\d){1,2})?$/;// 校验金额两位小数
      		  if(!regexAmount.test(fp_sewfextend2)){
      			 alert("当日现金解押金额格式不正确");
      		     return false;
      		  }
    	  }
    	  
    	//校验
   		var fp_sewfextend1 = $("#fp_sewfextend1").val();
   		var fp_sewfextend2 = $("#fp_sewfextend2").val();
   		if(fp_sewfextend1 == '' && fp_sewfextend2 == ''){
   			alert("当日赎楼解押金额和当日现金解押金额，两项中至少填一项");
   			return false;
   		}
   		var sum = Number(fp_sewfextend1) + Number(fp_sewfextend2);
   		$("#fp_sellerSolutionAmount").val(sum);
   		
    	 $('#buttonAdd').attr("disabled","disabled");
  		document.getElementById(domId).submit();
      };
      
      function checkNull(value, msg){
    	  if(value == null || value == '' || value == '0'){
    		  return true;
    	  }
      }
      
      function addAmount (value){
    		var fp_sewfextend1 = $("#fp_sewfextend1").val();
    		var fp_sewfextend2 = $("#fp_sewfextend2").val();
    		var sum = Number(fp_sewfextend1) + Number(fp_sewfextend2);
    		if(!isNaN(sum) && sum != undefined){
    			$("#fp_sellerSolutionAmount_temp").val(sum.toFixed(2));
    			
    			//计算担保费
    			//计算担保费
    	  		var fp_guaranteeFee1 =  fp_sewfextend1 * ${empty newwfTaskBo.wfTaskInfo.extend4 ? 0 : newwfTaskBo.wfTaskInfo.extend4} / 100
    	  							+ fp_sewfextend2 * ${empty newwfTaskBo.wfTaskInfo.extend5 ? 0 : newwfTaskBo.wfTaskInfo.extend5} / 100;
    	  		$("#fp_guaranteeFee").val(fp_guaranteeFee1.toFixed(0)); 
    		}
     }
    </script>
  </body>
</html>