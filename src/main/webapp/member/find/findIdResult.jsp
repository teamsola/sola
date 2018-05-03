<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style type="text/css">
#wrap
{
	margin: 20px 0px 0px 80px;
}
#box
{
	border: 1px #ff8400 solid;
	width: 80%;
	min-height: 170px;
	position: relative;
}
#spans
{
	position: absolute;
    width: 100%;
    left: 50%;
    top: 50%;
    transform: translateX(-50%) translateY(-50%);
    text-align: center;
}
input[type=button] 
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
a
{
	color: #ff8400;
	font-size: 12px;
	text-decoration: none;
}
a:visited
{
	color: #ff8400;
}
</style>
</head>
<body>
	<div id="wrap">
		<div id="box">
			<div id="spans">
				<c:forEach var="id" items="${ids }">
					<span>아이디는 [<b>${id }</b>] 입니다.<br></span>
				</c:forEach>
			</div>
		</div>
		<a href="findAccount.do?cmd=pw">비밀번호도 찾으시겠어요?</a><br>
		<input type="button" value="닫기" onclick="window.close()" />
	</div>
</body>
</html>