<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
  <title>中天房管家</title>
  <script type="text/javascript" src="${ctx}/static/js/wftask/task.js"></script>
<script type="text/javascript" src="${ctx}/static/js/BusinessCode.js"></script>
<style type="text/css">
     .error{position:static;top:-24px;width:100%;color:red;text-align:left;font-size: 12px;}
    </style>
</head>
<body>
    <div id="content_2" class="content_wrapper">
      <div class="content_main">
      <form class="cmxform form-horizontal" id="godownForma" name="godownForma" action="${ctx}/wftask/saveSellerFile" method="post" enctype="multipart/form-data">
      <input id="id" name="id" type="hidden" value="${id }"/>
      <input type="hidden" id="token" name="token" value="${token}" />
      <input id="type" name="type" value="${type }" type="hidden">
      <input id="back" name="back" value="${back }" type="hidden">
        <div class="panel panel-default">
          <div class="panel-heading">卖方电子资料</div>
          <div class="panel-body">
              <div class="form-group">
                <label class="col-xs-2 control-label">卖方A身份证照片   正面</label>
                <div class="col-xs-3">
                  <a class="file_href">
                    <span class="text">${empty sellerWfTaskFile.idCardA ? '' : '卖方A身份证照片   正面'}</span>
                    <span class="click">点击上传</span>
                    <input type="file" value="${sellerWfTaskFile.idCardA}" ${type == 'on' ? 'disabled=disabled' : ''} onchange="fileChange(this);$(this).parent('a').find('.text').text(this.value);" name="idCardA" id="idCardA"/>
                  </a>
                </div>
                <div class="col-xs-1 tip">*
                	<c:if test="${!empty sellerWfTaskFile.idCardA}">
                  		<a class="in_table" data-href="" data-toggle="modal" data-target=".bs-example-modal-lg" data-src="${sellerWfTaskFile.idCardA }" data-title="卖方A身份证照片   正面">查看</a>
                  	</c:if>
                </div>
                <label class="col-xs-2 control-label">卖方A身份证照片   反面</label>
                <div class="col-xs-3">
                  <a class="file_href">
                    <span class="text">${empty sellerWfTaskFile.extend1 ? '' : '卖方A身份证照片   反面'}</span>
                    <span class="click">点击上传</span>
                    <input type="file" value="${sellerWfTaskFile.extend1}" ${type == 'on' ? 'disabled=disabled' : ''} onchange="fileChange(this);$(this).parent('a').find('.text').text(this.value);" name="extend1" id="extend1"/>
                  </a>
                </div>
                <div class="col-xs-1 tip">*
                <c:if test="${!empty sellerWfTaskFile.extend1}">
                  		<a class="in_table" data-href="" data-toggle="modal" data-target=".bs-example-modal-lg" data-src="${sellerWfTaskFile.extend1 }" data-title="卖方A身份证照片   反面">查看</a>
                  	</c:if></div>
              </div>
              <div class="form-group">
                <label class="col-xs-2 control-label">卖方B身份证照片   正面</label>
                <div class="col-xs-3">
                  <a class="file_href">
                    <span class="text">${empty sellerWfTaskFile.idCardB ? '' : '卖方B身份证照片   正面'}</span>
                    <span class="click">点击上传</span>
                    <input type="file" value="${sellerWfTaskFile.idCardB}" onchange="fileChange(this);$(this).parent('a').find('.text').text(this.value);" name="idCardB" id="idCardB"/>
                  </a>
                </div>
                <div class="col-xs-1 tip"> &nbsp;
                <c:if test="${!empty sellerWfTaskFile.idCardB}">
                  		<a class="in_table" data-href="" data-toggle="modal" data-target=".bs-example-modal-lg" data-src="${sellerWfTaskFile.idCardB }" data-title="卖方B身份证照片   正面">查看</a>
                  	</c:if></div>
                <label class="col-xs-2 control-label">卖方B身份证照片   反面</label>
                <div class="col-xs-3">
                  <a class="file_href">
                    <span class="text">${empty sellerWfTaskFile.extend2 ? '' : '卖方B身份证照片  反面'}</span>
                    <span class="click">点击上传</span>
                    <input type="file" value="${sellerWfTaskFile.extend2}" onchange="fileChange(this);$(this).parent('a').find('.text').text(this.value);" name="extend2" id="extend2"/>
                  </a>
                </div>
                <div class="col-xs-1 tip"> &nbsp;
                <c:if test="${!empty sellerWfTaskFile.extend2}">
                  		<a class="in_table" data-href="" data-toggle="modal" data-target=".bs-example-modal-lg" data-src="${sellerWfTaskFile.extend2 }" data-title="卖方B身份证照片   反面">查看</a>
                  	</c:if></div>
              </div>
              <div class="form-group">
                <label class="col-xs-2 control-label">卖方户口本照片  首页</label>
                <div class="col-xs-3">
                  <a class="file_href">
                    <span class="text">${empty sellerWfTaskFile.residence ? '' : '卖方户口本照片  首页'}</span>
                    <span class="click">点击上传</span>
                    <input type="file" value="${sellerWfTaskFile.residence}" ${type == 'on' ? 'disabled=disabled' : ''} onchange="fileChange(this);$(this).parent('a').find('.text').text(this.value);" name="residence" id="residence"/>
                  </a>
                </div>
                <div class="col-xs-1 tip">*
                <c:if test="${!empty sellerWfTaskFile.residence}">
                  		<a class="in_table" data-href="" data-toggle="modal" data-target=".bs-example-modal-lg" data-src="${sellerWfTaskFile.residence }" data-title="卖方户口本照片  首页">查看</a>
                  	</c:if></div>
                <label class="col-xs-2 control-label">卖方户口本照片  户主页</label>
                <div class="col-xs-3">
                  <a class="file_href">
                    <span class="text">${empty sellerWfTaskFile.extend3 ? '' : '卖方户口本照片  户主页'}</span>
                    <span class="click">点击上传</span>
                    <input type="file" value="${sellerWfTaskFile.extend3}" ${type == 'on' ? 'disabled=disabled' : ''} onchange="fileChange(this);$(this).parent('a').find('.text').text(this.value);" name="extend3" id="extend3"/>
                  </a>
                </div>
                <div class="col-xs-1 tip">*
                <c:if test="${!empty sellerWfTaskFile.extend3}">
                  		<a class="in_table" data-href="" data-toggle="modal" data-target=".bs-example-modal-lg" data-src="${sellerWfTaskFile.extend3 }" data-title="卖方户口本照片  户主页">查看</a>
                  	</c:if></div>
              </div>
              <div class="form-group">
                <label class="col-xs-2 control-label">卖方户口本照片  本人页</label>
                <div class="col-xs-3">
                  <a class="file_href">
                    <span class="text">${empty sellerWfTaskFile.extend4? '' : '卖方户口本照片  本人页'}</span>
                    <span class="click">点击上传</span>
                    <input type="file" value="${sellerWfTaskFile.extend4}" ${type == 'on' ? 'disabled=disabled' : ''} onchange="fileChange(this);$(this).parent('a').find('.text').text(this.value);" name="extend4" id="extend4"/>
                  </a>
                </div>
                <div class="col-xs-1 tip">*
                <c:if test="${!empty sellerWfTaskFile.extend4}">
                  		<a class="in_table" data-href="" data-toggle="modal" data-target=".bs-example-modal-lg" data-src="${sellerWfTaskFile.extend4 }" data-title="卖方户口本照片  本人页">查看</a>
                  	</c:if></div>
              </div>
              <div class="form-group">
              <label class="col-xs-2 control-label">卖方结婚证扫描件（压缩包）</label>
                <div class="col-xs-3">
                  <a class="file_href">
                    <span class="text">${empty sellerWfTaskFile.marry ? '' : '卖方结婚证扫描件'}</span>
                    <span class="click">点击上传</span>
                    <input type="file" value="${sellerWfTaskFile.marry}" onchange="fileChange(this);$(this).parent('a').find('.text').text(this.value);" name="marry" id="marry"/>
                  </a>
                </div>
                <div class="col-xs-1 tip"> &nbsp;
                <c:if test="${!empty sellerWfTaskFile.marry}">
                  		<a class="" style="color: #d40c0c" href="${ctx}/wftask/download?fileName=${sellerWfTaskFile.marry}">下载</a>
                  	</c:if></div>
                <label class="col-xs-2 control-label">卖方离婚证和离婚协议扫描件（压缩包）</label>
                <div class="col-xs-3">
                  <a class="file_href">
                    <span class="text">${empty sellerWfTaskFile.divorce ? '' : '卖方离婚证和离婚协议扫描件'}</span>
                    <span class="click">点击上传</span>
                    <input type="file" value="${sellerWfTaskFile.divorce}" onchange="fileChange(this);$(this).parent('a').find('.text').text(this.value);" name="divorce" id="divorce"/>
                  </a>
                </div>
                <div class="col-xs-1 tip">&nbsp;
                <c:if test="${!empty sellerWfTaskFile.divorce}">
                  		<a class="" style="color: #d40c0c" href="${ctx}/wftask/download?fileName=${sellerWfTaskFile.divorce}">下载</a>
                  	</c:if></div>
              </div>
              <div class="form-group">
                <label class="col-xs-2 control-label">产权证扫描件（压缩包）</label>
                <div class="col-xs-3">
                  <a class="file_href">
                    <span class="text">${empty sellerWfTaskFile.sellerCertificate ? '' : '产权证扫描件'}</span>
                    <span class="click">点击上传</span>
                    <input type="file" value="${sellerWfTaskFile.sellerCertificate}" onchange="fileChange(this);$(this).parent('a').find('.text').text(this.value);" name="sellerCertificate" id="sellerCertificate"/>
                  </a>
                </div>
                <div class="col-xs-1 tip" style="color: blue;">*
                <c:if test="${!empty sellerWfTaskFile.sellerCertificate}">
                  		<a class="" style="color: #d40c0c" href="${ctx}/wftask/download?fileName=${sellerWfTaskFile.sellerCertificate}">下载</a>
                  	</c:if></div>
                <label class="col-xs-2 control-label">买卖合同（压缩包）</label>
                <div class="col-xs-3">
                  <a class="file_href">
                    <span class="text">${empty sellerWfTaskFile.sellerBussinessContract ? '' : '买卖合同'}</span>
                    <span class="click">点击上传</span>
                    <input type="file" value="${sellerWfTaskFile.sellerBussinessContract}" onchange="fileChange(this);$(this).parent('a').find('.text').text(this.value);" name="sellerBussinessContract" id="sellerBussinessContract"/>
                  </a>
                </div>
                <div class="col-xs-1 tip" style="color: blue;">*
                <c:if test="${!empty sellerWfTaskFile.sellerBussinessContract}">
                  		<a class="" style="color: #d40c0c" href="${ctx}/wftask/download?fileName=${sellerWfTaskFile.sellerBussinessContract}">下载</a>
                  	</c:if></div>
              </div>
              <div class="form-group">
                <label class="col-xs-2 control-label">征信报告（压缩包）</label>
                <div class="col-xs-3">
                  <a class="file_href">
                    <span class="text">${empty sellerWfTaskFile.sellerCreditReport ? '' : '征信报告'}</span>
                    <span class="click">点击上传</span>
                    <input type="file" value="${sellerWfTaskFile.sellerCreditReport}" onchange="fileChange(this);$(this).parent('a').find('.text').text(this.value);" name="sellerCreditReport" id="sellerCreditReport"/>
                  </a>
                </div>
                <div class="col-xs-1 tip" style="color: blue;">*
                <c:if test="${!empty sellerWfTaskFile.sellerCreditReport }">
                  		<a class="" style="color: #d40c0c" href="${ctx}/wftask/download?fileName=${sellerWfTaskFile.sellerCreditReport}">下载</a>
                  	</c:if></div>
                <label class="col-xs-2 control-label">其他材料（压缩包）</label>
                <div class="col-xs-3">
                  <a class="file_href">
                    <span class="text">${empty sellerWfTaskFile.otherFile ? '' : '其他材料'}</span>
                    <span class="click">点击上传</span>
                    <input type="file" value="${sellerWfTaskFile.otherFile}" onchange="fileChange(this);$(this).parent('a').find('.text').text(this.value);" name="otherFile" id="otherFile"/>
                  </a>
                </div>
                <div class="col-xs-1 tip">&nbsp;
                <c:if test="${!empty sellerWfTaskFile.otherFile}">
                  		<a class="" style="color: #d40c0c" href="${ctx}/wftask/download?fileName=${sellerWfTaskFile.otherFile}">下载</a>
                  	</c:if></div>
              </div>
          </div>
        </div>
        <div class="col-xs-12 align_center">
        <c:if test="${type=='on' }">
        	<a class="btn btn-default button" href="${ctx}/wftask/wfHasdoTaskInfoIndex">取  消</a>
          <button type="button" id="buttonAdd" class="btn btn-primary submit ml_20" onclick="submitSellerFileEdit('godownForma');">下一步</button>
        </c:if>
        <c:if test="${type!='on' }">
          <c:if test="${back == 'edit' }">
         		<a class="btn btn-default button" href="${ctx}/wftask/wfTaskEditInfoIndex">取  消</a>
         	</c:if>
          	<c:if test="${back != 'edit' }">
         		<a class="btn btn-default button" href="${ctx}/wftask/wfTaskInfoIndex">取  消</a>
         	</c:if>
<%--           <a class="btn btn-primary submit ml_20" href="${ctx}/wftask/toWfTaskInfoEdit?id=${id}">上一步</a> --%>
          <button type="button" id="buttonAdd" class="btn btn-primary submit ml_20" onclick="submitSellerFileAdd('godownForma');">下一步</button>
          </c:if>
        </div>
        </form>
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
      
    </script>
  </body>
</html>