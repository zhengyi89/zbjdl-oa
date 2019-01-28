<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
  <head>
    <title>中天房管家</title>
    <link rel="stylesheet" href="${def}/wx/css/warehouse.css" media="screen" title="no title" charset="utf-8"/>
    <link rel="stylesheet" href="${def}/wx/css/wxui.css" media="screen" title="no title" charset="utf-8">
  </head>
  
  <body>
    <div class="topbar">
      <a class="return" onclick="history.go(-1)"></a>
      我的赎楼
      <a class="submit" onclick="getUserinfo();">我的资料</a>
    </div>
    <div class="showbox">
      <div class="redemption">
        
        <c:forEach items="${wfTaskList}" var="item">
	        <div class="box" onclick="ransomFloorDetails(${item.wfTaskInfo.id })">
	        <c:if test="${item.buyerWfUserInfo.extend3 == 'buyer' }">
	          <div class="icon buy"></div>
	        </c:if>
	        <c:if test="${item.buyerWfUserInfo.extend3 == 'seller' }">
	          <div class="icon sell"></div>
	        </c:if>
	        <c:if test="${item.buyerWfUserInfo.extend3 != 'seller' && item.buyerWfUserInfo.extend3 != 'buyer'}">
	          <div class="icon sell"></div>
	        </c:if>
	          <h2>${item.wfTaskInfo.taskNo }</h2>
	          <h4>置业顾问：${item.wfTaskInfo.salesmanName }</h4>
	          <h4>买房人：${item.buyerWfUserInfo.nameA }<span class="blank_1r"></span>卖房人：${item.sellerWfUserInfo.nameA }</h4>
	          <h4>交易起止时间：<fmt:formatDate value="${item.wfTaskInfo.createTime }" pattern="yyyy.MM.dd" /> 
	          -<fmt:formatDate value="${item.wfTaskInfo.finalTime }" pattern="yyyy.MM.dd" /></h4>
	          <div class="tiping">${item.wfTaskInfo.status }</div>
	        </div>
        
        </c:forEach>
      </div>
    </div>
    <script src="${def}/js/zepto.min.js"></script>
    <script src="${def}/js/zepto.min.js"></script>
    
    <script type="text/javascript">
	    function getUserinfo(){
			window.location.href= "${ctx}/userinfo/get";
		}
	    
	    function ransomFloorDetails(id){
			window.location.href= "${ctx}/flow/details?task_id="+id;
		}
    </script>
  </body>
</html>
