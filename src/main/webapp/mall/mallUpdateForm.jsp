<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=“UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script>
	function modify(){
	
		if($('#subject').val()==''){
			alert("제목을 입력하세요");
			$('#subject').focus();
			return false;
			
		}if($('#img').val()==''){
			alert("사진을 첨부해주세요");
			$('#img').focus();
			return false;
			
		}if($('#mallurl').val()==''){
			alert("링크를 추가해주세요");
			$('#mallurl').focus();
			return false;
		}
			$('#modifyform').submit(); 
	};
</script>

<style>

body{
	padding-top:100px;
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
	margin:auto;
	border:7px solid #EAEAEA;
	border-radius: 60px;
	}
	
	tr{
		width:100%;
		height:100px;
		}
	td{
		padding-left:40px;
		}
		
		
#cat{
	text-decoration:bold;
}

#btnset{
	text-align:center;
	float:left;
	width:100%;
}

#btn{
	margin-top:100px;
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

<div id="aa">쇼핑몰 정보 수정</div>
	<hr id="line1">

<form name="modifyform" id="modifyform" method="post" enctype="multipart/form-data" action="mallUpdate.do?mall_seq=${mall_seq }"> 

<table>
 
	<tr>
		<td width="150px" id="cat">제목
		<td width="100px"><input type="text" id="subject" name="subject" value="${mallDTO.subject }">
	</tr>
	
	<tr>
		<td width="150px" id="cat">사진첨부
		<td width="100px"><input type="file" id="img" name="img" size="45">
	</tr>
	
	<tr>
		<td width="150px" id="cat">링크
		<td width="100px"><input type="text" id="mallurl" name="mallurl" value="${mallDTO.mallurl }">
	</tr>
	
 </table> 
 
 	<div id="btnset">
 		<input type="button" id="btn" value="수정" onclick="javascript:modify()">
		<input type="reset" id="btn" value="이전" onclick="location.href='mallUpdateBefore.do'">
 	</div>
</form>

</body>
</html>


