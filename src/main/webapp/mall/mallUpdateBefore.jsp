<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function del(){
		
		<c:forEach var="mallDTO" items="${list2 }">
		var mall_seq="${mallDTO.mall_seq}";
		
		</c:forEach>
		
		if (confirm("정말 삭제하시겠습니까?") == true){ 
			location.href="mallDelete.do?mall_seq="+mall_seq;
		}else{
			return false;
		}
	}
	
</script>

<style>
body{
	padding-top:100px;
}

#aa{
	margin-top:70px;
	font-weight: bold;
	text-align:center;
}

#line1{
	border-top: 1px solid #ff8400;
	width:200px;
}

#wrapper{
	width:100%;
	height:100%;
}

table{
margin:auto;
width:65%;
margin-top:5%;
text-align:center;
}

tr{
padding-top:30px;
}

#btn{
	text-align:center;
	float:left;
	width:100%;
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
	font-size:15px;
	background-color:#ffffff;
	color:#5D5D5D;
	width:150px;
	height:30px;
	border-color:#4a4949;
	border-width:2px;
	border-style:solid;
	
}

#modify{
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

#delete{
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
	border-color:#ff8400;
	border-width:2px;
	border-style:solid;
}

#line{
	color:#BDBDBD;
}


</style>
</head>
<body>

<div id="wrapper">
	
	<div id="aa">관리자모드-수정/삭제관리</div>
	<hr id="line1">
	
	<table>
	
	<c:forEach var="mallDTO" items="${list2 }">
		<tr>
			<td width="20%"><div id="first"><img src="storage/${mallDTO.img }" width="100" height="120"></div>
			<td width="40%"><div id="second">${mallDTO.subject }</div>
			<td width="20%"><div id="third"><input type="button" value="수정" id="modify" onclick="location.href='mallUpdateForm.do?mall_seq=${mallDTO.mall_seq}'"></div>
			<td width="20%"><div id="fourth"><input type="button" value="삭제" id="delete" onclick="javascript:del()"></div>
		</tr>
		
		<tr>
			<td colspan="4"><hr id="line">
		</tr>
	</c:forEach>

	</table>
	
	
	<div id="btn"><input type="button" id="goback" value="메인으로" onclick="location.href='mallIndex.do'"></div>
	
</div>
</body>
</html>