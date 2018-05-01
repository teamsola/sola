<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function checkWd(){
	var a = confirm("정말 강제탈퇴하시겠습니까?");
	if(a == true){
		document.memberWd.submit();
	}else{
		
	}
}
</script>
<style type="text/css">
	.container{
		width: 1000px;
		height: 800px;
		margin: auto;
		margin-top: 100px;
	}
	.detail{
		width: 800px;
		height: 400px;
		margin: auto;
	}
	.detail table{
		width: 600px;
		height: 350px;
		border-spacing: 0;
		margin: auto;
	}
	.detail th,.detail td{
		border: 1px solid gray;
		
	}
	.detail td{
		padding: 3px; 
		padding-left: 5px;
	}
	.op{
		margin-top: 20px;
		padding: 5px;
	}
</style>
</head>
<body>

<div class="container">
	<div class="detail">
		<table>
			<tr>
				<th>아이디</th>
				<td>${memberDTO.id }</td>
			</tr>
			<tr>
				<th>성명</th>
				<td>${memberDTO.name }</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>${memberDTO.gender }</td>
			</tr>
			<tr>
				<th>별명</th>
				<td>${memberDTO.nickname }</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${memberDTO.tel1 }-${memberDTO.tel2 }-${memberDTO.tel3 }</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${memberDTO.email1 }@${memberDTO.email2 }</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${memberDTO.post }<br>
				${memberDTO.addr1 }${memberDTO.addr2 }</td>
			</tr>
			<tr>
				<th>가입일자</th>
				<td>20${memberDTO.joinDate }</td>
			</tr>
			<tr>
				<th>등급</th>
				<td>${memberDTO.grade }</td>
			</tr>
			<tr>
				<th>스코어</th>
				<td>${memberDTO.score }</td>
			</tr>
		</table>
		<div class="op" align="center">
			<form name="memberWd" method="post" action="memberWd.do">
				<input type="hidden" name="id" value="${memberDTO.id }"/>
				<input type="button" value="강제탈퇴" onclick="javascript:checkWd()"/>
			</form>
		</div>
	</div>
</div>

</body>
</html>