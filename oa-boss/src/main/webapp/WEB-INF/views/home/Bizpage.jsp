<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>中天房管家</title>
</head>
<body>
	<div id="content_2" class="content_wrapper">
		<div class="content_main">
			<div class="content_main clearfix">
				<div class="panel panel-default">
				<div class="panel-heading">业务流程说明</div>
					<div class="panel-heading">流程图</div>
					<div class="panel-body">
						<div class="plumbOuter" style="height:630px">
						<img src="../../../ransomfloor-boss/static/plbmp11.png"/>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">角色说明</div>
					<div class="panel-body">
						<table class="table table-striped table-bordered">
							<tr>
								<th>角色</th>
								<th>可处理任务</th>
								<th>任务说明</th>
							</tr>
							 <tr>
				                <td rowspan="1">录单员</td>
				                <td>提交客户申请资料</td>
				                <td>填写客户信息、上传客户资料</td>
				             </tr>
							<tr>
								<td rowspan="7">经办人</td>
								<td>协议签署</td>
								<td>确认三方协议签署，上传协议照片</td>
							</tr>
							<tr>
								<td>公证确认</td>
								<td>确认已经委托公证，可录入公证费用等</td>
							</tr>
							<tr>
								<td>贷款确认</td>
								<td>确认签订贷款行协议、填写买方贷款行相关信息</td>
							</tr>
							<tr>
								<td>银行放款确认</td>
								<td>确认银行放款</td>
							</tr>
							<tr>
								<td>回款确认</td>
								<td>回款确认</td>
							</tr>
							<tr>
								<td>结单确认</td>
								<td>结单确认</td>
							</tr>
							<tr>
								<td>过户、抵押</td>
								<td>过户、抵押</td>
							</tr>
							<tr>
								<td>业务审核员</td>
								<td>资信审核</td>
								<td>客户资料审核</td>
							</tr>
							<tr>
								<td rowspan="3">风控审核员</td>
								<td>风控审核</td>
								<td>了解卖方实际情况</td>
							</tr>
							<tr>
								<td>房产确权</td>
								<td>确认房产是否冻结</td>
							</tr>
							<tr>
								<td>业务风险确认</td>
								<td>确认房产是否冻结、业务是否继续</td>
							</tr>
							<tr>
								<td rowspan="2">财务</td>
								<td>新贷款行设备收取</td>
								<td>收取新贷款银行开立的存折/银行卡、UKEY</td>
							</tr>
							<tr>
								<td>解押、费用收取确认</td>
								<td>担保费收取确认;收取解押行开立的贷款存折/银行卡、UKEY<br> 收取借款协议、收条 </td>
							</tr>
							<tr>
								<td>行政</td>
								<td>保函出具确认</td>
								<td>保函出具确认</td>
							</tr>
							<tr>
								<td>终审</td>
								<td>终审确认</td>
								<td>终审确认</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<!-- <div class="col-lg-offset-2 col-lg-10">
				<h1 class="title">欢迎登录运营系统</h1>
			</div> -->
		</div>
	</div>

</body>
</html>