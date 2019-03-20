<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.zbjdl.common.utils.config.TextResource" %>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title>外勤展板</title>
<script language="javascript" type="text/javascript" src="${resourcePath}/DatePicker/WdatePicker.js"></script>
</head>
<body>
	<div id="content_2" class="content_wrapper">
		<div class="content_main">
			<div class="panel panel-default">
				<div class="panel-heading">内容筛选</div>
				<div class="panel-body">
					<form class="cmxform form-horizontal" action="${ctx}/commonReport/index2" method="get"
						method="get" id="companyForm" name="companyForm">
						<!-- 第一组查询条件 -->
						<div class="form-group">
							<label class="control-label col-lg-2">外勤日期</label>
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
				<div class="panel-heading">固定资产列表</div>
				<div class="panel-body">
					<div class="panel-table">
						<q:table queryService="queryService" queryKey="queryCommonReport2" formId="godownForma"
							class="table table-striped table-bordered" pageSize="50">
							<q:nodata>无符合条件的记录</q:nodata>
							<%-- <q:param name="systemCode" value="${SESSION_ACCOUNTINFO.systemCode}" /> --%>
							<q:column title="序号" value="${_rowstatus.globalIndex}" with="10％" />
				            <q:column title="日期" value="${col1 }" width="10%" />
				            <q:column title="办理人员" value="${user_name }" width="10%" />
				            <q:column title="注册类" value="${col2}" width="10%" />
				            <q:column title="已完成" value="${col3}" width="10%" />
				            <q:column title="正常" value="${col4}" width="10%" />
				            <q:column title="延期" value="${col5}" width="10%" />
				            <q:column title="变更类" value="${col6}" width="10%" />
				            <q:column title="已完成" value="${col7}" width="10%" />
				            <q:column title="正常" value="${col8}" width="10%" />
				            <q:column title="延期" value="${col9}" width="10%" />
				            <q:column title="税务类" value="${col10}" width="10%" />
				            <q:column title="已完成" value="${col11}" width="10%" />
				            <q:column title="正常" value="${col12}" width="10%" />
				            <q:column title="延期" value="${col13}" width="10%" />
				            <q:column title="注销类" value="${col14}" width="10%" />
				            <q:column title="已完成" value="${col15}" width="10%" />
				            <q:column title="正常" value="${col16}" width="10%" />
				            <q:column title="延期" value="${col17}" width="10%" />
				            <q:column title="资质、社保、公积金类" value="${col18}" width="10%" />
				            <q:column title="已完成" value="${col19}" width="10%" />
				            <q:column title="正常" value="${col20}" width="10%" />
				            <q:column title="延期" value="${col21}" width="10%" />
				            <q:column title="工商年报" value="${col22}" width="10%" />
				            <q:column title="已完成" value="${col23}" width="10%" />
				            <q:column title="正常" value="${col24}" width="10%" />
				            <q:column title="延期" value="${col25}" width="10%" />
				            <q:column title="核名" value="${col26}" width="10%" />
				            <q:column title="已完成" value="${col27}" width="10%" />
				            <q:column title="正常" value="${col28}" width="10%" />
				            <q:column title="延期" value="${col29}" width="10%" />
						</q:table>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	<!--  end -->
	<script type="text/javascript">
    $(function(){
      
    });
  </script>
</body>
</html>
