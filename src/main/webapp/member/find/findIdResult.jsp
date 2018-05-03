<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<c:forEach var="id" items="${ids }">
	아이디는 [<b>${id }</b>] 입니다.<br>
</c:forEach>
<a href="findAccount.jsp">비밀번호 찾기</a><br>
<a href="javascript:close()">닫기</a>
</body>
</html>