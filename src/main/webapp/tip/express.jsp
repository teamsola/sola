<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>SOLA > 무인택배</title>
	<link rel="stylesheet" type="text/css" href="/sola/css/tip.css">
	<script type="text/javascript" src="/sola/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$('.link001').hide();
			$('.link002').hide();
			$('#express_main_up').hover(function(){
				$(this).children().fadeIn();
				$(this).animate({
					height : '+=50px'
				}, 300);
				$('#express_main_down').animate({
					height : '-=50px'
				}, 300);
			}, function(){
				$(this).animate({
				height : '-=50px'
			}, 300);
				$('#express_main_down').animate({
					height : '+=50px'
				}, 300);
				$(this).children().fadeOut();
			});
			$('#express_main_down').hover(function(){
				$(this).children().fadeIn();
				$('#express_main_up').animate({
					height : '-=50px'
				}, 300);
				$(this).animate({
					height : '+=50px'
				}, 300);
			}, function(){
				$(this).animate({
				height : '-=50px'
			}, 300);
				$('#express_main_up').animate({
				height : '+=50px'
			}, 300);
				$(this).children().fadeOut();
			});
		});
	</script>
	<style type="text/css">
		#express_main_up{
			background: black url("/sola/img/express_up.jpg") no-repeat center -300px;
			background-size: cover;
		}
		#express_main_down{
			background: black url("/sola/img/express_down.jpg") no-repeat center -300px;
			background-size: cover;
		}
		.express_main{
			margin:10px;
			background-color: #6a6763;
			width: 1100px;
			height: 250px;
		}
		.express_main .intro_title_up{
			text-align:right;
			float:right;
			width:300px;
			font-size:35px;
			margin:30px 30px 30px 10px;
			border-bottom: 1px solid #ff8400;
			font-weight: bold;
		}
		.express_main .intro_title_down{
			text-align:left;
			float:left;
			width:300px;
			font-size:35px;
			margin:30px 10px 30px 30px;
			border-bottom: 1px solid #ff8400;
			font-weight: bold;
		}
		
		.express_main .intro_detail_up{
			width:1000px;
			margin:0 30px 30px 10px;
			float:right;
			text-align: right;
			font-size: 15px;
		}
		.express_main .intro_detail_down{
			width:1000px;
			margin:0 10px 30px 30px;
			float:left;
			text-align: left;
			font-size: 15px;
		}
		.express_main a{
			width:100%;
			height:100%;
			display:block;
			text-decoration: none;
			font-family:"NanumGothic";
			src:url('../font/NanumGothic.eot?#iefix') format('embedded-opentype');
			font-size: 20px;
			color: white;
		}
		.link001:hover, .link001:active{
			background: black url("/sola/img/express_up_hover.jpg") no-repeat center -300px;
			background-size: cover;
		}
		.link002:hover, .link002:active{
			background: black url("/sola/img/express_down_hover.jpg") no-repeat center -300px;
			background-size: cover;
		}
	</style>
	<script type="text/javascript">
	var msg = '${result}';
	if(msg == "success"){
		alert("성공적으로 등록했습니다.");
	}
	</script>
	</head>
	<body>
<!-- 	<div style="font-size:30px;font-weight: bold;">무인택배</div> -->
	<c:set var="cmd" value="${ cmd }"/>
	
	<c:if test="${ cmd == null}">
	<div id="express_main_up" class="express_main">
		<a href="/sola/tip/express_add.do" class="link001">
			<span class="intro_title_up">장소 등록하기</span>
			<span class="intro_detail_up">'기사님! 택배 OO에 놔주세요!'<br>얼마 전 무인택배를 이용한 경험이 있으신가요?<br>그렇다면 혼자 사는 분들을 위해 알려주시죠!</span>

		</a>
	</div>
	
	<div id="express_main_down" class="express_main">
		<a href="/sola/tip/express_view.do" class="link002">
			<span class="intro_title_down">추천장소 보기</span>
			<span class="intro_detail_down">택배를 집까지 가져다놓는 게 부담스러우신가요?<br>혼자 살면 충분히 그럴 수 있어요. 이해합니다.<br>SOLA는 그런 분들을 위해 무인택배 HOT SPOT 을 공유합니다.</span>
		</a>
	</div>
	</c:if>
	
	<c:if test="${ cmd eq '001'}">
	<jsp:include page="express_add.jsp"></jsp:include>
	</c:if>

	<c:if test="${ cmd eq '002'}">
	<jsp:include page="express_view.jsp"></jsp:include>
	</c:if>

	</body>
</html>