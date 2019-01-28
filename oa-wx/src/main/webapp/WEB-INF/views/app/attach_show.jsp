<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html>
  <head>
    <title>中天房管家</title>
    <link rel="stylesheet" href="${def}/app/css/warehouse.css" media="screen" title="no title" charset="utf-8"/>
    <link rel="stylesheet" href="${def}/app/css/wxui.css" media="screen" title="no title" charset="utf-8">
  </head>
  <body>
    <div class="topbar">
      <a class="return" onclick="history.go(-1)"></a>
      附件
    </div>
    <div class="showbox">
      <div class="options">
      
      	
        <div class="box">
          <div class="picture">
            <img src="${wfTask.buyerWfTaskFile.idCardA }" onclick="showImg(this);"/>
          </div>
          <h2>身份证正面(买房人)</h2>
          <h4>创建时间：<fmt:formatDate value="${wfTask.buyerWfTaskFile.createTime }" pattern="yyyy.MM.dd" /></h4>
        </div>
        <div class="box">
          <div class="picture">
            <img src="${wfTask.buyerWfTaskFile.extend1 }" onclick="showImg(this);"/>
          </div>
          <h2>身份证反面(买房人)</h2>
          <h4>创建时间：<fmt:formatDate value="${wfTask.buyerWfTaskFile.createTime }" pattern="yyyy.MM.dd" /></h4>
        </div>
        <div class="box">
          <div class="picture">
            <img src="${wfTask.buyerWfTaskFile.residence }" onclick="showImg(this);"/>
          </div>
          <h2>户口本(买房人)</h2>
          <h4>创建时间：<fmt:formatDate value="${wfTask.buyerWfTaskFile.createTime }" pattern="yyyy.MM.dd" /></h4>
        </div>
        <div class="box">
          <div class="picture">
            <img src="${wfTask.buyerWfTaskFile.marry }" onclick="showImg(this);"/>
          </div>
          <h2>结婚证(买房人)</h2>
          <h4>创建时间：<fmt:formatDate value="${wfTask.buyerWfTaskFile.createTime }" pattern="yyyy.MM.dd" /></h4>
        </div>
        <div class="box">
          <div class="picture">
            <img src="${wfTask.buyerWfTaskFile.divorce }" onclick="showImg(this);"/>
          </div>
          <h2>离婚证和离婚协议(买房人)</h2>
          <h4>创建时间：<fmt:formatDate value="${wfTask.buyerWfTaskFile.createTime }" pattern="yyyy.MM.dd" /></h4>
        </div>
        <div class="box">
          <div class="picture">
            <img src="${wfTask.buyerWfTaskFile.idCardB }" onclick="showImg(this);"/>
          </div>
          <h2>B身份证照片正面(买房人)</h2>
          <h4>创建时间：<fmt:formatDate value="${wfTask.buyerWfTaskFile.createTime }" pattern="yyyy.MM.dd" /></h4>
        </div>
        <div class="box">
          <div class="picture">
            <img src="${wfTask.buyerWfTaskFile.extend2 }" onclick="showImg(this);"/>
          </div>
          <h2>B身份证照片,反面(买房人)</h2>
          <h4>创建时间：<fmt:formatDate value="${wfTask.buyerWfTaskFile.createTime }" pattern="yyyy.MM.dd" /></h4>
        </div>
        <div class="box">
          <div class="picture">
            <img src="${wfTask.buyerWfTaskFile.extend3 }" onclick="showImg(this);"/>
          </div>
          <h2>户口本照片，户主页(买房人)</h2>
          <h4>创建时间：<fmt:formatDate value="${wfTask.buyerWfTaskFile.createTime }" pattern="yyyy.MM.dd" /></h4>
        </div>
        <div class="box">
          <div class="picture">
            <img src="${wfTask.buyerWfTaskFile.extend4 }" onclick="showImg(this);"/>
          </div>
          <h2>户口本照片，本人页(买房人)</h2>
          <h4>创建时间：<fmt:formatDate value="${wfTask.buyerWfTaskFile.createTime }" pattern="yyyy.MM.dd" /></h4>
        </div>
        <div class="box">
          <div class="picture">
            <img src="${wfTask.buyerWfTaskFile.otherFile }" onclick="showImg(this);"/>
          </div>
          <h2>其他材料(买房人)</h2>
          <h4>创建时间：<fmt:formatDate value="${wfTask.buyerWfTaskFile.createTime }" pattern="yyyy.MM.dd" /></h4>
        </div>
        




        <div class="box">
          <div class="picture">
            <img src="${wfTask.sellerWfTaskFile.idCardA }" onclick="showImg(this);"/>
          </div>
          <h2>身份证正面(卖房人)</h2>
          <h4>创建时间：<fmt:formatDate value="${wfTask.sellerWfTaskFile.createTime }" pattern="yyyy.MM.dd"/></h4>
        </div>
        <div class="box">
          <div class="picture">
            <img src="${wfTask.sellerWfTaskFile.extend1 }" onclick="showImg(this);"/>
          </div>
          <h2>身份证反面(卖房人)</h2>
          <h4>创建时间：<fmt:formatDate value="${wfTask.sellerWfTaskFile.createTime }" pattern="yyyy.MM.dd"/></h4>
        </div>
        <div class="box">
          <div class="picture">
            <img src="${wfTask.sellerWfTaskFile.residence }" onclick="showImg(this);"/>
          </div>
          <h2>户口本(卖房人)</h2>
          <h4>创建时间：<fmt:formatDate value="${wfTask.sellerWfTaskFile.createTime }" pattern="yyyy.MM.dd"/></h4>
        </div>
        <div class="box">
          <div class="picture">
            <img src="${wfTask.sellerWfTaskFile.marry }" onclick="showImg(this);"/>
          </div>
          <h2>结婚证(卖房人)</h2>
          <h4>创建时间：<fmt:formatDate value="${wfTask.sellerWfTaskFile.createTime }" pattern="yyyy.MM.dd"/></h4>
        </div>
        <div class="box">
          <div class="picture">
            <img src="${wfTask.sellerWfTaskFile.divorce }" onclick="showImg(this);"/>
          </div>
          <h2>离婚证和离婚协议(卖房人)</h2>
          <h4>创建时间：<fmt:formatDate value="${wfTask.sellerWfTaskFile.createTime }" pattern="yyyy.MM.dd"/></h4>
        </div>
        <div class="box">
          <div class="picture">
            <img src="${wfTask.sellerWfTaskFile.sellerCertificate }" onclick="showImg(this);"/>
          </div>
          <h2>产权证扫描件(卖房人)</h2>
          <h4>创建时间：<fmt:formatDate value="${wfTask.sellerWfTaskFile.createTime }" pattern="yyyy.MM.dd"/></h4>
        </div>
        <div class="box">
          <div class="picture">
            <img src="${wfTask.sellerWfTaskFile.sellerBussinessContract }" onclick="showImg(this);"/>
          </div>
          <h2>买卖合同(卖房人)</h2>
          <h4>创建时间：<fmt:formatDate value="${wfTask.sellerWfTaskFile.createTime }" pattern="yyyy.MM.dd"/></h4>
        </div>
        <div class="box">
          <div class="picture">
            <img src="${wfTask.sellerWfTaskFile.sellerCreditReport }" onclick="showImg(this);"/>
          </div>
          <h2>征信报告(卖房人)</h2>
          <h4>创建时间：<fmt:formatDate value="${wfTask.sellerWfTaskFile.createTime }" pattern="yyyy.MM.dd"/></h4>
        </div>
        
        <div class="box">
          <div class="picture">
            <img src="${wfTask.sellerWfTaskFile.idCardB }" onclick="showImg(this);"/>
          </div>
          <h2>B身份证照片正面(卖房人)</h2>
          <h4>创建时间：<fmt:formatDate value="${wfTask.sellerWfTaskFile.createTime }" pattern="yyyy.MM.dd"/></h4>
        </div>
        <div class="box">
          <div class="picture">
            <img src="${wfTask.sellerWfTaskFile.extend2 }" onclick="showImg(this);"/>
          </div>
          <h2>B身份证照片,反面(卖房人)</h2>
          <h4>创建时间：<fmt:formatDate value="${wfTask.sellerWfTaskFile.createTime }" pattern="yyyy.MM.dd"/></h4>
        </div>
        <div class="box">
          <div class="picture">
            <img src="${wfTask.sellerWfTaskFile.extend3 }" onclick="showImg(this);"/>
          </div>
          <h2>户口本照片，户主页(卖房人)</h2>
          <h4>创建时间：<fmt:formatDate value="${wfTask.sellerWfTaskFile.createTime }" pattern="yyyy.MM.dd"/></h4>
        </div>
        <div class="box">
          <div class="picture">
            <img src="${wfTask.sellerWfTaskFile.extend4 }" onclick="showImg(this);"/>
          </div>
          <h2>户口本照片，本人页(卖房人)</h2>
          <h4>创建时间：<fmt:formatDate value="${wfTask.sellerWfTaskFile.createTime }" pattern="yyyy.MM.dd"/></h4>
        </div>
        <div class="box">
          <div class="picture">
            <img src="${wfTask.sellerWfTaskFile.otherFile }" onclick="showImg(this);"/>
          </div>
          <h2>其他材料(卖房人)</h2>
          <h4>创建时间：<fmt:formatDate value="${wfTask.sellerWfTaskFile.createTime }" pattern="yyyy.MM.dd"/></h4>
        </div>
        
        
        
        
        
        
        
        
        
        
        <div class="box">
          <div class="picture">
            <img src="${wfTask.taskWfTaskFile.threeAgreement }" onclick="showImg(this);"/>
          </div>
          <h2>第三方协议照片</h2>
          <h4>创建时间：<fmt:formatDate value="${wfTask.taskWfTaskFile.createTime }" pattern="yyyy.MM.dd"/></h4>
        </div>
        <div class="box">
          <div class="picture">
            <img src="${wfTask.taskWfTaskFile.firstPaymentFreeze }" onclick="showImg(this);"/>
          </div>
          <h2>首付款冻结单</h2>
          <h4>创建时间：<fmt:formatDate value="${wfTask.taskWfTaskFile.createTime }" pattern="yyyy.MM.dd"/></h4>
        </div>
        <div class="box">
          <div class="picture">
            <img src="${wfTask.taskWfTaskFile.houseAppraisalReport }" onclick="showImg(this);"/>
          </div>
          <h2>近期房产评估报告</h2>
          <h4>创建时间：<fmt:formatDate value="${wfTask.taskWfTaskFile.createTime }" pattern="yyyy.MM.dd"/></h4>
        </div>
        <div class="box">
          <div class="picture">
            <img src="${wfTask.taskWfTaskFile.originalLoanBank }" onclick="showImg(this);"/>
          </div>
          <h2>原贷款银行余额证明（卖方）</h2>
          <h4>创建时间：<fmt:formatDate value="${wfTask.taskWfTaskFile.createTime }" pattern="yyyy.MM.dd"/></h4>
        </div>
        <div class="box">
          <div class="picture">
            <img src="${wfTask.taskWfTaskFile.taskOtherFile }" onclick="showImg(this);"/>
          </div>
          <h2>任务其他材料</h2>
          <h4>创建时间：<fmt:formatDate value="${wfTask.taskWfTaskFile.createTime }" pattern="yyyy.MM.dd"/></h4>
        </div>
        
              
        
        
      </div>
    </div>
    
    
    <div id="imgMsg" onclick="this.style.display='';">
      <div class="imgMsg"></div>
      <div class="showImg">
        <img id="imgSelf" src="${def}/images/options_3.jpg" alt=""/>
      </div>
    </div>
    <script type="text/javascript">
      function showImg(obj){
        document.getElementById('imgSelf').setAttribute('src',obj.getAttribute('src'));
        document.getElementById('imgMsg').style.display='block';
      }
    </script>
  </body>
</html>
