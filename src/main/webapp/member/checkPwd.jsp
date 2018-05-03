<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.container{
		text-align: center;
		width: 818px;
		margin: auto;
	}
	label{
		display: inline-block;
		font-weight: bold;
		width: 100px;
		padding: 3px;
		font-size: 14px;
	}
	.pwd{
		width: 200px;
		height: 20px;
		padding: 3px;
		margin: 5px;
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
	.denouement{
		margin: 0;
		padding: 10px;
	}
	.inner{
		margin-top: 2px;
		padding: 5%;
	}
	h2, h3{color: #6a6763;}
	
</style>
</head>
<body>
<form name="" method="post" action="memberUpdateForm.do">
<div class="container">
<div class="denouement">
<h2 align="left">개인정보 수정</h2>
</div>
	<div class="inner">
		<h3>비밀번호 확인</h3><br>
		<label>비밀번호</label><input class="pwd" name="pwd" type="password"/><input type="submit" class="btn" value="확인"/>
	</div>
</div>
</form>
</body>
</html>