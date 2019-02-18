<%@page import="com.zbjdl.common.utils.config.TextResource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <title>大连八戒财税</title>
   <link rel="stylesheet" href="${def }/css/dxeui.css?version=1.5.0" media="screen" title="no title" charset="utf-8"/>
<link rel="stylesheet" href="${def }/css/iosSelect.css?version=1.5.0" media="screen" title="no title">
<link rel="stylesheet" href="${def }/css/animate.min.css?version=1.5.0" media="screen" title="no title">
<link rel="stylesheet" href="${def }/css/hashChange.css?version=1.5.0" media="screen" title="no title">
<link rel="stylesheet" href="${def}/app/css/warehouse.css" media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" href="${def}/app/css/wxui.css" media="screen" title="no title" charset="utf-8">
<link rel="stylesheet" href="${def}/app/css/mobiscroll.css" media="screen" title="no title" charset="utf-8">
  </head>
  <body>
  	<%pageContext.setAttribute("_textResource", new TextResource()); %>
    <div class="top_bar"><a class="return" onclick="window.location.href = '${ctx}/index'"></a>${month } 业绩目标</div>
    <div class="content_auto">
      <form id="formId">
        <div class="insert_team bottom">
          	<c:forEach items="${list }"  var="dto">
          		<div class="insert_message">
	            	<label>${dto.userName }:</label>
	            	<input type="hidden" id="id"  name="id" value="${dto.id }"/>
	            	<input type="text" id="targetAmount" name="targetAmount" placeholder="总额" value="${dto.targetAmount }"/>
	          	</div>
          	</c:forEach>
          	
        </div>
        <div class="btn_team bg_register">
          	<p class="submit_btn">
            	<input class="" type="button" id="submit_btn" value="保   存" onclick="do_submit();"/>
          	</p>
        </div>
      </form>
    </div>
    <script type="text/javascript">
	    $(function(){
	    	$("input").focus(function(){
	    		this.select();
	    		});
	    })
        
    	function do_submit(){
    		$.ajax({
    			url : "${ctx}/target/save",
    			type : "POST",
    			async: false,
    			contentType:"application/json",
    			data: JSON.stringify($('formId').serializeObject()),
    			success : function(data) {
    				console.log(data);
    				//原有逻辑不变
    				if ("0000" == data.code) {
    					alert('保存成功');
    					window.location.href = "${ctx}/index";
    					return;
    				}
    			},
    			error : function() {
    				alert("系统异常，请稍后重试");
    			}
    		});
    	}
    	
    	$.fn.serializeObject = function() {
            var o = [];
            var a = $("#formId").serializeArray();
            var p = {};
            var i = 0;
            $.each(a, function() {
            	i++;
            	p[this.name]=this.value;
            	if(i%2==0){
            		o.push(p);
            		p = {};
            	}
            });
            return o;
        };
    </script> 
  </body>
</html>
