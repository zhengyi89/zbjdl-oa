<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.zbjdl.common.utils.config.TextResource" %>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title>外勤展板</title>
<style type="text/css">
	.table>thead>tr>th {
		    vertical-align: middle;
		    text-align: center;
	        border-top: 0;
	}
</style>
<script type="text/javascript" src="${resourcePath}/DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/BusinessCode.js"></script>
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
				<form class="cmxform form-horizontal" action="${ctx}/commonReport/index2" method="get"
						method="get" id="companyForm" name="companyForm">
						<!-- 第一组查询条件 -->
						<div class="form-group">
							<label class="control-label col-lg-2">报表日期</label>
							<div class="col-lg-3">
								<input type="text" name="date" id="date" class="form-control input_left"  onclick="WdatePicker()" value = "<fmt:formatDate value="${date}" dateStyle="default" />"/>
							</div>
							
							<label class="control-label col-lg-2">城市</label>
							<div class="col-lg-3">
								<select class="form-control" id="city" name="city">
									<script type="text/javascript">
										BusinessCode.getSysConfigCode("ZBJ_CITY", "city", "${city}");
									</script>
								</select>
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
					<table class="table table-bordered">
			            <thead style="background-color: #f5f5f5;">
			           	  <tr>
			                <th rowspan="3">序号</th>
			                <th rowspan="3">办理人员</th>
			                <th colspan="4">注册类</th>
			                <th colspan="4">变更类</th>
			                <th colspan="4">税务类</th>
			                <th colspan="4">注销类</th>
			                <th colspan="4">资质、社保、公积金类</th>
			                <th colspan="4">工商年报</th>
			                <th colspan="4">核名</th>
			              </tr>
			              <tr>
			                <th rowspan="2">总件数</th>
			                <th rowspan="2">已完成</th>
			                <th colspan="2">未完成</th>
			                <th rowspan="2">总件数</th>
			                <th rowspan="2">已完成</th>
			                <th colspan="2">未完成</th>
			                <th rowspan="2">总件数</th>
			                <th rowspan="2">已完成</th>
			                <th colspan="2">未完成</th>
			                <th rowspan="2">总件数</th>
			                <th rowspan="2">已完成</th>
			                <th colspan="2">未完成</th>
			                <th rowspan="2">总件数</th>
			                <th rowspan="2">已完成</th>
			                <th colspan="2">未完成</th>
			                <th rowspan="2">总件数</th>
			                <th rowspan="2">已完成</th>
			                <th colspan="2">未完成</th>
			                <th rowspan="2">总件数</th>
			                <th rowspan="2">已完成</th>
			                <th colspan="2">未完成</th>
			              </tr>
			              <tr>
			              	<th>正常</th>
			                <th>延期</th>
			              	<th>正常</th>
			                <th>延期</th>
			              	<th>正常</th>
			                <th>延期</th>
			              	<th>正常</th>
			                <th>延期</th>
			              	<th>正常</th>
			                <th>延期</th>
			              	<th>正常</th>
			                <th>延期</th>
			              	<th>正常</th>
			                <th>延期</th>
			              </tr>
			            </thead>
			            <tbody>
			            	<c:forEach items="${list }"  var="dto">
			            		<tr>
			            			<td></td>
			            			<td>${dto.userName }</td>
			            			<td>${dto.col2 }</td>
			            			<td>${dto.col3 }</td>
			            			<td>${dto.col4 }</td>
			            			<td>${dto.col5 }</td>
			            			<td>${dto.col6 }</td>
			            			<td>${dto.col7 }</td>
			            			<td>${dto.col8 }</td>
			            			<td>${dto.col9 }</td>
			            			<td>${dto.col10 }</td>
			            			<td>${dto.col11 }</td>
			            			<td>${dto.col12 }</td>
			            			<td>${dto.col13 }</td>
			            			<td>${dto.col14 }</td>
			            			<td>${dto.col15 }</td>
			            			<td>${dto.col16 }</td>
			            			<td>${dto.col17 }</td>
			            			<td>${dto.col18 }</td>
			            			<td>${dto.col19 }</td>
			            			<td>${dto.col20 }</td>
			            			<td>${dto.col21 }</td>
			            			<td>${dto.col22 }</td>
			            			<td>${dto.col23 }</td>
			            			<td>${dto.col24 }</td>
			            			<td>${dto.col25 }</td>
			            			<td>${dto.col26 }</td>
			            			<td>${dto.col27 }</td>
			            			<td>${dto.col28 }</td>
			            			<td>${dto.col29 }</td>
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
  	 	$(function(){
  	 		var len = $('table tr').length;
	        for(var i = 3;i<len;i++){
	            $('table tr:eq('+i+') td:first').text(i-2);
	        }
  	 	})
    </script>
</body>
</html>
