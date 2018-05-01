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
		<input type="text" name="id" size="25" placeholder="ID">
		<input type="password" name="pwd" size="25" placeholder="PW">
		<input type="button" value="로그인" onclick="javascript:checkLogin()"/>
		<input type="button" value="회원가입" onclick="javascript:location.href='joinForm.do'">
	</div>
</form>
</body>
</html>