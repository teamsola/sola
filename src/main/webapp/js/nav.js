/**
 * 
 */
$(document).ready(function()
		{	
	$("ul#lv1>li").mouseenter(function()	// lev1에 마우스 올릴때
			{
				$("ul.lv2-list").css("visibility", "hidden");	// 일단 숨김 레벨 2
				$("ul.lv2-list").css("height", "4px");			
				var id = $(this).attr("id");		
				$("#"+ id + "Lv2").css("visibility", "visible");	// 보여주는 것
				$("#"+ id + "Lv2").css("height", "520px");	// 내려오는 크기
				$("#" + id + ">a").css("color", "#ff8400");
				/*$(this).css("background-color", "#6a6763");*/
			});
	$("#lv2>ul.lv2-list").mouseenter(function()
			{
				$(this).css("visibility", "visible");
				$(this).css("visibility", "520px");
				var rel = $(this).attr("rel");
				$("#" + rel + ">a").css("color", "#ff8400");
				/*$("#" + rel).css("background-color", "#6a6763");*/
			});
	$("ul#lv1>li").mouseleave(function()
			{
				$("#lv2>ul.lv2-list").css("visibility", "hidden");
				$("#lv2>ul.lv2-list").css("height", "4px");
				var id = $(this).attr("id");
				$("#" + id + ">a").css("color", "white");
			});
	$("#lv2>ul.lv2-list").mouseleave(function()
			{
				$("#lv2>ul.lv2-list").css("visibility", "hidden");
				$("#lv2>ul.lv2-list").css("height", "4px");
				var rel = $(this).attr("rel");
				$("#" + rel + ">a").css("color", "white");
				$("#lev1#"+rel).css("color","white");
			});
	$(window).scroll(function()	// 네비바 고정, 프로그레스바 
			 {
		 		var sc = $(window).scrollTop();
		 		var scPer = 100 * sc / ($(document).height() - $(window).height());
		 			$("nav").addClass("gnb-fixed-top");
		 			$("#progressbar").css("visibility", "visible");
		 			$("#progressbar").width(parseInt(scPer, 10) + "%");
		 		
			 });
}); 