<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ include file="/common/taglibs.jsp"%>
<html lang="zh-CN">
  <head>
    <title>中天房管家</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/common/easyDatetime/easyDatetime.css"/>
	<script type="text/javascript" src="${ctx}/common/easyDatetime/easyDatetime.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/BusinessCode.js"></script>
		<script language="javascript" type="text/javascript" src="http://bossres.yunpal.cn:9002/static/DatePicker/WdatePicker.js"></script>
  </head>
  <body>
    <div id="content_2" class="content_wrapper">
      <div class="content_main">
        <div class="panel panel-default">
          <div class="panel-heading">备注列表</div>
          <div class="panel-body">
          <div class="col-xs-offset-8 col-xs-4 align_right">
              <a class="btn btn-primary submit" href="${ctx}/wftask/toWfRemarkAdd?taskId=${taskId}">新  增
                <span class="content_blank_10"></span>
                <span class="glyphicon glyphicon-plus"></span>
              </a>
            </div>
            <div class="col-xs-12">
            <q:table queryService="queryService" queryKey="queryRemarkIndex" formId="godownForma"
							class="table table-striped table-bordered" paging="false">
				<q:param name="taskId" value="${taskId}"/>
				<q:column title="ID" value="${id}" hidden="hidden" />
				<q:nodata>无符合条件的记录</q:nodata>
				<q:column title="序号" value="${_rowstatus.globalIndex}" width="4%" />
				<q:column title="备注内容" value="${remark}" width="70%" /> 
				<q:column title="修改时间" width="10%" >
					<fmt:formatDate value="${updatedate}" pattern="yyyy-MM-dd" />
				</q:column>
				<q:column title="创建时间" width="10%" >
					<fmt:formatDate value="${createdate}" pattern="yyyy-MM-dd" />
				</q:column>
				<q:column title="操作" escapeHtml="false" width="6%">
					<a class="margr4" href="${ctx}/wftask/editWfRemark?id=${id}&taskId=${wftaskid}">编辑</a>
				</q:column>
			</q:table>
			<div class="col-xs-12 align_center">
              <button type="button" class="btn btn-primary submit ml_20" onclick="javascript:goBack();">返回</button>
            </div>				
            </div>
          </div>
        </div>
      </div>
    </div>
    <script type="text/javascript">
    function goBack(){
    	window.location = '${ctx}/wftask/wfTaskRemarkInfoIndex';
    }
    </script>
  </body>
</html>