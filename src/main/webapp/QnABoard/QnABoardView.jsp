<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA</title>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
function modifyFunc(){
	 var result = confirm("게시글을 수정하시겠습니까?");
	 
	 if(result){	/* yes */
		 location.href='QnABoardModifyForm.do?seq=${boardDTO.seq }&&pg=${pg}';
	 }
} 

function deleteFunc(){
	 var result = confirm("정말로 삭제하시겠습니까?");
	 
	 if(result){	/* yes */
		 location.href='QnABoard/QnABoardDelete.do?seq=${boardDTO.seq }&&${pg}';
	 }
}
</script>
<style type="text/css">
table{
	padding-top: 70px;
	margin:auto;
	width: 700px;
}

#line{
    border: 0.5px solid #EAEAEA;
}
a{
	text-decoration:none;
}
#a:link{
	color:black;
}

#a:visited{
	color:orange;
}
#a:hover{
	color:red;
}

#body{	/* 전체 글+댓글 */
width:800px;
height:50%;
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
#qnacontent{
	vertical-align:baseline;
}
</style>
</head>
<body>
	
<div id="body">
	<table>
		<tr>
			<td colspan="3" style="font-size:20px;" id="subject">${boardDTO.subject }
		</tr>
		
		<tr>
			<td colspan="3"><hr id="line">
		</tr>
		
		<tr>
			<td width="250" style="color:#8C8C8C;">${boardDTO.nickname }
			<td width="350" style="color:#8C8C8C;">${boardDTO.logtime }
			<td width="100" style="color:#8C8C8C;">조회수&nbsp;${boardDTO.hit }
		</tr>
		
		<tr>
			<td colspan="3"><hr id="line">
		</tr>
		
		<tr>
			<td colspan="3" class="qnacontent" style="width: 600px; height: 400px;"> ${boardDTO.content }
		</tr>
	</table>

	<div id="btnset">
		<c:if test="${fn:length(memId) < 6 }">
		<input type=button id="btn" value=수정 onclick="javascript:modifyFunc();">
		<input type=button id="btn" value=삭제 onclick="javascript:deleteFunc();">
		</c:if>
		
		<input type="button" id="btn2" value=목록 onclick="location.href='QnABoardList.do'"/>
	</div>
</div>

</body>
</html>