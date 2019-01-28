/*
 * 注意：WechatApi对象使用时，需要进行新建操作进行签到，否则无法正常使用：
 *	<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
 *	<script type="text/javascript" src="${ext}/js/WechatApi.js?version=202e"></script>
 *	var wxApi = new WechatApi();
 */
function WechatApi(){
	var def = {
		debug: false,
		appId: null,
		timestamp: null,
		nonceStr: null,
		signature: null,
		jsApiList: ['checkJsApi','onMenuShareTimeline','onMenuShareAppMessage','onMenuShareQQ','onMenuShareWeibo','hideMenuItems','showMenuItems','hideAllNonBaseMenuItem','showAllNonBaseMenuItem','translateVoice','startRecord','stopRecord','onRecordEnd','playVoice','pauseVoice','stopVoice','uploadVoice','downloadVoice','chooseImage','previewImage','uploadImage','downloadImage','getNetworkType','openLocation','getLocation','hideOptionMenu','showOptionMenu','closeWindow','scanQRCode','chooseWXPay','openProductSpecificView','addCard','chooseCard','openCard']
	};
	$.getJSON(ctx + "/jsSign" , {url : location.href.split('#')[0]} , function(msg){
		var config = $.extend(def , msg);
		wx.config({
			debug: config.debug,
			appId: config.appId,
			timestamp: config.timestamp,
			nonceStr:  config.nonceStr,
			signature: config.signature,
			jsApiList: config.jsApiList
		});
	});
	
	wx.error(function(res){
		// config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。
		//alert("系统异常：" + JSON.stringify(res));
	});
};


/**
 * 微信分享接口: 支持分享给微信好友、微信朋友圈、QQ等
 *	var shareData = {
 *		title: '微信JS-SDK Demo',
 *		desc: '微信JS-SDK Demo',
 *		link: 'http://......',
 *		imgUrl: 'http://......'
 *	};
 */
WechatApi.prototype.share = {
	/**
	 * 1 监听“分享给朋友”，按钮点击、自定义分享内容及分享结果接口
	 */ 
	toFriend : function(shareData) {
		wx.ready(function(){
			wx.showMenuItems({
				menuList : ["menuItem:share:appMessage"]
			});
			wx.onMenuShareAppMessage({
				type  : shareData.type || "link",
				title : shareData.title,
				desc  : shareData.desc,
				link  : shareData.link,
				imgUrl : shareData.imgUrl,
				trigger : function(res) {
				},
				success : function(res) {
				},
				cancel : function(res) {
				},
				fail : function(res) {
				}
			});
		});
	},

	/**
	 * 2 监听“分享到朋友圈”按钮点击、自定义分享内容及分享结果接口
	 */ 
	toFriendsCircle : function(shareData) {
		wx.ready(function(){
			wx.showMenuItems({
				menuList : ["menuItem:share:timeline"]
			});
			wx.onMenuShareTimeline({
				title : shareData.title,
				link  : shareData.link,
				imgUrl : shareData.imgUrl,
				trigger : function(res) {
				},
				success : function(res) {
				},
				cancel : function(res) {
				},
				fail : function(res) {
				}
			});
		});
	},

	/**
	 * 3 监听“分享到QQ”按钮点击、自定义分享内容及分享结果接口
	 * 
	 */ 
	toQQ : function(shareData) {
		wx.ready(function(){
			wx.showMenuItems({
				menuList : ["menuItem:share:qq"]
			});
			wx.onMenuShareQQ({
				title : shareData.title,
				desc  : shareData.desc,
				link  : shareData.link,
				imgUrl : shareData.imgUrl,
				trigger : function(res) {
				},
				complete : function(res) {
				},
				success : function(res) {
				},
				cancel : function(res) {
				},
				fail : function(res) {
				}
			});
		});
	},

	/**
	 * 4 监听“分享到微博”按钮点击、自定义分享内容及分享结果接口
	 */ 
	toWeiBo : function(shareData) {
		wx.ready(function(){
			wx.showMenuItems({
				menuList : ["menuItem:share:weiboApp" , "menuItem:share:QZone"]
			});
			wx.onMenuShareWeibo({
				title : shareData.title,
				desc  : shareData.desc,
				link  : shareData.link,
				imgUrl : shareData.imgUrl,
				trigger : function(res) {
				},
				complete : function(res) {
				},
				success : function(res) {
				},
				cancel : function(res) {
				},
				fail : function(res) {
				}
			});
		});
	},
	
	/**
	 * 监听多种方式
	 * @param ways ：分享方式数组类型，支持：toFriend、toFriendsCircle、toQQ、toWeiBo
	 * @param shareData ：分享数据
	 */
	toWays : function(ways , shareData){
		if(ways == null || !ways instanceof Array){
			return;
		}
		for(var i = 0 ; i < ways.length ; i++){
			var fun = this[ways[i]];
			if(fun){
				fun(shareData);
			}
		}
	}
};

	
/**
 * 图片处理接口
 */
WechatApi.prototype.image = {
	/**
	 * 1 拍照或从手机相册中选图接口
	 */
	chooseImage : function(shareData){
		wx.chooseImage({
			count:shareData.count,
			sizeType: ['original', 'compressed'],
			sourceType: ['album', 'camera'],
			success : function(res) {
				return res.localIds;
			}
		});
	},
	
	/**
	 * 2 图片预览（轮播）
	 * 
	 * @param urls   : 轮播图片URL数组
	 * @param current: 当前图片URL
	 */
	previewImage : function(urls , current){
		if(urls){
			wx.previewImage({
				current : current ? current : "",
				urls : urls
			});
		}
	},
	
	/**
	 * 3 上传图片到微信服务器
	 *	var images = {
			localId : [],
			serverId : []
		};
	 */
	upload : function(localIds) {
		if (!localIds || localIds.length == 0) {
			alert('请先选择图片');
			return;
		}
		var images = {
			localId : [],
			serverId: []
		};
		for(var i = 0 ; i < localIds.length ; i++){
			var localId = localIds[i];
			wx.uploadImage({
				localId : localId,
				isShowProgressTips : 1,
				success : function(res) {
					images.localId.push(localId);
					images.serverId.push(res.serverId);
				},
				fail : function(res) {
					alert(JSON.stringify(res));
				}
			});
		}
		return images;
	},

	/**
	 * 4 下载图片到手机
	 * 
	 */
	 download : function(serverIds) {
		if (!serverId || serverId.length === 0) {
			alert('请先使用 uploadImage 上传图片');
			return;
		}
		
		var localIds = [];
		for (var i = 0 ; i < serverIds.length ; i++){
			var serverId = serverIds[i];
			wx.downloadImage({
				serverId : serverId,
				isShowProgressTips : 1,
				success  : function(res) {
					localIds.push(res.localId);
				},
				fail : function(res) {
					alert(JSON.stringify(res));
				}
			});
		}
	}
}

	

/**
 * 语音接口
 */
WechatApi.prototype.voice = {
	/**
	 * 1 开始录音
	 */
	start : function(){
		wx.startRecord();
	},
	
	/**
	 * 2 停止录音
	 * @returns localId 返回本地资源Id
	 */
	stop : function(){
		wx.stopRecord({
			success: function (res) {
				return res.localId;
			}
		});
	},
	
	/**
	 * 3 识别音频并返回识别结果
	 */
	translate : function(localId){
		var def = {
			localId : '',
			serverId : ''
		};
		var voice = $.extend(def , {localId : localId});
		if (voice.localId == '') {
			return;
		}
		wx.translateVoice({
			localId : voice.localId,
			complete : function(res) {
				if (res.hasOwnProperty('translateResult')) {
					alert('识别结果：' + res.translateResult);
				} else {
					alert('无法识别');
				}
			}
		});
	}
};
	

/**
 * 地址位置接口
 */
WechatApi.prototype.location = {
	// 1 打开内置地图：火星坐标
	openLocation : function(location) {
		wx.openLocation({
			latitude : location.latitude,
			longitude : location.longitude,
			name : location.name,
			address : location.address,
			scale : location.scale,		//地图缩放级别,整形值,范围从1~28。默认为最大
			infoUrl : 'http://weixin.qq.com'// 在查看位置界面底部显示的超链接,可点击跳转
		});
	},

	// 2 获取当前地理位置
	getLocation : function(success , cancel) {
		wx.getLocation({
			success : success,
			cancel : cancel
		});
	}
}

/**
 * 设备操作接口
 */
WechatApi.prototype.terminal = {
	// 1 获取当前网络状态
	getNetworkType : function() {
		wx.getNetworkType({
			success : function(res) {
				alert(res.networkType);
			},
			fail : function(res) {
				alert(JSON.stringify(res));
			}
		});
	},
	
	// 2 扫描二维码并返回结果
	scanQRCode : function() {
		wx.scanQRCode({
			needResult : 1,
			desc : 'scanQRCode desc',
			success : function(res) {
				alert(res);
			}
		});
	}
}

/**
 * 界面操作接口
 */
WechatApi.prototype.window = {
	// 1 、注册隐藏右上角菜单事件，并且在wx.ready事件之后执行
	hideMenu : function() {
		wx.ready(function(){
			wx.hideOptionMenu();
		});
	},

	// 2 、注册显示右上角菜单事件，并且在wx.ready事件之后执行
	showMenu : function() {
		wx.ready(function(){
			wx.showOptionMenu();
		});
	},

	// 3 、注册批量隐藏菜单项事件，并且在wx.ready事件之后执行
	hideMenuItems : function(menuList) {
		wx.ready(function(){
			wx.hideMenuItems({
				menuList: menuList,
				success: function (res) {
			    },
			    fail: function (res) {
			    }
			});
		});
	},

	// 4 、注册批量显示菜单项事件，并且在wx.ready事件之后执行
	showMenuItems : function(menuList) {
		wx.ready(function(){
			wx.showMenuItems({
				menuList : menuList
			});
		});
	},

	// 5 、注册隐藏所有非基本菜单项事件，并且在wx.ready事件之后执行
	hideAllNonBaseMenuItem : function() {
		wx.ready(function(){
			wx.hideAllNonBaseMenuItem();
		});
	},

	// 6 、注册显示所有被隐藏的非基本菜单项事件，并且在wx.ready事件之后执行
	showAllNonBaseMenuItems : function() {
		wx.ready(function(){
			wx.showAllNonBaseMenuItem();
		});
	},

	// 7、注册 关闭当前窗口事件，并且在wx.ready事件之后执行
	close : function() {
		wx.ready(function(){
			wx.closeWindow();
		});
	}
};