<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/sola/js/memberScript.js"></script>
</head>
<body>
	<form name="login" method="post" action="login.do">
	<div>
		<label>아이디 또는 비밀번호가 잘못되었습니다.</label><br>
	
		<input type="text" name="id" size="25" placeholder="ID"><br>
		<input type="password" name="pwd" size="25" placeholder="PW"><br><br>
		<input type="button" value="로그인" onclick="javascript:checkLogin()"/>
		<input type="button" value="회원가입" onclick="javascript:location.href='joinForm.do'">
	</div>
</form>
</body>
</html>