<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ page import="com.zbjdl.common.utils.config.TextResource" %>

<div class="panel panel-default">
          <div class="panel-heading">审核材料</div>
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
                  <td>${newwfTaskBo.wfTaskInfo.salesmanName }</td>
                  <th>业务员手机</th>
                  <td>${wfTaskBo.wfTaskInfo.salesmanPhone }</td>
                </tr>
                <tr>
                  <th>中介姓名</th>
                  <td>${newwfTaskBo.wfTaskInfo.mediationName }</td>
                  <th>中介手机</th>
                  <td>${wfTaskBo.wfTaskInfo.mediationPhone }</td>
                </tr>
                <tr>
                  <th>经办员</th>
                  <td>${wfTaskBo.wfTaskInfo.userName }</td>
                  <th>经办员手机</th>
                  <td>${wfTaskBo.wfTaskInfo.userPhone }</td>
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
                  <th>现金解押金额（元）</th>
                  <td>${wfTaskBo.sellerWfUserInfo.extend1}</td>
                  <th>赎楼解押金额（元）</th>
                  <td>${wfTaskBo.sellerWfUserInfo.extend2}</td>
                </tr>
                <tr>
                  <th>业务品种</th>
                  <td>${_textResource.getSysText('SELLER_BUSINESS_TYPE', wfTaskBo.sellerWfUserInfo.sellerBussinessType)}
                  </td>
                  <th>业务细分</th>
                  <td>${_textResource.getSysText('SELLER_BUSINESS_SUB', wfTaskBo.sellerWfUserInfo.sellerBussinessSub)}
                  </td>
                  <th></th>
                  <td></td>
                </tr>
                <tr>
                  <th>原贷款银行</th>
                  <td colspan="2">${newwfTaskBo.wfTaskInfo.oldLoanBank}</td>
                  <th>原贷款支行</th>
                  <td colspan="2">${newwfTaskBo.wfTaskInfo.oldLoanBranchbank}</td>
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
                    &nbsp;<a class="" style="color: #d40c0c" href="javascript:download('${wfTaskBo.sellerWfTaskFile.otherFile}');">下载</a>
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
          </div>
        </div>

          