<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>글보기</title>
<style>
body{
	margin-top:150px;
}

table{
	margin:auto;
	width: 700px;
}

#line{
    border: 0.5px solid #EAEAEA;
}

#btnset{
	text-align:center;
	float:left;
	width:100%;
}

#btn{
	margin-top:50px;
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

#btn2{
	margin-top:50px;
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

	<table>
		<tr>
			<td colspan="3" style="font-size:20px;">${boardDTO.subject }
		</tr>
		
		<tr>
			<td colspan="3"><hr id="line">
		</tr>
		
		<tr>
			<td width="250" style="color:#8C8C8C;">${boardDTO.nickname }
			<td width="350" style="color:#8C8C8C;">작성일시:${boardDTO.logtime }
			<td width="100" style="color:#8C8C8C;">조회수:${boardDTO.hit }
		</tr>
		
		<tr>
			<td colspan="3"><hr id="line">
		</tr>
		
		<tr>
			<td colspan="3" style="width: 600px; height: 400px;"> ${boardDTO.content }
		</tr>
	</table>
	
	
	<div id="btnset">
		<c:if test="${memId.equals(boardDTO.id) }">
		<input type=button id="btn" value=수정 onclick="location.href='mallBoardModifyForm.do?board_seq=${board_seq}&pg=${pg }&'">
		<input type=button id="btn" value=삭제 onclick="location.href='mallBoardDelete.do?board_seq=${board_seq}'">
		</c:if>
		
		<c:if test="${memId.equals('admin') }">
		<input type=button id="btn" value=삭제 onclick="location.href='mallBoardDelete.do?board_seq=${board_seq}'">
		</c:if>
		
		<input type=button id="btn2" value=목록 onclick="location.href='mallBoardList.do?pg=${pg}'">
	</div>
	
	
</body>
</html>