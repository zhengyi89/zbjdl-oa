<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
  <head>
    <title>中天房管家</title>
  </head>
  <body>
    <div id="content_2" class="content_wrapper">
      <div class="content_main clearfix">
       <form class="cmxform form-horizontal" id="godownForma" name="godownForma" action="${ctx}/wftask/saveWfRemark" method="post">
       <input id="id" name="id" value="${id }" type="hidden">
       <input id="token" name="token" value="${token }" type="hidden">
       <input id="wfTaskId" name="wfTaskId" value="${taskId }" type="hidden">
        <div class="panel panel-default">
          <div class="panel-heading">备注信息</div>
          <div class="panel-body">
              <div class="form-group">
                <label class="col-xs-2 control-label">备注内容</label>
                <div class="col-xs-9">
                  <textarea class="form-control" required="required" title="备注内容" placeholder="请填写备注内容" maxlength="2500" rows="15" id="remark" name="remark" >${wfTaskRemark.remark }</textarea>
                </div>
              </div>
          </div>
        </div>
        <div class="col-xs-12 align_center">
          <button type="button" class="btn btn-primary submit ml_20" onclick="javascript:window.history.go(-1);">返   回</button>
          <button type="submit" class="btn btn-primary submit ml_20" onclick="javascript:checkData();">提   交</button>
        </div>
        </form>
      </div>
    </div>
    <script type="text/javascript">
    function checkData(){
    	var remark = $("#remark").val();
    	if(remark == null || remark == ''){
    		alert("备注内容不能为空");
    		return false;
    	}
    }
    </script>
  </body>
</html>