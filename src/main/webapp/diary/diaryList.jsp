<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

body{
	margin:0;
	padding-top:80px;
}

#aa{
	font-weight: bold;
	text-align:center;
}

#content{
	padding-top:60px;
}

#line1{
	border-top: 1px solid #ff8400;
	width:30%;
}

#content{
	width:70%;
	margin:0 auto;
}

#hr-sect {
	display: flex;
	flex-basis: 100%;
	align-items: center;
	color: rgba(0, 0, 0, 0.35);
	font-size: 15px;
	margin: 8px 0px;
}
#hr-sect::before,
#hr-sect::after {
	content: "";
	flex-grow: 1;
	background: rgba(0, 0, 0, 0.35);
	height: 1px;
	font-size: 0px;
	line-height: 0px;
	margin: 0px 16px;
}

#button{
	padding-top:70px;
	padding-bottom:100px;
	text-align:center;
	float:left;
	width:100%;
}

#btn{
	outline:none;
	text-decoration:none;
	text-indent:0px;
	line-height:16px;
	-moz-border-radius:100px;
	-webkit-border-radius:100px;
	border-radius:100px;
	text-align:center;
	vertical-align:middle;
	display:inline-block;
	font-size:15px;
	background-color:#ffffff;
	color:#5D5D5D;
	width:150px;
	height:30px;
	border-color:#4a4949;
	border-width:2px;
	border-style:solid;
}

</style>
</head>
<body>


	<div id="aa">모아보기</div>
	<hr id="line1">



	<div align="center" id="content">
		
		<c:forEach var="diaryDTO" items="${list }">
		
		<div id="hr-sect">${diaryDTO.diary_date }</div>
		
		${diaryDTO.diary_content }<br>
		</c:forEach>
		
	</div>	




	<br>
	<div id="button"><input type="button" value="메인" id="btn" onclick="location.href='diaryIndex.do'"></div>



</body>
</html>