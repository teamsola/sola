<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".fold").click(function(){
		if($(this).attr("rel") == "div_mail")
			{
				$("#div_mail").css("display", "block");
				$("#div_tel").css("display", "none");
				$(this).html("&nbsp;&nbsp;&nbsp;▼메일주소로 찾기");
				$("#span_tel").html("&nbsp;&nbsp;&nbsp;▶전화번호로 찾기")
				$("form").attr("action", "findIdByEmail.do");
			}
		else if($(this).attr("rel") == "findId")
			{
				$("#div_mail").css("display", "none");
				$("#div_tel").css("display", "none");
				$("#findId").css("display", "block");
				$("#findPw").css("display", "none");
				$(this).html("▼아이디 찾기");
				$("#span_tel").html("&nbsp;&nbsp;&nbsp;▶전화번호로 찾기")
				$("#span_mail").html("&nbsp;&nbsp;&nbsp;▶메일주소로 찾기")
				$("#span_pw").html("▶비밀번호 찾기")
				$("form").attr("action", "");
			}
		else if($(this).attr("rel") == "findPw")
		{
			$("#findPw").css("display", "block");
			$("#findId").css("display", "none");
			$("#span_id").html("▶아이디 찾기");
			$(this).html("▼비밀번호 찾기");
			$("form").attr("action", "findPw.do");
		}
		else
		{
			$("#div_tel").css("display", "block");
			$("#div_mail").css("display", "none");
			$(this).html("&nbsp;&nbsp;&nbsp;▼전화번호로 찾기");
			$("#span_mail").html("&nbsp;&nbsp;&nbsp;▶메일주소로 찾기")
			$("form").attr("action", "findIdByTel.do");
		}
	});
	
 	if("${cmd }" == "pw")
		{
			$("#findPw").css("display", "block");
			$("#findId").css("display", "none");
			$("#span_id").html("▶아이디 찾기");
			$(this).html("▼비밀번호 찾기");
			$("form").attr("action", "findPw.do");
			$("[name=id]").focus();
		};
		
		$(".email").focusout(function()
				{
					var email = $(".email").val();						
					var isEmail = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
				    var isHan = /[ㄱ-ㅎ가-힣]/g;
				    if (!isEmail.test(email) || isHan.test(email)) 
				    {
				    	var name = $(this).attr("name");
				    	$(this).css("border-bottom", "1px solid red");
				    	$("#" + name + "_check").html("<font color=red>이메일 형식이 올바르지 않습니다.</font>");
				    }
				    else
				    {
				    	var name = $(this).attr("name");
				    	$(this).css("border-bottom", "1px solid black");
				    	$("#" + name + "_check").html("<font color=blue>올바른 형식의 이메일 입니다.</font>");
				    }
				});
});
</script>
<style type="text/css">
form
{
	margin: 20px 0px 0px 80px;
}
.box
{
	border: 1px #ff8400 solid;
	width: 80%;
	height: 170px;
}
#box_pw
{
	margin-top: 30px;
}
span.upper{color: #ff8400;font-weight: bold;font-size: 16px;}
span.lower{font-size:12px; color:#6a6763;}
span.span_check{font-size:8px; margin-left: 30px;}
input[type=text], select
{
	border-style: none;
	border-bottom:1px solid black;
	height:30px;
	font-size: 16px;
	padding-left:5px;
	outline:none;
	display: block;
	margin-left: 30px;
	width: 75%;
}
input[type=text]:focus
{
	transition:.5s ease; 
	border-bottom:2px solid #ff8400;
	outline:none;
	box-sizing: content-box;
	font-size: 14px;
}
#findPw
{
	margin-top: 23px;
}
.fold
{
	cursor: pointer;
}
#div_mail, #div_tel, #findId, #findPw
{
	display: none;
}
input[type=submit] 
{
	outline:none;
	background:#ff8400;
	border-style: none;
	text-align: center;
	width:25%;
	height:33px;
	font-size: 15px;
	color:white;
	border-radius: 4px;
	cursor: pointer;
	margin: auto;
	position: absolute;
	left:50%;
	transform: translateX(-50%);
	margin-top: 10px;
}
</style>
</head>
<body>
	<form action="#" name="findForm" method="post">
		<div class="box" id="box_id">
			<span class="fold upper" rel="findId" id="span_id">▶아이디 찾기</span><br>
			<div id="findId">
				<div>
					<span class="fold lower" rel="div_mail" id="span_mail">&nbsp;&nbsp;&nbsp;▶메일주소로 찾기</span>
					<div id="div_mail">
						<input type="text" name="email_id" class="email" placeholder="email 전체 입력">
						<span id="email_id_check" class="span_check"></span>
					</div>
				</div>
				<div>
					<span class="fold lower" rel="div_tel" id="span_tel">&nbsp;&nbsp;&nbsp;▶전화번호로 찾기</span>
					<div id="div_tel">
						<select name="tel1" class="inp_text">
							<option selected="selected">010
							<option>011
							<option>017
							<option>019
							<option>02
							<option>031
							<option>032
							<option>033
							<option>041
							<option>042
							<option>043
							<option>044
							<option>051
							<option>052
							<option>053
							<option>054
							<option>055
							<option>061
							<option>062
							<option>063
							<option>064
						</select> 
						<input type="text" name="tel2" class="inp_text" placeholder="전화번호 입력(가운데 3~4자리)" />
						<input type="text" name="tel3" class="inp_text" placeholder="전화번호 입력(뒷 4자리)">
					</div>
				</div>
			</div>
		</div>
			<div class="box" id="box_pw">
			<span class="fold upper" rel="findPw" id="span_pw">▶비밀번호 찾기</span><br>
			<div id="findPw">
		 		<input type="text" name="id" placeholder="ID 입력"><br>
		 		<input type="text" name="email_pwd" class="email" placeholder="email 전체 입력"><br>
				<span id="email_pwd_check" class="span_check"></span>
			</div>
		</div>
		<input type="submit" value="제출">
	</form>
</body>
</html>