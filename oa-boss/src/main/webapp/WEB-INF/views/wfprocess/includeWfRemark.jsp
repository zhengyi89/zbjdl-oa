<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ include file="/common/taglibs.jsp"%>

<div class="panel panel-default">
        <div class="panel-heading">备注历史</div>
        <div class="panel-body">
          <div class="col-xs-12">
            <table class="table table-striped table-bordered">
              <tr>
                <th width="70%">备注内容</th>
                <th width="15%">修改时间</th>
                <th width="15%">创建时间</th>
              </tr>
              <c:forEach var="wfTaskRemark" items="${remarkList }">
              	<tr>
                <td>${wfTaskRemark.remark }</td>
                <td><fmt:formatDate value="${wfTaskRemark.createDate }" pattern="yyyy-MM-dd" /></td>
                <td><fmt:formatDate value="${wfTaskRemark.updateDate }" pattern="yyyy-MM-dd" /></td>
              </tr>
              </c:forEach>
            </table>
          </div>
        </div>
      </div>