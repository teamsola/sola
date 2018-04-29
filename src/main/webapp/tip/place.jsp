<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset=UTF-8">
	<title>SOLA > 혼밥&혼술</title>
	<style type="text/css">
		#place_main_left img, #place_main_right img{
			margin:37px 20px 0 20px;
			max-width: 400px;
		}
		.place_main{
			margin:10px;
			background-color: #6a6763;
			float: left;
			width: 45%;
			position:relative;
			height: 400px;
			text-align: center;
		}
		.place_main .intro_title_left, .place_main .intro_title_right{
			display:inline-block;
			margin: 0 auto;
			width:80%;
			border-bottom: 1px solid #ff8400;
			font-weight: bold;
		}
		.place_main .intro_title_left{text-align: left;}
		.place_main .intro_title_right{text-align: right;}
		.place_main .intro_detail_left, .place_main .intro_detail_right{
			text-align:left;
			display:inline-block;
			margin: 0 auto;
			width:80%;
			font-size:12px;
			border-bottom: 1px solid #ff8400;
		}
		.place_main .intro_detail_left{text-align: left;}
		.place_main .intro_detail_right{text-align: right;}
		.place_main a{
			width:100%;
			height:100%;
			display:block;
			text-decoration: none;
			font-family:"NanumGothic";
			src:url('../font/NanumGothic.eot?#iefix') format('embedded-opentype');
			font-size: 20px;
			color: white;
		}
		.place_main a:hover, .place_main a:active{
			background-color: #ff8400;
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
	<!-- <div style="font-size:30px;font-weight: bold;">혼밥 & 혼술</div> -->
	<c:set var="cmd" value="${ cmd }"/>
	
	<c:if test="${ cmd == null}">
	<div id="place_main_left" class="place_main">
		<a href="/sola/tip/place_add.do" class="link001">
		<img src="../img/place_main001.jpg" alt="장소 등록하기"/>
		<span class="intro_title_left">장소 등록하기</span>
		<span class="intro_detail_left">본인이 자주 가는 혼술집이 있나요? 아니면 혼밥집은요?<br>혹은 혼자 차를 마시기 좋은 분위기 좋은 카페는요?<br>혼자 먹기 좋은 술집 또는 맛집을 지금 SOLA 회원들과 공유해보세요.</span>
		</a>
	</div>
	
	<div id="place_main_right" class="place_main">
		<a href="/sola/tip/place_view.do" class="link002">
		<img src="../img/place_main002.jpg" alt="추천장소 보기"/>
		<span class="intro_title_right">추천장소 보기</span>
		<span class="intro_detail_right">오늘은 혼자 술을 마시고 싶은데<br>어디가 좋을지 모르겠다고요?<br>여기, SOLA 회원들이 추천한 혼술&혼밥&혼커 장소를 확인하세요.</span>
		</a>
	</div>
	</c:if>
	
	<c:if test="${ cmd eq '001'}">
	<jsp:include page="place_add.jsp"></jsp:include>
	</c:if>

	<c:if test="${ cmd eq '002'}">
	<jsp:include page="place_view.jsp"></jsp:include>
	</c:if>

	</body>
</html>