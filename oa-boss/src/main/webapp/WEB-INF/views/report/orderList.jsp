<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.zbjdl.common.utils.config.TextResource" %>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<style type="text/css">
	table th{word-break: keep-all;white-space:nowrap;}
</style>
<title>订单列表</title>
<script type="text/javascript" src="${resourcePath}/DatePicker/WdatePicker.js"></script>
</head>
<body>
	<!-- begin -->
    <%pageContext.setAttribute("_textResource", new TextResource()); %>
	<div id="content_2" class="content_wrapper">
		<div class="content_main">
			<div class="panel panel-default">
				<div class="panel-heading">内容筛选</div>
				<div class="panel-body">
				<form id="changeStatusForm" action="" method="post">
			      <input type="hidden" id="id" name="id" value=""/>
				</form>
				<form class="cmxform form-horizontal" action="${ctx}/report/orderList" method="get"
						method="get" id="companyForm" name="companyForm">
						<!-- 第一组查询条件 -->
						<div class="form-group">
							<label class="control-label col-lg-2">报表月份</label>
							<div class="col-lg-3">
								<input type="text" name="date" id="date" class="form-control input_left"  onclick="WdatePicker()" value = "<fmt:formatDate value="${date}" dateStyle="default" />"/>
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-11 align_center">
								<a onclick="document.getElementById('companyForm').submit();">
									<button class="btn btn-primary submit ml_20" type="submit">查 询</button>
								</a>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">查询结果</div>
				<div class="panel-body">
					<div class="panel-table">
					<table class="table table-striped" id="num">
			            <thead style="background-color: #f5f5f5;">
			              <tr>
			                <th>序号</th>
			                <th>工号</th>
			                <th>姓名</th>
			                <th>城市</th>
			                <th>产品类型</th>
			                <th>客户类型</th>
			                <th>获客渠道</th>
			                <th>产品细分</th>
			                <th>产品内容</th>
			                <th>套餐类型</th>
			                <th>服务详情</th>
			                <th>公司名称</th>
			                <th>客户姓名</th>
			                <th>联系方式</th>
			                <th>总额</th>
			                <th>实收</th>
			                <th>尾款</th>
			                <th>刻章</th>
			                <th>税控器</th>
			                <th>地址</th>
			                <th>开户</th>
			                <th>加急费用</th>
			                <th>资质成本</th>
			                <th>保证金</th>
			                <th>其他成本</th>
			                <th>其他收入</th>
			                <th>代帐费用</th>
			                <th>总额</th>
			                <th>猪八戒ID</th>
			                <th>订单ID</th>
			                <th>合同号</th>
			                <th>付款方式</th>
			              </tr>
			            </thead>
			            <tbody>
			            	<c:forEach items="${list }"  var="order">
			            		 <tr>
					                <td></td>
					                <td>${order.jobNo }</td>
					                <td>${order.userName }</td>
					                <td>${order.city }</td>
					                <td>${_textResource.getSysText('OA_PRODUCT_TYPE', order.productType)}</td>
					                <td>${_textResource.getSysText('OA_SELL_TYPE', order.customerType)}</td>
					                <td>${_textResource.getSysText('OA_CUSTOMER_CHANNEL', order.customerChannel)}</td>
					                <td>${_textResource.getSysText('OA_PRODUCT_DETAIL_TYPE', order.productDetailType)}</td>
					                <td>${_textResource.getSysText('OA_CUSTOMER_TYPE', order.productContext)}</td>
					                <td>${_textResource.getSysText('OA_PACKAGE_TYPE', order.productPackage)}</td>
					                <td>${order.serverDetails }</td>
					                <td>${order.companyName }</td>
					                <td>${order.customerName }</td>
					                <td>${order.mobile }</td>
					                <td>${order.orderSumAmount }</td>
					                <td>${order.orderRealAmount }</td>
					                <td>${order.orderRetailAmount }</td>
					                <td>${order.cost1 }</td>
					                <td>${order.cost2 }</td>
					                <td>${order.cost3 }</td>
					                <td>${order.cost4 }</td>
					                <td>${order.cost5 }</td>
					                <td>${order.cost6 }</td>
					                <td>${order.cost7 }</td>
					                <td>${order.costOther }</td>
					                <td>${order.profitOther }</td>
					                <td>${order.profitAccount }</td>
					                <td>${order.profitAmount }</td>
					                <td>${order.zbjId }</td>
					                <td>${order.orderNo }</td>
					                <td>${order.contractNo }</td>
					                <td>${order.payChannel }</td>
					              </tr>
			            	</c:forEach>
			            </tbody>
			          </table>
					</div>
				</div>
			</div>
		</div>
	</div>
  	 <script type="text/javascript">
    </script>
</body>
</html>
