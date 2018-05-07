<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/sola/proinfocss/proinfoMain.css" />
<script type="text/javascript">
	/* Demo purposes only */
	$(".hover").mouseleave(function() {
		$(this).removeClass("hover");
	});
</script>
<style type="text/css">

select { 
	background: url(이미지 경로) no-repeat 95% 50%; /* 화살표 모양의 이미지 */ 
	width: 100px; /* 원하는 너비설정 */ 
	padding: .4em .9em; /* 여백으로 높이 설정 */ 
	font-family: inherit; /* 폰트 상속 */ 
	background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
	border: 1px solid #999; 
	border-radius: 0px; /* iOS 둥근모서리 제거 */ 
	-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
	-moz-appearance: none; 
	appearance: none;
	
} /* IE 10, 11의 네이티브 화살표 숨기기 */ 

select::-ms-expand { 
	display: none; 
}

#search{
	float:left;
}

figure.snip1200 {
	font-family: 'Raleway', Arial, sans-serif;
	position: relative;
	float: left;
	overflow: hidden;
	height: 550px;
	width: 300px;
	background: #000000;
	color: #ffffff;
	text-align: center;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.15);
	font-size: 16px;
	margin: 0;
}

figure.snip1200 * {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-transition: all 0.45s ease-in-out;
	transition: all 0.45s ease-in-out;
}

figure.snip1200 img {
	max-width: 100%;
	height: 550px; position : relative;
	opacity: 0.9;
	position: relative;
}

figure.snip1200 figcaption {
	position: absolute;
	top: 45%;
	left: 7%;
	right: 7%;
	bottom: 45%;
	border: 1px solid white;
	border-width: 1px 1px 0;
}

figure.snip1200 .heading {
	overflow: hidden;
	-webkit-transform: translateY(50%);
	transform: translateY(50%);
	position: absolute;
	bottom: 0;
	width: 100%;
}

figure.snip1200 h2 {
	display: table;
	margin: 0 auto;
	padding: 0 10px;
	position: relative;
	text-align: center;
	width: auto;
	text-transform: uppercase;
	font-weight: 400;
}

figure.snip1200 h2 span {
	font-weight: 800;
}

figure.snip1200 h2:before, figure.snip1200 h2:after {
	position: absolute;
	display: block;
	width: 1000%;
	height: 1px;
	content: '';
	background: white;
	top: 50%;
}

figure.snip1200 h2:before {
	left: -1000%;
}

figure.snip1200 h2:after {
	right: -1000%;
}

figure.snip1200 p {
	top: 50%;
	-webkit-transform: translateY(-50%);
	transform: translateY(-50%);
	position: absolute;
	width: 100%;
	padding: 0 20px;
	margin: 0;
	opacity: 0;
	line-height: 1.6em;
	font-size: 0.9em;
}

figure.snip1200 a {
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	position: absolute;
	z-index: 1;
}

figure.snip1200:hover img, figure.snip1200.hover img {
	opacity: 0.25;
	-webkit-transform: scale(1.1);
	transform: scale(1.1);
}

figure.snip1200:hover figcaption, figure.snip1200.hover figcaption {
	top: 7%;
	bottom: 7%;
}

figure.snip1200:hover p, figure.snip1200.hover p {
	opacity: 1;
	-webkit-transition-delay: 0.35s;
	transition-delay: 0.35s;
}

#atag{
	color:black;
}

	.proinfo_top{
<<<<<<< HEAD
		width: 1530px;
=======
		width: 1800px;
>>>>>>> 4cfa75cfeccc77f13fa6e85ef5da493e820d8ffa
		height: 200px;
		background-image: url(/sola/img/proinfo_m3.PNG);
		background-size: 1530px auto;
		text-align:left;
		vertical-align:middle; 
		display:table-cell;
	}
	.top_title{
		width: 270px;
		height: 35px;
		font-size:25px;
		padding:10px 13px 10px 3px;
		background: rgba(255,255,255, 0.7);
		
	}
	.top_in{
		margin-left: 20px;
		display:inline-block;
	}
</style>
</head>
<body>
	<form name="proinfoMain" method="post" action="search.do?pg=1">
		<input type="hidden" name="list_t" value="${list_t }" />
		<div class="container">
		<div class="proinfo_top">
		<div class="top_in">
			<span class="top_title">전문지식</span>
		</div>
		</div>
			<!-- 메인 div -->
			<div class="inner">
				
				<!-- 검색 오른쪽 상단 -->
				<div class="proinfo_s">
					<div id="search">
						<select name="searchOp" id="searchOp">
							<option value="subject"
								<c:out value="${searchOp == 'subject'?'selected':''}"/>>제목</option>
							<option value="contents"
								<c:out value="${searchOp == 'contents'?'selected':''}"/>>내용</option>
						</select>
					</div>
					
					 <input type="hidden" name="keyword_c" value="${keyword_c }" /> 
					 <input type="hidden" name="list_n" value="${list_n }" />
					
					
					<c:set var="text" value="${keyword }" />
					<c:set var="len" value="${fn:length(text) }" />
					
					<input name="keyword" class="keyword" type="text"
						value="${fn:substring(text,1,len-1)}" />
					
					
					<button class="searchbt" type="submit">
						<img class="btn_image" src="/sola/img/searchBtn.png" width="34px" height="32px">
					</button>
			
				<c:set var="id_len" value="${fn:length(memId) }" />
				<c:if test="${id_len < 6 }">
				<input type="button" class="insert_btn" value="등록"
					onclick="location.href='proinfoInsertForm.do'" />
				</c:if>
				
			
				</div>

				
				
				
				
				
				<!-- 전, 중, 후 -->
				<figure class="snip1200">
					<img src="/sola/img/proinfo_live.jpg" alt="" />
					<figcaption>
						<p>자취방 구하기<br>.<br>.<br>.</p>
						<div class="heading">
							<h2>
								<span>입주 전</span>
							</h2>
						</div>
					</figcaption>
					<a href="search_c.do?keyword_c=live&list_n=0" id="atag"></a>
				</figure>
				
				<figure class="snip1200">
					<img src="/sola/img/proinfo_living_2.jpg" alt="" />
					<figcaption>
						<p>이사할때 주의할 점<br>.<br>.<br>.</p>
						<div class="heading">
							<h2>
								<span>입주 중</span>
							</h2>
						</div>
					</figcaption>
					<a href="search_c.do?keyword_c=living&list_n=0" id="atag"></a>
				</figure>
				
				<figure class="snip1200">
					<img src="/sola/img/proinfo_lived.jpg" alt="" />
					<figcaption>
						<p>전입신고<br>.<br>.<br>.</p>
						<div class="heading">
							<h2>
								<span>입주 후</span>
							</h2>
						</div>
					</figcaption>
					<a href="search_c.do?keyword_c=lived&list_n=0" id="atag"></a>
				</figure>
				
				
			</div>
		</div>
	</form>
</body>
</html>