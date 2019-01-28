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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/warehouse.css" media="screen" title="no title" charset="utf-8"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/wxui.css" media="screen" title="no title" charset="utf-8">
  </head>
  <body>
    <div class="topbar">
      <a class="return"  onclick="javascript:window.history.go(-1);"></a>
      付款明细
    </div>
    <div class="showbox bg_white">
      <div class="paydetail_top">
        <p class="title">请用商户POS终端扫描二维码</p>
        <p class="code"><img src="${pageContext.request.contextPath}/static/payInfo.jpg"/></p>
      </div>
      <table class="paydetail_bottom">
        <tr colspan="2"><td>费用明细（元）：</td></tr>
        <tr>
          <td>公证金额：${notaryFee}</td>
          <td>中介费：${intermStandardFee}</td>
        </tr>
        <tr>
          <td>评估费：${assessFee}</td>
          <td>其他费用：${assessOtherFee}</td>
        </tr>
          <tr>
          <td>代办服务费：${extend3}</td>
        </tr>
        <tfoot>
          <tr colspan="2">
            <td>合计：<span class="emphasize">${totalAmount}</span></td>
          </tr>
        </tfoot>
      </table>
    </div>
    <script type="text/javascript" src="js/circles.js"></script>
    <script>
  		var circles = [];
			var child = document.getElementById('circles-1'),
					percentage = 85;
			circles.push(Circles.create({
				id:         child.id,
				value:			percentage,
				radius:     document.getElementById('circles-1').clientWidth/2,
				width:      document.getElementById('circles-1').clientWidth*0.1,
				colors:     ['#e0e1e5', '#45afdf']
			}));
  	</script>
  </body>
</html>
