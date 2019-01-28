<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ page import="com.zbjdl.common.utils.config.TextResource" %>

<div class="panel panel-default">
        <div class="panel-heading">流程节点</div>
        <div class="panel-body">
          <div class="col-xs-12">
            <table class="table table-striped table-bordered">
              <tr>
                <th>节点</th>
                <th>操作人</th>
                <th>操作状态</th>
                <th>接收时间</th>
                <th>操作时间</th>
                <th>操作耗时</th>
                <th>审核意见</th>
              </tr>
              <c:forEach var="approves" items="${approveList }">
              	<tr>
                <td>${approves.approvalNode }</td>
                <td>${approves.userName }</td>
                <td>${approves.status }</td>
                <td><fmt:formatDate value="${approves.beginDate }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                <td><fmt:formatDate value="${approves.handelDate }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                <td>${approves.operateTime }</td>
                <td>${approves.suggestion }</td>
              </tr>
              </c:forEach>
            </table>
          </div>
        </div>
      </div>

          