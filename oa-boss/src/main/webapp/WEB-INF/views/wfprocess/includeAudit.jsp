<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ page import="com.zbjdl.common.utils.config.TextResource" %>

<div class="panel panel-default">
          <div class="panel-heading">三方协议详情</div>
          <div class="panel-body">
            <div class="col-xs-12">
              <table class="table table-striped table-bordered">
                <tr>
                  <th>业务编号</th>
                  <td>${wfTaskBo.wfTaskInfo.taskNo }</td>
                  <th>业务来源</th>
                  <td>${_textResource.getSysText('BUSINESSSOURCE', wfTaskBo.wfTaskInfo.businessSource)}</td>
                  <th>业务员姓名</th>
                  <td>${newwfTaskBo.wfTaskInfo.salesmanName }</td>
                  <th>业务员手机</th>
                  <td>${wfTaskBo.wfTaskInfo.salesmanPhone }</td>
                </tr>
                <tr>
                  <th>创建时间</th>
                  <td colspan="3"><fmt:formatDate value="${wfTaskBo.wfTaskInfo.createTime }" pattern="yyyy-MM-dd HH:mm:ss" />
                  </td>
                  <th>更新时间</th>
                  <td colspan="3"><fmt:formatDate value="${wfTaskBo.wfTaskInfo.updateTime }" pattern="yyyy-MM-dd HH:mm:ss" />
                  </td>
                </tr>
                <tr>
                  <th>卖方姓名</th>
                  <td>${wfTaskBo.sellerWfUserInfo.nameA}</td>
                  <th>卖方手机号</th>
                  <td>${wfTaskBo.sellerWfUserInfo.phoneA}</td>
                  <th>买方姓名</th>
                  <td>${wfTaskBo.buyerWfUserInfo.nameA}</td>
                  <th>买方手机号</th>
                  <td>${wfTaskBo.buyerWfUserInfo.phoneA}</td>
                </tr>
                <tr>
                  <th>中介姓名</th>
                  <td>${newwfTaskBo.wfTaskInfo.mediationName }</td>
                  <th>中介手机号</th>
                  <td>${wfTaskBo.wfTaskInfo.mediationPhone }</td>
                  <th>产权地址</th>
                  <td colspan="3">${wfTaskBo.sellerWfUserInfo.sellerCertificateAdress}</td>
                </tr>
              </table>
            </div>
            <div class="col-xs-12 align_center">
              <a class="btn btn-primary submit" href="${ctx }/wftask/wfProcessInfo?id=${wfTaskBo.wfTaskInfo.id}">查看详情</a>
            </div>
          </div>
        </div>