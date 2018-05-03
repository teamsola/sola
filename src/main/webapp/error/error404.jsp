<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
img.bg
{
	/* 브라우저의 크기에 맞게 전체 화면에 맞춘다. */
	min-height: 100%;
	min-width: 1024px;
	
	/* 크기를 화면전체로 지정해준다. */
	width: 100%;
	height: auto;
	
	/* 스크롤해도 배경이미지는 고정 */
	position: fixed;
	
	/* absolute로 하면 배경도 스크롤 되지만 부자연스러워 진다. */
	top: 0;
	left 0;
}

@media screen and (max-width: 1024px)
{
	/* 그림을 브라우저의 중앙에 맞춘다. -512는 1024의 반값으로 중앙정렬을 위한 것이다. */
	img.bg
	{
		left: 50%;
		margin-left: -512px;
	}
}

div#container
{
	/* relative가 필수, 안하면 화면이 커지지 않는다. */
	position: relative;
	z-index: 5;
	margin: 50px;
}
span
{
	color: white;
	font-size: xx-large;
	margin: 10px;
}
/* html, body{width:100%;margin:0;padding:0;display: block;overflow: hidden;}
#up
{
	padding: 5px;
    width: 100%;
    height: 70px;
    background-color: #6a6763;
}
#img
{
	background-image: url(../img/error404.jpg);
	background-size: width=100% height=100%;
}
img
{
	width: 100%;
	height: 100%;
} */
</style>
</head>
<body>
<img class="bg" src="../img/error404.jpg" alt="" />
<div id="container">
<span>404 ERROR<br></span>
<span>Oops.. So many sheep, here.<br></span>
<span>There is no way to go.<br></span>
<span>please, go back.</span>
</div>
</body>
</html>