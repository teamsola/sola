<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>SOLA > 혼밥&혼술</title>
	<link rel="stylesheet" type="text/css" href="/sola/css/tip.css">
	<script type="text/javascript" src="/sola/js/jquery-3.3.1.min.js"></script>
	<style type="text/css">
	body{overflow-x: hidden;}
		#r_add_subtitle{float:left;margin:30px 5%;width: 90%;}
		#r_add_subtitle .subtitle_detail{border:1px solid #DCDCDC; padding: 20px; font-size:17px; line-height: 26px;}
		
		#place_title{padding:20px;line-height:150px;float:left; width:100%;height:150px; background-image: url('/sola/img/qa.jpg'); background-size:cover; background-position:center; background-repeat: no-repeat;}
		#place_main_left img, #place_main_right img{
			margin:37px 20px 0 20px;
			max-width: 400px;
		}
		.place_main{
			background-color: #6a6763;
			width: 50%;
			position:relative;
			height: 500px;
			text-align: center;
		}
		#place_main_left{float: left; background-image: url("/sola/img/place_main1.jpg");background-size: cover;background-position-x: -100px;}
		#place_main_right{float: right; background-image: url("/sola/img/place_main2.png");background-size: cover;}
		.place_main .intro_title_left, .place_main .intro_title_right{
			display:inline-block;
			margin: 0 auto;
			width:100%;
			padding:20px 0;
			 margin-top:200px;
			font-weight: bold;
			text-align: center;
		}
		.place_main .intro_detail_left, .place_main .intro_detail_right{
			text-align:left;
			display:inline-block;
			margin: 0 auto;
			padding: 10px 0;
			width:auto;
			font-size:14px;
			line-height:30px;
			border-top: 1px solid #ff8400;
			border-bottom: 1px solid #ff8400;
			text-align: center;
		}
		.place_main a{
			width:100%;
			height:100%;
			display:block;
			text-decoration: none;
			font-family:"NanumGothic";
			src:url('../font/NanumGothic.eot?#iefix') format('embedded-opentype');
			font-size: 36px;
			color: white;
		}
		.place_main a:hover, .place_main a:active{
			background-color: rgba(0,0,0,0.8);
			transition:.5s ease;
		}
	</style>
	<script type="text/javascript">
	var msg = '${result}';
	if(msg == "success"){
		alert("성공적으로 등록했습니다.");
	}
	$(function(){
		var content_l = '<span class="intro_title_left">장소 등록하기</span>' +
			'<span class="intro_detail_left">본인이 자주 가는 혼술집이 있나요? 아니면 혼밥집은요?<br>혹은 혼자 차를 마시기 좋은 분위기 좋은 카페는요?<br>혼자 먹기 좋은 술집 또는 맛집을 지금 SOLA 회원들과 공유해보세요.</span>';
		var content_r = '<span class="intro_title_right">추천장소 보기</span>'+
			'<span class="intro_detail_right">오늘은 혼자 술을 마시고 싶은데<br>어디가 좋을지 모르겠다고요?<br>여기, SOLA 회원들이 추천한 혼술&혼밥&혼커 장소를 확인하세요.</span>';
			$('#place_main_left a').hover(function(){
				$(this).append($(content_l).hide().fadeIn(300));
			}, function(){
				$(this).children().remove();
			});
			$('#place_main_right a').hover(function(){
				$(this).append($(content_r).hide().fadeIn(300));
			}, function(){
				$(this).children().remove();
			});
	});
	</script>
	</head>
	<body>
	<div id="place_title">
				<span style="font-size:25px;padding:10px 13px 10px 3px;margin:7px;background: rgba(255,255,255, 0.7);">TIP > 혼밥혼술 </span>
			</div>
			
	<div id="r_add_subtitle">
		<h2>더 이상 혼자 밥 먹지 마세요</h2>
		<div class="subtitle_detail">
			혼자 밥먹기 좋은 맛집이 궁금한가요?<br>오늘은 왠지 혼자 술을 마시고 싶으신가요?
					<br>SOLA는 미식가인 혼자족들을 위해 혼밥과 혼술하기 좋은 최상의 공간을 공유합니다.
		</div>
	</div>
	
	<div style="width:100%;float:left;text-align: center;">
	<div style="width:100%;display: inline-block;">
		<div id="place_main_left" class="place_main">
		<a href="place_add.do" class="link001">
		
		
		</a>
	</div>
	
	<div id="place_main_right" class="place_main">
		<a href="place_view.do" class="link002">
		
		
		</a>
	</div>
	</div>
	
	</div>
	
	</body>
</html>