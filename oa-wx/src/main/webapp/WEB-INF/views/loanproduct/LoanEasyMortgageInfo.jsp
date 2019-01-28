<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="zh-cmn-Hans">
<head>
<title>易押贷详情页</title>
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
			<img src="${def}/images/finance_easy_loan.png"/>
		</div>
		<div class="weui_text_area">
			<h2 class="weui_msg_title">民生易押贷</h2>
			<p class="weui_msg_desc">100%放大、最高300万</p>
		</div>
	</div>
	<div class="weui_panel weui_panel_access">
		<div class="weui_panel_hd">产品特点</div>
		<div class="weui_panel_bd">
			<div class="weui_media_box weui_media_text">
				<h4 class="weui_media_title">连带担保</h4>
				<p class="weui_media_desc">优质小微客户可由其名下所经营企业提供连带担保</p>
			</div>
			<div class="weui_media_box weui_media_text">
				<h4 class="weui_media_title">100%放大</h4>
				<p class="weui_media_desc">普通住房抵押率可放大至100%</p>
			</div>
			<div class="weui_media_box weui_media_text">
				<h4 class="weui_media_title">无须转贷</h4>
				<p class="weui_media_desc">额度最高300万、3年/5年期单笔贷款、无须转贷</p>
			</div>
			<div class="weui_media_box weui_media_text">
				<h4 class="weui_media_title">免费评估</h4>
				<p class="weui_media_desc">可提供免费在线评估</p>
			</div>
			<div class="weui_media_box weui_media_text">
				<h4 class="weui_media_title">多种还款方式</h4>
				<p class="weui_media_desc">支持等额本金/等额本息期供还款方式</p>
			</div>
			<div class="weui_media_box weui_media_text">
				<h4 class="weui_media_title">亲属住房抵押</h4>
				<p class="weui_media_desc">接受客户本人/配偶/成年子女/双方父母或兄弟姐妹的名下住房作为抵押物</p>
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
            title: '民生易押贷',
            desc: '100%放大、最高300万',
            link: path+path_sub+"/product/productInfoIndex?type=easyMortgage&merchant="+merchant,
            imgUrl: path+'${def}/images/easy_loan.png'
        };
 		wxApi.share.toFriend(shareData);
 		wxApi.share.toFriendsCircle(shareData);
 	</script>
</body>
</html>
