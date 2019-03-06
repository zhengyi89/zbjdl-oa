<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.zbjdl.common.utils.config.TextResource" %>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title>商机数表</title>
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
				<form class="cmxform form-horizontal" action="${ctx}/report/bussAnalyze" method="get"
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
			            <thead style="background-color: #f5f5f5;">
			           	  <tr>
			                <th rowspan="2">城市</th>
			                <th rowspan="2">姓名</th>
			                <th colspan="5" style="text-align: center;">BOSS商机库</th>
			                <th colspan="5" style="text-align: center;">企大师</th>
			                <th colspan="5" style="text-align: center;">企顺宝</th>
			              </tr>
			              <tr>
			                <th>日领取商机数</th>
			                <th>日成交商机数</th>
			                <th>月累计领取商机数</th>
			                <th>月累计成交商机数</th>
			                <th>月累计成交百分比</th>
			                <th>日领取商机数</th>
			                <th>日成交商机数</th>
			                <th>月累计领取商机数</th>
			                <th>月累计成交商机数</th>
			                <th>月累计成交百分比</th>
			                <th>日领取商机数</th>
			                <th>日成交商机数</th>
			                <th>月累计领取商机数</th>
			                <th>月累计成交商机数</th>
			                <th>月累计成交百分比</th>
			              </tr>
			            </thead>
			            <tbody>
			            	<c:forEach items="${list }"  var="dto">
			            		<c:if test="${dto.userName =='总计'}"><tr style="background-color: #ffc800b8;"></c:if>
			            		<c:if test="${dto.userName !='总计' }"><tr></c:if>
					                <td>${dto.city }</td>
					                <td>${dto.userName }</td>
					                <td>${dto.dayOpp1 }</td>
					                <td>${dto.bossDay }</td>
					                <td>${dto.monthOpp1 }</td>
					                <td>${dto.bossMonth }</td>
					                <td><fmt:formatNumber value="${dto.bossMonth/dto.monthOpp1 }" pattern="#0.00%"/></td>
					                <td>${dto.dayOpp2 }</td>
					                <td>${dto.qdsDay }</td>
					                <td>${dto.monthOpp2 }</td>
					                <td>${dto.qdsMonth }</td>
					                <td><fmt:formatNumber value="${dto.qdsMonth/dto.monthOpp2 }" pattern="#0.00%"/></td>
					                <td>${dto.dayOpp3 }</td>
					                <td>${dto.qsbDay }</td>
					                <td>${dto.monthOpp3 }</td>
					                <td>${dto.qsbMonth }</td>
					                <td><fmt:formatNumber value="${dto.qsbMonth/dto.monthOpp3 }" pattern="#0.00%"/></td>
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
	    /* $('#date').bind('input change', function() {
	    	var tmp = $('#date').val();
	    	console.log(tmp);
	    	if(date != tmp){
	    		window.location.href= '${ctx}/report/salePerformance?date='+tmp;
	    	}
	    });	 */
    </script>
</body>
</html>
