/**
 * 
 */
$(document).ready(function()
		{	
	$("ul#lv1>li").mouseenter(function()
			{
				$("ul.lv2-list").css("visibility", "hidden");
				$("ul.lv2-list").css("height", "4px");
				var id = $(this).attr("id");
				$("#"+ id + "Lv2").css("visibility", "visible");
				$("#"+ id + "Lv2").css("height", "520px");
				$("#" + id + ">a").css("color", "#ff8400");
				$(this).css("background-color", "#6a6763");
			});
	$("#lv2>ul.lv2-list").mouseenter(function()
			{
				$(this).css("visibility", "visible");
				$(this).css("visibility", "520px");
				var rel = $(this).attr("rel");
				$("#" + rel + ">a").css("color", "#ff8400");
				$("#" + rel).css("background-color", "#6a6763");
			});
	$("ul#lv1>li").mouseleave(function()
			{
				$("#lv2>ul.lv2-list").css("visibility", "hidden");
				$("#lv2>ul.lv2-list").css("height", "4px");
				var id = $(this).attr("id");
				$("#" + id + ">a").css("color", "#6a6763");
				$(this).css("background-color", "#ff8400");
			});
	$("#lv2>ul.lv2-list").mouseleave(function()
			{
				$("#lv2>ul.lv2-list").css("visibility", "hidden");
				$("#lv2>ul.lv2-list").css("height", "4px");
				var rel = $(this).attr("rel");
				$("#" + rel + ">a").css("color", "#6a6763");
				$("#" + rel).css("background-color", "#ff8400");
			});
	$(window).scroll(function()
			 {
		 		var sc = $(window).scrollTop();
		 		var scPer = 100 * sc / ($(document).height() - $(window).height());
		 		if(sc > 69)
		 		{
		 			$("nav").addClass("gnb-fixed-top");
		 			$("#progressbar").css("visibility", "visible");
		 			$("#progressbar").width(parseInt(scPer, 10) + "%");
		 		}
		 		else
		 		{
		 			$("nav").removeClass("gnb-fixed-top");
		 			$("#progressbar").css("visibility", "hidden");
		 		}
			 });
}); 