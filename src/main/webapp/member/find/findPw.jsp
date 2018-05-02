<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://smtpjs.com/smtp.js"></script>
<script type="text/javascript">
var title = "";

var send = function(var email, var title, var content)
{
 	Email.send("sola.manage@gmail.com",//보내는 이메일 계정
				email,// 받는 이메일 계정
				title,
				content,
				"smtp.gmail.com",//구글 smtp사용
				"sola.manage@gmail.com",//구글이메일전체
				"solamanage");
 	alert(email + "로 이메일이 전송되었습니다.");
}
 	close();
</script>
</head>
<body>
</body>
</html>