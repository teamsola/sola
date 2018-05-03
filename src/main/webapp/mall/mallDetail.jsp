<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
	padding-top:100px;
}

a{
	color:black;
	text-decoration:none;
}

#aa{
	margin-top: 70px;
	font-weight: bold;
	text-align:center;
}

#line1{
	border-top: 1px solid #ff8400;
	width:200px;
	
}

	table{
		padding-top:20px;
		text-align:center;
		margin:0 auto;
		}
	
	tr{
		width:100%;
		height:100%;
		}

	td{
		width:20%;
		height:100%;
		padding-bottom:10px;
		}
		
#btn{
	text-align:center;
	float:left;
	width:100%;
}

	#one{
		height:100%;
		}

	#picture{
		width:100%;
		height:70%;
	}
	
	#subject{
		margin:auto;
		width:50%;
		height:30%;
		font-size:14px;
	}

#goback{
	margin-top:40px;
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

#goback:hover{
	margin-top:40px;
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
	background-color:#ff8400;
	color:#ffffff;
	width:150px;
	height:30px;
	border-color:#ff8400;
	border-width:1px;
	border-style:solid;
}
	
</style>
</head>
<body>

	<div id="aa">목록더보기</div>
	<hr id="line1">

<div id="wrapper2">
	<table>
		<tr>
			<c:forEach var="mallDTO" items="${list2 }" begin="0" end="4" step="1">
					<td>
					<div id="one">
					<div id="picture">
						<img src="storage/${mallDTO.img }" width="100" height="120">
					</div>
					<div id="subject">
						<a href="${mallDTO.mallurl}">${mallDTO.subject }</a>
					</div>
					</div>
					</td>
			</c:forEach>
		</tr>
		
		<tr>
			<c:forEach var="mallDTO" items="${list2 }" begin="5" end="9" step="1">
					<td>
					<div id="one">
					<div id="picture">
						<img src="storage/${mallDTO.img }" width="100" height="120">
					</div>
					<div id="subject">
						<a href="${mallDTO.mallurl}">${mallDTO.subject }</a>
					</div>
					</div>
					</td>
			</c:forEach>
		</tr>
		
		<tr>
			<c:forEach var="mallDTO" items="${list2 }" begin="10" end="14" step="1">
					<td>
					<div id="one">
					<div id="picture">
						<img src="storage/${mallDTO.img }" width="100" height="120">
					</div>
					<div id="subject">
						<a href="${mallDTO.mallurl}">${mallDTO.subject }</a>
					</div>
					</div>
					</td>
			</c:forEach>
		</tr>
		
		
	</table>
	
</div>

	<div id="btn"><input type="button" id="goback" value="메인으로" onclick="location.href='mallIndex.do'"></div>
	
</body>
</html>