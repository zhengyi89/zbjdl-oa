<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 0);
%>
<%
     String path = request.getContextPath();
     String basePath = request.getScheme() + "://"
             + request.getServerName() + (request.getServerPort() == 80 ? "" : ":" + request.getServerPort())
             + path + "/";
     System.out.println(request.getParameter("url"));
     String reportid = request.getParameter("reportid");
%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8"/>
  	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
  	<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no"/>
    <title>中天房管家</title>
    <link rel="stylesheet" href="${def}/app/css/warehouse.css" media="screen" title="no title" charset="utf-8"/>
    <link rel="stylesheet" href="${def}/app/css/wxui.css" media="screen" title="no title" charset="utf-8">
  </head>
  <body>
    <div class="index_bg">
      <form class="login_form" action="" method="post" id="loginForm">
        <div class="input_box">
          <p class="icon_username"></p>
          <input type="text" id="mobile" name="mobile" placeholder="请输入用户名"/>
          <p class="tip" id="mobileTip"></p>
        </div>
        <div class="input_box">
          <p class="icon_yzm"></p>
          <input type="password" id="password" name="password" placeholder="请输入密码"/>
          <p class="tip" id="passwordTip"></p>
        </div>
        <div class="submit">
          <input id="loginSubmit" type="button" value="登   录" onclick="this.value='登录中…';this.setAttribute('disabled',true);doLogin();"/>
        </div>
      </form>
    </div>
    
    <script type="text/javascript" src="${def}/app/js/circles.js"></script>
    <script type="text/javascript" src="${def}/app/js/WebViewJavascriptBridge.js"></script>
    <script>
    
    //初始化结束后，调用此方法去掉vc的按钮
    $(function(){ 

    	if ("${os}"=="ios") {
    		setupWebViewJavascriptBridge(function(bridge) {
   				var uniqueId = 1
   			});
    		
    		/*type: 0 登录成功跳转， 1:去掉登陆页面按钮*/
        	WebViewJavascriptBridge.callHandler('testObjcCallbacka', {'type': '1'}, 
        			function(response) {log('JS got response', response)});
		}else if ("${os}"=="android" || "${os}"=="pos") {
			android_bridge();
	        window.WebViewJavascriptBridge.callHandler(
		            'loginFromWeb'
		            , {'param': {'type': '1'} }
		            , function(responseData) { }
		     ); 
		}
   	}); 
    
	//验证手机号
    function checkMobile(){
		var mobile=$("#mobile").val();
		cssChange("mobileTip", true, "");
		if(mobile.length==0){
			cssChange("mobileTip", false, "用户名不能为空");
			return false;
		} 
		return true;
	}
	
    //验证密码
	function checkPwd(){
		var password=$("#password").val();
		cssChange("passwordTip",true,"");
		if (password.length==0) {
			cssChange("passwordTip", false, "密码不能为空");
			return false;
		}
		return true;
	}
	
    //提交校验
	function checkInput(){
		cssChange("mobileTip",true,"");
		cssChange("passwordTip",true,"");
		if(!checkMobile()){
			return false;
		} 
		if (!checkPwd()) {
			return false;
		}
		return true; 
	}
    function resetLogin(){
    	$("#loginSubmit").removeAttr("disabled");
    	$("#loginSubmit").val("登   录");
    }
    //登录
    function doLogin(){
    	if(!checkInput()){
    		resetLogin();
			return;
		}
		$.ajax({
			url : "${ctx}/app/login/do",
			method : "POST",
			dataType: "json",
			async: false,
			data:$("#loginForm").serialize(),
			success : function(data) { 
				if (data.flag=='ok') {
					var url2 = "<%=basePath %>app/flow/list?os="+"${os}";
					var url_more = "<%=basePath %>app/more";
					//判断终端类型，进行不同处理
					if ("${os}"=="ios") {
						/*type: 0 登录成功跳转， 1:去掉登陆页面按钮*/
						WebViewJavascriptBridge.callHandler('testObjcCallbacka', 
								{'type': '0', 'url':''+url2+'', 'url_more':''+url_more+''},
								function(response) { });
					}else if ("${os}"=="android" || "${os}"=="pos") {
						var param = {'type': '0', 'url':''+url2+'', 'url_more':''+url_more+'', 'login_name':''+data.loginName+''};
							
				        window.WebViewJavascriptBridge.callHandler(
				            'loginFromWeb'
				            , {"param": param }
				            , function(responseData) { }
				        ); 
					}else {
						window.location.href= "${ctx}/app/flow/list";
					}
					
				}else if (data.flag == 'failed') {
					alert(data.errorMessage);
					resetLogin();
				}else {
					alert("系统异常，请稍候重试");
					resetLogin();
				}
			},
			error : function() {
				alert("系统异常，请稍后重试");
				resetLogin();
			}
		});
	}
    
    /**
     * ios
     * @param callback
     * @returns
     */
    //与终端通信
    function setupWebViewJavascriptBridge(callback) {
       if (window.WebViewJavascriptBridge) { return callback(WebViewJavascriptBridge); }
       if (window.WVJBCallbacks) { return window.WVJBCallbacks.push(callback); }
       window.WVJBCallbacks = [callback];
       var WVJBIframe = document.createElement('iframe');
       WVJBIframe.style.display = 'none';
       WVJBIframe.src = 'wvjbscheme://__BRIDGE_LOADED__';
       document.documentElement.appendChild(WVJBIframe);
       setTimeout(function() { document.documentElement.removeChild(WVJBIframe) }, 0)
    }
    
	function cssChange(inputId,type,message){
		if(type == false){
			$("#"+inputId).html(message).attr("class", "err");
		}else{
			$("#"+inputId).html("").attr("class", "tip");
		}
	}
    
    </script>
  </body>
</html>
