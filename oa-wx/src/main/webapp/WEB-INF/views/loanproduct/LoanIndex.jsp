<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="zh-cmn-Hans">
<head>
<title>贷款产品</title>
<link rel="stylesheet" href="${def}/css/weui.css" />
<link rel="stylesheet" href="${def}/css/common.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/loanproduct/loanApply.js"></script>
</head>
<body>
	<script>
		var contextPath = "${pageContext.request.contextPath}";
	</script>
	<input type="hidden" id="merchant" name="merchant" value="${merchant}">
	<div class="index_title">
		<img src="${def}/images/index.png" />
	</div>
	<div class="weui_panel weui_panel_access">
		<div class="weui_panel_hd">可点击下列产品名称查看详情</div>
		<div class="weui_panel_bd">
			<a href="javascript:toProduct('superiorMortgage');"
				class="weui_media_box weui_media_appmsg">
				<div class="weui_media_hd">
					<img class="weui_media_appmsg_thumb"
						src="${def}/images/weixin_youfang_s.png" alt="">
				</div>
				<div class="weui_media_bd">
					<h4 class="weui_media_title">民生优房贷</h4>
					<p class="weui_media_desc">优房在手、一闪即货</p>
				</div>
			</a>
			<a href="javascript:toProduct('mortgage');"
				class="weui_media_box weui_media_appmsg">
				<div class="weui_media_hd">
					<img class="weui_media_appmsg_thumb"
						src="${def}/images/house_loan_s.png" alt="">
				</div>
				<div class="weui_media_bd">
					<h4 class="weui_media_title">民生按揭贷</h4>
					<p class="weui_media_desc">额度高、周期长、费率低</p>
				</div>
			</a> <a href="javascript:toProduct('smallMortgage');"
				class="weui_media_box weui_media_appmsg">
				<div class="weui_media_hd">
					<img class="weui_media_appmsg_thumb"
						src="${def}/images/shop_loan_s.png" alt="">
				</div>
				<div class="weui_media_bd">
					<h4 class="weui_media_title">民生小微抵押贷</h4>
					<p class="weui_media_desc">最高500万、最长10年</p>
				</div>
			</a> <a href="javascript:toProduct('easyMortgage');"
				class="weui_media_box weui_media_appmsg">
				<div class="weui_media_hd">
					<img class="weui_media_appmsg_thumb"
						src="${def}/images/easy_loan_s.png" alt="">
				</div>
				<div class="weui_media_bd">
					<h4 class="weui_media_title">民生易押贷</h4>
					<p class="weui_media_desc">100%放大、最高300万</p>
				</div>
			</a> <a href="javascript:toProduct('homeMortgage');"
				class="weui_media_box weui_media_appmsg">
				<div class="weui_media_hd">
					<img class="weui_media_appmsg_thumb"
						src="${def}/images/home_loan_s.png" alt="">
				</div>
				<div class="weui_media_bd">
					<h4 class="weui_media_title">民生家庭消费贷</h4>
					<p class="weui_media_desc">最高300万、最长20年</p>
				</div>
			</a> <a href="javascript:toProduct('weixinMortgage');"
				class="weui_media_box weui_media_appmsg">
				<div class="weui_media_hd">
					<img class="weui_media_appmsg_thumb"
						src="${def}/images/weixin_loan_s.png" alt="">
				</div>
				<div class="weui_media_bd">
					<h4 class="weui_media_title">民生小额信用贷</h4>
					<p class="weui_media_desc">“零”抵押、“零”担保</p>
				</div>
			</a>
		</div>
	</div>
	<script src="${def}/js/zepto.min.js"></script>
	<script type="text/javascript">
		$('#showDialog1').on('click', function() {
			$('#dialog1').show().on('click', '.weui_btn_dialog', function() {
				$('#dialog1').off('click').hide();
			});
		});
	</script>
</body>
</html>