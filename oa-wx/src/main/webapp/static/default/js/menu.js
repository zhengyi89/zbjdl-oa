$(function(){
	$("input[type='text'],input[type='tel'],input[type='password'],input[type='number']").focus(function(){
		$("ul.menu").hide();
	}).blur(function(){
		if($(this).attr("menu")!=undefined){
			return false;
		}else{
			$("ul.menu").show();	
		}
	});
});
var indexInit="";
function menuClick(event){
	event=event?event:window.event;
	event.stopPropagation(); 
	var menuId='#'+$(this).attr('id');
	var menuIndex='#menu_detail'+$(this).attr('id').substring(5,6);
	if($(this).parent().find("a").attr("selected")!=undefined && ($(this).parent().find("a").attr("default")==undefined || $(this).parent().find("a").attr("default")==null)){
		for(var j=1;j<4;j++){
			$("#menu_"+j).removeAttr("selected");
			$("#menu_"+j).removeClass("color_orange").addClass("color_gray_3");
			$("#menu_detail"+j).css("display","none");
		}
		$("#menu_"+indexInit).removeClass("color_gray_3").addClass("color_orange");
	}else{
		for(var j=1;j<4;j++){
			$("#menu_"+j).removeAttr("selected");
			$("#menu_"+j).removeAttr("default");
			$("#menu_"+j).removeClass("color_orange").addClass("color_gray_3");
			$("#menu_detail"+j).css("display","none");
		}
		$(this).attr("selected","selected");
		$(menuId).removeClass("color_gray_3").addClass("color_orange");
		$(menuIndex).css('display','block');
	}	
}
function setDefaultMenu(){
	var pageType = $('meta[name="fmenuIndex"]');
	if(pageType != null && pageType.length != 0){
		if(pageType[0].content == "account"){
			setMenuChange(1);//我的多多
		} else if(pageType[0].content == "invest"){
			setMenuChange(2);//我要投资
		} else if(pageType[0].content == "other"){
			setMenuChange(3);//焦点关注
		} else{
			setMenuChange(1);
		}
	}
}
function setMenuChange(index){
	indexInit=index;
	var id = "";
	if(index == 3){
		id = "menu_3";
	} else if(index == 2){
		id = "menu_2";
	} else {
		id = "menu_1";
	}
	$('#'+id).attr("selected","selected");
	$('#'+id).attr("default","default");
	$('#'+id).removeClass("color_gray_3").addClass("color_orange");
}
$(document.body).click(function(){
	for(var i=1;i<4;i++){		
		$("#menu_"+i).removeClass("color_orange").addClass("color_gray_3");	
		$("#menu_detail"+i).css("display","none");
	}
});