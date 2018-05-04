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
</style>
</head>
<body>
	<form name="proinfoMain" method="post" action="search.do?pg=1">
		<input type="hidden" name="list_t" value="${list_t }" />
		<div class="container">
			<!-- 메인 div -->
			<div class="inner">
				<!-- 검색 오른쪽 상단 -->
				<div class="proinfo_s">
					<select name="searchOp" id="searchOp">
						<option value="subject"
							<c:out value="${searchOp == 'subject'?'selected':''}"/>>제목</option>
						<option value="contents"
							<c:out value="${searchOp == 'contents'?'selected':''}"/>>내용</option>
					</select> <input type="hidden" name="keyword_c" value="${keyword_c }" /> <input
						type="hidden" name="list_n" value="${list_n }" />
					<c:set var="text" value="${keyword }" />
					<c:set var="len" value="${fn:length(text) }" />
					<input name="keyword" class="keyword" type="text"
						value="${fn:substring(text,1,len-1)}" />
					<button class="searchbt" type="submit">
						<img class="btn_image" src="/sola/img/searchBtn.png">
					</button>
				</div>

				<!-- 전, 중, 후 -->
				<figure class="snip1200">
					<img src="/sola/img/proinfo_live.png" alt="" />
					<figcaption>
						<p>정말</p>
						<div class="heading">
							<h2>
								<span>입주 전</span>
							</h2>
						</div>
					</figcaption>
					<a href="search_c.do?keyword_c=live&list_n=0"></a>
				</figure>
				
				<figure class="snip1200">
					<img src="/sola/img/proinfo_living.png" alt="" />
					<figcaption>
						<p>너무</p>
						<div class="heading">
							<h2>
								<span>입주 중</span>
							</h2>
						</div>
					</figcaption>
					<a href="search_c.do?keyword_c=living&list_n=0"></a>
				</figure>
				
				<figure class="snip1200">
					<img src="/sola/img/proinfo_lived.png" alt="" />
					<figcaption>
						<p>어렵다</p>
						<div class="heading">
							<h2>
								<span>입주 후</span>
							</h2>
						</div>
					</figcaption>
					<a href="search_c.do?keyword_c=lived&list_n=0"></a>
				</figure>
				
				<c:set var="id_len" value="${fn:length(memId) }" />
				<c:if test="${id_len < 6 }">
				<input type="button" class="insert_btn" value="전문 지식 입력"
					onclick="location.href='proinfoInsertForm.do'" />
				</c:if>
			</div>
		</div>
	</form>
</body>
</html>