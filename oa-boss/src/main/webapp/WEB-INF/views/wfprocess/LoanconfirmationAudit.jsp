<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ page import="com.zbjdl.common.utils.config.TextResource" %>
<html>
  <head>
    <title>中天房管家</title>
	<script type="text/javascript" src="${ctx}/static/js/BusinessCode.js"></script>
	<style type="text/css">
     .error{position:static;top:-24px;width:100%;color:red;text-align:left;font-size: 12px;}
    </style>
  </head>
<body>
    <div id="content_2" class="content_wrapper">
      <div class="content_main">
                <jsp:include page="includeAudit.jsp"></jsp:include>    
        
       <div class="panel panel-default">
          <div class="panel-heading">贷款确认</div>
          <div class="panel-body">
            <form class="cmxform form-horizontal" id="godownForma" name="godownForma" enctype="multipart/form-data" action="${ctx}/wftask/completeTask" method="post">
              <input id="taskId" name="taskId" type="hidden" value="${taskId }"/>
              	<input id="processId" name="processId" type="hidden" value="${processId }"/>
              	<input id="fp_status" name="fp_status" type="hidden" />
              	<input id="fp_approvalStep" name="fp_approvalStep" type="hidden" />
              	<input id="fp_approvalStatus" name="fp_approvalStatus" type="hidden" />
              	<input id="fp_appStatus" name="fp_appStatus" type="hidden" />
              <div class="form-group">
                <div class="col-xs-offset-2 col-xs-3 checkbox">
                  <label>
                    <input type="checkbox" name="fp_isSignBankAgreement" id="fp_isSignBankAgreement" checked="checked" value="1" onchange="this.value=(fp_isSignBankAgreement.checked)?1:0"> 是否与银行签订贷款协议
                  </label>
                </div>
                <div class="col-xs-1 tip">*</div>
              </div>
              <div class="form-group">
                <label class="col-xs-2 control-label">原贷款银行</label>
                <div class="col-xs-3">
                  <select class="form-control" name="fp_oldLoanBank" id="fp_oldLoanBank">
                    <script type="text/javascript">
						BusinessCode.getSysConfigCode("NOWLOANBANK", "fp_oldLoanBank", "${wfTaskBo.wfTaskInfo.oldLoanBank}");
					</script>
                  </select>
                </div>
                <label class="col-xs-offset-1 col-xs-2 control-label">原贷款支行</label>
                <div class="col-xs-3">
                  <select class="form-control" name="fp_oldLoanBranchbank" id="fp_oldLoanBranchbank">
                   <c:if test="${wfTaskBo.wfTaskInfo.oldLoanBranchbank != null}">
                  <script type="text/javascript">
                  		BusinessCode.getRoleSelect($("#fp_oldLoanBank").val(), "fp_oldLoanBranchbank", "${wfTaskBo.wfTaskInfo.oldLoanBranchbank}");
                  	</script>
                  </c:if>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-xs-2 control-label">现贷款银行</label>
                <div class="col-xs-3">
                  <select class="form-control" name="fp_nowLoanBank" id="fp_nowLoanBank">
                    <script type="text/javascript">
						BusinessCode.getSysConfigCode("NOWLOANBANK", "fp_nowLoanBank", "${wfTaskBo.wfTaskInfo.nowLoanBank}");
					</script>
                  </select>
                </div>
                <label class="col-xs-offset-1 col-xs-2 control-label">现贷款支行</label>
                <div class="col-xs-3">
                  <select class="form-control" name="fp_nowLoanBranchbank" id="fp_nowLoanBranchbank">
                  <c:if test="${wfTaskBo.wfTaskInfo.nowLoanBranchbank != null}">
                  <script type="text/javascript">
                  		BusinessCode.getRoleSelect($("#fp_nowLoanBank").val(), "fp_nowLoanBranchbank", "${wfTaskBo.wfTaskInfo.nowLoanBranchbank}");
                  	</script>
                  </c:if>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-xs-2 control-label">贷款类别</label>
                <div class="col-xs-3">
                  <select class="form-control" name="fp_loanType" id="fp_loanType">
                  <script type="text/javascript">
						BusinessCode.getSysConfigCode("RANSOM_LOAN_TYPE", "fp_loanType", "${wfTaskBo.wfTaskInfo.loanType}");
					</script>
                  </select>
                </div>
                <label class="col-xs-offset-1 col-xs-2 control-label">评估公司名称</label>
                <div class="col-xs-3">
                  <select class="form-control" name="fp_assessCompanyName" id="fp_assessCompanyName">
					    <script type="text/javascript">
						BusinessCode.getSysConfigCode("ASSESSMENT", "fp_assessCompanyName", "${wfTaskBo.wfTaskInfo.assessCompanyName}");
					</script>
                  </select>
                </div>
               
              </div>
              <div class="form-group">
                 <label class=" col-xs-2 control-label">评估费（元）</label>
                <div class="col-xs-3">
                  <input type="text" class="form-control" placeholder="" value="${wfTaskBo.wfTaskInfo.assessFee }" name="fp_assessFee" id="fp_assessFee"/>
                </div>
                <label class="col-xs-offset-1 col-xs-2 control-label">代办服务费（元）</label>
                <div class="col-xs-3">
                  <input type="text" class="form-control" placeholder="" value="${wfTaskBo.wfTaskInfo.extend3 }" name="fp_extend3" id="fp_extend3"/>
                </div>
              </div>
              <div class="form-group">
                 <label class=" col-xs-2 control-label">贷款金额（元）</label>
                <div class="col-xs-3">
                  <input type="text" class="form-control" placeholder="" value="${wfTaskBo.wfTaskInfo.loanAmount }" name="fp_loanAmount" id="fp_loanAmount"/>
                </div>
                <label class="col-xs-offset-1 col-xs-2 control-label">首付款金额（元）</label>
                <div class="col-xs-3">
                  <input type="text" class="form-control" placeholder="" value="${wfTaskBo.wfTaskInfo.downPayment }" name="fp_downPayment" id="fp_downPayment"/>
                </div>
              </div>
              <div class="form-group">
                 <label class=" col-xs-2 control-label">差额款金额（元）</label>
                <div class="col-xs-3">
                  <input type="text" class="form-control" placeholder="" value="${wfTaskBo.wfTaskInfo.balanceAmount }" name="fp_balanceAmount" id="fp_balanceAmount"/>
                </div>
                <label class="col-xs-offset-1 col-xs-2 control-label">差额款是否冻结在银行</label>
                <div class="col-xs-2 checkbox">
                  <label >
                    <input type="checkbox" name="fp_isBalanceOnBank" ${wfTaskBo.wfTaskInfo.isBalanceOnBank == '1' ? checked : ''}  id="fp_isBalanceOnBank" onchange="this.value=(fp_isBalanceOnBank.checked)?1:0"> 
                  </label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-xs-2 control-label">其他费用（元）</label>
                <div class="col-xs-3">
                  <input type="text" class="form-control" placeholder="" value="${wfTaskBo.wfTaskInfo.assessOtherFee }" name="fp_assessOtherFee" id="fp_assessOtherFee"/>
                </div>
              </div>
                   
              <div class="form-group">
                <label class="col-xs-2 control-label">首付款冻结单</label>
                <div class="col-xs-3">
                  <a class="file_href">
                    <span class="text">${empty wfTaskBo.taskWfTaskFile.firstPaymentFreeze ? '' : '首付款冻结单'}</span>
                    <span class="click">点击上传</span>
                    <input type="file" value="${wfTaskBo.taskWfTaskFile.firstPaymentFreeze}" onchange="fileChange1(this);$(this).parent('a').find('.text').text(this.value);" name="fp_firstPaymentFreeze" id="fp_firstPaymentFreeze"/>
                  </a>
                </div>
                <div class="col-xs-1 tip">
                	<c:if test="${!empty wfTaskBo.taskWfTaskFile.firstPaymentFreeze }">
                  		<a class="in_table" data-href="" data-toggle="modal" data-target=".bs-example-modal-lg" data-src="${wfTaskBo.taskWfTaskFile.firstPaymentFreeze}" data-title="首付款冻结单">查看</a>
                  	</c:if>
                  	</div>
                <label class=" col-xs-2 control-label">近期房产评估报告</label>
                <div class="col-xs-3">
                  <a class="file_href">
                    <span class="text">${empty wfTaskBo.taskWfTaskFile.houseAppraisalReport ? '' : '近期房产评估报告'}</span>
                    <span class="click">点击上传</span>
                    <input type="file" value="${wfTaskBo.taskWfTaskFile.houseAppraisalReport}" onchange="fileChange1(this);$(this).parent('a').find('.text').text(this.value);" name="fp_houseAppraisalReport" id="fp_houseAppraisalReport"/>
                  </a>
                </div>
                <div class="col-xs-1 tip">
                	<c:if test="${!empty wfTaskBo.taskWfTaskFile.houseAppraisalReport}">
                  		<a class="in_table" data-href="" data-toggle="modal" data-target=".bs-example-modal-lg" data-src="${wfTaskBo.taskWfTaskFile.houseAppraisalReport}" data-title="近期房产评估报告">查看</a>
                  	</c:if>
                  	</div>
              </div>
              <div class="form-group">
                <label class="col-xs-2 control-label">原贷款行余额证明-卖方</label>
                <div class="col-xs-3">
                  <a class="file_href">
                    <span class="text">${empty wfTaskBo.taskWfTaskFile.originalLoanBank ? '' : '原贷款行余额证明-卖方'}</span>
                    <span class="click">点击上传</span>
                    <input type="file" value="${wfTaskBo.taskWfTaskFile.originalLoanBank}" onchange="fileChange1(this);$(this).parent('a').find('.text').text(this.value);" name="fp_originalLoanBank" id="fp_originalLoanBank"/>
                  </a>
                </div>
                <div class="col-xs-1 tip">
                	<c:if test="${!empty wfTaskBo.taskWfTaskFile.originalLoanBank}">
                  		<a class="in_table" data-href="" data-toggle="modal" data-target=".bs-example-modal-lg" data-src="${wfTaskBo.taskWfTaskFile.originalLoanBank}" data-title="原贷款行余额证明-卖方">查看</a>
                  	</c:if>
                  	</div>
                <label class="col-xs-2 control-label">其他材料（压缩包）</label>
                <div class="col-xs-3">
                  <a class="file_href">
                    <span class="text">${empty wfTaskBo.taskWfTaskFile.taskOtherFile ? '' : '其他材料'}</span>
                    <span class="click">点击上传</span>
                    <input type="file" value="${wfTaskBo.taskWfTaskFile.taskOtherFile}" onchange="fileChange1(this);$(this).parent('a').find('.text').text(this.value);" name="fp_taskOtherFile" id="fp_taskOtherFile"/>
                  </a>
                </div>
                <div class="col-xs-1 tip">
                	<c:if test="${!empty wfTaskBo.taskWfTaskFile.taskOtherFile}">
                  		<a class="" href="${ctx}/wftask/download?fileName=${wfTaskBo.taskWfTaskFile.taskOtherFile}">下载</a>
                  	</c:if>
                  	</div>
              </div>
              <div class="form-group selectDepart">
                <label class="col-xs-2 control-label">审核意见</label>
                <div class="col-xs-9">
                  <textarea class="form-control" rows="3" id="fp_suggestion" name="fp_suggestion"></textarea>
                </div>
              </div>
              <div class="col-xs-12 align_center">
                <a class="btn btn-default button" href="${ctx}/wftask/wfTaskInfoIndex">取  消</a>
                <button type="button" class="btn btn-primary submit ml_20" id="buttonAdd"
                onclick="$('input[name=fp_appStatus]').val('pass');$('input[name=fp_status]').val('1');$('input[name=fp_approvalStep]').val('7');$('input[name=fp_approvalStatus]').val('0');javascript:submitAudit('godownForma');">提  交</button>
              </div>
            </form>
          </div>
        </div>
                  <jsp:include page="includeProcessHistory.jsp"></jsp:include>    
        <jsp:include page="includeWfRemark.jsp"></jsp:include> 
      </div>
    </div>
    
     <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
            <h4 class="modal-title" id="myLargeModalLabel"></h4>
          </div>
          <div class="modal-body align_center">
            <img src=""/>
          </div>
        </div>
      </div>
    </div>
    <script type="text/javascript">
    $("a.in_table").on("click",function(){
        $("h4.modal-title").text($(this).attr("data-title"));
        if($(this).attr("data-src") == null || $(this).attr("data-src") == ''){
        	alert("没有上传图片");
        	return false;
        }else{
        	$("div.modal-body").find("img").attr("src",$(this).attr("data-src"));
        }
      });
    
    var checkForm = null;
      function submitAudit(domId){
    	  var fp_isSignBankAgreement = $("#fp_isSignBankAgreement").val();
    	  if(fp_isSignBankAgreement == null || fp_isSignBankAgreement == '' || fp_isSignBankAgreement == '0'){
    		  alert("请勾选是否与银行签订贷款协议");
    		  return false;
    	  }
    	jqueryCheckFile();
   		if (!checkForm.form()) {
   			return false;
   		}
   		
   		$('#buttonAdd').attr("disabled","disabled");
  		document.getElementById(domId).submit();
      };
      
 function jqueryCheckFile() {
	checkForm = $("#godownForma").validate({ // 为表单绑定校验事件
		onfocus:true,
		rules : {
			"fp_extend3" : {
				rate : "rate"
			},
			"fp_assessFee" : {
				rate : "rate"
			},
			"fp_assessOtherFee" : {
				rate : "rate"
			},
			"fp_firstPaymentFreeze" : {
				checkLimit : "checkLimit",
				image : "image"
			},
			"fp_houseAppraisalReport" : {
				checkLimit : "checkLimit",
				image : "image"
			},
			"fp_originalLoanBank" : {
				checkLimit : "checkLimit",
				image : "image"
			},
			"fp_taskOtherFile" : {
				checkLimit : "checkLimit",
				ziprar : "ziprar"
			},
			"fp_downPayment" : {
				rate : "rate"
			},
			"fp_balanceAmount" : {
				rate : "rate"
			},
			"fp_loanAmount" : {
				rate : "rate"
			},
		},
		messages : {
			
		},
		errorPlacement : function(error, element) {
			if (element.parent("div").hasClass("input-group")) {
				error.insertAfter(element.parent("div"));
			}else if(element.parent("div").hasClass("col-xs-2") ||element.parent("div").hasClass("col-xs-3") ){
				error.appendTo(element.parent("div"));//.css("color", "red"));
			}else {
				error.appendTo(element.parent("a").parent("div"));//.css("color", "red"));
			}
		}
	});
	jQuery.validator.addMethod("checkLimit", function(value, element) {
		return true;
	}, "上传的附件文件不能超过2M");
	jQuery.validator.addMethod("rate", function(value, element) {
		var regexAmount = /^(([1-9]\d*)|0)(\.(\d){1,2})?$/;// 校验金额两位小数
		return this.optional(element) || (regexAmount.test(value));
	}, "金额格式不正确");
	jQuery.validator.addMethod("ziprar", function(value, element) {
		var arr = new Array();
		arr = value.split(".");
		var photo = arr[arr.length-1];
		var regexAmount = /.+(.ZIP|.zip|.RAR|.rar)$/;// 压缩包格式
		return this.optional(element) || (regexAmount.test(value));
	}, "压缩包格式不正确");
	jQuery.validator.addMethod("percent", function(value, element) {
		var regexAmount = /^\d+(.\d{1,1})?$/;// 校验
		return this.optional(element) || (regexAmount.test(value));
	}, "格式不正确，例：10.1");
	jQuery.validator.addMethod("image", function(value, element) {
		var arr = new Array();
		arr = value.split(".");
		var photo = arr[arr.length-1];
		var regexAmount = /.+(.JPEG|.jpeg|.JPG|.jpg|.GIF|.gif|.BMP|.bmp|.PNG|.png)$/;// 图片格式
		return this.optional(element) || (regexAmount.test(value));
	}, "图片格式不正确");
};
//原贷款银行变化，开始给支行查询数据
$(function(){
    $("#fp_oldLoanBank").on("change",function(e){
  	  var obj = document.all("fp_oldLoanBranchbank"); 
        for (var i = obj.options.length - 1; i >= 0; i--) { 
                obj.options.remove(i); //从后往前删除 
        } 
  	  BusinessCode.getRoleSelect($("#fp_oldLoanBank").val(), "fp_oldLoanBranchbank", "${wfTaskInfo.oldLoanBranchbank}");
    });
});

//现贷款银行变化，开始给支行查询数据
$(function(){
    $("#fp_nowLoanBank").on("change",function(e){
  	  var obj = document.all("fp_nowLoanBranchbank"); 
        for (var i = obj.options.length - 1; i >= 0; i--) { 
                obj.options.remove(i); //从后往前删除 
        } 
  	  BusinessCode.getRoleSelect($("#fp_nowLoanBank").val(), "fp_nowLoanBranchbank", "${wfTaskInfo.nowLoanBranchbank}");
    });
});

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
        