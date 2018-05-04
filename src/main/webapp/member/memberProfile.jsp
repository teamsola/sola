<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style type="text/css">
	.container {
		width: 818px;
		height: 700px;
		margin:auto;
		padding: 5px;
		text-align: center;
	}
	.denouement{
		margin: 0;
		padding: 10px;
	}
	.inner{
		margin-top: 2px;
		padding: 5%;
	}
	.profileImg{
		margin: 10px;
	}
	table{
		border-collapse:collapse;
		width: 800px;
		margin: auto;
	}

	th,td { border:1px solid gray; }
	table th{
		border-left: none;
		background-color:  #ff8400;
		font-size: 14px;
	}
	table td{
		border-right: none;
		border-left: none;
	}
	h2{
		color: #6a6763;
	}
	input{
		margin: 15px;
		padding: 3px;
	}
	.btn{
		width: 100px;
		height: 35px;
		background-color: white;
		color: #6a6763;
		border: 2px solid #ff8400;
		border-radius: 20px;
		outline: none;
	}
	label {
		color: white;
	}
</style>
</head>
<body>
<form name="" method="post" enctype="multipart/form-data"  action="memberProfileUpdate.do">
<div class="container">
<div class="denouement">
	<h2 align="left">프로필 수정</h2>
</div>
<div class="inner">	
	<table>
		<tr>
			<th width="100" rowspan="2"><label>프로필 사진</label></th>
			<td class="profileImg" align="center" rowspan="2">
				<img alt="" src="storage/${memberDTO.profile }" width="100" height="100"/>
			</td>
			<td align="left" style="border-bottom: none;">
				<input type="file" name="img" size="45">
			</td>
		</tr>
		<tr>
			<td align="left" style="border-top: none;">
				<c:if test="${memberDTO.profile ne 'default_profile.jpg' }">
					<input type="button" value="삭제" class="btn" onclick="location.href='memberProfileDelete.do?nickname=${memberDTO.nickname }'"/>
				</c:if>
			</td>
		</tr>
		<tr>
			<th><label>별명</label></th>
			<td colspan="2" style="border-top: 1px solid gray;">
				<div align="left">
					<input type="text" name="nickname" value="${memberDTO.nickname }"/>
				</div>
			</td>
		</tr>
	</table><br>
</div>	
	<div class="btnc">
		<input class="btn" type="submit" value="적용"/>
		<input class="btn" type="button" value="취소" onclick="location.href='member.do'" />
	</div>
</div>
</form>
</body>
</html>