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
      我的赎房详情
    </div>
    <div class="showbox">
      <div class="project">
        <h2>业务编号：${wfTask.wfTaskInfo.taskNo }</h2>
        <h4>经办员：${wfTask.wfTaskInfo.userName }</h4>
        <h4>买房人：${wfTask.buyerWfUserInfo.nameA } <span class="blank_1r"></span> 卖房人：${wfTask.sellerWfUserInfo.nameA }</h4>
        <h4>正在进行：<span class="emphasize">${wfTask.wfTaskInfo.approvalStep }</span> </h4>
        <div id="circleOuter" class="circleOuter" onclick="showFlow(${wfTask.wfTaskInfo.id });">
  			  <div class="circle" id="circles-1"></div>
        </div>
      </div>
      <div class="project_list">
        <div class="message" onclick="getFloorBase(${wfTask.wfTaskInfo.id });">
          <p class="icon bg_1"></p>
          楼房基本信息
        </div>
        <c:if test="${role == '0' }">
        <div class="message" onclick="getBuyer(${wfTask.wfTaskInfo.id });">
          <p class="icon bg_2"></p>
          买房人信息
        </div>
        </c:if>
        <c:if test="${role == '1' }">
        <div class="message" onclick="getSeller(${wfTask.wfTaskInfo.id });">
          <p class="icon bg_3"></p>
          卖房人信息
        </div>
        </c:if>
       <%--  <div class="message last" onclick="getAttach(${wfTask.wfTaskInfo.id })">
          <p class="icon bg_4"></p>
          附件
        </div> --%>
      </div>
    </div>
    <script type="text/javascript" src="${ext}/js/circles.js"></script>
    <script>
  		var circles = [];
			var child = document.getElementById('circles-1'),
					percentage = 85;
			circles.push(Circles.create({
				id:         child.id,
				value:		${percent },
				radius:     document.getElementById('circles-1').clientWidth/2,
				width:      document.getElementById('circles-1').clientWidth*0.1,
				colors:     ['#e0e1e5', '#45afdf']
			}));
			
		    function getFloorBase(id){
				window.location.href= "${ctx}/floor/base?task_id="+id;
			}
		    
		    function getBuyer(id){
				window.location.href= "${ctx}/buyer/get?task_id="+id;
			}
		    
		    function getSeller(id){
				window.location.href= "${ctx}/seller/get?task_id="+id;
			}
		    
		    function getAttach(id){
				window.location.href= "${ctx}/attach/get?task_id="+id;
			}
		    
		    function showFlow(id){
				window.location.href= "${ctx}/flow/show?task_id="+id;
			}
		    
  	</script>
  </body>
</html>
