<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
<title>解绑</title>
<link rel="stylesheet" href="${def}/css/weui.css" />
<link rel="stylesheet" href="${def}/css/mine.css" />
<link rel="stylesheet" href="${def}/app/css/warehouse.css"
	media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" href="${def}/app/css/wxui.css" media="screen"
	title="no title" charset="utf-8">
<link rel="stylesheet" href="${def}/app/css/mobiscroll.css"
	media="screen" title="no title" charset="utf-8">
</head>
<body>
	<div class="topbar">
		<a class="return" onclick="history.go(-1)"></a> 解绑原因
	</div>
	<div class="showbox">
		<div class="container p_none">
			<div class="weui_cells weui_cells_radio">
				<label class="weui_cell weui_check_label" for="x11">
					<div class="weui_cell_bd weui_cell_primary">
						<p>原绑定商户错误，需要重新绑定</p>
					</div>
					<div class="weui_cell_ft">
						<input type="radio" class="weui_check" name="radio1" id="x11"
							value="x11"> <span class="weui_icon_checked"></span>
					</div>
				</label> <label class="weui_cell weui_check_label" for="x12">
					<div class="weui_cell_bd weui_cell_primary">
						<p>原绑定微信号变更，需要重新绑定</p>
					</div>
					<div class="weui_cell_ft">
						<input type="radio" name="radio1" class="weui_check" id="x12"
							value="x12" checked="checked"> <span
							class="weui_icon_checked"></span>
					</div>
				</label> <label class="weui_cell weui_check_label" for="x13">
					<div class="weui_cell_bd weui_cell_primary">
						<p>其他</p>
					</div>
					<div class="weui_cell_ft">
						<input type="radio" name="radio1" class="weui_check" id="x13"
							value="x13" checked="checked"> <span
							class="weui_icon_checked"></span>
					</div>
				</label>
			</div>
			<div class="weui_cells weui_cells_form">
				<div class="weui_cell">
					<div class="weui_cell_bd weui_cell_primary">
						<textarea class="weui_textarea" id="reason" name="reason"
							placeholder="请输入解绑原因" rows="3"></textarea>
					</div>
				</div>
			</div>

			<div class="submit_box">
				<p class="submit">
					<input type="button" value="解 绑" onclick="un_bind();" />
				</p>
			</div>
		</div>
	</div>

	<script src="${def}/js/zepto.min.js"></script>
	<script type="text/javascript">
	    function un_bind(){
	    	var _reason=$("#reason").val();
	    	var _radio1=$('input[name="radio1"]:checked').val();
			$.ajax({
				url : "${ctx}/user/unBind",
				method : "POST",
				data:{"code":_radio1+_reason},
				success : function(data) { 
					var code = data.code;
					var error  = data.msg;
					//原有逻辑不变
					if("0000" == code){
						window.location.href= "${ctx}/user/unbind/success";
						return;
					}else {
						var callUrl = "${ctx}/user/unbind/failed?error="+encodeURI(error);
						window.location.href= callUrl;
						return;
					}
				},
				error : function() {
					var callUrl = "${ctx}/user/unbind/failed?error="+encodeURI("系统异常，请稍后重试");
					window.location.href= callUrl;
				}
			});
		}
    
    </script>
</body>
</html>
