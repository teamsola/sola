<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>500ERROR</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
var baseball = function(){
	var ans = "SOLA";
	var count = 0;
	
	$("#check").click(function(){
		var input = $("#input").val().toUpperCase();
		if(input.length != 4)
			{
				alert("4글자만 입력해주세요.");
				return false;
			}
		else if(/[^a-zA-Z]/.test(input))
			{
				alert("영문만 입력 가능합니다.");
				return false;
			}
		
		var dupl = 0;
		for(var x=0; x<input.length; x++)
			{
				for(var z=0; z<input.length; z++)
				{
					if(input[x] == input[z]) { dupl++; }
					if(dupl > 5)
						{
							alert("문자 중복은 허용되지 않습니다.");
							return false;
						}
				}
			}
		
		count++;
		var ball = 0;
		var strike = 0;
		
		for(var x=0; x<input.length; x++)
			{
				for(var y=0; y<ans.length; y++)
					{
						if(input[x] == ans[y])
							{
								if(x==y){ strike++; }
								else { ball++; }
							}
					}
			}
		$(".current").removeClass("current").addClass("ex");
		if(strike == 4)
			{
				$("#print").append("<span class='homerun'>홈런!! 축하합니다! 정답은 [<font color='#ff8400'>" + ans + "</font>]입니다.</span><br><br>");
				$("#print").append("<span class='homerun'>정답과 함께 오류 발생사항을 sola.manage@gmail.com으로 보내주시면 소정의 상품을 지급해드립니다.</span><br>");
				$("#print").append("<span class='homerun'>불편을 끼쳐드려 죄송합니다.</span><br>");
				$("#print").append("<br><a href='javascript:history.go(-1)'>뒤돌아가기...</a>");
				$("input[type=text]").attr("readonly","readonly");
				$("input[type=button]").hide();
				return true;
			}
		$("#print").append("<span class='current'>"+ input + " / " + count + "번 째 시도 : 볼 : " + ball + ", 스트라이크 : " + strike + "</span><br>");
	});
};

$(document).ready(function()
		{
			baseball();
		});
var openRight = function()
{
	$("#right").slideToggle();
}
</script>
<style type="text/css">
body {
	background-color: #6a6763;
	width: 100%;
	height: 100%;
}
div#container {
	/* relative가 필수, 안하면 화면이 커지지 않는다. */
	position: relative;
	z-index: 5;
	width: 100%;
	height: 100%;
}

span {
	color: white;
	margin: 10px;
}
span.ex {
	color: black;
}

div#left, div#right 
{
	float: left;

	height: 100%;
	overflow: hidden;
	word-wrap: break-word;
}
div#left
{
	background-color: #ff8400;
	width: 30%;
}
div#right
{
	display: none;
	margin-left: 20px;
	width: 50%;
}
input[type=text]
{
	border-style: none;
	border-bottom:1px solid black;
	height:30px;
	font-size: 16px;
	padding-left:5px;
	outline:none;
	display: inline-block;
	width: 400px;
	background-color: #6a6763;
	color: white;
}
input[type=text]:focus
{
	transition:.5s ease; 
	border-bottom:2px solid #ff8400;
	outline:none;
	box-sizing: content-box;
	font-size: 14px;
}
a
{
	color: black;
}
a:visiter
{
	color: black;
}
</style>
</head>
<body>
	<div id="container">
		<div id="left">
			<span style="font-size:40px;"><b>500 ERROR<br></b></span>
			<span>예기치 못한 문제가 발생하였습니다.<br></span>
			<span><br></span>
			<span><a href="javascript:openRight()">문제 풀러 가기</a><br></span>
		</div>
		<div id="right">
			<span>추억의 야구게임 - 4글자의 알파벳으로 이루어진 글자를 찾아보세요.<br></span>
			<span>&nbsp;&nbsp;&nbsp;*중복 문자는 없습니다.<br><br></span>
			<input type="text" id="input" /> 
			<input type="button" value="확인" id="check" /><br> 
			
			<div id="print"></div>
		</div>
	</div>
</body>
</html>