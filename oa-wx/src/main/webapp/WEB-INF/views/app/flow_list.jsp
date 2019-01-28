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
    <link rel="stylesheet" href="${def}/app/css/wxui.css" media="screen" title="no title" charset="utf-8"/>
  </head>
  <body>
    <div class="topbar">
      <p id="list_11" name="projectList" class="list" onclick="tabSelect(this,this.id);">待办</p>
      <p id="list_21" name="projectList" class="list" onclick="tabSelect(this,this.id);">进行中</p>
      <p id="list_31" name="projectList" class="list" onclick="tabSelect(this,this.id);">已完结</p>
    </div>
    
    <div class="showbox">
      <div id="list_12" name="projectDetail" class="mylist checked" >
      	<c:forEach items="${wfTaskList}" var="item">
      	 <c:if test="${item.type == 0}">    
      	  <div class="list_detail" onclick="flowDetails(${item.wfTaskInfo.id }, ${item.type });">
           <h2>业务编号：${item.wfTaskInfo.taskNo }</h2>
           <h4>经办员：${item.wfTaskInfo.userName }</h4>
           <h4>正在进行：<span class="emphasize">${item.wfTaskInfo.approvalStep }</span>
           <span class="blank_2r"></span>跟进人：${item.wfTaskInfo.mediationName }</h4>
          </div>
      	 </c:if>
	    </c:forEach>
	    
      </div>
      <div id="list_22" name="projectDetail" class="mylist">
        <c:forEach items="${wfTaskList}" var="item">
      	 <c:if test="${item.type == 1}">    
      	  <div class="list_detail" onclick="flowDetails(${item.wfTaskInfo.id }, ${item.type });">
           <h2>业务编号：${item.wfTaskInfo.taskNo }</h2>
           <h4>经办员：${item.wfTaskInfo.userName }</h4>
           <h4>正在进行：<span class="emphasize">${item.wfTaskInfo.approvalStep }</span>
           <span class="blank_2r"></span>跟进人：${item.wfTaskInfo.mediationName }</h4>
          </div>
      	 </c:if>
	    </c:forEach>
      </div>
      <div id="list_32" name="projectDetail" class="mylist">
        <c:forEach items="${wfTaskList}" var="item">
      	 <c:if test="${item.type == 2}">    
      	  <div class="list_detail" onclick="flowDetails(${item.wfTaskInfo.id }, ${item.type });">
           <h2>业务编号：${item.wfTaskInfo.taskNo }</h2>
           <h4>经办员：${item.wfTaskInfo.userName }</h4>
           <h4>正在进行：<span class="emphasize">${item.wfTaskInfo.approvalStep }</span>
           </h4>
          </div>
      	 </c:if>
	    </c:forEach>
      </div>
    </div>
    <script type="text/javascript">
	    $(function(){
	    	if ("${index}" != '') {
	    		var object = document.getElementById("${index}");
	    		tabSelect1(object,'${index}');
			}else {
				var object = document.getElementById("list_11");
				tabSelect1(object,'list_11');
			}
	    });
	    
	    function hasClass(dom,selector){
	    	var rclass = /[\t\r\n\f]/g,
	        className = " " + selector + " ";
		    if(dom.nodeType === 1 && (" " + dom.className + " ").replace(rclass, " ").indexOf(className)>-1){
		      return true;
		    }
		    return false;
	    }
	    
	    
	    function tabSelect(obj,id){
	    	window.location.href= "${ctx}/app/flow/list?index="+id;
	    }
	    
	    function tabSelect1(obj,id){
	    	var thisIndex = id,
		      thisObj = document.getElementById(id),
		      thisObjArr = document.getElementsByName('projectList'),
		      listIndex = id.substring(0,6)+"2",
		      listObj = document.getElementById(listIndex),
		      listObjArr = document.getElementsByName('projectDetail');
		      if(hasClass(obj,"checked")){
		          return false;
		      }else{
		    	  for(var i=0;i<thisObjArr.length;i++){
		              if(hasClass(thisObjArr[i],"checked")){
		                thisObjArr[i].className = "list";
		              }
		              if(hasClass(listObjArr[i],"checked")){
		                listObjArr[i].className = "mylist";
		              }
		            }
		            thisObj.className = thisObj.className + " checked";
		            listObj.className = listObj.className + " checked";
		      }
	    }
	    
      function flowDetails(id, type){
  		window.location.href= "${ctx}/app/flow/details/"+id+"/"+type;
 	  }
    </script>
  </body>
</html>
