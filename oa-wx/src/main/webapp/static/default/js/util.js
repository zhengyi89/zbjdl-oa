try {
	/**
	 * 创建定时器任务
	 * @param timeSpace 定时器时间间隔
	 * @param timeCount 定时器触发次数(-1表示不设置间隔)
	 * @param callBackFunction 定时器回调任务
	 */
	var TimerTaskCanV2 = function(opt) {
		var def = {
			timeSpace : 1000, 
			timeCount : 1, 
			isEndCallBack : false,
			callBackFunction : null 
		};
		var timeSpace = opt.timeSpace || def.timeSpace, 
			timeCount = opt.timeCount || def.timeCount, 
			isEndCallBack = opt.isEndCallBack || def.isEndCallBack, 
			callBackFunction = opt.callBackFunction || def.callBackFunction;
		setTimeout(function() {
			if(isEndCallBack){
				if(timeCount == 1) {
					callBackFunction(timeCount);
				}
			} else {
				if ("stop" == callBackFunction(timeCount)){
					timeCount = 0;
				}
			}
			if (--timeCount > 0) {
				setTimeout(arguments.callee, timeSpace);
			}
		}, timeSpace);
	};
	/**
	 * 创建定时器任务
	 * @param timeSpace 定时器时间间隔
	 * @param timeCount 定时器触发次数(-1表示不设置间隔)
	 * @param callBackFunction 定时器回调任务
	 */
	var TimerTask = function(timeSpace, timeCount, callBackFunction , isEndCallBack) {
		setTimeout(function() {
			if(isEndCallBack){
				if(timeCount == 1) {
					callBackFunction(timeCount);
				}
			} else {
				callBackFunction(timeCount);
			}
			if (--timeCount > 0) {
				setTimeout(arguments.callee, timeSpace);
			}
		}, timeSpace);
	};
	/**
	 * 定时器任务:任意时刻调用多任务机制
	 * @param taskArray 任务数组
	 * 调用方式：
	 * TimerTasks( 1000 , [
		{
			timeCount : 1
			isInvoke : function(){
				return true;
			}
			callBack : function(){}
		}
		]);
	 */
	var TimerTasks = function(timeSpace, taskArray){
		for(var i = 0 ; i < taskArray.length ; i++){
			(function(index){
				setTimeout(function() {
					var task = taskArray[index];
					if(!task.isInvoke || task.isInvoke()){
						task.callBack();
					}
				}, timeSpace * taskArray[index].timeCount);
			})(i);	
		}
	};
	/**
	 * 字符串格式化成日期
	 */
	var parseDate = function (str) {
		return new Date(Date.parse(str.replace(/-/g,"/")));
	};

	/**
	 * $('.djs_time').countDownLevel({
	 *		stopTime:"2014-10-25 16:32:00",
	 *		distype:3
	 * });
	 */
	$.fn.countDownLevel = function(options) {
		var defaults = {
			startTime:null,
			startTimeMilli:null,
			stopTime:null,
			stopTimeMilli:null,
			distype:4,
			callback:null,
			tag:null
		};
		var opts  = $.extend(defaults, options);
		return $(this).each(function() {
			var $this = $(this);
			setTimeout(function(leftsecond){
				var metadata = $this.attr("metadata");
				var _opts = metadata ? $.extend(opts , $.parseJSON(metadata)) : opts;
				_opts.tag = $this;
				//开始时间为空  或者  结束时间为空
				if((_opts.stopTime == null && _opts.stopTimeMilli == null) || (_opts.startTime == null && _opts.startTimeMilli == null)){
					return;
				}
				
				if(!leftsecond){
					//取得开始时间
					var _startTimeMilli = _opts.startTimeMilli ? parseInt(_opts.startTimeMilli) : new Date(parseDate(_opts.startTime)).getTime();
					//取得结束时间
					var _stopTimeMilli = _opts.stopTimeMilli ? parseInt(_opts.stopTimeMilli) : new Date(parseDate(_opts.stopTime)).getTime();
					
					leftsecond = parseInt((_stopTimeMilli - _startTimeMilli) / 1000);
				}
				if(leftsecond <= 0){
					leftsecond = 1;
				}
				leftsecond -= 1;
				_d = parseInt(leftsecond / 86400);
				_h = parseInt(leftsecond % 86400 / 3600);
				_m = parseInt(leftsecond % 3600 / 60);
				_s = parseInt(leftsecond % 60);
				
				if(_d<10&&_d>=0){
					_d = '0'+_d;
				}
				if(_h<10&&_h>=0){
					_h = '0'+_h;
				}
				if(_m<10&&_m>=0){
					_m = '0'+_m;
				}
				if(_s<10&&_s>=0){
					_s = '0'+_s;
				}
				
				if(_opts.distype==4){
					$this[0].innerHTML = ( "<b>" + _d + "</b><i>天</i>" + "<b>" + _h + "</b><i>时</i>" + "<b>" + _m + "</b><i>分</i>" + "<b>" + _s + "</b><i>秒</i>" );
				}else if(_opts.distype==3){
					if(_d==0){
						$this[0].innerHTML = ( "<b>" + _h + "</b><i>时</i>" + "<b>" + _m + "</b><i>分</i>" + "<b>" + _s + "</b><i>秒</i>" );
					}else{
						$this[0].innerHTML = ( "<b>" + _d + "</b><i>天</i>" + "<b>" + _h + "</b><i>时</i>" + "<b>" + _m + "</b><i>分</i>" );
					}
				}else{
					if(_d > 0){
						$this[0].innerHTML = ( "<b>" + _d + "</b><i>天</i><b>" + _h + "</b><i>时</i>" );
					}else if(_h > 0){
						$this[0].innerHTML = ( "<b>" + _h + "</b><i>时</i><b>" + _m + "</b><i>分</i>" );
					}else{
						$this[0].innerHTML = ( "<b>" + _m + "</b><i>分</i><b>" + _s + "</b><i>秒</i>" );
					}
				}
				if(leftsecond > 0){
					setTimeout(arguments.callee, 1000 , leftsecond);
				} else if(_opts.callback != null){
					_opts.callback(_opts);
				}
			} , 1000);
		});
	};
	/**
	 * 倒计时方法，用于发送短信时的倒计时
	 * @param btn 短信发送按钮
	 * @param count 倒计时时间(单位秒)
	 */
	var DJS = function (param){
		var o = {};
		o.btn	= param.btn;	//倒计时对象
		o.jishi = param.count;	//倒计时次数
		o.reset = param.reset;  //重试按钮样式等功能
		o.template  = param.template;//倒计时样式模板:"验证码发送成功(time)".replace("time" , "60秒")
		o.copyJishi = param.count;
		o.timer = null;

		//开始倒计时
		o.startdjs = function(){
			o.btn.disabled = true;
			clearInterval(o.timer);
			o.timer = setInterval(function(){
				if(o.template) {
					o.btn.value = o.template.replace("time" , o.jishi--);
				} else {
					o.btn.value = o.jishi-- + "秒";
				}
				if(o.jishi < 0){
					o.offdjs();
				}
			},1000);
		};
		
		//关闭倒计时
		o.offdjs = function(){
			clearInterval(o.timer);
			o.jishi_reset();
			o.btn.value="立即发送";
			o.btn.disabled = false;
			if(o.reset){
				o.reset();
			}
		};
		
		//重置时间
		o.jishi_reset = function(){
			clearInterval(o.timer);
			o.jishi = o.jishi;
		};
		return o;
	};

	/**
	 * 获取地址栏中指定名称的参数
	 * @param strName
	 * @returns
	 */
	var getUrlPara = function(strName){  
		var strHref  =  location.href; 
		var intPos = strHref.indexOf("?");  
		var strRight = strHref.substr(intPos + 1);  
		var arrTmp = strRight.split("&");  
		for(var i = 0; i < arrTmp.length; i++) {  
			var arrTemp = arrTmp[i].split("=");  
			if(arrTemp[0].toUpperCase() == strName.toUpperCase()){
				return arrTemp[1];  
			}
		}  
		return "index";  
	};

	/**
	 * 翻页
	 * @param formId 表单ID
	 * @param page	 页码
	 * @param limit  分页条数
	 */
	var _bossToPage = function(formId, page, limit) {
		var pageField =  $("<input type='hidden' name='_query_page', value='" + page + "'></input>");
		var limitField =  $("<input type='hidden' name='_query_limit', value='" + limit + "'></input>");
		$("#" + formId).append(pageField).append(limitField)[0].submit();
	};

	/**
	 * 刷新验证码
	 */
	var changeVCode = function() {
		$("#codeImg").attr("src", ctx + "/Kaptcha.jpg?seed=" + Math.random());
	};

	/**
	 * 判断字符串是否由相同的字符组成
	 * @return true:全部相同
	 * 		   false：不全部相同
	 */
	var isSame = function(varString){
		if(varString == null || varString.length <= 1){
			return false;
		}
		var a = varString.split("");
		var r = true;
		for(var i = 1 ; i < a.length ; i++){
			if(a[i] != a[0]){
				r = false;
				break;
			}
		}
		return r;
	};

	/**
	 * 验证码发送方法：
	 * @param options :对象类型
	 * 		  url	  :请求地址		【非必填】	
	 *		  btn	  :发送按钮		【必填】
	 *		  code	  :输入框			【必填】
	 *		  phone	  :手机号			【非必填】
	 *		  phoneErr:手机号错误提示区	【必填】
	 *		  otherErr:其它错误提示区	【必填】
	 */
	 var wxCaptcha = function(options){
		var def = {
			url		: ctx + "/ajax/captcha",
			btn		: null,
			code	: null,
			phone	: null,
			phoneErr: null,
			otherErr: null,
			success : null,
			template: null,
			visitFlowNo: null
		};
		var opts  = $.extend(def, options);
		//(0)清空原有提示
		opts.phoneErr.html("&nbsp;");
		opts.otherErr.html("&nbsp;");
		//(1)禁用"按钮"
		var $btn = (opts.btn).attr("disabled" , "true").removeClass("tixian_djs").addClass("re_send_active");
		//(2)启动倒计时
	 	var doj = DJS({
			btn  :$btn[0],
			count:60,
			template : opts.template,
			reset:function(){
				$btn.removeClass("re_send_active").addClass("tixian_djs");
			}
		});
		doj.startdjs();
		//(3)发送获取验证码请求
		try {
			$.ajax({
				url : opts.url,
				method : "POST",
				data: {
					enterName : (opts.phone ? opts.phone.val() : "") ,
					visitFlowNo : opts.visitFlowNo
				},
				success : function(data) {
					var status = data.status;
					if("ok" == status){
						if(opts.success){
							opts.success();
						} else {
							if(opts.phoneErr.parent().find("input").attr("id")=="enterName"){
								addNormalBorder(opts.otherErr.parent().find("input").attr("id"),opts.otherErr.attr("id"),"验证码发送成功");
							}else{
								addNormalBorder(opts.otherErr.parent().find("input").attr("id"),opts.otherErr.attr("id"),"验证码发送成功");
								opts.code.focus();
							}
						}
					} else if("fail" == status){
						addErrorBorder(opts.phoneErr.parent().find("input").attr("id"),opts.phoneErr.attr("id"),data.message);
		 				doj.offdjs();
		 			} else {
		 				addErrorBorder(opts.otherErr.parent().find("input").attr("id"),opts.otherErr.attr("id"),data.message);
		 				doj.offdjs();
		 			}
				},
				error : function() {
					addErrorBorder(opts.otherErr.parent().find("input").attr("id"),opts.otherErr.attr("id"),"网络异常，请稍后重试");
					doj.offdjs();
				}
			});
		} catch (e){
			addErrorBorder(opts.otherErr.parent().find("input").attr("id"),opts.otherErr.attr("id"),"网络异常，请稍后重试");
			doj.offdjs();
		}
	};
	 
	var NumberFormat = {
		/**
		 * 格式化小数：
		 * @param src 原数字
		 * @param pos 需要保留小数点后几位
		 */
		format : function (src, pos) {
			if(src){
				return src.toFixed(2);
			} else {
				return 0;
			}
		},
		/**
		 * 限制输入内容必须为金额
		 * 使用方法如下： <input oninput="NumberFormat.limitAmount(this)" />
		 */
		limitAmount : function(text){
			while(true){	
				var val = $(text).val();
				if(!/^(([1-9]{1}\d*)|([0]{1}))(\.(\d){0,2})?$/.test(val)){
					if(val.length > 0){
						text.value = val.substring(0 , val.length - 1);
					} else {
						break;
					}
				} else {
					break;
				}
			}
		},
		
		/**
		 * 限制输入内容必须为数字
		 * 使用方法如下： <input onkeyup="this.value = NumberFormat.limitNumber(this.value)" />
		 * 
		 * @param val 	被判断的值
		 * @return 		过滤非法字符之后的源字符串
		 */
		limitNumber : function(val) {
			if (!val) {
				return "";
			}
			val = val.replace(/[^\d]+/g, "");
			return val;
		},
		
		/**
		 * 限制输入内容必须为数字,并且限制长度
		 * 使用方法如下： <input onkeyup="this.value = NumberFormat.limitNumLength(4 , this.value)" />
		 * 
		 * @param len 	允许输入的最大长度
		 * @param val 	被判断的值
		 * @return 过滤非法字符之后的源字符串
		 */
		limitNumLength : function(len, val) {
			if (!val) {
				return "";
			}
			val = val.replace(/[^\d]+/g, "");
			if (val.length > len) {
				val = val.substring(0, len);
			}
			return val;
		},
		/**
		 * 将手机号码按照3,4,4分段,13911111111  转为 139 1111 1111
		 * js使用方法如下： NumberFormat.formatPhone($('#phone').val())"
		 * 
		 * @param val 	被判断的值
		 * @return 		格式后的手机号
		 */
		formatPhone : function(val) {
			if (!val) {
				return "";
			}
			val = val.replace(/\s/g, "");
			val = val.replace(/(\d{3})/, "$1 ");
			val = val.replace(/(\d{4})/, "$1 ");		
			return val;
		},
		/**
		 * 将银行卡号按照4,4,4,4,3分段，6227002872000205123  转为 6227 0028 7200 0205 123
		 * js使用方法如下： NumberFormat.formatBankCardNo($('#bankCardNo').val())"
		 * @param val 	被判断的值
		 * @return 		格式后的手机号
		 */
		formatBankCardNo:function(val){
			if(!val){
				return "";
			}
			val=val.replace(/\s/g,"");
			val=val.replace(/(\d{4})/g, "$1 ");
			return val;
		},
		formatCredentialsNo:function(val){
			if(!val){return "";}
			val=val.replace(/\s/g,"");
			if(val.length<=14){
				val=val.replace(/(\d{6})/,"$1 ");
			}else{
				val=val.replace(/(\d{6})(\d{8})/g,"$1 $2 ");	
			}
			return val;		
		}
	};
	


	/**
	 * ajax工具封装
	 */
	var ajaxUtil = function(opts){
		(function(opts){
			var url = opts.url;
			var data = opts.data;
			var success = opts.success;
			var error = opts.error;
			var before = opts.before;
			if(before) {
				before(opts);
			}
			$.ajax({
				url : url,
				method : "POST",
				data : data,
				success : function(data) {
					success(opts,data);
				},
				error : function() {
					if(error){
						error(opts,data);
					} else {
						alert("网路异常，请检查网络连接是否正常!");
					}
				}
			});
		})(opts);
	};
} catch (e){
}