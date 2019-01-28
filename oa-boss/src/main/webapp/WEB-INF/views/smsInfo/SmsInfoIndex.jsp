<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title>短信管理</title>
 <link rel="stylesheet" type="text/css" href="${ctx}/common/easyDatetime/easyDatetime.css"/>
	<script type="text/javascript" src="${ctx}/common/easyDatetime/easyDatetime.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/BusinessCode.js"></script>
	<script language="javascript" type="text/javascript" src="http://bossres.yunpal.cn:9002/static/DatePicker/WdatePicker.js"></script>
</head>
<body>
	<div id="content_2" class="content_wrapper">
		<div class="content_main">
			<div class="panel panel-default">
				<div class="panel-heading">内容筛选</div>
				<div class="panel-body">
					<form action="${pageContext.request.contextPath}/smsInfo/smsInfoIndex" method="get" id="godownForma" name="godownForma"
						class="cmxform form-horizontal">
						 <div class="form-group">
			                <label class="col-xs-2 control-label">发送日期</label>
			                <div class="col-xs-3 during">
			                  <input type="text" name="sendTime1" id="datetimepicker1" class="form-control input_left" value="" aria-describedby="basic-addon2" onclick="WdatePicker()"/> -
			                  <input type="text" name="sendTime2" id="datetimepicker2" class="form-control input_right" value="" aria-describedby="basic-addon2" onclick="WdatePicker()"/>
			                </div>
			                <label class="col-lg-1 control-label">业务编号</label>
			                <div class="col-xs-3">
			                  <input type="text" class="form-control" placeholder="" value="" name="bizNo"/>
			                </div>
			              </div>
						<div class="form-group">
							<label for="customerType" class="col-lg-2 control-label">接收人姓名</label>
							<div class="col-lg-3">
								<input type="text" id="receiveName" name="receiveName" class="form-control" placeholder="" />
							</div>
							<label for="customerType" class="col-lg-1 control-label">接收手机号</label>
							<div class="col-lg-3">
								<input type="text" id="receiveMobile" name="receiveMobile" class="form-control" placeholder="" />
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
						<q:table queryService="queryService" queryKey="querySmsInfo"
							formId="godownForma" class="table table-striped table-bordered"
							pageSize="10" showExpButton="false"
							contextUrl="${ctx}/bussinessCode/exportExcel">
							<q:column title="ID" value="${id}" hidden="hidden" dataIndex="id" />
							<q:nodata>无符合条件的记录</q:nodata>
							<q:column title="发送流水" value="${serialno}" dataIndex="serialno" />
							<q:column title="发送时间" escapeHtml="false" dataIndex="sendtime">${fn:substring(sendtime, 0, 19)}</q:column>
							<q:column title="接收人姓名" value="${receivename}" dataIndex="receivename" />
							<q:column title="接收人手机" value="${receivemobile}" dataIndex="receivemobile" />
							<q:column title="业务编号" value="${bizno}" dataIndex="bizno" />
							<q:column title="发送状态" value="${_textResource.getSysText('SMSSTATE', smsstate)}" dataIndex="smsstate" />
							<q:column title="原发送流水" value="${oriserialno}" dataIndex="oriserialno" />
							<q:column title="详细" value="${smsdetail}" dataIndex="smsdetail" />
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