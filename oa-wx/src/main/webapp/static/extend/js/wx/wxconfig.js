/**
 * 系统配置管理js，重构时希望把该Js文件由系统自动生成，保证提示内容达到可配置的目标；
 * (1)为了避免文件过大，可以对配置进行模块化管理
 */
var wxconfig = {		
	//获取提示内容
	getTip : function(key){
		if(key){
			return wxconfig.tip[key];
		} else {
			return null;
		}
	}

}

/**
 * 页面提示模块
 */
wxconfig.tip = {
	captcha_mistake		: "验证码错误",
	login_phone_mistake	: "手机号码格式错误",
	login_phone_exit 	: "此手机号码不是会员",
	login_phone_error	: "用户被冻结，禁止登录",
	pwd_mistake			: "登录密码错误，请重新输入"
}

/**
 * 页面参数配置
 */
wxconfig.app = {
	
}






