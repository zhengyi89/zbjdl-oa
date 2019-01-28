<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title>产品管理</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/BusinessCode.js"></script>

</head>
<body>
		<div id="content_2" class="content_wrapper">
			<div class="content_main">
				<div class="panel panel-default">
					<div class="panel-heading">产品详情</div>
					<div class="panel-body">
					<form method="post" id="godownForma" name="godownForma" action="#" class="cmxform form-horizontal">
						<div class="form-group">
							<input type="hidden" value="${pageInfo.id}" id="id" name="id"> 
							<label for="inputPassword3" class="col-lg-2 control-label">发送流水:</label>
							<div class="col-lg-3">
								<label class="control-label">${pageInfo.serialNo}</label>
							</div>
							<label for="inputPassword3" class="col-lg-2 control-label">发送时间:</label>
							<div class="col-lg-3">
								<label class="control-label"  id="targetCustomType">${pageInfo.sendTime}</label>
							</div>
						</div>
						<div class="col-lg-offset-2 col-lg-10">
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-lg-2 control-label">接收人姓名:</label>
							<div class="col-lg-3">
								<label class="control-label">${pageInfo.receiveName}</label>
							</div>
							<label for="inputPassword3" class="col-lg-2 control-label">接收人手机:</label>
							<div class="col-lg-3">
								<label class="control-label">${pageInfo.receiveMobile}</label>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-lg-2 control-label">业务编号:</label>
							<div class="col-lg-3">
								<label class="control-label">${pageInfo.bizNo}</label>
							</div>
							<label for="inputPassword3" class="col-lg-2 control-label">发送状态:</label>
							<div class="col-lg-3">
								<label class="control-label">${pageInfo.smsState}</label>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-lg-2 control-label">原发送流水:</label>
							<div class="col-lg-3">
							<label class="control-label"  id="rateType">${pageInfo.oriSerialNo}</label>
							</div>
							<label for="inputPassword3" class="col-lg-2 control-label">详细:</label>
							<div class="col-lg-3">
								<label class="control-label">${pageInfo.smsDetail}</label>
							</div>
						</div>
					</form>
					<div class="form-group">
							<div class="col-lg-10 align_center">
								<!-- <button class="btn btn-primary submit" type="submit" onclick="document.getElementById('godownForma').submit();">保存</button> -->
								<a href="${pageContext.request.contextPath}/smsInfo/smsInfoIndex"><button
										class="btn btn-default button ml_20" type="button">返回</button></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>