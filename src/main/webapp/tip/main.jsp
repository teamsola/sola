<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset=UTF-8">
	<title>Insert_title_here</title>
	<script type="text/javascript">
		$(function(){
			$(".cont_left").hide();
			$(".cont_right").hide();
			
			$('.tip_main_menu1').hover(function(){
				$(this).children().fadeIn();
				$(this).animate({height : '+=50px'}, 200);
				$('.tip_main_menu2').animate({height : '-=50px'}, 200);
			}, function(){
				$(this).animate({height : '-=50px'}, 200);
				$('.tip_main_menu2').animate({height : '+=50px'}, 200);
				$(this).children().fadeOut();
			});
			
			$('.tip_main_menu2').hover(function(){
				$(this).children().fadeIn();
				$('.tip_main_menu1').animate({height : '-=25px'}, 200);
				$(this).animate({height : '+=50px'}, 200);
				$('.tip_main_menu3').animate({height : '-=25px'}, 200);
			}, function(){
				$('.tip_main_menu1').animate({height : '+=25px'}, 200);
				$(this).animate({height : '-=50px'}, 200);
				$('.tip_main_menu3').animate({height : '+=25px'}, 200);
				$(this).children().fadeOut();
			});
			
			$('.tip_main_menu3').hover(function(){
				$(this).children().fadeIn();
				$('.tip_main_menu2').animate({height : '-=25px'}, 200);
				$(this).animate({height : '+=50px'}, 200);
				$('.tip_main_menu4').animate({height : '-=25px'}, 200);
			}, function(){
				$('.tip_main_menu2').animate({height : '+=25px'}, 200);
				$(this).animate({height : '-=50px'}, 200);
				$('.tip_main_menu4').animate({height : '+=25px'}, 200);
				$(this).children().fadeOut();
			});
			
			$('.tip_main_menu4').hover(function(){
				$(this).children().fadeIn();
				$(this).animate({height : '+=50px'}, 200);
				$('.tip_main_menu3').animate({height : '-=50px'}, 200);
			}, function(){
				$(this).animate({height : '-=50px'}, 200);
				$('.tip_main_menu3').animate({height : '+=50px'}, 200);
				$(this).children().fadeOut();
			});
			
		});
	</script>
	<style type="text/css">
	.tip_main_menu {
		width: 100%;
	}
		.tip_main_menu *{
			float: left;
			width:100%;
			height:400px;
		}
		.tip_main_menu1{ background:url("img/place.jpg") center; background-size: 100%; cursor: pointer; }
		.tip_main_menu2{  background:url("img/express.jpg") center; background-size: 100%; cursor: pointer; }
		.tip_main_menu3{  background:url("img/interior.jpg") center; background-size: 100%; cursor: pointer; }
		.tip_main_menu4{  background:url("img/recipe.jpg") center; background-size: 100%; cursor: pointer; }
		.cont_left{
			float: left;
			width:500px;
			height: 400px;
			border: 0;
			background-color: transparent;
		}
		.cont_right{
			float: right;
			width:500px;
			height: 400px;
			border: 0;
			background-color: transparent;
		}
		.title_left{
			margin-top: 80px;
			margin-left: 30px;
			border-bottom: 2px solid #ff8400;
			float: left;
			width: 430px;
			height: 80px;
			font-size: 38px;
			color: white;
			line-height: 35px;
			text-shadow: 1px gray;
			background-color: transparent;
		}
		.detail_left{
			margin-left: 30px;
			margin-top: 20px;
			float: left;
			width: 430px;
			height: 150px;
			font-size: 14px;
			color: white;
			line-height: 20px;
			background-color: transparent;
		}
		
		.title_right{
			margin-top: 80px;
			margin-right: 30px;
			border-bottom: 2px solid #ff8400;
			float: right;
			width: 430px;
			height: 80px;
			font-size: 38px;
			text-align:right;
			line-height: 35px;
			background-color: transparent;
		}
		.detail_right{
			margin-right: 30px;
			margin-top: 20px;
			float: right;
			width: 430px;
			height: 150px;
			font-size: 14px;
			text-align:right;
			line-height: 20px;
			font-weight: bold;
			background-color: transparent;
		}
	</style>
	</head>
	<body>
		<div class="tip_main_menu">
			
			<!-- 첫번째 메뉴 -->
			<div class="tip_main_menu1" onclick="location.href='/sola/tip/tip_index.do?cmd=place'">
				<div class="cont_left">
					<div class="title_left">오늘<br>혼술하고 싶으세요?</div>
					<div class="detail_left">혼자 밥먹기 좋은 맛집이 궁금한가요?<br>오늘은 왠지 혼자 술을 마시고 싶으신가요?
					<br><br>SOLA는 분위기 있는 혼자족들을 위해<br>혼밥과 혼술하기 좋은 최상의 공간을 공유합니다.
					</div>
				</div>
			</div>
			
			<!-- 두번째 메뉴 -->
			<div class="tip_main_menu2" onclick="location.href='/sola/tip/tip_index.do?cmd=express'">
				<div class="cont_right">
					<div class="title_right">택배기사님!<br>여기로 갖다놔주세요!</div>
					<div class="detail_right">혼자 사는 분들, 택배 받기가 어지간히 난처한 게 아닙니다.<br>편하게 택배를 받을 수 있는 방법은 없을까요?
					<br><br>SOLA는 택배를 안전하게 받고 싶은 혼자족들을 위해<br>무인택배 핫스팟을 공유합니다.
					</div>
				</div>
			</div>
			
			<!-- 세번째 메뉴 -->
			<div class="tip_main_menu3">
			
			</div>
			
			<!-- 네번째 메뉴 -->
			<div class="tip_main_menu4">
				<div class="cont_right">
					<div class="title_right">오늘<br>혼술하고 싶으세요?</div>
					<div class="detail_right">혼자 밥먹기 좋은 맛집이 궁금한가요?<br>오늘은 왠지 혼자 술을 마시고 싶으신가요?
					<br><br>SOLA는 분위기 있는 혼자족들을 위해<br>혼밥과 혼술하기 좋은 최상의 공간을 공유합니다.
					</div>
				</div>
			</div>
		</div>
	</body>
</html>