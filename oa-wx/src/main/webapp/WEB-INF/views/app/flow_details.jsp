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
      项目详情
    </div>
    <div class="showbox">
      <div class="project">
        <h2>业务编号：${wfTask.wfTaskInfo.taskNo }</h2>
        <h4>经办员：${wfTask.wfTaskInfo.userName }</h4>
        <h4>买房人：${wfTask.buyerWfUserInfo.nameA }<span class="blank_1r"></span> 卖房人：${wfTask.sellerWfUserInfo.nameA }</h4>
        <h4>正在进行：<span class="emphasize">${task_curr}</span> </h4>
        <div id="circleOuter" class="circleOuter" onclick="showFlow(${wfTask.wfTaskInfo.id });">
  			  <div class="circle" id="circles-1"></div>
        </div>
      </div>
      <div class="about_pay clearfix">
        待收费用：<span class="emphasize">${wfTask.wfTaskInfo.feeSum }元</span>
        <c:if test="${wfTask.wfTaskInfo.approvalStep > 6 && wfTask.wfTaskInfo.payStatus != 1 && hiddenPayButton != 1}">
        	<c:if test="${os =='pos'}">
        		<input type="button" id="submitButton" value="收款" onclick="this.value='生成中…';this.setAttribute('disabled',true);pay(${wfTask.wfTaskInfo.id });"/>
        	</c:if>
        	<c:if test="${os != 'pos'}">
        		<input type="button" id="submitButton" value="付款" onclick="this.value='生成中…';this.setAttribute('disabled',true);pay(${wfTask.wfTaskInfo.id });"/>
        	</c:if>
        </c:if>
        <c:if test="${wfTask.wfTaskInfo.payStatus == 1 }">
        	<input type="button" value="已付款"/>
        </c:if>
      </div>
      <div class="project_list">
        <div class="message" onclick="getFloorBase(${wfTask.wfTaskInfo.id });">
          <p class="icon bg_1"></p>
          楼房基本信息
        </div>
        <div class="message" onclick="getBuyer(${wfTask.wfTaskInfo.id });">
          <p class="icon bg_2"></p>
          买房人信息
        </div>
        <div class="message" onclick="getSeller(${wfTask.wfTaskInfo.id });">
          <p class="icon bg_3"></p>
          卖房人信息
        </div>
        <div class="message last" onclick="getAttach(${wfTask.wfTaskInfo.id });">
          <p class="icon bg_4"></p>
          附件
        </div>
      </div>
      <c:if test="${status == 0}">
      	<div class="project_step">
      		<p class="prev">上一步：${task_pre }</p>
     		<p class="rightnow">现在：${task_curr }</p>
      		<p class="submit"><input class="submit" type="button" name="name" value="现在处理" onclick="handlingFlow(${wfTask.wfTaskInfo.id });"/></p>
      </div>
      </c:if>
    </div>
    <script type="text/javascript" src="${def}/app/js/circles.js"></script>
    <script>
  	 	var circles = [];
			var child = document.getElementById('circles-1'),
					percentage = 85;
			circles.push(Circles.create({
				id:         child.id,
				value:			"${percent}",
				radius:     document.getElementById('circles-1').clientWidth/2,
				width:      document.getElementById('circles-1').clientWidth*0.1,
				colors:     ['#e0e1e5', '#45afdf']
			})); 
			
			function getFloorBase(id){
				window.location.href= "${ctx}/app/floor/details/"+id;
			}
		    
		    function getBuyer(id){
				window.location.href= "${ctx}/app/buyer/get/"+id;
			}
		    
		    function getSeller(id){
				window.location.href= "${ctx}/app/seller/get/"+id;
			}
		    
		    function getAttach(id){
				window.location.href= "${ctx}/app/attach/get/"+id;
			}
		    
		    function handlingFlow(id){
				window.location.href= "${ctx}/app/flow/tohandle/"+id;
			}
		    
		    function showFlow(id){
				window.location.href= "${ctx}/app/flow/show/"+id;
			}
		    
		    function pay(id){
		    	if ("${os}"=='pos') {
		    		$.ajax({
		    			url : "${ctx}/pay/pos/toPayInfo?id="+id,
		    			method : "GET",
		    			success : function(data) { 
							window.WebViewJavascriptBridge.callHandler(
						            'loginFromWeb'
						            , {"param": data }
						            , function(responseData) { }
						        ); 
		    			},
		    			error : function() {
		    				alert("系统异常，请稍后重试");
		    				$("#submitButton").removeAttr("disabled");
		    		    	$("#submitButton").val("收款");
		    			}
		    		});
				} else {
					window.location.href= "${ctx}/pay/toPayInfo?id="+id;
				}
			}
		    
  	</script>
  </body>
</html>
