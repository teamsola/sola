
var load = true;

$(document).ready(function(){
	$(".wait").css("display", "none").removeClass("wait");
	
	$("#before").click(function()
			{
	 			if(load === false) return;
				var pre =  $('.banner.current').prev('.banner').length ? $('.banner.current').prev('.banner') : $('#banners .banner:last');
				$(".current").fadeOut(0).removeClass("current");
				// $(pre).show();
				$(pre).css("display", "block");
				$(pre).addClass("current");
				var pre_link = $(".active").prev("li").length ? $('.active').prev('li') : $('#controls li:last');
				$(".active").removeClass("active");
				$(pre_link).addClass('active'); 
			});

	$("#post").click(function()
			{
				banner_switch();
			});
	
	$("#banners div a").mouseover(function(){ load = false });
	$("#banners div a").mouseout(function(){ load = true });
	$("#controls li ").mouseover(function()
			{
				load = false;
				var rel = $(this).attr("rel");
				if ( $("#" + rel).hasClass("current") )
				{    
					return false;
				}   
		$("#" + rel).stop(true,true).css("display", "block");
		$(".current").fadeOut(0).removeClass("current");
		$("#" + rel).addClass("current");
		$(".active").removeClass("active");
		$(this).addClass("active");
		return false;
	});
	$("#controls li a").mouseout(function(){ load = true });

});


function banner_switch(){
	if(load === false) return;
	var next =  $('.banner.current').next('.banner').length ? $('.banner.current').next('.banner') : $('#banners .banner:first');
	$(".current").fadeOut(0).removeClass("current");
	//$(next).show();
	$(next).css("display", "block");
	$(next).addClass("current");
	var next_link = $(".active").next("li").length ? $('.active').next('li') : $('#controls li:first');
	$(".active").removeClass("active");
	$(next_link).addClass('active');
}

$(function() {
	slide = setInterval( "banner_switch()", 4000 );
});

function set_new_interval(interval){
	clearInterval(slide);
	slide = setInterval("banner_switch()", interval);
}
//]]>