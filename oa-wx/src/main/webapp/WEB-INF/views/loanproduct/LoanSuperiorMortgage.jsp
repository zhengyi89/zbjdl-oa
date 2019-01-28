<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="zh-cmn-Hans">
<head>
<title>优房贷申请页</title>
<link rel="stylesheet" href="${def}/css/weui.css" />
<link rel="stylesheet" href="${def}/css/common.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/loanproduct/loanApply.js"></script>
</head>
<body>
	<script>
		var contextPath = "${pageContext.request.contextPath}";
	</script>
	<input type="hidden" id="type" name="type" value="${type}">
	<input type="hidden" id="merchant" name="merchant" value="${merchant}">
	<div class="weui_msg">
		<div class="weui_opr_area">
			<p class="weui_btn_area">
				<a href="javascript:goLoan(0);" class="weui_btn weui_btn_primary" style="font-size: 18">上班族消费贷</a>
				<a href="javascript:goLoan(1);" class="weui_btn weui_btn_primary" style="font-size: 18">企业主经营贷</a>
			</p>
		</div>
	</div>
	
	<!--END dialog1-->
	<script src="${def}/js/zepto.min.js"></script>
	<script src="${def}/js/router.min.js"></script>
	<script src="${def}/js/example.js"></script>
	<script type="text/javascript">
		function goLoan(type){
			//localStorage.applyType = type;
			window.location.href='https://yfsdfuz.cmbc.com.cn/wxp/yfsd/page/diyawu.html?v=1.3.1';
		}
	</script>
</body>
</html>