<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title>公告详情</title>
</head>
<body>
		<div id="content_2" class="content_wrapper">
			<div class="content_main">
				<div class="panel panel-default">
					<div class="panel-heading">公告详情</div>
					<div class="panel-body">
					<form method="post" id="godownForma" name="godownForma" action="#" class="cmxform form-horizontal">
						<div class="form-group">
							<input type="hidden" value="${pageInfo.id}" id="id" name="id"> 
							<label for="inputPassword3" class="col-lg-2 control-label">公告标题:</label>
							<div class="col-lg-3">
								<label class="control-label">${pageInfo.title}</label>
							</div>
						</div>
						<div class="col-lg-offset-2 col-lg-10">
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">公告内容:</label>
							<div class="col-lg-7 pt_2">
								<textarea class="form-control" rows="30" id="remark" name="remark" disabled="disabled">${pageInfo.content}</textarea>
							</div>
						</div>
					</form>
					<div class="form-group">
							<div class="col-lg-10 align_center">
								<!-- <button class="btn btn-primary submit" type="submit" onclick="document.getElementById('godownForma').submit();">保存</button> -->
								<a href="javascript:window.history.go(-1)"><button
										class="btn btn-primary button ml_20" type="button">返回</button></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>