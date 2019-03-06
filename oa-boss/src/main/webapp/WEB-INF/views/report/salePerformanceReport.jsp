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
<title>我的客户</title>
<script language="javascript" type="text/javascript" src="${resourcePath}/DatePicker/WdatePicker.js"></script>
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
				<form class="cmxform form-horizontal" action="${ctx}/company/index" method="get"
						method="get" id="companyForm" name="companyForm">
						<!-- 第一组查询条件 -->
						<div class="form-group">
							<label class="control-label col-lg-2">报表月份</label>
							<div class="col-lg-3">
								<select class="form-control" id="date" name="date">
									<c:forEach items="${dateSet}" var="item">
										<option value="${item}" <c:if test="${item == date}">selected</c:if>>
											${item } 
										</option>
									</c:forEach>
								</select>
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
			            <tbody>
			            	<c:forEach items="${list }"  var="dto" varStatus="index">
			            		<%-- <c:if test="${dto.value =='总计'}"><tr style="background-color: #ffc800b8;"></c:if>
			            		<c:if test="${dto.value.c2 !='总计' }"><tr></c:if> --%>
			            		<c:if test="${index.count == 1 }">
			            			<tr style="background-color: #f5f5f5;">
			            		</c:if>
			            		<c:if test="${index.count > 1  && dto.value[1]!='总计'}">
			            			<tr>
			            		</c:if>
			            		<c:if test="${index.count > 1 && dto.value[1]=='总计'}">
			            			<tr style="background-color: #ffc800b8;">
			            		</c:if>
			           			<c:forEach items="${dto.value }"  var="item" >
			           				<c:if test="${index.count == 1 }">
				            			<th>${item }</th>
				            		</c:if>
			           				<c:if test="${index.count > 1 }">
				            			<td>${item }</td>
				            		</c:if>
			           			</c:forEach>
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
	    $('#date').bind('input change', function() {
	    	var tmp = $('#date').val();
	    	console.log(tmp);
	    	if(date != tmp){
	    		window.location.href= '${ctx}/report/salePerformance?date='+tmp;
	    	}
	    });	
    </script>
</body>
</html>
