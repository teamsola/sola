<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script type="text/javascript" src="../js/memberScript.js?v=1"></script>
</head>
<body>
<form name="loginForm" method="post" action="login.do">
	<div>
		<input type="text" name="id" size="25" placeholder="ID">
		<input type="password" name="pwd" size="25" placeholder="PW">
		<input type="button" value="로그인" onclick="javascript:checkLogin()"/>
		<input type="button" value="회원가입" onclick="javascript:location.href='joinForm.do'">
	</div>
</form>
</body>
</html>