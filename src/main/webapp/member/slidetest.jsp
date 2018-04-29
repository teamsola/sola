<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* Banners */

.event_banner_margin
{
 padding-right:4px;
 _padding-right:1px;
}

*:first-child+html .event_banner_margin
{
 padding-right:2px;
}

.event_banner 
{
 float:left;
 _float:none;
 padding:0;
 position: relative;
 _position: absolute;
 width:1024px;
 _padding-left:0px;
}

#banners 
{
 height:200px;
 font-family: Arial, sans-serif;
}

#banners .banner
{
 text-align:center;
 position: absolute;
 display:none;
}

/*.banner.current{z-index: 2;}*/
.banner.current{display:block;}

#controls
{
 position:absolute;
 _position:absolute;
 right:3px;
 _right:20px;
 bottom:5px;
 z-index:10;
}

#controls li { list-style:none; display:inline;}

#controls li a
{
 filter:alpha(opacity=70);
 -ms-filter: "alpha(Opacity=70)";
 opacity:0.7;
 display:-moz-inline-box; /* <= FF2 hack */
 display:inline-block;
 margin-right:3px;
 font-size:11px;
 padding:3px 5px 1px 5px;
 text-decoration:none;
 color: #666;
 background:#fff; /* Specify a fall back color */
 background:rgba(204,204,204,.7);
 border:1px solid #CCC;
 outline:none;
}

#controls li.active a
{ 
 border-color:#FFF;
 color:#FFF;
 background-color:#333;
}

#controls li a:hover
{ 
 border-color:#FFF;
 color: #FFF;
 background-color:#333;
}


</style>
</head>
<body>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
 <div class="event_banner">  
  <div id="banners">
   <div class="banner current" style="display:block;" id="bn1"><a href="http://styledanawa.co.kr"><img src="../img/1.png" alt=""></a></div>
   <div class="banner" id="bn2"><a href="http://styledanawa.co.kr"><img src="../img/2.png" alt=""></a></div>
   <div class="banner" id="bn3"><a href="http://styledanawa.co.kr"><img src="../img/3.png" alt=""></a></div>
   <ul id="controls">
    <li class="active" rel="bn1"><a href="#"><b>1</b></a></li> 
    <li rel="bn2"><a href="#"><b>2</b></a></li> 
    <li rel="bn3"><a href="#"><b>3</b></a></li> 
   </ul>
  </div>
 </div>

<script type="text/javascript">  
//<![CDATA[
 var load = true;
 $(document).ready(function(){
  $("#banners div a").mouseover(function(){ load = false });
  $("#banners div a").mouseout(function(){ load = true });
  $("#controls li ").mouseover(function(){
   load = false;
   var rel = $(this).attr("rel");
   if ( $("#" + rel).hasClass("current") ){    
    return false;
   }   

   $("#" + rel).stop(true,true).show();  /* Bug Fix, thanks Dave -> added .stop(true,true) to stop any ongoing animation */
   $(".current").fadeOut(0).removeClass("current");
   $("#" + rel).addClass("current");
   $(".active").removeClass("active");
   $(this).parents("li").addClass("active");
   return false;
  });
  $("#controls li a").mouseout(function(){ load = true });
 });

 
 function banner_switch(){
  if(load === false) return;
  var next =  $('.banner.current').next('.banner').length ? $('.banner.current').next('.banner') : $('#banners .banner:first');
  $(".current").fadeOut(0).removeClass("current");
  $(next).show();
  $(next).addClass("current");
  var next_link = $(".active").next("li").length ? $('.active').next('li') : $('#controls li:first');
  $(".active").removeClass("active");
  $(next_link).addClass('active');
 }

 
 $(function() {
  slide = setInterval( "banner_switch()", 3000 );
 });

 function set_new_interval(interval){
  clearInterval(slide);
  slide = setInterval("banner_switch()", interval);
 }
//]]>

</script>

</body>
</html>