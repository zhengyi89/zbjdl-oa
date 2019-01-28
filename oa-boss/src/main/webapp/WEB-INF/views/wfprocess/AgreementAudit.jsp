<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ page import="com.zbjdl.common.utils.config.TextResource" %>
<html>
  <head>
    <title>中天房管家</title>
	<script type="text/javascript" src="${ctx}/static/js/BusinessCode.js"></script>
	    <link rel="stylesheet" type="text/css" href="${ctx}/common/easyDatetime/easyDatetime.css"/>
	<script type="text/javascript" src="${ctx}/common/easyDatetime/easyDatetime.js"></script>
		<script language="javascript" type="text/javascript" src="http://bossres.yunpal.cn:9002/static/DatePicker/WdatePicker.js"></script>
  </head>
<body>
    <div id="content_2" class="content_wrapper">
      <div class="content_main">
        
          <jsp:include page="includeAudit.jsp"></jsp:include>    
        
        <div class="panel panel-default">
          <div class="panel-heading">审核事项及审核意见</div>
          <div class="panel-body">
            <form class="cmxform form-horizontal" id="godownForma" name="godownForma" enctype="multipart/form-data" action="${ctx}/wftask/completeTask" method="post">
            <input id="taskId" name="taskId" type="hidden" value="${taskId }"/>
              	<input id="processId" name="processId" type="hidden" value="${processId }"/>
              	<input id="fp_status" name="fp_status" type="hidden" />
              	<input id="fp_approvalStep" name="fp_approvalStep" type="hidden" />
              	<input id="fp_approvalStatus" name="fp_approvalStatus" type="hidden" />
              	<input id="fp_appStatus" name="fp_appStatus" type="hidden" />
              <div class="form-group">
                <div class="col-xs-offset-2 col-xs-2 checkbox">
                  <label>
                    <input type="checkbox" name="fp_isSignThreeAgreement" id="fp_isSignThreeAgreement" checked="checked" value="1" onchange="this.value=(fp_isSignThreeAgreement.checked)?1:0"> 是否签订三方协议
                  </label>
                </div>
                <div class="col-xs-1 tip">*</div>
              </div>
              <div class="form-group">
                <label class="col-xs-2 control-label">协议签订时间</label>
                <div class="col-xs-3">
<!--                   <input type="text" name="fp_agreemengTime" id="fp_agreemengTime" class="form-control" /> -->
						<div class="input-group">
								<input id="fp_agreemengTime" name="fp_agreemengTime"
									type="text" class="form-control" placeholder=""
									aria-describedby="basic-addon2" onclick="WdatePicker()">
								<span class="input-group-addon"><span
									class="glyphicon glyphicon-calendar"></span></span>
							</div>
						</div>
                <div class="col-xs-4">
                  <a class="file_href">
                    <span class="text"></span>
                    <span class="click">协议照片上传</span>
                    <input type="file" onchange="fileChange1(this);$(this).parent('a').find('.text').text(this.value);" name="fp_threeAgreement" id="fp_threeAgreement"/>
                  </a>
                </div>
              </div>
              <div class="form-group selectDepart">
                <label class="col-xs-2 control-label">审核意见</label>
                <div class="col-xs-8">
                  <textarea class="form-control" rows="3" id="fp_suggestion" name="fp_suggestion"></textarea>
                </div>
              </div>
              <div class="col-xs-12 align_center">
                <a class="btn btn-default button" href="${ctx}/wftask/wfTaskInfoIndex">取  消</a>
                <button type="button" class="btn btn-primary submit ml_20" id="buttonAdd"
                onclick="$('input[name=fp_appStatus]').val('pass');$('input[name=fp_status]').val('1');$('input[name=fp_approvalStep]').val('5');$('input[name=fp_approvalStatus]').val('0');javascript:submitAudit('godownForma');">提  交</button>
              </div>
            </form>
          </div>
        </div>
          <jsp:include page="includeProcessHistory.jsp"></jsp:include>    
        <jsp:include page="includeWfRemark.jsp"></jsp:include> 
      </div>
    </div>
    <script type="text/javascript">
    /*
      $(function(){
        $("#fp_agreemengTime").on("click",function(e){
          e.stopPropagation();
          $(this).easyDatetime({
            css : 'easyDay',
            dateType : 'D',
            selectback : function(){}
          });
        });
      });
    */
      function submitAudit(domId){
    	  var fp_isSignThreeAgreement = $("#fp_isSignThreeAgreement").val();
    	  if(fp_isSignThreeAgreement == null || fp_isSignThreeAgreement == '' || fp_isSignThreeAgreement == '0'){
    		  alert("请勾选是否签订三方协议 ");
    		  return false;
    	  }
    	  /*
    	  var fp_agreemengTime = $("#fp_agreemengTime").val();
    	  if(fp_agreemengTime == null || fp_agreemengTime == '' ){
    		  alert("请填写协议签订时间");
    		  return false;
    	  }
    	  var fp_threeAgreement = $("#fp_threeAgreement").val();
    	  if(fp_threeAgreement == null || fp_threeAgreement == ''){
    		  alert("请上传协议照片");
    		  return false;
    	  }
    	 */
    	 $('#buttonAdd').attr("disabled","disabled");
  		document.getElementById(domId).submit();
      };
      
      var isIE = /msie/i.test(navigator.userAgent) && !window.opera; 
      var filemaxsize = 1024*3;//3M 
      function fileChange1(target) {     
          var fileSize = 0;          
          if (isIE && !target.files) {      
            var filePath = target.value;      
            var fileSystem = new ActiveXObject("Scripting.FileSystemObject");         
            var file = fileSystem.GetFile (filePath);      
            fileSize = file.Size;     
          } else {     
           fileSize = target.files[0].size;      
           }    
           var size = fileSize / 1024;     
           if(size>filemaxsize){   
            alert("文件不能大于3M");   
            if(target.outerHTML){
          	  target.outerHTML = target.outerHTML;
            }else{
          	  target.value = "";
            }
              return false;
           }   
      }
    </script>
  </body>
</html>
