<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404ERROR</title>
<style type="text/css">
@font-face {
	font-family:"DX시인과나";
	src:url('/sola/font/DXPNM-KSCPC-EUC-H.TTF?#iefix') format('embedded-opentype');
}
body{font-family: 'DX시인과나' !important;}
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
	margin: 45px;
}
#span_content, a
{
	color: white;
	opacity: 70;
	font-size: medium;
}
h1
{
	color: white;
	opacity: 70;
	font-family: NanumGothic;
}
a:visiter
{
	color: white;
}
</style>
</head>
<body>
<img class="bg" src="/sola/img/error404.jpg" alt="" />
<div id="container">
<h1>404 ERROR<br></h1>
<span id="span_content">
<br>
그래요.<br>
혼자 산다는건 제법 어려운 일이에요.<br>
<br>
이정표 없는 길을 혼자 걷는 것과 같아서,<br>
가끔씩은 막다른 길에 다다를 때도 있고,<br>
길을 잃어 엉뚱한 곳으로 올 수도 있지요.<br>
<br>
잘못된 길에 다다르게 되었다면,<br>
잠시만 그 자리에 서서<br>
심호흡을 해보세요.<br>
<br>
그리고 뒤돌아서<br>
다시 당당하게 걸어나가세요.<br>
<br>
다른 길에는 훨씬 멋진 일들이 당신을 기다리고 있을거에요.<br>
.<br>.
</span>
<br>
<a href="javascript:history.go(-1)">뒤돌아가기...</a>
</div>
</body>
</html>