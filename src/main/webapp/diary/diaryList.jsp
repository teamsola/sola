<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

#aa{
	margin-top:70px;
	font-weight: bold;
	text-align:center;
}

#line1{
	border-top: 1px solid #ff8400;
	width:200px;
}

#contentwrapper{
	text-align:center;
	float:left;
	width:100%;
}

#content2{
	margin:auto;
}

#hr-sect {
	padding-left:500px;
	padding-right:500px;
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
	margin: 30px 40px;
}

#button{
	text-align:center;
	float:left;
	width:100%;
}

#btn{
	margin-top:80px;
	margin-bottom:30px;
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
	color:#ff8400;
	width:150px;
	height:30px;
	border-color:#ff8400;
	border-width:1px;
	border-style:solid;
}

</style>
</head>
<body>


	<div id="aa">모아보기</div>
	<hr id="line1">



	<div id="contentwrapper">
		<div id="content2">
			
			<c:forEach var="diaryDTO" items="${list }">
			
			<div id="hr-sect">${diaryDTO.diary_date }</div>
			
			${diaryDTO.diary_content }<br>
			</c:forEach>
			
		</div>	
	</div>



	<br>
	<div id="button"><input type="button" value="메인" id="btn" onclick="location.href='diaryIndex.do'"></div>



</body>
</html>