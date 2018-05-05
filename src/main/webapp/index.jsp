<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SOLA</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/sola/js/memberScript.js"></script>
<script type="text/javascript">
var findAccount = function(){open("member/find/findAccount.jsp", "아이디/비밀번호 찾기", "width=500, height=450, location=no, resizable=no")};
</script>
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

@font-face {
	font-family:"NanumGothic";
	src:url('../font/NanumGothic.eot?#iefix') format('embedded-opentype');
}

body{font-family: 'NanumGothic' !important;}
html, body{width:100%;margin:0;padding:0;display: block;overflow: hidden;font-family: NanumGothic;}
#joinLink:link, #joinLink:visited{font-size:12px; color:white;text-decoration: none;}
#joinLink:hover, #joinLink:active{color:#ff8400;}
#id:focus, #pwd:focus{outline:none;border-bottom:1px solid #ff8400;transition:.3s ease;}
#id, #pwd{width: 170px;height:17px;padding:3px 0;background:none;border-style:none;color:white;border-bottom:1px solid white;}
#loginBtn{border-style:none; border:1px solid #ff8400;outline:none;color:white; border-radius: 2px; width:55px;height:24px;background: orange;text-align: center;}
#loginBtn:hover{background: #ff8400;outline: none;}
#login {
	border: 0px;
	float:left;
}

#up 
{	
	padding:5px;
	width: 100%;
	height:70px;
	background-color: #6a6763;
}
#down
{
	width: 100%;
}
#loginForm{border-spacing: 15px 0;position: absolute;top:5px;left:65%;}
#wrapper
{
	margin: 0;
	padding:0;
	width: 100%;
	position: relative;
}
</style>
</head>
<body>
	<img class="bg" src="img/index.jpg" alt="" />
	<div id="wrapper">
		<div id="up" class="frame">
			<img src="img/logo(org).png" width="auto" height="55px" style="margin: 10px 0 0 30px;">
			<div id="login" class="frame">
				<form name="login" action="login.do" method="post">
					<table id="loginForm">
						<tr>
							<td style="font-size: 12px;color: white;font-weight: bold;">아이디</td>
							<td style="font-size: 12px;color: white;font-weight: bold;">비밀번호</td>
						</tr>
						<tr>
							<td><input type="text" id="id" name="id" tabindex="1"/></td>
							<td><input type="password" id="pwd" name="pwd" tabindex="2" onkeypress="if(event.keyCode==13) {javascript:checkLogin(); return false;}"/></td>
							<td><input type="button" id="loginBtn" value="로그인" tabindex="3" onclick="javascript:checkLogin()"/></td>
						</tr>
						<tr>
							<td><a id="joinLink" href="joinForm.do">쏠라는 처음이신가요?</a></td>
							<td><a id="joinLink" href="javascript:findAccount()">아이디/비밀번호 찾기</a></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>