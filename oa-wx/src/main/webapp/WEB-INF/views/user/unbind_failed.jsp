<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
  <head>
    <title>解绑</title>
    <link rel="stylesheet" href="${def}/css/weui.css"/>
    <link rel="stylesheet" href="${def}/css/mine.css"/>
  </head>
  <body ontouchstart>
    <div class="container p_none">
      <div class="weui_msg">
        <div class="weui_icon_area"><i class="weui_icon_warn weui_icon_msg"></i></div>
        <div class="weui_text_area">
          <h2 class="weui_msg_title"><%=request.getParameter("error")%></h2>
        </div>
        <div class="weui_opr_area">
          <p class="weui_btn_area">
            <a href="${ctx}/user/login/index" class="weui_btn weui_btn_default">确定</a>
          </p>
        </div>
      </div>
    </div>
    <script src="${def}/js/zepto.min.js"></script>
  </body>
</html>
