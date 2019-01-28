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
          <div class="panel-heading">业务查询</div>
          <div class="panel-body">
            <form class="cmxform form-horizontal" action="${ctx}/wftask/wfHasdoTaskInfoIndex" method="get" id="godownForma"
				  name="godownForma">
              <div class="form-group">
                <label class="col-xs-2 control-label">业务编号</label>
                <div class="col-xs-3">
                  <input type="text" class="form-control" placeholder="" value="" id="taskNo" name="taskNo"/>
                </div>
                <div class="col-xs-1 tip"></div>
                <label class="col-xs-2 control-label">经办人姓名</label>
                <div class="col-xs-3">
                  <input type="text" class="form-control" placeholder="" value="" id="userName" name="userName"/>
                </div>
                <div class="col-xs-1 tip"></div>
              </div>
              <div class="form-group">
                <label for="datePicker" class="col-xs-2 control-label">创建开始时间</label>
					<div class="col-xs-3 ">
						<div class="input-group">
							<input id="createTimeBegin" name="createTimeBegin" type="text"
								class="form-control" placeholder=""
								aria-describedby="basic-addon2" onclick="WdatePicker()">
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-calendar"></span></span>
						</div>
					</div>
					<div class="col-xs-1 tip"></div>
					<label for="datePicker" class="col-xs-2 control-label">创建结束时间</label>
					<div class="col-xs-3 ">
						<div class="input-group">
							<input id="createTimeEnd" name="createTimeEnd" type="text"
								class="form-control" placeholder=""
								aria-describedby="basic-addon2" onclick="WdatePicker()">
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-calendar"></span></span>
						</div>
					</div>
              </div>
              <div class="form-group">
                <label class="col-xs-2 control-label">卖方姓名</label>
                <div class="col-xs-3">
                  <input type="text" class="form-control" placeholder="" value="" id="sellerName" name="sellerName"/>
                </div>
                <div class="col-xs-1 tip"></div>
                <label class="col-xs-2 control-label">卖方手机号</label>
                <div class="col-xs-3">
                  <input type="text" class="form-control" placeholder="" value="" id="sellerPhone" name="sellerPhone"/>
                </div>
                <div class="col-xs-1 tip"></div>
              </div>
              <div class="form-group ">
                <label class="col-xs-2 control-label">买方姓名</label>
                <div class="col-xs-3">
                  <input type="text" class="form-control" placeholder="" value="" id="buyerName" name="buyerName"/>
                </div>
                <div class="col-xs-1 tip"></div>
                <label class="col-xs-2 control-label">买方手机号</label>
                <div class="col-xs-3">
                  <input type="text" class="form-control" placeholder="" value="" id="buyerPhone" name="buyerPhone"/>
                </div>
                <div class="col-xs-1 tip"></div>
              </div>
              <div class="form-group selectDepart">
                <label class="col-xs-2 control-label">业务状态</label>
                <div class="col-xs-3">
                  <select class="form-control" id="taskStatus" name="taskStatus">
                  	<option value=""></option>
                  	<option value="all">全部</option>
                  	<option value="finish">已完结</option>
                  	<option value="other">其他</option>
                  </select>
                </div>
                <div class="col-xs-1 tip"></div>
                
              </div>
              <div class="col-xs-12 align_center">
              	<button class="btn btn-default button" type="button" onclick="BusinessCode.clearAllInput('godownForma');">清除</button>
                <button class="btn btn-primary submit" type="submit" onclick="document.getElementById('godownForma').submit();">查   询</button>
              </div>
            </form>
          </div>
        </div>
        <div class="panel panel-default">
          <div class="panel-heading">任务列表</div>
          <div class="panel-body">
            <div class="col-xs-12">
            <q:table queryService="queryService" queryKey="queryHasdoTaskInfo" formId="godownForma"
							class="table table-striped table-bordered" pageSize="10">
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
    <script type="text/javascript">
      $(function(){
        $("#createTimeBegin1").on("click",function(e){
          e.stopPropagation();
          $(this).easyDatetime({
            css : 'easyDay',
            dateType : 'D',
            selectback : function(){}
          });
        });
        $("#createTimeEnd1").on("click",function(e){
          e.stopPropagation();
          $(this).easyDatetime({
            css : 'easyDay',
            dateType : 'D',
            selectback : function(){}
          });
        });
        $("td.sorting").on("click",function(){
          var _this = $(this);
          if(_this.find("span").hasClass("glyphicon-triangle-bottom")){
            _this.find("span").removeClass("glyphicon-triangle-bottom").addClass("glyphicon-triangle-top");
          }else{
            _this.find("span").removeClass("glyphicon-triangle-top").addClass("glyphicon-triangle-bottom");
          }
        });
      });
    </script>
  </body>
</html>