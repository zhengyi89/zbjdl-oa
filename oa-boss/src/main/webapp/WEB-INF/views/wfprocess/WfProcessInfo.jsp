<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ page import="com.zbjdl.common.utils.config.TextResource" %>
<html>
  <head>
    <title>中天房管家</title>
	<script type="text/javascript" src="${ctx}/static/js/BusinessCode.js"></script>
  </head>
<body>
    <div id="content_2" class="content_wrapper">
      <div class="content_main">
        <div class="panel panel-default">
          <div class="panel-heading">业务详细</div>
          <div class="panel-body">
            <div class="col-xs-12"><h2 class="title">买卖方基础信息</h2></div>
            <div class="col-xs-12">
              <table class="table table-striped table-bordered">
                <tr>
                  <th>是否特殊业务</th>
                  <td><c:if test="${wfTaskBo.wfTaskInfo.isSpecialBusiness == '0'}">否</c:if>
                  <c:if test="${wfTaskBo.wfTaskInfo.isSpecialBusiness == '1'}">是</c:if>
                  </td>
                  <th>业务来源</th>
                  <td>${_textResource.getSysText('BUSINESSSOURCE', wfTaskBo.wfTaskInfo.businessSource)}
                  </td>
                </tr>
                <tr>
                  <th>业务员</th>
                  <td>${wfTaskBo.wfTaskInfo.salesmanName }</td>
                  <th>业务员手机</th>
                  <td>${wfTaskBo.wfTaskInfo.salesmanPhone }</td>
                </tr>
                <tr>
                  <th>中介姓名</th>
                  <td>${wfTaskBo.wfTaskInfo.mediationName }</td>
                  <th>中介手机</th>
                  <td>${wfTaskBo.wfTaskInfo.mediationPhone }</td>
                </tr>
                <tr>
                  <th>经办人姓名</th>
                  <td>${wfTaskBo.wfTaskInfo.userName }</td>
                  <th>经办人手机</th>
                  <td>${wfTaskBo.wfTaskInfo.userPhone }</td>
                </tr>
                <tr>
                  <th>付款状态</th>
                  <td>${_textResource.getSysText('RANSOMFLOOR_PAY_STATUS', wfTaskBo.wfTaskInfo.payStatus) }</td>
                  <th></th>
                  <td></td>
                </tr>
              </table>
            </div>
            <div class="col-xs-12"><h2 class="title">买方信息</h2></div>
            <div class="col-xs-12">
              <table class="table table-striped table-bordered">
                <tr>
                  <th>买方姓名A</th>
                  <td>${wfTaskBo.buyerWfUserInfo.nameA}</td>
                  <th>买方电话A</th>
                  <td>${wfTaskBo.buyerWfUserInfo.phoneA}</td>
                  <th>买方身份证A</th>
                  <td>${wfTaskBo.buyerWfUserInfo.idCardA}</td>
                </tr>
                <tr>
                  <th>买方姓名B</th>
                  <td>${wfTaskBo.buyerWfUserInfo.nameB}</td>
                  <th>买方电话B</th>
                  <td>${wfTaskBo.buyerWfUserInfo.phoneB}</td>
                  <th>买方身份证B</th>
                  <td>${wfTaskBo.buyerWfUserInfo.idCardB}</td>
                </tr>
                <tr>
                  <th>买方备注</th>
                  <td colspan="5">${wfTaskBo.buyerWfUserInfo.note}</td>
                </tr>
              </table>
            </div>
            <div class="col-xs-12"><h2 class="title">卖方信息</h2></div>
            <div class="col-xs-12">
              <table class="table table-striped table-bordered">
                <tr>
                  <th>卖方姓名A</th>
                  <td>${wfTaskBo.sellerWfUserInfo.nameA}</td>
                  <th>卖方电话A</th>
                  <td>${wfTaskBo.sellerWfUserInfo.phoneA}</td>
                  <th>卖方身份证A</th>
                  <td>${wfTaskBo.sellerWfUserInfo.idCardA}</td>
                </tr>
                <tr>
                  <th>卖方姓名B</th>
                  <td>${wfTaskBo.sellerWfUserInfo.nameB}</td>
                  <th>卖方电话B</th>
                  <td>${wfTaskBo.sellerWfUserInfo.phoneB}</td>
                  <th>卖方身份证B</th>
                  <td>${wfTaskBo.sellerWfUserInfo.idCardB}</td>
                </tr>
                <tr>
                  <th>卖方备注</th>
                  <td colspan="5">${wfTaskBo.sellerWfUserInfo.note}</td>
                </tr>
                <tr>
                  <th>产权证号</th>
                  <td>${wfTaskBo.sellerWfUserInfo.sellerCertificateNo}</td>
                  <th>产权地址</th>
                  <td>${wfTaskBo.sellerWfUserInfo.sellerCertificateAdress}</td>
                  <th>成交金额（元）</th>
                  <td>${wfTaskBo.sellerWfUserInfo.sellerAmount}</td>
                </tr>
                <tr>
                  <th>总解押金额（元）</th>
                  <td>${wfTaskBo.sellerWfUserInfo.sellerSolutionAmount}</td>
                  <th>赎楼解押金额（元）</th>
                  <td>${wfTaskBo.sellerWfUserInfo.extend1}</td>
                  <th>现金解押金额（元）</th>
                  <td>${wfTaskBo.sellerWfUserInfo.extend2}</td>
                </tr>
                <tr>
                  <th colspan="6">担保费百分比</th>
                  
                </tr>
                <tr>
                  <th>赎楼百分比</th>
                  <td>${wfTaskBo.wfTaskInfo.extend4}</td>
                  <th>现金百分比</th>
                  <td>${wfTaskBo.wfTaskInfo.extend5}</td>
                  <th>其他百分比</th>
                  <td>${wfTaskBo.wfTaskInfo.guaranteeFeeOther}</td>
                </tr>
                <tr>
                  <th>总担保费（元）</th>
                  <td>${Math.round(wfTaskBo.sellerWfUserInfo.extend1.toString() * wfTaskBo.wfTaskInfo.extend4 / 100  + wfTaskBo.sellerWfUserInfo.extend2.toString() * wfTaskBo.wfTaskInfo.extend5 / 100)}</td>
                  <th>赎楼担保费（元）</th>
                  <td>${Math.round(wfTaskBo.sellerWfUserInfo.extend1.toString() * wfTaskBo.wfTaskInfo.extend4 / 100)}</td>
                  <th>现金担保费（元）</th>
                  <td>${Math.round(wfTaskBo.sellerWfUserInfo.extend2.toString() * wfTaskBo.wfTaskInfo.extend5 / 100)}</td>
                </tr>
                <tr>
                	<th>担保费支付方式</th>
                  <td >${_textResource.getSysText('RANSOMFLOOR_GUARANTEE_TYPE', wfTaskBo.wfTaskInfo.guaranteeType)}
                  </td>
                  <th>业务品种</th>
                  <td >${_textResource.getSysText('SELLER_BUSINESS_TYPE', wfTaskBo.sellerWfUserInfo.sellerBussinessType)}
                  </td>
                  <th>业务细分</th>
                  <td >${_textResource.getSysText('SELLER_BUSINESS_SUB', wfTaskBo.sellerWfUserInfo.sellerBussinessSub)}
                  </td>
                  
                </tr>
                <tr>
                  <th>原贷款银行</th>
                  <td colspan="2">${wfTaskBo.wfTaskInfo.oldLoanBank}</td>
                  <th>原贷款支行</th>
                  <td colspan="2">${wfTaskBo.wfTaskInfo.oldLoanBranchbank}</td>
                </tr>
              </table>
            </div>
            <div class="col-xs-12"><h2 class="title">卖方电子资料</h2></div>
            <div class="col-xs-12">
              <table class="table table-striped table-bordered">
                <tr>
                  <th>卖方A身份证照片   正面</th>
                  <td>
                  <c:if test="${!empty wfTaskBo.sellerWfTaskFile.idCardA}">
                    <a class="in_table" data-href="" data-toggle="modal" data-target=".bs-example-modal-lg" data-src="${wfTaskBo.sellerWfTaskFile.idCardA }" data-title="卖方A身份证照片   正面">
                      查看
                    </a>
                    </c:if>
                    <c:if test="${empty wfTaskBo.sellerWfTaskFile.idCardA}">
                    	&nbsp;<h style="color: gray;">查看</h>
					</c:if>
                  </td>
                  <th>卖方A身份证照片   反面</th>
                  <td>
                  <c:if test="${!empty wfTaskBo.sellerWfTaskFile.extend1}">
                    <a class="in_table" data-href="" data-toggle="modal" data-target=".bs-example-modal-lg" data-src="${wfTaskBo.sellerWfTaskFile.extend1 }" data-title="卖方A身份证照片   反面">
                      查看
                    </a>
                    </c:if>
                    <c:if test="${empty wfTaskBo.sellerWfTaskFile.extend1}">
                    	&nbsp;<h style="color: gray;">查看</h>
					</c:if>
                  </td>
                  <th>卖方B身份证照片 正面</th>
                  <td>
                  <c:if test="${!empty wfTaskBo.sellerWfTaskFile.idCardB}">
                    <a class="in_table" data-href="" data-toggle="modal" data-target=".bs-example-modal-lg" data-src="${wfTaskBo.sellerWfTaskFile.idCardB }" data-title="卖方B身份证照片  正面">
                      查看
                    </a>
                    </c:if>
                    <c:if test="${empty wfTaskBo.sellerWfTaskFile.idCardB}">
                    	&nbsp;<h style="color: gray;">查看</h>
					</c:if>
                  </td>
                  </tr>
               <tr>
                  <th>卖方B身份证照片 反面</th>
                  <td>
                  <c:if test="${!empty wfTaskBo.sellerWfTaskFile.extend2}">
                    <a class="in_table" data-href="" data-toggle="modal" data-target=".bs-example-modal-lg" data-src="${wfTaskBo.sellerWfTaskFile.extend2 }" data-title="卖方B身份证照片  反面">
                      查看
                    </a>
                    </c:if>
                    <c:if test="${empty wfTaskBo.sellerWfTaskFile.extend2}">
                    	&nbsp;<h style="color: gray;">查看</h>
					</c:if>
                  </td>
                  <th>卖方户口本照片  首页</th>
                  <td>
                  <c:if test="${!empty wfTaskBo.sellerWfTaskFile.residence}">
                    <a class="in_table" data-href="" data-toggle="modal" data-target=".bs-example-modal-lg" data-src="${wfTaskBo.sellerWfTaskFile.residence }" data-title="卖方户口本照片  首页">
                      查看
                    </a>
                    </c:if>
                    <c:if test="${empty wfTaskBo.sellerWfTaskFile.residence}">
                    	&nbsp;<h style="color: gray;">查看</h>
					</c:if>
                  </td>
                <th>卖方户口本照片  户主页</th>
                  <td>
                  <c:if test="${!empty wfTaskBo.sellerWfTaskFile.extend3}">
                    <a class="in_table" data-href="" data-toggle="modal" data-target=".bs-example-modal-lg" data-src="${wfTaskBo.sellerWfTaskFile.extend3 }" data-title="卖方户口本照片  户主页">
                      查看
                    </a>
                    </c:if>
                    <c:if test="${empty wfTaskBo.sellerWfTaskFile.extend3}">
                    	&nbsp;<h style="color: gray;">查看</h>
					</c:if>
                  </td>
                </tr>
                <tr>
                  <th>卖方户口本照片  本人页</th>
                  <td>
                  <c:if test="${!empty wfTaskBo.sellerWfTaskFile.extend4}">
                    <a class="in_table" data-href="" data-toggle="modal" data-target=".bs-example-modal-lg" data-src="${wfTaskBo.sellerWfTaskFile.extend4 }" data-title="卖方户口本照片  本人页">
                      查看
                    </a>
                    </c:if>
                    <c:if test="${empty wfTaskBo.sellerWfTaskFile.extend4}">
                    	&nbsp;<h style="color: gray;">查看</h>
					</c:if>
                  </td>
                  <th>卖方结婚证扫描件（压缩包）</th>
                  <td>
                  <c:if test="${!empty wfTaskBo.sellerWfTaskFile.marry}">
                    &nbsp;<a class="" style="color: #d40c0c" href="javascript:download('${wfTaskBo.sellerWfTaskFile.marry}');">下载</a>
                    </c:if>
                    <c:if test="${empty wfTaskBo.sellerWfTaskFile.marry}">
                    	&nbsp;<h style="color: gray;">下载</h>
					</c:if>
                  </td>
                  <th>卖方离婚证和离婚协议扫描件（压缩包）</th>
                  <td>
                  <c:if test="${!empty wfTaskBo.sellerWfTaskFile.divorce}">
                    &nbsp;<a class="" style="color: #d40c0c" href="javascript:download('${wfTaskBo.sellerWfTaskFile.divorce}');">下载</a>
                  </c:if>
                  <c:if test="${empty wfTaskBo.sellerWfTaskFile.divorce}">
                    	&nbsp;<h style="color: gray;">下载</h>
					</c:if>
                  </td>
                 </tr>
                 <tr> 
                  <th>产权证扫描件（压缩包）</th>
                  <td>
                  <c:if test="${!empty wfTaskBo.sellerWfTaskFile.sellerCertificate}">
                    &nbsp;<a class="" style="color: #d40c0c" href="javascript:download('${wfTaskBo.sellerWfTaskFile.sellerCertificate}');">下载</a>
                  </c:if>
                  <c:if test="${empty wfTaskBo.sellerWfTaskFile.sellerCertificate}">
                    	&nbsp;<h style="color: gray;">下载</h>
					</c:if>
                  </td>
                  <th>征信报告（压缩包）</th>
                  <td>
                  <c:if test="${!empty wfTaskBo.sellerWfTaskFile.sellerCreditReport}">
                    &nbsp;<a class="" style="color: #d40c0c" href="javascript:download('${wfTaskBo.sellerWfTaskFile.sellerCreditReport}');">下载</a>
                  </c:if>
                  <c:if test="${empty wfTaskBo.sellerWfTaskFile.sellerCreditReport}">
                    	&nbsp;<h style="color: gray;">下载</h>
					</c:if>
                  </td>
                  <th>买卖合同（压缩包）</th>
                  <td>
                  <c:if test="${!empty wfTaskBo.sellerWfTaskFile.sellerBussinessContract}">
                    &nbsp;<a class="" style="color: #d40c0c" href="javascript:download('${wfTaskBo.sellerWfTaskFile.sellerBussinessContract}');">下载</a>
                  </c:if>
                  <c:if test="${empty wfTaskBo.sellerWfTaskFile.sellerBussinessContract}">
                    	&nbsp;<h style="color: gray;">下载</h>
					</c:if>
                  </td>
                  </tr>
                  <tr>
                  <th>其他材料（压缩包）</th>
                  <td colspan="6">
                  <c:if test="${!empty wfTaskBo.sellerWfTaskFile.otherFile}">
                    &nbsp;&nbsp;<a class="" style="color: #d40c0c" href="javascript:download('${wfTaskBo.sellerWfTaskFile.otherFile}');">下载</a>
                  </c:if>
                  <c:if test="${empty wfTaskBo.sellerWfTaskFile.otherFile}">
                    	&nbsp;<h style="color: gray;">下载</h>
					</c:if>
                  </td>
                </tr>
              </table>
            </div>
            <div class="col-xs-12"><h2 class="title">买方电子资料</h2></div>
            <div class="col-xs-12">
              <table class="table table-striped table-bordered">
                <tr>
                  <th>买方A身份证照片   正面</th>
                  <td>
                  <c:if test="${!empty wfTaskBo.buyerWfTaskFile.idCardA}">
                    <a class="in_table" data-href="" data-toggle="modal" data-target=".bs-example-modal-lg" data-src="${wfTaskBo.buyerWfTaskFile.idCardA }" data-title="买方A身份证照片   正面">
                      查看
                    </a>
                    </c:if>
                    <c:if test="${empty wfTaskBo.buyerWfTaskFile.idCardA}">
                    	&nbsp;<h style="color: gray;">查看</h>
					</c:if>
                  </td>
                  <th>买方A身份证照片   反面</th>
                  <td>
                  <c:if test="${!empty wfTaskBo.buyerWfTaskFile.extend1}">
                    <a class="in_table" data-href="" data-toggle="modal" data-target=".bs-example-modal-lg" data-src="${wfTaskBo.buyerWfTaskFile.extend1 }" data-title="买方A身份证照片   反面">
                      查看
                    </a>
                    </c:if>
                    <c:if test="${empty wfTaskBo.buyerWfTaskFile.extend1}">
                    	&nbsp;<h style="color: gray;">查看</h>
					</c:if>
                  </td>
                  <th>买方B身份证照片   正面</th>
                  <td>
                  <c:if test="${!empty wfTaskBo.buyerWfTaskFile.idCardB}">
                    <a class="in_table" data-href="" data-toggle="modal" data-target=".bs-example-modal-lg" data-src="${wfTaskBo.buyerWfTaskFile.idCardB }" data-title="买方B身份证照片   正面">
                      查看
                    </a>
                    </c:if>
                    <c:if test="${empty wfTaskBo.buyerWfTaskFile.idCardB}">
                    	&nbsp;<h style="color: gray;">查看</h>
					</c:if>
                  </td>
                 </tr>
                 <tr>
                 <th>买方B身份证照片   反面</th>
                  <td>
                  <c:if test="${!empty wfTaskBo.buyerWfTaskFile.extend2}">
                    <a class="in_table" data-href="" data-toggle="modal" data-target=".bs-example-modal-lg" data-src="${wfTaskBo.buyerWfTaskFile.extend2 }" data-title="买方B身份证照片   反面">
                     查看
                    </a>
                    </c:if>
                    <c:if test="${empty wfTaskBo.buyerWfTaskFile.extend2}">
                    	&nbsp;<h style="color: gray;">查看</h>
					</c:if>
                  </td>
                  <th>买方户口本照片  首页</th>
                  <td>
                  <c:if test="${!empty wfTaskBo.buyerWfTaskFile.residence}">
                    <a class="in_table" data-href="" data-toggle="modal" data-target=".bs-example-modal-lg" data-src="${wfTaskBo.buyerWfTaskFile.residence }" data-title="买方户口本照片  首页">
                      查看
                    </a>
                    </c:if>
                    <c:if test="${empty wfTaskBo.buyerWfTaskFile.residence}">
                    	&nbsp;<h style="color: gray;">查看</h>
					</c:if>
                  </td>
                <th>买方户口本照片  户主页</th>
                  <td>
                  <c:if test="${!empty wfTaskBo.buyerWfTaskFile.extend3}">
                    <a class="in_table" data-href="" data-toggle="modal" data-target=".bs-example-modal-lg" data-src="${wfTaskBo.buyerWfTaskFile.extend3 }" data-title="买方户口本照片  户主页">
                      查看
                    </a>
                    </c:if>
                    <c:if test="${empty wfTaskBo.buyerWfTaskFile.extend3}">
                    	&nbsp;<h style="color: gray;">查看</h>
					</c:if>
                  </td>
                </tr>
                <tr>
                <th>买方户口本照片  个人页</th>
                  <td>
                  <c:if test="${!empty wfTaskBo.buyerWfTaskFile.extend4}">
                    <a class="in_table" data-href="" data-toggle="modal" data-target=".bs-example-modal-lg" data-src="${wfTaskBo.buyerWfTaskFile.extend4}" data-title="买方户口本照片 个人页">
                      查看
                    </a>
                    </c:if>
                    <c:if test="${empty wfTaskBo.buyerWfTaskFile.extend4}">
                    	&nbsp;<h style="color: gray;">查看</h>
					</c:if>
                  </td>
                  <th>买方结婚证扫描件（压缩包）</th>
                  <td>
                  <c:if test="${!empty wfTaskBo.buyerWfTaskFile.marry}">
                    &nbsp;<a class="" style="color: #d40c0c" href="javascript:download('${wfTaskBo.buyerWfTaskFile.marry}');">下载</a>
                    </c:if>
                    <c:if test="${empty wfTaskBo.buyerWfTaskFile.marry}">
                    	&nbsp;<h style="color: gray;">下载</h>
					</c:if>
                  </td>
                  <th>买方离婚证和离婚协议扫描件（压缩包）</th>
                  <td>
                  <c:if test="${!empty wfTaskBo.buyerWfTaskFile.divorce}">
                    &nbsp;<a class="" style="color: #d40c0c" href="javascript:download('${wfTaskBo.buyerWfTaskFile.divorce}');">下载</a>
                  </c:if>
                  <c:if test="${empty wfTaskBo.buyerWfTaskFile.divorce}">
                    	&nbsp;<h style="color: gray;">下载</h>
					</c:if>
                  </td>
                  </tr>
                  <tr>
                  <th>其他材料（压缩包）</th>
                  <td colspan="6">
                  <c:if test="${!empty wfTaskBo.buyerWfTaskFile.otherFile}">
                    &nbsp;<a class="" style="color: #d40c0c" href="javascript:download('${wfTaskBo.buyerWfTaskFile.otherFile}');">下载</a>
                  </c:if>
                  <c:if test="${empty wfTaskBo.buyerWfTaskFile.otherFile}">
                    	&nbsp;<h style="color: gray;">下载</h>
					</c:if>
                  </td>
                </tr>
              </table>
            </div>
            <div class="col-xs-12"><h2 class="title">其他信息</h2></div>
            <div class="col-xs-12">
              <table class="table table-striped table-bordered">
              	<tr>
                  <th width="28%">资信调查通过</th>
                  <td width="22%">${wfTaskBo.wfTaskInfo.isCreditinvest == '1' ? '是' : '否'}
                  </td>
                  <th width="28%">中介约定费用</th>
                  <td width="22%">
                  ${wfTaskBo.wfTaskInfo.intermStandardFee }
                  </td>
                </tr>
                <tr>
                  <th width="28%">了解卖方实际情况</th>
                  <td width="22%">${wfTaskBo.wfTaskInfo.isSellerSituation == '1' ? '是' : '否'}
                  </td>
                  <th width="28%">是否签订三方协议</th>
                  <td width="22%">
                  ${wfTaskBo.wfTaskInfo.isSignThreeAgreement == '1' ? '是' : '否'}
                  </td>
                </tr>
                <tr>
                  <th width="28%">协议签订时间</th>
                  <td width="22%">
                  <fmt:formatDate value="${wfTaskBo.wfTaskInfo.agreemengTime }" pattern="yyyy-MM-dd" />
                  </td>
                  <th>协议照片</th>
                  <td>
                  <c:if test="${!empty wfTaskBo.taskWfTaskFile.threeAgreement}">
                       &nbsp;&nbsp;<a class="" style="color: #d40c0c" href="javascript:download('${wfTaskBo.taskWfTaskFile.threeAgreement}');">下载</a>
                     </c:if>
                      </td>
                </tr>
                <tr>
                  <th>委托公证</th>
                  <td>${wfTaskBo.wfTaskInfo.isNotary == '1' ? '是' : '否'}</td>
                  <th>公证处</th>
                  <td>${_textResource.getSysText('NOTARY_OFFICE', wfTaskBo.wfTaskInfo.notaryOffice)}</td>
                </tr>
                 <tr>
                  <th>公证费用（元）</th>
                  <td>${wfTaskBo.wfTaskInfo.notaryFee }</td>
                  <th>公证时间</th>
                  <td><fmt:formatDate value="${wfTaskBo.wfTaskInfo.notaryTime }" pattern="yyyy-MM-dd" /></td>
                </tr>
                <tr>
                  <th>原贷款银行</th>
                  <td>${wfTaskBo.wfTaskInfo.oldLoanBank }</td>
                  <th>原贷款支行</th>
                  <td>${wfTaskBo.wfTaskInfo.oldLoanBranchbank }</td>
                </tr>
                <tr>
                  <th>现贷款银行</th>
                  <td>${wfTaskBo.wfTaskInfo.nowLoanBank }</td>
                  <th>现贷款支行</th>
                  <td>${wfTaskBo.wfTaskInfo.nowLoanBranchbank }</td>
                </tr>
                <tr>
                  <th>贷款类别</th>
                  <td>${_textResource.getSysText('RANSOM_LOAN_TYPE', wfTaskBo.wfTaskInfo.loanType)}
                  </td>
                   <th>评估公司名称</th>
                  <td>
                  ${_textResource.getSysText('ASSESSMENT', wfTaskBo.wfTaskInfo.assessCompanyName)}
                  </td>
                </tr>
                <tr>
                  <th>评估费（元）</th>
                  <td>${wfTaskBo.wfTaskInfo.assessFee }</td>
                  <th>代办服务费（元）</th>
                  <td>${wfTaskBo.wfTaskInfo.extend3 }</td>
                </tr>
                <tr>
                  <th>其他费用（元）</th>
                  <td>${wfTaskBo.wfTaskInfo.assessOtherFee }</td>
                  <th>贷款金额（元）</th>
                  <td>${wfTaskBo.wfTaskInfo.loanAmount }</td>
                </tr>
                <tr>
                  <th>首付款金额（元）</th>
                  <td>
                  ${wfTaskBo.wfTaskInfo.downPayment }
                  </td>
                  <th>差额款金额（元）</th>
                  <td>${wfTaskBo.wfTaskInfo.balanceAmount }</td>
                </tr>
                 <tr>
                  <th>差额款是否冻结在银行</th>
                  <td>${wfTaskBo.wfTaskInfo.isBalanceOnBank == '1' ? '是' : '否'}</td>
                </tr>
                <tr>
                  <th>首付款冻结单</th>
                  <td>
                  <c:if test="${!empty wfTaskBo.taskWfTaskFile.firstPaymentFreeze}">
                    <a class="in_table" data-href="" data-toggle="modal" data-target=".bs-example-modal-lg" data-src="${wfTaskBo.taskWfTaskFile.firstPaymentFreeze }" data-title="首付款冻结单">
                      查看
                    </a>
                    </c:if>
                      </td>
                  <th>近期房产评估报告</th>
                  <td>
                  <c:if test="${!empty wfTaskBo.taskWfTaskFile.houseAppraisalReport}">
                  <a class="in_table" data-href="" data-toggle="modal" data-target=".bs-example-modal-lg" data-src="${wfTaskBo.taskWfTaskFile.houseAppraisalReport }" data-title="近期房产评估报告">
                      查看
                    </a>
                   </c:if>
                      </td>
                </tr>
                <tr>
                  <th>原贷款银行余额证明（卖方）</th>
                  <td>
                  <c:if test="${!empty wfTaskBo.taskWfTaskFile.originalLoanBank}">
                   <a class="in_table" data-href="" data-toggle="modal" data-target=".bs-example-modal-lg" data-src="${wfTaskBo.taskWfTaskFile.originalLoanBank }" data-title="原贷款银行余额证明（卖方）">
                      查看
                    </a>
                   </c:if>
                      </td>
                  <th>其他材料</th>
                  <td>
                  <c:if test="${!empty wfTaskBo.taskWfTaskFile.taskOtherFile}">
                      &nbsp;<a class="" style="color: #d40c0c" href="javascript:download('${wfTaskBo.taskWfTaskFile.taskOtherFile}');">下载</a>
                    </c:if>
                      </td>
                </tr>
                <tr>
                  <th>新开银行卡是否收取</th>
                  <td>${wfTaskBo.wfTaskInfo.isNewOpenBankcard == '1' ? '是' : '否'}</td>
                  <th>新开UKEY是否收取</th>
                  <td>${wfTaskBo.wfTaskInfo.isNewOpenUkey == '1' ? '是' : '否'}</td>
                </tr>
                <tr>
                  <th>新开银行卡、Ukey收取日期</th>
                  <td>
                  <fmt:formatDate value="${wfTaskBo.wfTaskInfo.newOpenTime }" pattern="yyyy-MM-dd" />
                  </td>
                </tr>
                <tr>
                  <th>是否确权</th>
                  <td>${wfTaskBo.wfTaskInfo.isWinRight == '1' ? '是' : '否'}</td>
                  <th>确权日期</th>
                  <td>
                  <fmt:formatDate value="${wfTaskBo.wfTaskInfo.winRightTime }" pattern="yyyy-MM-dd" />
                  </td>
                </tr>
                <tr>
                  <th>是否出具保函</th>
                  <td>${wfTaskBo.wfTaskInfo.isIssueGuarantee == '1' ? '是' : '否'}</td>
                  <th>保函出具日期</th>
                  <td>
                  <fmt:formatDate value="${wfTaskBo.wfTaskInfo.issueGuaranteeTime }" pattern="yyyy-MM-dd" />
                  </td>
                </tr>
                <tr>
                  <th>银行是否放款</th>
                  <td>${wfTaskBo.wfTaskInfo.isBankLending == '1' ? '是' : '否'}</td>
                  <th>银行放款日期</th>
                  <td>
                  <fmt:formatDate value="${wfTaskBo.wfTaskInfo.bankLendingTime }" pattern="yyyy-MM-dd" />
                  </td>
                </tr>
                <tr>
                  <th>已确权，业务可做</th>
                  <td>${wfTaskBo.wfTaskInfo.isHouseFreezing == '1' ? '是' : '否'}</td>
                  <th>终审通过</th>
                  <td>${wfTaskBo.wfTaskInfo.isFinalPass == '1' ? '是' : '否'}</td>
                </tr>
                <tr>
                  <th>借款协议已收到</th>
                  <td>${wfTaskBo.wfTaskInfo.isLoanAgreementReceived == '1' ? '是' : '否'}</td>
                  <th>收条已收到</th>
                  <td>${wfTaskBo.wfTaskInfo.isReceiptReceived == '1' ? '是' : '否'}</td>
                </tr>
                <tr>
                  <th>解押银行卡、密码、网银收取时间</th>
                  <td>
                  <fmt:formatDate value="${wfTaskBo.wfTaskInfo.loanReceivedTime }" pattern="yyyy-MM-dd" />
                  </td>
                  <th>收款日期</th>
                  <td>
                  <fmt:formatDate value="${wfTaskBo.wfTaskInfo.loanReceivedTime }" pattern="yyyy-MM-dd" />
                  </td>
                </tr>
                <tr>
                  <th>解押出款已确认、已确认还款时间</th>
                  <td>${wfTaskBo.wfTaskInfo.isPaymentConfirm == '1' ? '是' : '否'}</td>
                  <th>还款日期</th>
                  <td>
                  <fmt:formatDate value="${wfTaskBo.wfTaskInfo.paymentConfirmTime }" pattern="yyyy-MM-dd" />
                  </td>
                </tr>
                <tr>
                  <th>担保费已收取</th>
                  <td>${wfTaskBo.wfTaskInfo.isGuaranteeFee == '1' ? '是' : '否'}</td>
                 <th>其他担保费</th>
                  <td>${wfTaskBo.wfTaskInfo.otheGuaranteeFee }</td>
                </tr>
                <tr>
                  <th>其他担保费收取日期</th>
                  <td>
                  <fmt:formatDate value="${wfTaskBo.wfTaskInfo.guaranteeFeeTime }" pattern="yyyy-MM-dd" />
                  </td>
                  <th>差额款已收取</th>
                  <td>${wfTaskBo.wfTaskInfo.isBalanceAmount == '1' ? '是' : '否'}</td>
                </tr>
                <tr>
                  <th>差额款（元）</th>
                  <td>${wfTaskBo.wfTaskInfo.balanceAmount }</td>
                  <th>差额款收款日期</th>
                  <td>
                  <fmt:formatDate value="${wfTaskBo.wfTaskInfo.balanceTime }" pattern="yyyy-MM-dd" />
                  </td>
                </tr>
                <tr>
                  <th>已过户</th>
                  <td>${wfTaskBo.wfTaskInfo.isTransferHouse == '1' ? '是' : '否'}</td>
                  <th>过户时间</th>
                  <td><fmt:formatDate value="${wfTaskBo.wfTaskInfo.transferHouseTime }" pattern="yyyy-MM-dd" /></td>
                </tr>
                <tr>
                <th>垫资是否回款</th>
                  <td>${wfTaskBo.wfTaskInfo.isLoanPayment == '1' ? '是' : '否'}</td>
                  <th>回款日期</th>
                  <td>
                  <fmt:formatDate value="${wfTaskBo.wfTaskInfo.loanPaymentTime }" pattern="yyyy-MM-dd" />
                  </td>
                </tr>
                <tr>
                   <th>结单日期</th>
                  <td>
                  <fmt:formatDate value="${wfTaskBo.wfTaskInfo.finalTime }" pattern="yyyy-MM-dd" />
                  </td>
                </tr>
              </table>
            </div>
            <div class="col-xs-12 align_center">
              <button type="button" class="btn btn-primary submit ml_20" onclick="javascript:window.history.go(-1);">返回</button>
            </div>
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
      
      function download(value){
    	  if(value == null || value == ''){
    		alert("没有上传文件");
    	  }else{
    		  window.location = "${ctx}/wftask/download?fileName=" + value;
    	  }
      }
    </script>
  </body>
</html>
