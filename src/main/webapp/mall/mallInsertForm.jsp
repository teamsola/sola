<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=“UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>

<script>
	function insert(){
	
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
			$('#mallinsert').submit(); 
	};
</script>

<style>

body{
	padding-top:100px;
}

#wrapper{
	width:100%;
	height:100%;
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
<div id="wrapper">

<div id="aa">쇼핑몰 정보등록</div>
	<hr id="line1">

<form name="mallinsert" id="mallinsert" method="post" enctype="multipart/form-data" action="mallInsert.do"> 

<table>
 
	<tr>
		<td width="150px" id="cat">제목
		<td width="100px"><input type="text" id="subject" name="subject">
	</tr>
	
	<tr>
		<td width="150px" id="cat">사진첨부
		<td width="100px"><input type="file" id="img" name="img" size="45">
	</tr>
	
	<tr>
		<td width="150px" id="cat">링크
		<td width="100px"><input type="text" id="mallurl" name="mallurl">
	</tr>
	
 </table> 
 
 	<div id="btnset">
 		<input type="button" id="btn" value="등록" onclick="javascript:insert()">
		<input type="reset" id="btn" value="메인" onclick="location.href='mallIndex.do'">
 	</div>
</form>

</div>

</body>
</html>