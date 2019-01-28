/**
 * 汉化validate描述
 */
jQuery.extend(jQuery.validator.messages, {
	required : "必选字段",
	remote : "请修正该字段",
	email : "请输入正确格式的电子邮件",
	url : "请输入合法的网址",
	date : "请输入合法的日期",
	dateISO : "请输入合法的日期 (ISO).",
	number : "请输入合法的数字",
	digits : "只能输入整数",
	creditcard : "请输入合法的信用卡号",
	equalTo : "请再次输入相同的值",
	accept : "请输入拥有合法后缀名的字符串",
	maxlength : jQuery.validator.format("最大长度是{0}"),
	minlength : jQuery.validator.format("最小长度是{0}"),
	rangelength : jQuery.validator.format("有效长度为{0}到 {1}之间"),
	range : jQuery.validator.format("请输入一个介于 {0} 和 {1} 之间的值"),
	max : jQuery.validator.format("请输入一个最大为{0} 的值"),
	min : jQuery.validator.format("请输入一个最小为{0} 的值")
});

//手机号校验规则
jQuery.validator.addMethod(
	"phone",
	function(value, element){
		var myreg = /^(1+\d{10})$/;
		return this.optional(element) || myreg.test(value);
	}, 
	"手机号格式错误"
);
//密码
jQuery.validator.addMethod(
	"pwd",
	function(value, element){
		return this.optional(element) || (value.length >= 6 && value.length <= 20 && !isSame(value));
	}, 
	"密码应为6到20位的字母数字组合"
);
//必须是数字，且必须为6位
jQuery.validator.addMethod(
	"captcha",
	function(value, element){
		var myreg = /^\d{6}$/;
		return this.optional(element) || myreg.test(value);
	}, 
	"应为6位数字组合"
);