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
      我的资料
      <a class="submit" onclick="unbind();">解绑</a>
    </div>
    <div class="showbox">
      <div class="mydata">
        <div class="box">
          <p>姓名 <span>${userinfo.nameA}</span></p>
          <p>身份证号 <span>${userinfo.idCardA}</span></p>
          <p class="last">手机号 <span>${userinfo.phoneA}</span></p>
        </div>
        <c:if test="${userinfo.nameB != null && userinfo.nameB != ''}">
        	<p class="title">附属买房人信息</p>
	        <div class="box bottom">
	          <p>姓名 <span>${userinfo.nameB}</span></p>
	          <p>身份证号 <span>${userinfo.idCardB}</span></p>
	        </div>
        </c:if>
      </div>
    </div>
    
     <script type="text/javascript">
	    function unbind(){
			window.location.href= "${ctx}/unbind";
		}
    </script>
  </body>
</html>
