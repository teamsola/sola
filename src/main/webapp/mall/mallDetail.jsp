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

#aa{
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
	margin-top:50px;
	margin-bottom:50px;
	
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
	font-size:17px;
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

	<div id="aa">목록더보기</div>
	<hr id="line1">

<div id="wrapper">
	<table>
		<tr>
			<c:forEach var="mallDTO" items="${list2 }" begin="0" end="4" step="1">
					<td>
					<div id="one">
					<div id="picture">
						<img src="../storage/${mallDTO.img }" width="100" height="120">
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
						<img src="../storage/${mallDTO.img }" width="100" height="120">
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
						<img src="../storage/${mallDTO.img }" width="100" height="120">
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