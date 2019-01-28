<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title>客户管理</title>
<link rel="stylesheet" type="text/css"
	href="${ctx}/common/easyDatetime/easyDatetime.css" />
<script type="text/javascript"
	src="${ctx}/common/easyDatetime/easyDatetime.js"></script>
<script type="text/javascript" src="${ctx}/static/js/BusinessCode.js"></script>
</head>
<body>
	<div id="content_2" class="content_wrapper">
		<div class="content_main">
			<div class="panel panel-default">
				<!-- <div class="panel-heading">内容筛选</div> -->
				<div class="panel-body">
					<form
						action="${pageContext.request.contextPath}/customerInfo/customerIndex"
						method="get" id="godownForma" name="godownForma"
						class="cmxform form-horizontal" hidden="hidden">
					</form>
				</div>
			<!-- </div> -->
			<div class="panel panel-default">
				<div class="panel-heading">查询结果</div>
				<div class="panel-body">
					<!-- 结果列表 -->
					<div class="col-lg-12">
						<q:table queryService="queryService" queryKey="queryCustomerInfo" formId="godownForma" class="table table-striped table-bordered"
							pageSize="15" showExpButton="false" contextUrl="${ctx}/bussinessCode/exportExcel">
							<q:nodata>无符合条件的记录</q:nodata>
							<q:column title="客户编号" value="${userno}" dataIndex="userno" />
							<q:column title="姓名" value="${namea}" dataIndex="namea" />
							<q:column title="电话" value="${phonea}" dataIndex="phonea" />
							<q:column title="身份证号" value="${idcarda}" dataIndex="idcarda" />
							<q:column title="买卖角色" value="${_textResource.getSysText('USERTYPE', usertype)}" dataIndex="usertype" />
							<q:column title="创建时间" value="${ceratetime}" dataIndex="ceratetime" />
							<q:column title="修改时间" value="${updtetime}" dataIndex="updtetime" />
						</q:table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>