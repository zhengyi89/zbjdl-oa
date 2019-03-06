<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.zbjdl.common.utils.config.TextResource" %>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title>战报表</title>
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
				<form class="cmxform form-horizontal" action="${ctx}/report/orderSummary" method="get"
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
					<table class="table table-striped">
			            <thead style="background-color: #f5f5f5;">
			              <tr>
			                <th>城市</th>
			                <th>日业绩</th>
			                <th>月业绩</th>
			                <th>目标业绩</th>
			                <th>未完成业绩</th>
			                <th>完成率</th>
			              </tr>
			            </thead>
			            <tbody>
			            	<c:forEach items="${list }"  var="dto">
			            		 <tr>
					                <td>${dto.city }</td>
					                <td>${dto.dayAmount }</td>
					                <td>${dto.monthAmount }</td>
					                <td>${dto.targetAmount }</td>
					                <td>${dto.unsellAmount }</td>
					                <td>${dto.finishRate }%</td>
					              </tr>
			            	</c:forEach>
			            </tbody>
			          </table>
			          
			          
			          <table class="table table-striped" >
			            <tr style="background-color: #f5f5f5;"> 
			                <td>日业绩总金额</td>
			                <td>${sumDay }</td>
			              </tr>
			              <tr style="background-color: #f5f5f5;">
			              	 <td>月业绩总金额</td>
			                 <td>${sumMonth }</td>
			              </tr>
			          </table>
					
				</div>
			</div>
		</div>
	</div>
  	 <script type="text/javascript">
    </script>
</body>
</html>
