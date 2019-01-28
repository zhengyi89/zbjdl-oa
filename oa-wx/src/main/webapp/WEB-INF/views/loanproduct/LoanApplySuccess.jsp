<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="zh-cmn-Hans">
<head>
<title>申请后分享页</title>
<link rel="stylesheet" href="${def}/css/weui.css" />
<link rel="stylesheet" href="${def}/css/common.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/loanproduct/loanApply.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/loanproduct/jquery.qrcode.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/loanproduct/jquery.1.9.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/loanproduct/jquery.qrcode.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/loanproduct/qrcode.js"></script>
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
	<input type="hidden" id="content" name="content" value="${content}">
	<input type="hidden" id="url" name="url" value="${url}">
	<div class="weui_msg">
		<div class="weui_text_area">
			<h2 class="weui_msg_title" style="font-size: 17">分享给好友，享受额外惊喜</h2>
			<div class="loan_icon_area" id="code">
        	</div>
			<c:if test="${flag == 'success'}">
				<h2 class="weui_msg_title">您的申请已经提交成功</h2>
				<p class="weui_msg_desc">请耐心等待民生银行与您的沟通</p>
			</c:if>
			<c:if test="${flag == 'fail'}">
				<h2 class="weui_msg_title">您的提交申请失败</h2>
				<p class="weui_msg_desc">${flag_msg}</p>
			</c:if>
		</div>
		<div class="weui_opr_area">
			<p class="weui_btn_area">
				<a href="javascript:goback();" class="weui_btn weui_btn_primary" style="font-size: 18">返回</a>
			</p>
		</div>
	</div>
	<script src="${def}/js/zepto.min.js"></script>
	<script src="${def}/js/router.min.js"></script>
	<script src="${def}/js/example.js"></script>
	<script type="text/javascript">
		$('#showDialog1').on('click', function() {
			$('#dialog1').show().on('click', '.weui_btn_dialog', function() {
				$('#dialog1').off('click').hide();
			});
		});
		var wxtype = $("#type").val();
		var wxmerchant = $("#merchant").val();
		var url = $("#url").val();
		var wxcontent = url + contextPath +"/product/productInfoIndex?type="+wxtype+"&merchant="+wxmerchant;
		var content = $('#content').val();
		$('#code').qrcode({render: "canvas",
			    width: 200, //宽度
			    height:200, //高度
			    text: wxcontent}); //任意字符串
	
 		//初始化JS-SDK对象
 		var wxApi = new WechatApi();
 		var wxtitle = "民生贷款产品分享";
 		var wxdesc = "民生贷款产品";
 		var wxlink = url+contextPath+"/product/productInfoIndex?type=mortgage&merchant="+wxmerchant;
 		var wximgUrl = url+'${def}/images/house_loan.png';
 		
 		if(wxtype=='easyMortgage'){
 			wxtitle = "民生易押贷";
 			wxdesc = "100%放大、最高300万";
 			wxlink = url+contextPath+"/product/productInfoIndex?type=easyMortgage&merchant="+merchant;
 			wximgUrl = url+'${def}/images/easy_loan.png';
 		}else if(wxtype=='homeMortgage'){
 			wxtitle = "民生家庭消费贷";
 			wxdesc = "最高300万、最长20年";
 			wxlink = url+contextPath+"/product/productInfoIndex?type=homeMortgage&merchant="+merchant;
 			wximgUrl = url+'${def}/images/home_loan.png';
 		}else if(wxtype=='smallMortgage'){
 			wxtitle = "民生小微抵押贷";
 			wxdesc = "最高500万、最长10年";
 			wxlink = url+contextPath+"/product/productInfoIndex?type=smallMortgage&merchant="+merchant;
 			wximgUrl = url+'${def}/images/shop_loan.png';
 		}else if(wxtype=='weixinMortgage'){
 			wxtitle = "民生小额信用贷";
 			wxdesc = "“零”抵押、“零”担保";
 			wxlink = url+contextPath+"/product/productInfoIndex?type=weixinMortgage&merchant="+merchant;
 			wximgUrl = url+'${def}/images/weixin_loan.png';
 		}
 		//1:定义分享连接的内容
        //1:定义分享连接的内容
        var shareData = {
            title: wxtitle,
            desc: wxdesc,
            link: wxlink,
            imgUrl: wximgUrl
        };
 		wxApi.share.toFriend(shareData);
 		wxApi.share.toFriendsCircle(shareData);
 	</script>
</body>
</html>