<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>글보기</title>
<style>

table{
	padding-top: 70px;
	margin:auto;
	width: 700px;
}

#line{
    border: 0.5px solid #EAEAEA;
}

#dtocon{
	margin-left:32%;
	margin-right:32%;
}

#cont{
	border: 1px solid gray;
	border-radius: 10px;
	padding: 10px;
	margin:left;
	min-height:300px;
}

#btnset{
	text-align:center;
	float:left;
	width:100%;
}

#btn{
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

#btn2{
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

#btn:hover{
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

#btn2:hover{
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

<script>
function del(){

	if (confirm("정말 삭제하시겠습니까?") == true){ 
		location.href="mallBoardDelete.do?board_seq=${board_seq}";
	}else{
		return false;
	}
}
</script>
</head>
<body>

	<table>
		<tr>
			<td colspan="3" style="font-size:20px;"><span style="font-size:17px; color:white;font-weight:bold;border-radius:5px;background: #ff8400;float:left;text-align:center;width:100px;">${boardDTO.category }</span>&nbsp;&nbsp;&nbsp;${boardDTO.subject }
		</tr>
		
		<tr>
			<td colspan="3"><hr id="line">
		</tr>
		
		<tr>
			<td width="250" style="color:#8C8C8C;"><img src="/sola/img/write_icon.png" width="17px" height="17px">${boardDTO.nickname }
			<td width="350" style="color:#8C8C8C;"><img src="/sola/img/timer.png" width="17px" height="17px">${boardDTO.logtime }
			<td width="100" style="color:#8C8C8C;"><img src="/sola/img/hit.png" width="17px" height="17px">&nbsp;${boardDTO.hit }
		</tr>
		
		<tr>
			<td colspan="3"><hr id="line">
		</tr>
		
		<tr>
			<td id="dtocon" colspan="3" style="width: 600px; height: 400px;"> <div id="cont">${boardDTO.content } </div>
		</tr>
	</table>
	
	
	<div id="btnset">
		<c:if test="${memId.equals(boardDTO.id) && fn:length(memId)>6 }">
		<input type=button id="btn" value=수정 onclick="location.href='mallBoardModifyForm.do?board_seq=${board_seq}&pg=${pg }&'">
		<input type=button id="btn" value=삭제 onclick="del()">
		</c:if>
		
		<c:if test="${fn:length(memId) < 6 }">
		<input type=button id="btn" value=삭제 onclick="del()">
		</c:if>
		
		<input type=button id="btn2" value=목록 onclick="location.href='mallBoardList.do?pg=${pg}'">
	</div>
	
	
</body>
</html>