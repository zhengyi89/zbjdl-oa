<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title>中天房管家</title>
<link rel="stylesheet" type="text/css"
	href="${ctx}/common/easyDatetime/easyDatetime.css" />
<script type="text/javascript"
	src="${ctx}/common/easyDatetime/easyDatetime.js"></script>
<script type="text/javascript" src="${ctx}/static/js/BusinessCode.js"></script>
</head>
<body>
	<div id="content_2" class="content_wrapper">
		<div class="content_main">
			<div class="panel panel-default">
				<div class="panel-heading">
					业务管理
				</div>

				<div class="panel-body">
					<div>
						<!-- Nav tabs -->
						<ul class="nav nav-tabs" role="tablist">
							<li role="presentation" class="active"><a href="#home"
								data-href="#待办链接" aria-controls="home" role="tab"
								data-toggle="tab">待办</a></li>
							<li role="presentation"><a href="#profile" data-href="#已办链接"
								aria-controls="profile" role="tab" data-toggle="tab">已办</a></li>
						</ul>
						<!-- Tab panes -->
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane active" id="home">
							<a class="pull-right color_red" href="${pageContext.request.contextPath}/wftask/wfTaskInfoIndex">更多</a>
								<div class="col-lg-12">
									<q:table queryService="queryService" queryKey="queryTaskInfo" formId="godownForma"
													class="table table-striped table-bordered" pageSize="5" paging="false">
										<q:param name="userId" value="${userId}"/>
										<q:column title="ID" value="${id}" hidden="hidden" />
										<q:nodata>无符合条件的记录</q:nodata>
										<q:column title="序号" value="${_rowstatus.globalIndex}" width="4%" />
										<q:column title="业务编号" value="${taskno}" width="8%"/> 
										<q:column title="经办人姓名" value="${username}" width="10%"/>
										<q:column title="中介姓名" value="${mediationname}" width="11%"/>
										<q:column title="卖方姓名" value="${sellername}" width="10%"/>
										<q:column title="买方姓名" value="${buyername}" width="8%"/>
										<q:column title="业务来源" escapeHtml="false" value="${_textResource.getSysText('BUSINESSSOURCE', businesssource)}" width="10%"/>
										<q:column title="解押金额" value="${_messageFormater.formatNumber(sellersolutionamount)}" width="10%"/>
										<q:column title="待办节点" value="${taskname}" width="10%"/>
										<q:column title="创建时间" width="9%" >
											<fmt:formatDate value="${createtime}" pattern="yyyy-MM-dd HH:mm:ss" />
										</q:column>
										<q:column title="操作" escapeHtml="false" width="10%">
											<c:if test="${status == '0' || status == '8' || status == '7'}">
												<a class="margr4" href="${ctx}/wftask/toWfTaskInfoEdit?id=${id}">编辑</a>
											</c:if>
											<c:if test="${status == '1'}">
											<a class="margr4" href="${ctx}/wftask/taskDetail?taskId=${id}&processId=${taskid}">审批</a>
											</c:if>
											<a class="margr4" href="${ctx}/wftask/viewProcessDiagram?processInstanceId=${processinstanceid}&id=${id}" target="_blank">查看流程</a>
										</q:column>
									</q:table>	
								</div>
							</div>
							<div role="tabpanel" class="tab-pane" id="profile">
							<a class="pull-right color_red" href="${pageContext.request.contextPath}/wftask/wfHasdoTaskInfoIndex">更多</a>
								<div class="col-lg-12">
									<q:table queryService="queryService" queryKey="queryHasdoTaskInfo" formId="godownForma"
													class="table table-striped table-bordered" pageSize="5" paging="false">
										<q:param name="userId" value="${userId}"/>
										<q:column title="ID" value="${id}" hidden="hidden" />
										<q:nodata>无符合条件的记录</q:nodata>
										<q:column title="序号" value="${_rowstatus.globalIndex}" width="4%" />
										<q:column title="业务编号" value="${taskno}" width="8%"/> 
										<q:column title="经办人姓名" value="${username}" width="8%"/>
										<q:column title="中介姓名" value="${mediationname}" width="8%"/>
										<q:column title="卖方姓名" value="${sellername}" width="8%"/>
										<q:column title="买方姓名" value="${buyername}" width="8%"/>
										<q:column title="业务来源" escapeHtml="false" value="${_textResource.getSysText('BUSINESSSOURCE', businesssource)}" width="10%"/>
										<q:column title="解押金额" value="${_messageFormater.formatNumber(sellersolutionamount)}" width="10%"/>
										<q:column title="待办角色" value="${status != '2' ? groupname : ''}" width="8%"/>
										<q:column title="待办节点" escapeHtml="false" value="${_textResource.getSysText('TASK_APPROVE_STEP', taskname)}" width="9%"/>
										<q:column title="创建时间" width="9%" >
											<fmt:formatDate value="${createtime}" pattern="yyyy-MM-dd HH:mm:ss" />
										</q:column>
										<q:column title="操作" escapeHtml="false" width="10%">
										<c:if test="${user eq taskuserid && status eq '1' && taskname ge 4 && taskname le 12}">
											<a class="margr4" href="${ctx}/wftask/toWfTaskInfoEdit?id=${id}&type=on">补充资料</a>
										</c:if>	
										<a class="margr4" href="${ctx}/wftask/wfProcessInfo?id=${id}">查看</a>
											<a class="margr4" href="${ctx}/wftask/viewProcessDiagram?processInstanceId=${processinstanceid}&id=${id}" target="_blank">查看流程</a>
										</q:column>
									</q:table>	
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					公告
					<span class="glyphicon glyphicon-volume-up"> </span> <a class="pull-right color_red" href="${pageContext.request.contextPath}/notice/noticeIndex">更多</a>
				</div>

				<div class="panel-body">
					<div>
						<q:table queryService="queryService" queryKey="queryNotice"
							formId="godownForma" class="table table-striped table-bordered"
							pageSize="5" paging="false">
							<q:column title="ID" value="${id}" hidden="hidden" dataIndex="id" />
							<q:nodata>无符合条件的记录</q:nodata>
							<q:column title="公告编号" value="${bizno}" dataIndex="bizno" />
							<q:column title="公告标题" value="${title}" dataIndex="title" />
							<q:column title="创建时间">
								<fmt:formatDate value="${cretime}" pattern="yyyy-MM-dd HH:mm:ss" />
							</q:column>
							<q:column title="创建人" value="${creuser}" dataIndex="creuser" />
							<q:column title="修改时间">
								<fmt:formatDate value="${dem1}" pattern="yyyy-MM-dd HH:mm:ss" />
							</q:column>
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
		$(function() {
			$("#datetimepicker1").on("click", function(e) {
				e.stopPropagation();
				$(this).easyDatetime({
					css : 'easyDay',
					dateType : 'D',
					selectback : function() {
					}
				});
			});
			$("#datetimepicker2").on("click", function(e) {
				e.stopPropagation();
				$(this).easyDatetime({
					css : 'easyDay',
					dateType : 'D',
					selectback : function() {
					}
				});
			});
		});

		$("ul.nav li").on(
				"click",
				function() {
					if ($(this).hasClass("active")) {
						return;
					} else {
						$("#tab_href").attr("href", $(this).find("a").attr("data-href"));
					}
				});
	</script>


</body>
</html>