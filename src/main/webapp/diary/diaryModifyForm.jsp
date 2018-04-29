<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function modify(){
		
		var content=document.getElementById("diary_content").value;
		
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

body{
	padding-top:80px;
}

#wr{
	margin-left:150px;
	margin-right:150px;
}

#diary_content{
	outline:1px solid #ff8400;
	margin-top:50px;
	resize: none;
}
		
#hr-sect {
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
	margin: 0px 16px;
}

#content{
	text-align:center;
}

#btnset{
	padding-top:30px;
	text-align:center;
	float:left;
	width:100%;
}

#button{
	padding-top:10px;
}
	
#btn{
	text-decoration:none;
	text-indent:0px;
	line-height:16px;
	-moz-border-radius:100px;
	-webkit-border-radius:100px;
	border-radius:100px;
	text-align:center;
	vertical-align:middle;
	display:inline-block;
	font-size:14px;
	background-color:#ffffff;
	color:#5D5D5D;
	width:150px;
	height:30px;
	border-color:#4a4949;
	border-width:2px;
	border-style:solid;
	outline:none;
	margin-bottom:20px;
	margin-left:20px;
	margin-right:20px;
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
		<div id="content">
			<textarea rows="30" cols="55" name="diary_content" id="diary_content">${diaryDTO.diary_content}</textarea>
		</div>
		
		
		<br>
		<div id="btnset">
			<input type="button" id="btn" value="수정하기" onclick="javascript:modify()">
			<input type="reset" id="btn" value="다시작성">
			<div id="button"><input type="button" value="메인으로" id="btn" onclick="location.href='diaryIndex.do'"></div>
		</div>
	</form>



</body>
</html>


