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
});
</script>
<style type="text/css">
.fold
{
	cursor: pointer;
}
#div_mail, #div_tel, #findId, #findPw
{
	display: none;
}
</style>
</head>
<body>
	<form action="#" name="findForm" method="post">
		<span class="fold" rel="findId" id="span_id">▶아이디 찾기</span><br>
		<div id="findId">
			<div>
				<span class="fold" rel="div_mail" id="span_mail">&nbsp;&nbsp;&nbsp;▶메일주소로 찾기</span>
				<div id="div_mail">
					<input type="text" name="email_id" id="email">
				</div>
			</div>
			<div>
				<span class="fold" rel="div_tel" id="span_tel">&nbsp;&nbsp;&nbsp;▶전화번호로 찾기</span>
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
		<span class="fold" rel="findPw" id="span_pw">▶비밀번호 찾기</span><br>
		<div id="findPw">
	 		<input type="text" name="id" placeholder="ID 입력"><br>
	 		<input type="text" name="email_pwd" placeholder="email 전체 입력"><br>
		</div>
		<input type="submit" value="제출">
	</form>
</body>
</html>