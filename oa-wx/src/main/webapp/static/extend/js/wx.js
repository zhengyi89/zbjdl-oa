/**
 * 微信分享
 * 
	shareData = {
		"imgUrl" 		: "${def}${message.getImageUrl()}",
		"imgWdith"		: ${message.getImageWidth()},
		"imgHeight"		: ${message.getImageHeight()},
		"timeLineLink" 	: "${ctx}${message.getCircleLink()}/${batch.getBatchEncNo()}",
		"tTitle" 		: "${message.getCircleTitle()}",
		"tContent" 		: "${message.getCircleContent()}",
		"sendFriendLink": "${ctx}${message.getFriendLink()}/${batch.getBatchEncNo()}",
		"fTitle" 		: "${message.getFriendTitle()}",
		"fContent" 		: "${message.getFriendContent()}",
		"weiboLink" 	: "${ctx}${message.getWeiboLink()}/${batch.getBatchEncNo()}",
		"wContent"  	: "${message.getWeiboContent()}",
		"shareCallBack" : null
	};
 */
var share = function(shareData) {
	document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
		WeixinJSBridge.call('showOptionMenu');
		// 发送给好友
		WeixinJSBridge.on('menu:share:appmessage', function() {
			WeixinJSBridge.invoke('sendAppMessage', {
				"appid" : Share.appid ? Share.appid : "",
				"img_url" : shareData.imgUrl,
				"img_width" : shareData.imgWdith,
				"img_height" : shareData.imgHeight,
				"link" : shareData.sendFriendLink,
				"desc" : shareData.fContent,
				"title" : shareData.fTitle
			}, function(res) {
				if(shareData.shareCallBack){
					shareData.shareCallBack(res);
				}
			});
		});

		// 分享到朋友圈
		WeixinJSBridge.on('menu:share:timeline', function() {
			WeixinJSBridge.invoke('shareTimeline', {
				"appid" : Share.appid ? Share.appid : "",
				"img_url" : shareData.imgUrl,
				"img_width" : shareData.imgWdith,
				"img_height" : shareData.imgHeight,
				"link" : shareData.timeLineLink,
				"desc" : shareData.tContent,
				"title" : shareData.tTitle
			}, function(res) {
				if(shareData.shareCallBack){
					shareData.shareCallBack(res);
				}
			});
		});
	}, false);
}


/**
 * 判断是否是在微信浏览器中打开
 */
var openInWeixin = function() {
	return /MicroMessenger/i.test(navigator.userAgent);
}

/**
 * 显示网页右上角的按钮
 */
function showOptionMenu() {
	try {
		if(WeixinJSBridge){
			WeixinJSBridge.call('showOptionMenu');
		}
	} catch (e){}
};


/**
 * ! 微信内置浏览器的Javascript API，功能包括：
 * 
 * 1、获取当前的网络状态 
 * 2、调起微信客户端的图片播放组件 
 * 3、判断当前网页是否在微信内置浏览器中打开 
 * 4、增加打开扫描二维码
 */
var WeixinApi = (function() {
	/**
	 * 关闭当前微信公众平台页面
	 * 
	 * @param {Object}
	 *            callbacks 回调方法
	 * @p-config {Function} fail(resp) 失败
	 * @p-config {Function} success(resp) 成功
	 */
	function closeWindow(callbacks) {
		callbacks = callbacks || {};
		if (openInWeixin()) {
			WeixinJSBridge.invoke("closeWindow", {}, function(resp) {
				switch (resp.err_msg) {
					// 关闭成功
					case 'close_window:ok' :
						callbacks.success && callbacks.success(resp);
						break;

					// 关闭失败
					default :
						callbacks.fail && callbacks.fail(resp);
						break;
				}
			});
		}
	}
	
	/**
	 * 调起微信Native的图片播放组件。 这里必须对参数进行强检测，如果参数不合法，直接会导致微信客户端crash
	 * 
	 * @param {String}
	 *            curSrc 当前播放的图片地址
	 * @param {Array}
	 *            srcList 图片地址列表
	 */
	function imagePreview(curSrc, srcList) {
		if (!curSrc || !srcList || srcList.length == 0) {
			return;
		}
		WeixinJSBridge.invoke('imagePreview', {
			'current' : curSrc,
			'urls' : srcList
		});
	};

	
	/**
	 * 隐藏网页右上角的按钮
	 */
	function hideOptionMenu() {
		WeixinJSBridge.call('hideOptionMenu');
	}

	/**
	 * 显示底部工具栏
	 */
	function showToolbar() {
		WeixinJSBridge.call('showToolbar');
	}

	/**
	 * 显示底部工具栏
	 */
	function hideToolbar() {
		WeixinJSBridge.call('showToolbar');
	}

	/**
	 * 隐藏底部工具栏
	 */
	function hideToolbar() {
		WeixinJSBridge.call('hideToolbar');
	}

	/**
	 * 返回如下几种类型：
	 * 
	 * network_type:wifi wifi网络 network_type:edge 非wifi,包含3G/2G
	 * network_type:fail 网络断开连接 network_type:wwan 2g或者3g
	 * 
	 * 使用方法： WeixinApi.getNetworkType(function(networkType){
	 * 
	 * });
	 * 
	 * @param callback
	 */
	function getNetworkType(callback) {
		if (callback && typeof callback == 'function') {
			WeixinJSBridge.invoke('getNetworkType', {}, function(e) {
				// 在这里拿到e.err_msg，这里面就包含了所有的网络类型
				callback(e.err_msg);
			});
		}
	}

	/**
	 * 关闭当前微信公众平台页面
	 * 
	 * @param {Object}
	 *            callbacks 回调方法
	 * @p-config {Function} fail(resp) 失败
	 * @p-config {Function} success(resp) 成功
	 */
	function closeWindow(callbacks) {
		try {
			callbacks = callbacks || {};
			if(WeixinJSBridge){
				WeixinJSBridge.invoke("closeWindow", {}, function(resp) {
					switch (resp.err_msg) {
						// 关闭成功
						case 'close_window:ok' :
							callbacks.success && callbacks.success(resp);
							break;
		
						// 关闭失败
						default :
							callbacks.fail && callbacks.fail(resp);
							break;
					}
				});
			}
		} catch (e){}
	}

	/**
	 * 当页面加载完毕后执行，使用方法： WeixinApi.ready(function(Api){ // 从这里只用Api即是WeixinApi
	 * });
	 * 
	 * @param readyCallback
	 */
	function wxJsBridgeReady(readyCallback) {
		if (readyCallback && typeof readyCallback == 'function') {
			var Api = this;
			var wxReadyFunc = function() {
				readyCallback(Api);
			};
			if (typeof window.WeixinJSBridge == "undefined") {
				if (document.addEventListener) {
					document.addEventListener('WeixinJSBridgeReady',wxReadyFunc, false);
				} else if (document.attachEvent) {
					document.attachEvent('WeixinJSBridgeReady', wxReadyFunc);
					document.attachEvent('onWeixinJSBridgeReady', wxReadyFunc);
				}
			} else {
				wxReadyFunc();
			}
		}
	}

	/**
	 * 判断当前网页是否在微信内置浏览器中打开
	 */
	function openInWeixin() {
		return /MicroMessenger/i.test(navigator.userAgent);
	}

	/*
	 * 打开扫描二维码 @param {Object} callbacks 回调方法 @p-config {Function} fail(resp) 失败
	 * @p-config {Function} success(resp) 成功
	 */
	function scanQRCode(callbacks) {
		callbacks = callbacks || {};
		WeixinJSBridge.invoke("scanQRCode", {}, function(resp) {
			switch (resp.err_msg) {
				// 打开扫描器成功
				case 'scan_qrcode:ok' :
					callbacks.success && callbacks.success(resp);
					break;

				// 打开扫描器失败
				default :
					callbacks.fail && callbacks.fail(resp);
					break;
			}
		});
	}

	return {
		version : "2.3",
		ready : wxJsBridgeReady,
		hideOptionMenu : hideOptionMenu,
		showToolbar : showToolbar,
		hideToolbar : hideToolbar,
		getNetworkType : getNetworkType,
		imagePreview : imagePreview,
		closeWindow : closeWindow,
		openInWeixin : openInWeixin,
		scanQRCode : scanQRCode
	};
})();
