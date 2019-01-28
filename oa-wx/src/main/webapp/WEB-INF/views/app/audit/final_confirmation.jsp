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
    <link rel="stylesheet" href="${def}/app/css/warehouse.css" media="screen" title="no title" charset="utf-8"/>
    <link rel="stylesheet" href="${def}/app/css/wxui.css" media="screen" title="no title" charset="utf-8">
    <link rel="stylesheet" href="${def}/app/css/mobiscroll.css" media="screen" title="no title" charset="utf-8">
  </head>
  <body>
    <div class="topbar">
      <a class="return" onclick="history.go(-1)"></a>
     终审确认
    </div>
    <div class="showbox">
    	<form class="cmxform form-horizontal" id="godownForma" name="godownForma" action="${ctx}/app/completeTask" method="post">
    		<div class="submit_input">
              <input id="taskId" name="taskId" type="hidden" value="${wfTask.wfTaskInfo.id }"/>
              	<input id="processId" name="processId" type="hidden" value="${wfTask.wfTaskInfo.workflowId }"/>
              	<input id="fp_status" name="fp_status" type="hidden" />
              	<input id="fp_approvalStep" name="fp_approvalStep" type="hidden" />
              	<input id="fp_approvalStatus" name="fp_approvalStatus" type="hidden" />
              	<input id="fp_appStatus" name="fp_appStatus" type="hidden" />
              	
              	<input name="fp_isFinalPass" id="fp_isFinalPass" value="1" type="hidden" />
				<p class="selectRadio ed" name="fp_isFinalPass1" id="fp_isFinalPass1" selected="selected" onclick="toggleRadio(this);">终审通过*</p>
			</div>
              
            <div class="submit_text">
				<textarea id="fp_suggestion" name="fp_suggestion" rows="8" cols="40" placeholder="请输入处理意见或备注" /></textarea>
			</div>

			<div class="submit_box">
				<p class="submit">
					<input type="button" value="提  交"
						onclick="$('input[name=fp_appStatus]').val('pass');$('input[name=fp_status]').val('1');$('input[name=fp_approvalStep]').val('13');$('input[name=fp_approvalStatus]').val('0');javascript:submitAudit('godownForma');">
				</p>
			</div>
            </form>
    </div>
    <script type="text/javascript" src="${def}/app/js/mobiscroller.js"></script>
    <script type="text/javascript" src="${def}/app/js/dateformat.js"></script>
	<script type="text/javascript">
		function toggleRadio(obj) {
			if ($(obj).hasClass("ed")) {
				$("#fp_isFinalPass").val("0");
				$(obj).removeClass("ed");
				$(obj).removeAttr("selected");
			} else {
				$("#fp_isFinalPass").val("1");
				$(obj).addClass("ed");
				$(obj).attr("selected", "selected");
			}
		}

		function submitAudit(domId) {
			var fp_isFinalPass = $("#fp_isFinalPass").val();
			if (fp_isFinalPass == null || fp_isFinalPass == ''
					|| fp_isFinalPass == '0') {
				alert("请勾选终审通过  ");
				return false;
			}
			document.getElementById(domId).submit();
		};
	</script>
</body>
</html>
