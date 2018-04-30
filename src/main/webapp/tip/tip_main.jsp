<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert_title_here</title>
	<link rel="stylesheet" type="text/css" href="../css/tip.css">
	<script type="text/javascript" src="../script/jquery-3.3.1.min.js"></script>
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
		.tip_main_menu1{ background:url("../img/place.jpg") center; background-size: 100%; cursor: pointer; }
		.tip_main_menu2{  background:url("../img/express.jpg") center; background-size: 100%; cursor: pointer; }
		.tip_main_menu3{  background:url("../img/interior.jpg") center; background-size: 100%; cursor: pointer; }
		.tip_main_menu4{  background:url("../img/recipe.jpg") center; background-size: 100%; cursor: pointer; }
		.cont_left{
			float: left;
			width:500px;
			height: 400px;
			border: 0;
		}
		.cont_right{
			float: right;
			width:500px;
			height: 400px;
			border: 0;
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
		}
		.title_left_menu3 {
			margin-top: 80px;
			margin-left: 30px;
			border-bottom: 2px solid #ff8400;
			float: left;
			width: 430px;
			height: 80px;
			font-size: 38px;
			line-height: 35px;
			text-shadow: 1px gray;
			color:black;
		}
		.detail_left_menu3{
			margin-left: 30px;
			margin-top: 20px;
			float: left;
			width: 430px;
			height: 150px;
			font-size: 14px;
			color: black;
			line-height: 20px;
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
		}
	</style>
	</head>
	<body>
		<div class="tip_main_menu">
			
			<!-- 첫번째 메뉴 -->
			<div class="tip_main_menu1" onclick="location.href='place.do'">
				<div class="cont_left">
					<div class="title_left">오늘<br>혼술하고 싶으세요?</div>
					<div class="detail_left">혼자 밥먹기 좋은 맛집이 궁금한가요?<br>오늘은 왠지 혼자 술을 마시고 싶으신가요?
					<br><br>SOLA는 미식가인 혼자족들을 위해<br>혼밥과 혼술하기 좋은 최상의 공간을 공유합니다.
					</div>
				</div>
			</div>
			
			<!-- 두번째 메뉴 -->
			<div class="tip_main_menu2" onclick="location.href='express.do'">
				<div class="cont_right">
					<div class="title_right">택배기사님!<br>여기로 갖다놔주세요!</div>
					<div class="detail_right">혼자 사는 분들, 택배 받기가 어지간히 난처한 게 아닙니다.<br>편하게 택배를 받을 수 있는 방법은 없을까요?
					<br><br>SOLA는 택배를 안전하게 받고 싶은 혼자족들을 위해<br>무인택배 핫스팟을 공유합니다.
					</div>
				</div>
			</div>
			
			<!-- 세번째 메뉴 -->
			<div class="tip_main_menu3" onclick="location.href='interior.do'">
				<div class="cont_left">
					<div class="title_left_menu3">더 이상<br>시공업체는 필요없어요</div>
					<div class="detail_left_menu3">인스타그램에 가끔 올라오는 자취방 꾸미기,<br>나도 그것처럼 나만의 감성공간을 만들고 싶은데<br>방법을 전혀 모르시겠다고요?
					<br><br>SOLA는 분위기 있는 혼자족들을 위해<br>DIY 셀프 인테리어를 공유합니다.
					</div>
				</div>
			</div>
			
			<!-- 네번째 메뉴 -->
			<div class="tip_main_menu4" onclick="location.href='recipe.do'">
				<div class="cont_right">
					<div class="title_right">오늘은 내가<br>SOLA 요리사</div>
					<div class="detail_right">혼자 산다고 언제까지<br>배달음식만 드실 순 없는 노릇이에요.
					<br><br>SOLA는 건강을 생각하는 혼자족들을 위해<br>자취 요리 레시피를 공유합니다.
					</div>
				</div>
			</div>
		</div>
	</body>
</html>