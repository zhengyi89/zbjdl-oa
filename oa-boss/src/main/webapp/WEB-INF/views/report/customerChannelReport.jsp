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
<title>获客渠道表</title>
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
				<form class="cmxform form-horizontal" action="${ctx}/report/customerChannel" method="get"
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
					<table class="table table-bordered">
			            <thead>
			              <tr  style="background-color: #f5f5f5;">
			                <th colspan="2">总计</th>
			                <th>毛利</th>
			                <th>注册+代帐</th>
			                <th>纯注册</th>
			                <th>纯代帐</th>
			                <th>纯增值</th>
			                <th>高端业务</th>
			                <th>资质业务</th>
			                <th>HR业务</th>
			                <th>总订单数</th>
			                <th>新增数</th>
			                <th>企大师</th>
			                <th>企顺宝</th>
			                <th>转介绍</th>
			                <th>老客户</th>
			                <th>电话</th>
			                <th>渠道商</th>
			                <th>机会库</th>
			                <th>地推</th>
			              </tr>
			              <tr>
			              	<th>城市</th>
			              	<th>姓名</th>
			                <th>${summary.c3 }</th>
			                <th>${summary.c4 }</th>
			                <th>${summary.c4 }</th>
			                <th>${summary.c5 }</th>
			                <th>${summary.c6 }</th>
			                <th>${summary.c7 }</th>
			                <th>${summary.c8 }</th>
			                <th>${summary.c9 }</th>
			                <th>${summary.c10 }</th>
			                <th>${summary.c11 }</th>
			                <th>${summary.c12 }</th>
			                <th>${summary.c13 }</th>
			                <th>${summary.c14 }</th>
			                <th>${summary.c15 }</th>
			                <th>${summary.c16 }</th>
			                <th>${summary.c17 }</th>
			                <th>${summary.c18 }</th>
			                <th>${summary.c19 }</th>
			                
			              </tr>
			            </thead>
			          </table>
			      
			      
			          <table class="table table-bordered">
			            <thead  style="background-color: #f5f5f5;">
			              <tr>
			                <th rowspan="2">城市</th>
			                <th rowspan="2">姓名</th>
			                <th rowspan="2">毛利</th>
			                <th colspan="7">收入来源</th>
			                <th rowspan="2">总订单数</th>
			                <th rowspan="2">新增数</th>
			                <th colspan="8">客户来源</th>
			              </tr>
			              <tr>
			                <th>注册+代帐</th>
			                <th>纯注册</th>
			                <th>纯代帐</th>
			                <th>纯增值</th>
			                <th>高端业务</th>
			                <th>资质业务</th>
			                <th>HR业务</th>
			                <th>企大师</th>
			                <th>企顺宝</th>
			                <th>转介绍</th>
			                <th>老客户</th>
			                <th>电话</th>
			                <th>渠道商</th>
			                <th>机会库</th>
			                <th>地推</th>
			              </tr>
			            </thead>
			            <tbody>
			            	<c:forEach items="${list }"  var="dto">
			            		<c:if test="${dto.value.c2 =='总计'}"><tr style="background-color: #ffc800b8;"></c:if>
			            		<c:if test="${dto.value.c2 !='总计' }"><tr></c:if>
					                <!-- <td>1</td> -->
					                <%-- <td><fmt:formatDate value="${dto.dtoDate }" pattern="yyyy-MM-dd" /></td> --%>
					                <td>${dto.value.c1 }</td>
					                <td>${dto.value.c2 }</td>
					                <td>${dto.value.c3 }</td>
					                <td>${dto.value.c4 }</td>
					                <td>${dto.value.c4 }</td>
					                <td>${dto.value.c5 }</td>
					                <td>${dto.value.c6 }</td>
					                <td>${dto.value.c7 }</td>
					                <td>${dto.value.c8 }</td>
					                <td>${dto.value.c9 }</td>
					                <td>${dto.value.c10 }</td>
					                <td>${dto.value.c11 }</td>
					                <td>${dto.value.c12 }</td>
					                <td>${dto.value.c13 }</td>
					                <td>${dto.value.c14 }</td>
					                <td>${dto.value.c15 }</td>
					                <td>${dto.value.c16 }</td>
					                <td>${dto.value.c17 }</td>
					                <td>${dto.value.c18 }</td>
					                <td>${dto.value.c19 }</td>
					                <%-- <td>${dto.value.c20 }</td> --%>
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
