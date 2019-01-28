<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="zh-cmn-Hans">
<head>
<title>微信贷详情页</title>
<link rel="stylesheet" href="${def}/css/weui.css" />
<link rel="stylesheet" href="${def}/css/common.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/loanproduct/loanApply.js"></script>
<script type="text/javascript"
	src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js?version=20150525"></script>
<script type="text/javascript"
	src="${ext}/js/WechatApi.js?version=20150525"></script>
	<script type="text/javascript">
	var wxApi2 = new WechatApi();
	var hideMenuList = [  "menuItem:share:qq",
			"menuItem:share:weiboApp", "menuItem:share:QZone" ];
	var showMenuList = [ "menuItem:share:appMessage","menuItem:share:timeline" ];
	try {
		setInterval(function() {
			if (WeixinApi) {
				wxApi2.window.showMenuItems(showMenuList);
				wxApi2.window.hideMenuItems(hideMenuList);
			}
		}, 500)
	} catch (e) {
	}
</script>
</head>
<body>
	<script>
		var contextPath = "${pageContext.request.contextPath}";
	</script>
	<input type="hidden" id="type" name="type" value="${type}">
	<input type="hidden" id="merchant" name="merchant" value="${merchant}">
	<input type="hidden" id="url" name="url" value="${url}">
	<div class="weui_msg">
		<div class="mine_icon_area">
			<img src="${def}/images/finance_weixin_loan.png" style="max-weidth: 420px;" />
		</div>
		<div class="weui_text_area">
			<h2 class="weui_msg_title">民生小额信用贷</h2>
			<p class="weui_msg_desc">专为小微客户，“零”抵押、“零”担保</p>
		</div>
	</div>
	<div class="weui_panel weui_panel_access">
		<div class="weui_panel_hd">产品特点</div>
		<div class="weui_panel_bd">
			<div class="weui_media_box weui_media_text">
				<h4 class="weui_media_title">专为小微客户</h4>
				<p class="weui_media_desc">微信贷产品是中国民生银行福州分行专为微型企业和个体工商户开发的小额、无担保的信用授信产品</p>
			</div>
			<div class="weui_media_box weui_media_text">
				<h4 class="weui_media_title">短期小宗</h4>
				<p class="weui_media_desc">单户授信额度控制在50万元（含）以内，授信期限最长不超过1年</p>
			</div>
			<div class="weui_media_box weui_media_text">
				<h4 class="weui_media_title">通过微信申请</h4>
				<p class="weui_media_desc">客户可通过微信平台预约申请客户经理上门办理信用贷款</p>
			</div>
			<div class="weui_media_box weui_media_text">
				<h4 class="weui_media_title">无须担保</h4>
				<p class="weui_media_desc">微信之“信”，为信用无担保，真正做到“零”抵押、“零”担保</p>
			</div>
		</div>
	</div>
	<div class="weui_msg">
		<div class="weui_opr_area">
			<p class="weui_btn_area">
				<a href="javascript:toApply();" class="weui_btn weui_btn_primary" style="font-size: 18">我要申请</a>
				<!-- <a href="javascript:;" class="weui_btn weui_btn_default"
					id="showDialog1">我要分享</a> -->
			</p>
		</div>
	</div>
	<div class="weui_msg">
	</div>
	<!--BEGIN dialog1-->
	<div class="weui_dialog_alert" id="dialog1" style="display: none;">
		<div class="weui_mask"></div>
		<div class="weui_dialog">
			<div class="weui_dialog_hd">
				<strong class="weui_dialog_title">长按识别图中二维码</strong>
			</div>
			<div class="weui_dialog_bd">
				<img src="${def}/images/code.jpg" width="180px" />
			</div>
			<div class="weui_dialog_ft">
				<a href="javascript:;" class="weui_btn_dialog primary">确定</a>
			</div>
		</div>
	</div>
	<!--END dialog1-->
	<!--BEGIN dialog2-->
	<div class="weui_dialog_alert" id="dialog2" style="display: none;">
		<div class="weui_mask"></div>
		<div class="mine_mask_icon"></div>
		<div class="mine_mask_text">
			点击右上角【发送给朋友】<br />或【分享到朋友圈】
		</div>
	</div>
	<!--END dialog2-->
	<script src="${def}/js/zepto.min.js"></script>
	<script type="text/javascript">
		function isWeiXin() {
			var ua = window.navigator.userAgent.toLowerCase();
			if (ua.match(/MicroMessenger/i) == 'micromessenger') {
				return true;
			} else {
				return false;
			}
		}
		
		$('#showDialog1').on('click', function() {
			if (isWeiXin()) {
				$('#dialog2').show().on('click', function() {
					$('#dialog2').off('click').hide();
				});
			}else{
				$('#dialog1').show().on('click', '.weui_btn_dialog', function() {
					$('#dialog1').off('click').hide();
				});
			}
		});
	</script>
	<script type="text/javascript">
 		//初始化JS-SDK对象
 		var wxApi = new WechatApi();
 		var merchant = $("#merchant").val();
 		var path = $("#url").val();
 		var path_sub = '${pageContext.request.contextPath}';
 		//1:定义分享连接的内容
        //1:定义分享连接的内容
        var shareData = {
            title: '民生小额信用贷',
            desc: '“零”抵押、“零”担保',
            link: path+path_sub+"/product/productInfoIndex?type=weixinMortgage&merchant="+merchant,
            imgUrl: path+'${def}/images/weixin_loan.png'
        };
 		wxApi.share.toFriend(shareData);
 		wxApi.share.toFriendsCircle(shareData);
 	</script>
</body>
</html>