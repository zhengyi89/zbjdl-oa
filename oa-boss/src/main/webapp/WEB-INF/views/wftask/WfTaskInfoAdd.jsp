<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ page import="com.zbjdl.common.utils.config.TextResource" %>
<html>
  <head>
    <title>中天房管家</title>
    <script type="text/javascript" src="${ctx}/static/js/wftask/task.js"></script>
    <link rel="stylesheet" type="text/css" href="${ctx}/common/easyDatetime/easyDatetime.css"/>
	<script type="text/javascript" src="${ctx}/common/easyDatetime/easyDatetime.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/BusinessCode.js"></script>
	<style type="text/css">
     .error{position:static;top:-24px;width:100%;color:red;text-align:left;font-size: 12px;}
    </style>
  </head>
  <body>
    <div id="content_2" class="content_wrapper">
      <div class="content_main clearfix">
       <form class="cmxform form-horizontal" id="godownForma" name="godownForma" action="${ctx}/wftask/saveWfTaskInfo" method="post">
       <input id="errorMsg" name="errorMsg" value="${errorMsg }" type="hidden">
       <input id="id" name="id" value="${id }" type="hidden">
       <input id="token" name="token" value="${token }" type="hidden">
       <input id="type" name="type" value="${type }" type="hidden">
       <input id="back" name="back" value="${back }" type="hidden">
        <div class="panel panel-default">
          <div class="panel-heading">中介基础信息</div>
          <div class="panel-body">
              <div class="form-group no_tip">
                <label class="col-xs-2 control-label">是否特殊业务</label>
                <div class="col-xs-3">
                  <label class="radio-inline">
                    <input type="radio" name="isSpecialBusiness" id="isSpecialBusiness" value="1" ${type == 'on' ? 'disabled=disabled' : ''}
                    ${wfTaskInfo.isSpecialBusiness == '1' ? 'checked=checked' : '' }> 是
                  </label>
                  <label class="radio-inline">
                    <input type="radio" name="isSpecialBusiness" id="isSpecialBusiness" value="0" ${type == 'on' ? 'disabled=disabled' : ''}
                    ${wfTaskInfo.isSpecialBusiness == '0' || wfTaskInfo.isSpecialBusiness == null ? 'checked=checked' : ''}> 否
                  </label>
                </div>
                <div class="col-xs-1 tip">*</div>
              </div>
               <div class="form-group no_tip">
                <label class="col-xs-2 control-label">业务来源</label>
                <div class="col-xs-3">
                  <select class="form-control" id="businessSource" name="businessSource" ${type == 'on' ? 'disabled=disabled' : ''}>
					<script type="text/javascript">
						BusinessCode.getSysConfigCode("BUSINESSSOURCE", "businessSource", "${wfTaskInfo.businessSource}");
					</script>
				  </select>
                </div>
                <div class="col-xs-1 tip">*</div>
                <label class="col-xs-2 control-label">门店</label>
                <div class="col-xs-3">
                  <select class="form-control" id="businessSourceAddress" name="businessSourceAddress">
                  <c:if test="${wfTaskInfo.businessSourceAddress != null}">
                  <script type="text/javascript">
                  	BusinessCode.getRoleSelect($("#businessSource").val(), "businessSourceAddress", "${wfTaskInfo.businessSourceAddress}");
                  	</script>
                  </c:if>	
                  	</select>
                </div>
                <div class="col-xs-1 tip"></div>
              </div>
              <div class="form-group tip_error">
                <div class="col-xs-offset-2 col-xs-4"></div>
                <div class="col-xs-offset-2 col-xs-4"></div>
              </div>
              <div class="form-group">
                <label class="col-xs-2 control-label">中介姓名</label>
                <div class="col-xs-3">
                  <select class="form-control" name="mediationName" id="mediationName">
                   <c:if test="${wfTaskInfo.mediationName != null}">
                  <script type="text/javascript">
                  	BusinessCode.getUserSelect("${wfTaskInfo.businessSourceAddress}", "mediationName", "${wfTaskInfo.mediationName}");
                  	</script>
                  </c:if>
                  </select>
                </div>
                <div class="col-xs-1 tip"></div>
                <label class="col-xs-2 control-label">中介手机</label>
                <div class="col-xs-3" id="mediationPhoneDiv">
                  <input type="text" class="form-control" id="mediationPhone" name="mediationPhone" value="${wfTaskInfo.mediationPhone}"/>
                </div>
                <div class="col-xs-1 tip"></div>
              </div>
              <div class="form-group ">
                <label class="col-xs-2 control-label">业务员</label>
                <div class="col-xs-3">
                  <select class="form-control" name="salesmanName" id="salesmanName" ${type == 'on' ? 'disabled=disabled' : ''}>
	                  <script type="text/javascript">
	                  		BusinessCode.getUserSelect26(26, "salesmanName", "${wfTaskInfo.salesmanName}");
					  </script>
				  </select>
                </div>
                <div class="col-xs-1 tip">*</div>
                <label class="col-xs-2 control-label">业务员手机</label>
                <div class="col-xs-3" id="salesmanPhoneDiv">
                	<input type="text" class="form-control" id="salesmanPhone" name="salesmanPhone" value="${wfTaskInfo.salesmanPhone}"/>
                </div>
                <div class="col-xs-1 tip"></div>
              </div>
              
              <div class="form-group no_tip">
                <label class="col-xs-2 control-label">指定经办员</label>
                <div class="col-xs-3">
                  <select class="form-control" name="userId" id="userId" ${type == 'on' || !empty id ? 'disabled=disabled' : ''}>
	                  <script type="text/javascript">
	                  		BusinessCode.getUserSelect17(17, "userId", "${wfTaskInfo.userId}");
					  </script>
				  </select>
                </div>
                <div class="col-xs-1 tip">*</div>
                <label class="col-xs-2 control-label">经办员手机</label>
                <div class="col-xs-3" id="userPhoneDiv">
                	<input type="text" class="form-control" id="userPhone" name="userPhone" value="${wfTaskInfo.userPhone}"/>
                </div>
                <div class="col-xs-1 tip"></div>
              </div>
            
          </div>
        </div>
        <div class="panel panel-default">
          <div class="panel-heading">买方信息</div>
          <div class="panel-body">
              <div class="form-group no_tip">
                <label class="col-xs-2 control-label">买方姓名A</label>
                <div class="col-xs-3">
                  <input type="text" class="form-control" placeholder="" value="${buyerWfUserInfo.nameA }" id="buyerNameA" name="buyerNameA" />
                </div>
                <div class="col-xs-1 tip" style="color: blue;">*</div>
              </div>
              <div class="form-group tip_error">
                <div class="col-xs-offset-2 col-xs-4"></div>
                <div class="col-xs-offset-2 col-xs-4"></div>
              </div>
					<div class="form-group no_tip" >
						<label class="col-xs-2 control-label">买方电话A</label>
						<div class="col-xs-3">
							<input type="text" class="form-control" placeholder="" value="${buyerWfUserInfo.phoneA }"
								id="buyerPhoneA" name="buyerPhoneA" />
						</div>
						<div class="col-xs-1 tip" style="color: blue;">*</div>
						<label class="col-xs-2 control-label">买方身份证A</label>
						<div class="col-xs-3">
							<input type="text" class="form-control" placeholder="" value="${buyerWfUserInfo.idCardA }"
								id="buyerIdCardA" name="buyerIdCardA" />
						</div>
						<div class="col-xs-1 tip" style="color: blue;">*</div>
					</div>
					<div class="form-group tip_error">
                <div class="col-xs-offset-2 col-xs-4"></div>
                <div class="col-xs-offset-2 col-xs-4"></div>
              </div>
              <div class="form-group">
                <label class="col-xs-2 control-label">买方姓名B</label>
                <div class="col-xs-3">
                  <input type="text" class="form-control" placeholder="" value="${buyerWfUserInfo.nameB }" id="buyerNameB" name="buyerNameB"/>
                </div>
                <div class="col-xs-1 tip"></div>
              </div>
              <div class="form-group">
                <label class="col-xs-2 control-label">买方电话B</label>
                <div class="col-xs-3">
                  <input type="text" class="form-control" placeholder="" value="${buyerWfUserInfo.phoneB }" id="buyerPhoneB" name="buyerPhoneB"/>
                </div>
                <div class="col-xs-1 tip"></div>
                <label class="col-xs-2 control-label">买方身份证B</label>
                <div class="col-xs-3">
                  <input type="text" class="form-control" placeholder="" value="${buyerWfUserInfo.idCardB }" id="buyerIdCardB" name="buyerIdCardB"/>
                </div>
                <div class="col-xs-1 tip"></div>
              </div>
              <div class="form-group">
                <label class="col-xs-2 control-label">买方备注</label>
                <div class="col-xs-9">
                  <textarea class="form-control" maxlength="250" rows="3" id="buyerNote" name="buyerNote" >${buyerWfUserInfo.note }</textarea>
                </div>
              </div>
            
          </div>
        </div>
        <div class="panel panel-default">
          <div class="panel-heading">卖方信息</div>
          <div class="panel-body">
           
              <div class="form-group no_tip">
                <label class="col-xs-2 control-label">卖方姓名A</label>
                <div class="col-xs-3">
                  <input type="text" class="form-control" ${type == 'on' ? 'disabled=disabled' : ''} placeholder="" value="${sellerWfUserInfo.nameA }" id="nameA" name="nameA"/>
                </div>
                <div class="col-xs-1 tip">*</div>
              </div>
              <div class="form-group tip_error">
                <div class="col-xs-offset-2 col-xs-4"></div>
                <div class="col-xs-offset-2 col-xs-4"></div>
              </div>
              <div class="form-group no_tip">
                <label class="col-xs-2 control-label">卖方电话A</label>
                <div class="col-xs-3">
                  <input type="text" class="form-control" ${type == 'on' ? 'disabled=disabled' : ''} placeholder="" value="${sellerWfUserInfo.phoneA }" id="phoneA" name="phoneA"/>
                </div>
                <div class="col-xs-1 tip">*</div>
                <label class="col-xs-2 control-label">卖方身份证A</label>
                <div class="col-xs-3">
                  <input type="text" class="form-control" ${type == 'on' ? 'disabled=disabled' : ''} placeholder="" value="${sellerWfUserInfo.idCardA }" id="idCardA" name="idCardA"/>
                </div>
                <div class="col-xs-1 tip">*</div>
              </div>
              <div class="form-group tip_error">
                <div class="col-xs-offset-2 col-xs-4"></div>
                <div class="col-xs-offset-2 col-xs-4"></div>
              </div>
              <div class="form-group">
                <label class="col-xs-2 control-label">卖方姓名B</label>
                <div class="col-xs-3">
                  <input type="text" class="form-control" placeholder="" value="${sellerWfUserInfo.nameB }" id="nameB" name="nameB"/>
                </div>
                <div class="col-xs-1 tip"></div>
              </div>
              <div class="form-group">
                <label class="col-xs-2 control-label">卖方电话B</label>
                <div class="col-xs-3">
                  <input type="text" class="form-control" placeholder="" value="${sellerWfUserInfo.phoneB }" id="phoneB" name="phoneB"/>
                </div>
                <div class="col-xs-1 tip"></div>
                <label class="col-xs-2 control-label">卖方身份证B</label>
                <div class="col-xs-3">
                  <input type="text" class="form-control" placeholder="" value="${sellerWfUserInfo.idCardB }" id="idCardB" name="idCardB"/>
                </div>
                <div class="col-xs-1 tip"></div>
              </div>
              <div class="form-group">
                <label class="col-xs-2 control-label">卖方备注</label>
                <div class="col-xs-9">
                  <textarea class="form-control" rows="3" maxlength="250" id="note" name="note" >${sellerWfUserInfo.note }</textarea>
                </div>
              </div>
              <div class="form-group no_tip">
                <label class="col-xs-2 control-label">产权证号</label>
                <div class="col-xs-3">
                  <input type="text" class="form-control" placeholder="" value="${sellerWfUserInfo.sellerCertificateNo }" id="sellerCertificateNo" name="sellerCertificateNo"/>
                </div>
                <div class="col-xs-1 tip" style="color: blue;">*</div>
                <label class="col-xs-2 control-label">产权地址</label>
                <div class="col-xs-3">
                  <input type="text" class="form-control" placeholder="" value="${sellerWfUserInfo.sellerCertificateAdress }" id="sellerCertificateAdress" name="sellerCertificateAdress"/>
                </div>
                <div class="col-xs-1 tip" style="color: blue;">*</div>
              </div>
              <div class="form-group tip_error">
                <div class="col-xs-offset-2 col-xs-4"></div>
                <div class="col-xs-offset-2 col-xs-4"></div>
              </div>
              <div class="form-group">
                <label class="col-xs-2 control-label">当日总解押金额（元）</label>
                <div class="col-xs-3 addSpan">
                	<input type="hidden" name="sellerSolutionAmount" id="sellerSolutionAmount" />
                	<input type="text" disabled="disabled" style="border: none;background: white;" class="form-control" id="sellerSolutionAmount_temp" readonly="readonly"  placeholder="0" value="${sellerWfUserInfo.sellerSolutionAmount }"/>
                	<span >元</span>
                </div>
                <div class="col-xs-1 tip">*</div>
                <label class="col-xs-2 control-label">当日赎楼解押金额（元）</label>
                <div class="col-xs-3 addSpan">
                  <input type="text" class="form-control" onkeyup="javascript:addAmount(this.value);" placeholder="" value="${sellerWfUserInfo.extend1 }" id="sewf_extend1" name="sewf_extend1"/>
                <span >元</span>
                </div>
                <div class="col-xs-1 tip"></div>
              </div>
              <div class="form-group ">
                <label class="col-xs-2 control-label">当日现金解押金额（元）</label>
                <div class="col-xs-3 addSpan">
                  <input type="text" class="form-control" onkeyup="javascript:addAmount(this.value);" placeholder="" value="${sellerWfUserInfo.extend2 }" id="sewf_extend2" name="sewf_extend2"/>
                  <span>元</span>
                </div>
                <div class="col-xs-1 tip"></div>
              </div>
			<div class="form-group">  
			<label class="col-xs-2 control-label">担保费百分比:&nbsp;&nbsp;&nbsp;&nbsp;赎楼</label>
                <div class="col-xs-3 addSpan">
                  <input type="text" class="form-control" placeholder="" value="${wfTaskInfo.extend4 }"  name="wf_extend4" id="wf_extend4"/>
                  <span>%</span>
                </div> 
                <div class="col-xs-1 tip"></div>   
                <label class="col-xs-2 control-label">现金</label>
                <div class="col-xs-3 addSpan">
                  <input type="text" class="form-control" placeholder="" value="${wfTaskInfo.extend5 }"  name="wf_extend5" id="wf_extend5"/>
                	<span>%</span>
                </div>   
                <div class="col-xs-1 tip"></div>
             </div> 
             
             <div class="form-group ">
                <label class="col-xs-2 control-label">其他</label>
                <div class="col-xs-3 addSpan">
                  <input type="text" class="form-control" placeholder="" value="${wfTaskInfo.guaranteeFeeOther }" name="guaranteeFeeOther" id="guaranteeFeeOther"/>
               	<span>%</span>
                </div>
                <div class="col-xs-1 tip"></div>
              </div>
              
              <div class="form-group ">
                <label class="col-xs-2 control-label">担保费支付方式</label>
                <div class="col-xs-3 addSpan">
                  <select class="form-control" id="guaranteeType" name="guaranteeType" >
					<script type="text/javascript">
						BusinessCode.getSysConfigCode("RANSOMFLOOR_GUARANTEE_TYPE", "guaranteeType", "${wfTaskInfo.guaranteeType}");
					</script>
				  </select>
                </div>
                <div class="col-xs-1 tip">*</div>
                <label class="col-xs-2 control-label">成交金额（元）</label>
                <div class="col-xs-3 addSpan">
                  <input type="text" class="form-control" ${type == 'on' ? 'disabled=disabled' : ''} placeholder="" value="${sellerWfUserInfo.sellerAmount }" id="sellerAmount" name="sellerAmount"/>
                  <span>元</span>
                </div>
                <div class="col-xs-1 tip">*</div>
              </div>
              <div class="form-group no_tip">
                <label class="col-xs-2 control-label">业务品种</label>
                <div class="col-xs-3">
                  <select class="form-control" id="sellerBussinessType" name="sellerBussinessType" ${type == 'on' ? 'disabled=disabled' : ''}>
                  <script type="text/javascript">
						BusinessCode.getSysConfigCode("SELLER_BUSINESS_TYPE", "sellerBussinessType", "${sellerWfUserInfo.sellerBussinessType}");
					</script>
				</select>
                </div>
                <div class="col-xs-1 tip">*</div>
                <label class="col-xs-2 control-label">业务细分</label>
                <div class="col-xs-3">
                  <select class="form-control" id="sellerBussinessSub" name="sellerBussinessSub" ${type == 'on' ? 'disabled=disabled' : ''}>
                  <c:if test="${sellerWfUserInfo.sellerBussinessType == '1'}">
                  	<script type="text/javascript">
          				BusinessCode.getSysConfigCode("SELLER_BUSINESS_SUB", "sellerBussinessSub", "${sellerWfUserInfo.sellerBussinessSub}");
					</script>
                  </c:if>
                  </select>
                </div>
                <div class="col-xs-1 tip" style="color: blue;">*</div>
              </div>
              <div class="form-group tip_error">
                <div class="col-xs-offset-2 col-xs-4">
					
				</div>
              </div>
          </div>
        </div>
        <div class="col-xs-12 align_center">
        <c:if test="${type=='on' }">
        	<a class="btn btn-default button" href="${ctx}/wftask/wfHasdoTaskInfoIndex">取  消</a>
        	<button type="button" id="buttonAdd" class="btn btn-primary submit ml_20" onclick="submitEdit('godownForma');">下一步</button>
        </c:if>
         <c:if test="${type!='on' }">
         	<c:if test="${back == 'edit' }">
         		<a class="btn btn-default button" href="${ctx}/wftask/wfTaskEditInfoIndex">取  消</a>
         	</c:if>
          	<c:if test="${back != 'edit' }">
         		<a class="btn btn-default button" href="${ctx}/wftask/wfTaskInfoIndex">取  消</a>
         	</c:if>
          <button type="button" id="buttonAdd" class="btn btn-primary submit ml_20" onclick="submitAdd('godownForma');">下一步</button>
          </c:if>
        </div>
        </form>
      </div>
    </div>
    <script type="text/javascript">
    	var errorMsg = $("#errorMsg").val();
    	if(errorMsg != null && errorMsg != '' && errorMsg != undefined){
    		alert(errorMsg);
    	}
      $(function(){
        $("#datetimepicker1").on("click",function(e){
          e.stopPropagation();
          $(this).easyDatetime({
            css : 'easyDay',
            dateType : 'D',
            selectback : function(){}
          });
        });
      });

    //业务来源变化，开始给门店查询数据
      $(function(){
          $("#businessSource").on("change",function(e){
        	  var obj = document.all("businessSourceAddress"); 
              for (var i = obj.options.length - 1; i >= 0; i--) { 
                      obj.options.remove(i); //从后往前删除 
              } 
        	  BusinessCode.getRoleSelect($("#businessSource").val(), "businessSourceAddress", "${wfTaskInfo.businessSourceAddress}");
          });
      });
      //门店发生变化，开始给中介姓名下拉框查询数据
      $(function(){
          $("#businessSourceAddress").on("change",function(e){
        	  var obj = document.all("mediationName"); 
              for (var i = obj.options.length - 1; i >= 0; i--) { 
                      obj.options.remove(i); //从后往前删除 
              } 
        	  BusinessCode.getUserSelect($("#businessSourceAddress").val(), "mediationName", "${wfTaskInfo.mediationName}");
          });
      });
      //中介姓名变化，自动填充手机号
      $(function(){
          $("#mediationName").on("change",function(e){
        	  BusinessCode.displayMobil($("#mediationName").val(),"#mediationPhoneDiv", "${wfTaskInfo.mediationPhone}");
          });
      });
      //业务员名称变化填充手机号
      $(function(){
          $("#salesmanName").on("change",function(e){
        	  BusinessCode.displaySalesMobil($("#salesmanName").val(),"#salesmanPhoneDiv", "${wfTaskInfo.salesmanPhone}");
          });
      });
    //只有当业务品种是  保函的时候，细分才有值
      $(function(){
          $("#sellerBussinessType").on("change",function(e){
        	  var obj = document.all("sellerBussinessSub"); 
              for (var i = obj.options.length - 1; i >= 0; i--) { 
                      obj.options.remove(i); //从后往前删除 
              } 
              if($("#sellerBussinessType").val() == '1'){
      			BusinessCode.getSysConfigCode("SELLER_BUSINESS_SUB", "sellerBussinessSub", "${sellerWfUserInfo.sellerBussinessSub}");
              }
          });
      });
    
    //业务员名称变化填充手机号
      $(function(){
          $("#userId").on("change",function(e){
        	  BusinessCode.displayUserMobil($("#userId").val(),"#userPhoneDiv", "${wfTaskInfo.userPhone}");
          });
      });
    
    </script>
  </body>
</html>