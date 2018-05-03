<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/sola/js/memberScript.js"></script>
<script type="text/javascript">
	alert("아이디 또는 비밀번호가 잘못되었습니다.");
</script>
<style type="text/css">
body{
	/* background: url("img/index.jpg") no-repeat center top;
	-webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover; */
    background:#6a6763;
    text-align: center;
}
#id:focus, #pwd:focus{outline:none;border-bottom:2px solid #ff8400;font-size:16px;transition:.3s ease;}
#id, #pwd{width: 170px;font-size:18px;background:none;border-style:none;border-bottom:1px solid white; color:white;}
input[type=button]{border-style:none; border:1px solid #ff8400;outline:none;color:white; border-radius: 2px; width:70px;height:24px;background: orange;text-align: center;}
input[type=button]:hover{background: #ff8400;outline: none;}
</style>
</head>
<body>
	<form name="login" method="post" action="login.do">
	<div style="margin-top:250px;">
		<label style="font-size: 16px; color: #ff8400;font-family: NanumGothic;font-weight: bold;">아이디 또는 비밀번호가 잘못되었습니다.</label><br>
		<br>
		<input type="text" name="id" id="id" size="25" placeholder="ID"><br><br>
		<input type="password" name="pwd" id="pwd" size="25" placeholder="PW" onkeypress="if(event.keyCode==13) {javascript:checkLogin(); return false;}"><br><br>
		<input type="button" value="로그인" onclick="javascript:checkLogin()"/>
		<input type="button" value="회원가입" onclick="javascript:location.href='joinForm.do'">
	</div>
</form>
</body>
</html>