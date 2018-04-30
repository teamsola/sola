<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index화면</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
/* if("${lgout}" == 1)
{
	history.pushState(null, document.title, location.href);  // push 
	window.addEventListener('popstate', function(event) {    //  뒤로가기 이벤트 등록
    	// 특정 페이지로 가고싶다면 location.href = '';
   	history.pushState(null, document.title, location.href);  // 다시 push함으로 뒤로가기 Block
});
} */
</script>
<link rel="stylesheet" type="text/css" href="css/main.css" />
<style type="text/css">
#login {
	border: 0px;
	width: 100%;
	height: 25%;
	background-color: #ff8400;
}

#loginForm {
	margin: auto; 
	border: #6a6763 solid 1px;
	border-collapse: collapse;
}ㅂ
</style>
</head>
<body>
	<div id="wrapper" class="frame">
		<div id="left" class="frame">
			<img src="img/sola.jpg" width="20%">
		</div>
		<div id="right" class="frame">
			<div id="login" class="frame">
				<form action="login.do" method="post">
					<br>
					<table id=loginForm>
						<tr>
							<th>아이디</th>
							<td><input type="text" name="id" style="width: 100px" tabindex="1"/></td>
							<td rowspan="2"><input type="submit" value="로그인" tabindex="3"/></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="pwd" style="width: 100px" tabindex="2" /></td>
						</tr>
						<tr>
							<td colspan="3" align="right"><a href="joinForm.do">회원가입</a></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>