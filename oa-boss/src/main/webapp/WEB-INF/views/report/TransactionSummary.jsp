<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title>交易汇总统计</title>
 <link rel="stylesheet" type="text/css" href="${ctx}/common/easyDatetime/easyDatetime.css"/>
	<script type="text/javascript" src="${ctx}/common/easyDatetime/easyDatetime.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/BusinessCode.js"></script>
	<script language="javascript" type="text/javascript" src="http://bossres.yunpal.cn:9002/static/DatePicker/WdatePicker.js"></script>
</head>
<body>
	<div id="content_2" class="content_wrapper">
		<div class="content_main clearfix">
			<div class="panel panel-default">
				<div class="panel-heading">内容筛选</div>
				<div class="panel-body">
					<form action="${pageContext.request.contextPath}/report/transactionSummary" method="get" id="godownForma" name="godownForma"
						class="cmxform form-horizontal">
						<div class="form-group">
			                <label class="col-xs-4 control-label">创建日期</label>
			                <div class="col-xs-3 during">
			                  <input type="text" name="createTime1" id="datetimepicker1" class="form-control input_left" value="" aria-describedby="basic-addon2" onclick="WdatePicker()"/> -
			                  <input type="text" name="createTime2" id="datetimepicker2" class="form-control input_right" value="" aria-describedby="basic-addon2" onclick="WdatePicker()"/>
			                </div>
			              </div>
						<div class="col-lg-11 align_center">
							<a onclick="BusinessCode.clearAllInput('godownForma');">
								<button class="btn btn-default button" type="button">清 除</button>
							</a> <a onclick="document.getElementById('godownForma').submit();">
								<button class="btn btn-primary submit ml_20" type="submit">查 询</button>
							</a>
						</div>
					</form>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">查询结果</div>
				<div class="panel-body">
					<!-- 结果列表 -->
					<div class="col-lg-12">
						<q:table queryService="queryService" queryKey="queryTransactionSummary"
							formId="godownForma" class="table table-striped table-bordered"
							pageSize="10" showExpButton="false"
							contextUrl="${ctx}/bussinessCode/exportExcel">
							<q:nodata>无符合条件的记录</q:nodata>
							<q:column title="成功笔数" value="${succcounts}" dataIndex="succcounts" />
							<q:column title="出具保函笔数" value="${baohancounts}" dataIndex="baohancounts" />
							<q:column title="其他处理中笔数" value="${othergoing}" dataIndex="othergoing" />
							<q:column title="业务驳回笔数" value="${bohuicounts}" dataIndex="bohuicounts" />
							<q:column title="风控驳回笔数" value="${auditcounts}" dataIndex="auditcounts" />
							<q:column title="45天过期笔数" value="${guoqicounts}" dataIndex="guoqicounts" />
						</q:table>

					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	      $(function(){
	        $("#datetimepicker1").on("click",function(e){
	          e.stopPropagation();
	          $(this).easyDatetime({
	            css : 'easyDay',
	            dateType : 'D',
	            selectback : function(){}
	          });
	        });
	        $("#datetimepicker2").on("click",function(e){
	          e.stopPropagation();
	          $(this).easyDatetime({
	            css : 'easyDay',
	            dateType : 'D',
	            selectback : function(){}
	          });
	        });
	      });
    </script>
</body>
</html>