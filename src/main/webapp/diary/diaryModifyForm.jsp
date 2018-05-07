<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:scriptlet>
    pageContext.setAttribute("cr", "\r");
    pageContext.setAttribute("lf", "\n");
    pageContext.setAttribute("crlf", "\r\n");
</jsp:scriptlet>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function modify(){
		
		var content=document.getElementById("diary_content").value.replace(/(?:\r\n|\r|\n)/g, '<br/>');
		
		if(!content){
			alert("내용을 입력하세요");
			return false;
		}else{
		
		var date=document.getElementById("date");
		var date2=date.innerHTML;
		var diary_seq2=${diary_seq };
		
		location.href="diaryModify.do?diary_date="+date2+"&diary_content="+content+"&diary_seq="+diary_seq2;		
		}
	}
	

</script>

<style>
#wr{
	margin-top: 70px;
    margin-left: 350px;
    margin-right: 350px
}

#diary_content{
	outline:1px solid #ff8400;
	resize: none;
}
		
#hr-sect {
	padding-left:100px;
	padding-right:100px;
	display: flex;
	flex-basis: 100%;
	align-items: center;
	color: rgba(0, 0, 0, 0.35);
	font-size: 16px;
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

#content2{
	text-align:center;
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

</style>

</head>
<body>


	<div id="wr">
		<div id="hr-sect">
			<div id="date">${diaryDTO.diary_date}</div>
		</div>
	</div>
	
	
	
	
	<form>
		<div id="content2">
			<textarea rows="30" cols="90" name="diary_content" id="diary_content">${fn:replace(diaryDTO.diary_content,"<br/>",crlf) }</textarea>
		</div>
		
		
		<br>
		<div id="btnset">
			<input type="button" id="btn" value="수정하기" onclick="javascript:modify()">
			<input type="button" value="메인으로" id="btn" onclick="location.href='diaryIndex.do'">
		</div>
	</form>

</body>

</html>


