<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://smtpjs.com/smtp.js"></script>
<script type="text/javascript">
 	Email.send("sola.manage@gmail.com",//보내는 이메일 계정
 				"${email}",// 받는 이메일 계정
				"솔라 임시 비밀번호 발급",
				"솔라 임시 비밀번호 : [${rand}]<br>로그인 후 비밀번호를 변경해주세요.",
				"smtp.gmail.com",//구글 smtp사용
				"sola.manage@gmail.com",//구글이메일전체
				"solamanage");
 	alert("${email}로 임시비밀번호가 전송되었습니다.");
 	close();
</script>
</head>
<body>

</body>
</html>