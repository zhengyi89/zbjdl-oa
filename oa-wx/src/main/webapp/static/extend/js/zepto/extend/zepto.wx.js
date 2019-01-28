;(function($){
	/**
	 * 创建定时器任务
	 * 
	 * @param timeSpace
	 *            定时器时间间隔
	 * @param timeCount
	 *            定时器触发次数(-1表示不设置间隔)
	 * @param callBackFunction
	 *            定时器回调任务
	 * @param endflag 
	 * 			  true : 只在结束的时候调用回调
	 * 			  否则，每次都回调
	 * 
	 */
	var TimerTask = function(timeSpace, timeCount, callBackFunction , endflag) {
		setTimeout(function() {
			if(endflag){
				var time = --timeCount;
				if (time == 0){
					callBackFunction(timeCount);
				} else if(time > 0) {
					setTimeout(arguments.callee, timeSpace);
				}
			} else {
				callBackFunction(timeCount);
				if (--timeCount > 0) {
					setTimeout(arguments.callee, timeSpace);
				}
			}
		}, timeSpace);
	}
	$.extend($.fn, {
		/**
		 * 微信加载层
		 */
		emerald_mask: function(callBackFun){
				var _this = this;
				TimerTask(1000 , 2 , callBackFun , true);
				
				var _content = $('<div id="_emerald_mask" class="loading_page"><div class="mask"></div><div class="mask_loading"><img src="'+def+'/images/loading2.gif" width="50" height="50"></div></div>').appendTo($("body"));
				var $mask = $("#_emerald_mask").on("click",function(){
					$(this).hide();
				}).on("touchstart",function(){
					$(this).hide();
				});
				$(window).bind('beforeunload',function(){
					$("body").remove("div#_emerald_mask");
				});
				return _this;
		}
	})
})(Zepto);