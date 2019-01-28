<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
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
<link rel="stylesheet" href="${def}/app/css/warehouse.css" media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" href="${def}/app/css/wxui.css" media="screen" title="no title" charset="utf-8">
</head>
<body>
	<div class="topbar">
		<a class="return" onclick="history.go(-1)"></a> 资信审核
	</div>
	<div class="showbox">
		<form id="godownForma" name="godownForma" action="${ctx}/app/completeTask" method="post">
			<div class="submit_input">
				<input id="taskId" name="taskId" type="hidden" value="${wfTask.wfTaskInfo.id }"/>
	           	<input id="processId" name="processId" type="hidden" value="${wfTask.wfTaskInfo.workflowId }"/>
	           	<input id="fp_sellerSolutionAmount" name="fp_sellerSolutionAmount" type="hidden" value="${wfTask.sellerWfUserInfo.sellerSolutionAmount }"/>
	           	<input id="fp_sellerBussinessType" name="fp_sellerBussinessType" type="hidden" value="${wfTask.sellerWfUserInfo.sellerBussinessType }"/>
              	<input id="fp_isSpecialBusiness" name="fp_isSpecialBusiness" type="hidden" value="${wfTask.wfTaskInfo.isSpecialBusiness }"/>
	           	<input id="fp_status" name="fp_status" type="hidden" />
	           	<input id="fp_approvalStep" name="fp_approvalStep" type="hidden" />
	           	<input id="fp_approvalStatus" name="fp_approvalStatus" type="hidden" />
	           	<input id="fp_appStatus" name="fp_appStatus" type="hidden" />
	           	
	           	<input name="fp_isCreditinvest" id="fp_isCreditinvest" value="1" type="hidden" />
				<input name="fp_isIntermStandard" id="fp_isIntermStandard" value="1" type="hidden" />
				
				<p class="selectRadio ed" name="fp_isCreditinvest1" id="fp_isCreditinvest1" selected="selected"
					onclick="toggleRadio(this);">资信调查通过*</p>
				<p class="selectRadio ed" name="fp_isIntermStandard1" id="fp_isIntermStandard1" selected="selected"
					onclick="toggleRadio1(this);">中介已约定收费标准*</p>

				<p>
					<input type="text" name="fp_intermStandardFee" id="fp_intermStandardFee" placeholder="请填写代办服务费（元）" />
				</p>
			</div>

			<input id="fp_isApproved" name="fp_isApproved" type="hidden" />

			<div class="submit_text">
				<textarea id="fp_suggestion" name="fp_suggestion" rows="8" cols="40"
					placeholder="请输入处理意见或备注" /></textarea>
			</div>

			<div class="submit_box">
				<p class="primary">
					<input type="button" name="name" value="不通过"
						onclick="$('input[name=fp_appStatus]').val('nopass');$('input[name=fp_isApproved]').val('false');$('input[name=fp_status]').val('7');$('input[name=fp_approvalStep]').val('1');$('input[name=fp_approvalStatus]').val('2');javascript:submitAudit('godownForma');">
				</p>
				<p class="submit">
					<input type="button" name="name" value="通过"
						onclick="$('input[name=fp_appStatus]').val('pass');$('input[name=fp_isApproved]').val('true');$('input[name=fp_status]').val('1');$('input[name=fp_approvalStep]').val('4');$('input[name=fp_approvalStatus]').val('0');javascript:submitAudit('godownForma');">
				</p>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		function toggleRadio(obj) {
			if ($(obj).hasClass("ed")) {
				$("#fp_isCreditinvest").val("0");
				$(obj).removeClass("ed");
				$(obj).removeAttr("selected");
			} else {
				$("#fp_isCreditinvest").val("1");
				$(obj).addClass("ed");
				$(obj).attr("selected", "selected");
			}
		}
		
		function toggleRadio1(obj) {
			if ($(obj).hasClass("ed")) {
				$("#fp_isIntermStandard").val("0");
				$(obj).removeClass("ed");
				$(obj).removeAttr("selected");
			} else {
				$("#fp_isIntermStandard").val("1");
				$(obj).addClass("ed");
				$(obj).attr("selected", "selected");
			}
		}
	
	    function handlingFlow(id, approve){
			window.location.href= "${ctx}/app/flow/list/"+id+"/"+approve;
		}
	    
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
	    	  var fp_isApproved = $("#fp_isApproved").val();
	    	  if(fp_isApproved == 'true' && (fp_sellerSolutionAmount >= 1000000 || fp_sellerBussinessType == '0')){
	    		  $("#fp_approvalStep").val("3");
	    	  }
	  		document.getElementById(domId).submit();
	      };
    </script>
</body>
</html>
