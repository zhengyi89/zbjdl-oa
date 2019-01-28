<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="zh-cmn-Hans">
<head>
<title>微信贷申请页</title>
<link rel="stylesheet" href="${def}/css/weui.css" />
<link rel="stylesheet" href="${def}/css/common.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/loanproduct/loanApply.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/loanproduct/jquery.1.9.1.min.js"></script>
</head>
<body>
	<script>
		var contextPath = "${pageContext.request.contextPath}";
	</script>
	<form method="get" id="godownForma" name="godownForma"
		action="${pageContext.request.contextPath}/product/save">
		<input type="hidden" id="merchant" name="merchant" value="${merchant}">
		<input type="hidden" id="type" name="type" value="${type}"> <input
			type="hidden" name="token" value="${token}" />
		<div class="weui_cells_title" style="font-size: 16">个人信息</div>
		<div class="weui_cells weui_cells_form">
			<div class="weui_cell">
				<div class="weui_cell_hd">
					<label class="weui_label">真实姓名</label>
				</div>
				<div class="weui_cell_bd weui_cell_primary">
					<input class="weui_input" type="text" name="userName" id="userName"
						placeholder="请输入您的真实姓名" maxlength="20" required
						autofocus="autofocus" />
				</div>
				<div id="userName_div_null" class="loan_pop_warn" style="display: none;">不能为空<i class="outer"></i><em class="inner"></em></div>
			</div>
			<div class="weui_cell weui_cells_form">
				<div class="weui_cell_hd">
					<label for="" class="weui_label">手机号码</label>
				</div>
				<div class="weui_cell_bd weui_cell_primary">
					<input class="weui_input" type="text" pattern="^1[3-9]\d{9}$"
						maxlength="11" required placeholder="请输入真实的手机号码" onblur="checkPhone(this.value)"
						name="mobilePhone" id="mobilePhone" onkeyup="this.value=this.value.replace(/\D/g,'')" />
				</div>
				<div id="mobilePhone_div_null" class="loan_pop_warn" style="display: none;">不能为空<i class="outer"></i><em class="inner"></em></div>
				<div id="mobilePhone_div_reg" class="loan_pop_warn" style="display: none;">手机号格式不正确<i class="outer"></i><em class="inner"></em></div>
			</div>
			<div class="weui_cell weui_cell_select weui_select_after">
				<div class="weui_cell_hd">
					<label for="" class="weui_label">性别</label>
				</div>
				<div class="weui_cell_bd weui_cell_primary">
					<select class="weui_select" name="sex" id="sex" required="required">
						<option selected="selected" value=""></option>
						<option value="M">男</option>
						<option value="W">女</option>
					</select>
				</div>
				<div id="sex_div_null" class="loan_pop_warn" style="display: none;">不能为空<i class="outer"></i><em class="inner"></em></div>
			</div>
			<div class="weui_cell weui_cell_select weui_select_after">
				<div class="weui_cell_hd">
					<label for="" class="weui_label">婚姻状况</label>
				</div>
				<div class="weui_cell_bd weui_cell_primary">
					<select class="weui_select" name="marriage" id="marriage"
						required="required">
						<option selected="selected" value=""></option>
						<option value="0">已婚</option>
						<option value="1">未婚</option>
						<option value="2">离异</option>
					</select>
				</div>
				<div id="marriage_div_null" class="loan_pop_warn" style="display: none;">不能为空<i class="outer"></i><em class="inner"></em></div>
			</div>
			<div class="weui_cell weui_cell_select weui_select_after">
				<div class="weui_cell_hd">
					<label for="" class="weui_label">所在城市</label>
				</div>
				<div class="weui_cell_bd weui_cell_primary">
					<select class="weui_select" name="provinceCode" id="provinceCode" onchange="getCity(this.value);"
						required="required">
						<option selected="selected" value=""></option>
						<option value="1001">福州</option>
						<option value="1002">厦门</option>
						<option value="1003">漳州</option>
						<option value="1004">泉州</option>
						<option value="1005">三明</option>
						<option value="1006">莆田</option>
						<option value="1007">南平</option>
						<option value="1008">龙岩</option>
						<option value="1009">宁德</option>
						<option value="1010">平潭</option>
						<%--
						<script>
							getProvince();
						</script>
						 --%>
					</select>
				</div>
				<div id="provinceCode_div_null" class="loan_pop_warn" style="display: none;">不能为空<i class="outer"></i><em class="inner"></em></div>
			</div>
			<div class="weui_cell weui_cell_select weui_select_after">
				<div class="weui_cell_hd"> <label for="" class="weui_label">所在区县</label></div>
				<div class="weui_cell_bd weui_cell_primary">
					<select class="weui_select" name="cityCode" id="cityCode"
						required="required">
						<option selected="selected" value=""></option>
					</select>
				</div>
				<div id="cityCode_div_null" class="loan_pop_warn" style="display: none;">不能为空<i class="outer"></i><em class="inner"></em></div>
			</div>
		</div>
		
		<div class="weui_cells_title" style="font-size: 16">贷款信息</div>
		<div class="weui_cells weui_cells_form">
			<div class="weui_cell">
				<div class="weui_cell_hd">
					<label class="weui_label" style="font-size: 14">贷款金额(万元)</label>
				</div>
				<div class="weui_cell_bd weui_cell_primary">
					<input class="weui_input" type="number" min="0" max="9999"
						step="0.01" placeholder="请输入贷款金额(万元)" name="payAmount" onblur="checkAmount(this.value)"
						id="payAmount" required="required" onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')"/>
				</div>
				<div id="payAmount_div_null" class="loan_pop_warn" style="display: none;">不能为空<i class="outer"></i><em class="inner"></em></div>
				<div id="payAmount_div_reg" class="loan_pop_warn" style="display: none;">金额输入有误<i class="outer"></i><em class="inner"></em></div>
				<div id="payAmount_div_greater" class="loan_pop_warn" style="display: none;">金额不能大于9999.99<i class="outer"></i><em class="inner"></em></div>
			</div>
			<div class="weui_cell weui_cell_select weui_select_after">
				<div class="weui_cell_hd">
					<label for="" class="weui_label">贷款期限</label>
				</div>
				<div class="weui_cell_bd weui_cell_primary">
					<select class="weui_select" name="loanLimit" id="loanLimit"
						required="required">
						<option selected="selected" value=""></option>
						<option value="0">3个月</option>
						<option value="1">6个月</option>
						<option value="2">12个月</option>
						<option value="3">24个月</option>
					</select>
				</div>
				<div id="loanLimit_div_null" class="loan_pop_warn" style="display: none;">不能为空<i class="outer"></i><em class="inner"></em></div>
			</div>
			<div class="weui_cell weui_cell_select weui_select_after">
				<div class="weui_cell_hd">
					<label for="" class="weui_label">贷款用途</label>
				</div>
				<div class="weui_cell_bd weui_cell_primary">
					<select class="weui_select" name="loanPurpose" id="loanPurpose"
						required="required">
						<option selected="selected" value=""></option>
						<option value="0">资金周转</option>
						<option value="1">增加经营品类或增加订货</option>
						<option value="2">门店装修</option>
						<option value="3">其他经营型用途</option>
						<option value="4">消费性用途</option>
					</select>
				</div>
				<div id="loanPurpose_div_null" class="loan_pop_warn" style="display: none;">不能为空<i class="outer"></i><em class="inner"></em></div>
			</div>
			<div class="weui_cell weui_cell_select weui_select_after">
				<div class="weui_cell_hd">
					<label for="" class="weui_label" style="font-size: 14">是否有本地房产</label>
				</div>
				<div class="weui_cell_bd weui_cell_primary">
					<select class="weui_select" name="localHouse" id="localHouse"
						required="required">
						<option selected="selected" value=""></option>
						<option value="1">是</option>
						<option value="0">否</option>
					</select>
				</div>
				<div id="localHouse_div_null" class="loan_pop_warn" style="display: none;">不能为空<i class="outer"></i><em class="inner"></em></div>
			</div>
		</div>
		
		<div class="weui_cells_title" style="font-size: 16">留言</div>
		<div class="weui_cells weui_cells_form">
			<div class="weui_cell">
				<div class="weui_cell_bd weui_cell_primary">
					<textarea class="weui_textarea" placeholder="请输入留言" rows="3"
						maxlength="200" name="remarks" id="remarks"></textarea>
				</div>
			</div>
		</div>
		<div class="weui_msg">
			<div class="weui_opr_area">
				<p class="weui_btn_area">
					<input class="weui_btn weui_btn_primary" id="button" type="button"
						value="提交申请 " style="font-size: 18" onclick="doSubmit();"/>
				</p>
			</div>
		</div>
		<div class="weui_msg">
		</div>
		<script src="${def}/js/zepto.min.js"></script>
		<script src="${def}/js/router.min.js"></script>
		<script src="${def}/js/example.js"></script>
	</form>
</body>
</html>