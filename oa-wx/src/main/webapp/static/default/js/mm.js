
$(function(){
	//主菜单弹出
	$(".menu_btn").click(function(){
		var m_b = $(window).height()/8;
		var li_l = $(".mm_mask_ul li").length;
		$(".main_menu").css({"display":"block"});
		
		for(var i=0; i<li_l; i++){
			//console.log(i);
			$(".mm_mask_ul li").eq(i).css({'top':i*m_b+(m_b-40)/2});
			(function(i){
				setTimeout(function(){
					$(".mm_mask_ul li").eq(i).animate({'left':'-100%'},300);
				},i*100)
			})(i)
		}
		
		$(".main_menu").click(function(e){
			if(!$(e.target).hasClass("zsty")){
				$(".mm_mask_ul li").animate({'left':'100%'},300,function(){
					$(".main_menu").css({"display":"none"});
				});
		    }
		});
	});

})

