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
   风控审核
    </div>
	<div class="showbox">
		<form id="godownForma" name="godownForma"
			action="${ctx}/app/completeTask" method="post">
			<div class="submit_input">
				<input id="taskId" name="taskId" type="hidden" value="${wfTask.wfTaskInfo.id }"/>
	         	<input id="processId" name="processId" type="hidden" value="${wfTask.wfTaskInfo.workflowId }"/>
	         	<input id="fp_isRiskApproved" name="fp_isRiskApproved" type="hidden"/>
	         	<input id="fp_status" name="fp_status" type="hidden" />
	         	<input id="fp_approvalStep" name="fp_approvalStep" type="hidden" />
	         	<input id="fp_approvalStatus" name="fp_approvalStatus" type="hidden" />
	         	<input id="fp_risker" name="fp_risker" type="hidden" value="${loginName }"/>
	         	<input id="fp_appStatus" name="fp_appStatus" type="hidden" />
	         	
				<input id="fp_isSellerSituation" name="fp_isSellerSituation" value="1" type="hidden" />
				<p class="selectRadio ed" name="fp_isSellerSituation1" selected="selected"
					id="fp_isSellerSituation1" onclick="toggleRadio(this);">了解卖方实际情况*</p>
			</div>
			
			<div class="submit_text">
				<textarea id="fp_suggestion" name="fp_suggestion" rows="8"
					cols="40" placeholder="请输入处理意见或备注" /></textarea>
			</div>

			<div class="submit_box">
				<p class="primary">
					<input type="button" value="不通过"
						onclick="$('input[name=fp_appStatus]').val('nopass');$('input[name=fp_isRiskApproved]').val('false');$('input[name=fp_status]').val('8');$('input[name=fp_approvalStep]').val('1');$('input[name=fp_approvalStatus]').val('2');javascript:submitAudit('godownForma');">
				</p>
				<p class="submit">
					<input type="button" value="通过"
						onclick="$('input[name=fp_appStatus]').val('pass');$('input[name=fp_isRiskApproved]').val('true');$('input[name=fp_status]').val('1');$('input[name=fp_approvalStep]').val('4');$('input[name=fp_approvalStatus]').val('0');javascript:submitAudit('godownForma');">
				</p>
			</div>

		</form>
	</div>
	<script type="text/javascript">
    
		function toggleRadio(obj) {
			if ($(obj).hasClass("ed")) {
				$("#fp_isSellerSituation").val("0");
				$(obj).removeClass("ed");
				$(obj).removeAttr("selected");
			} else {
				$("#fp_isSellerSituation").val("1");
				$(obj).addClass("ed");
				$(obj).attr("selected", "selected");
			}
		}

		$("#optionMsg").find("p.selectRadio").on("click", function() {
			$("#optionMsg").find("p.selectRadio").each(function(index) {
				$(this).removeClass("ed");
			});
			$(this).addClass("ed");
			$("#optionSelect").text($(this).text());
			$("#optionMsg").hide();
		});

		function submitAudit(domId) {
			var isCreditinvest = $("#fp_isSellerSituation").val();
			if (isCreditinvest == null || isCreditinvest == ''
					|| isCreditinvest == '0') {
				alert("请勾选了解卖方实际情况");
				return false;
			}
			
			document.getElementById(domId).submit();
		};
	</script>
  </body>
</html>
