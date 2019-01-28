<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title>公告管理</title>
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
					<form action="${pageContext.request.contextPath}/notice/noticeIndex" method="get" id="godownForma" name="godownForma"
						class="cmxform form-horizontal">
						 <div class="form-group">
			                <label class="col-xs-2 control-label">创建日期</label>
			                <div class="col-xs-3 during">
			                  <input type="text" name="cretime1" id="datetimepicker1" class="form-control input_left" value="" aria-describedby="basic-addon2" onclick="WdatePicker()"/> -
			                  <input type="text" name="cretime2" id="datetimepicker2" class="form-control input_right" value="" aria-describedby="basic-addon2" onclick="WdatePicker()"/>
			                </div>
			                <label class="col-lg-1 control-label">标题</label>
			                <div class="col-xs-3">
			                  <input type="text" class="form-control" placeholder="" value="" name="title"/>
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
						<%-- <a href="${pageContext.request.contextPath}/notice/toNoticeEdit?id=0">
								<button class="btn btn-primary submit" type="button">新 增<span class="content_blank_10"></span><span class="glyphicon glyphicon-plus"></span>
								</button>
						</a> --%>
						<q:table queryService="queryService" queryKey="queryNotice"
							formId="godownForma" class="table table-striped table-bordered"
							pageSize="10" showExpButton="false"
							contextUrl="${ctx}/bussinessCode/exportExcel">
							<q:column title="ID" value="${id}" hidden="hidden" dataIndex="id" />
							<q:nodata>无符合条件的记录</q:nodata>
							<q:column title="公告编号" value="${bizno}" dataIndex="bizno" />
							<q:column title="公告标题" value="${title}" dataIndex="title" />
							<q:column title="创建时间" dataIndex="cretime" escapeHtml="false">${fn:substring(cretime, 0, 19)}</q:column>
							<q:column title="创建人" value="${creuser}" dataIndex="creuser" />
							<q:column title="修改时间" dataIndex="dem1" escapeHtml="false">${fn:substring(dem1, 0, 19)}</q:column>
							<q:column title="操作" escapeHtml="false">
								<a class="margr4" href="${pageContext.request.contextPath}/notice/toNoticeDetail?id=${id}">
									明细
								</a>
							</q:column>
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