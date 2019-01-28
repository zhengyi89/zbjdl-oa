<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
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
<link rel="stylesheet" href="${def}/app/css/warehouse.css" media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" href="${def}/app/css/wxui.css" media="screen" title="no title" charset="utf-8">
<link rel="stylesheet" href="${def}/app/css/mobiscroll.css" media="screen" title="no title" charset="utf-8">
</head>
<body>
	<div class="topbar">
		<a class="return" onclick="history.go(-1)"></a> 我要卖房 <a class="submit"
			onclick="javascript:check();">提交</a>
	</div>
	<form action="${ctx}/bussDemand/save" id="form1" method="get">
		<div class="showbox">
			<div class="submit_input">
				<input type="hidden" name="type" value="1" />
				<p>
					<input type="text" placeholder="请填写您的姓名" name="name"  id="nam"/>
				</p>
				<p>
					<input type="text" placeholder="请填写您的联系方式" name="phone" />
				</p>
				<p>
					<input type="text" placeholder="请填写您房产的所在地址" name="address" />
				</p>
				<p class="last">
					<input type="text" placeholder="房产销售金额" name="amount" />
				</p>
			</div>
			<div class="submit_text">
				<textarea  rows="8" cols="40" placeholder="其他信息"
					name="note" /></textarea>
			</div>
		</div>
		<div id="serviceMsg">
			<div class="msg"
				onclick="document.getElementById('serviceMsg').style.display='none';"></div>
			<div class="service">
				<p class="title"></p>
				<p class="text">我们的工作人员会尽快与您联系，请保持联系方式畅通</p>
				<p class="submit">
					<input type="button" value="提   交" onclick="sub();" />
				</p>
			</div>
		</div>
	</form>
	<script type="text/javascript">
		function check() {
			var result = true;
					var name = $("#nam").val().replace(/\s+/g,"");
			if (name == null || name == "") {
				alert("请输入姓名");
				$("#nam").val("");
				result = false;
			}
			if (result) {
				var phone = $("input[name='phone']").val().replace(/\s+/g,"");
				if (phone == null || phone == "") {
					alert("请输入联系方式");
					$("input[name='phone']").val("");
					result = false;
				}
				if (result) {
					var regexNum = /^[0-9]*$/;
					if (!regexNum.test(phone)) {
						alert("联系方式格式不正确");
						result = false;
					}
				}
				if (result) {
					var address = $("input[name='address']").val().replace(/\s+/g,"");
					if (address == null || address == "") {
						alert("请输入地址信息");
						$("input[name='address']").val("");
						result = false;
					}
					if (result) {
						var amount = $("input[name='amount']").val().replace(/\s+/g,"");
						if (amount == null || amount == "") {
							alert("请输入销售金额");
							$("input[name='amount']").val("");
							result = false;
						}
						if (result) {
							var regexAmount = /^(([1-9]\d{0,9})|0)(\.\d{1,2})?$/;
							if (!regexAmount.test(amount)) {
								alert("销售金额格式不正确");
								result = false;
							}
						}
					}
				}
			}
			if (result) {
				document.getElementById('serviceMsg').style.display = 'block';
			}
		}

		function sub() {
			$("#form1").submit();
		}
	</script>
</body>
</html>
