<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script type="text/javascript">
			function checkIdClose(){
				$("#id", opener.document).val("${id}");
				$("#idAuth", opener.document).val("ok");
				$("#id", opener.document).attr("readonly", "readonly");
//				opener.joinForm.id.value = '${id }';
//				opener.joinForm.idAuth.value = "ok";
				window.close();
				opener.joinForm.pwd.focus();
			}
		</script>
</head>
<body>
	<form name="" method="post" action="checkId.do">
	<c:if test="${exist }">
		${id } 는 사용중 입니다.<br><br>
		아이디 <input type="text" name="id">
			<input type="submit" value="중복 체크">
	</c:if>
	<c:if test="${!exist }">
		${id }는 사용가능합니다.<br><br>
		<input type="button" value="사용" onclick="checkIdClose()">
	</c:if>
	</form>
</body>
</html>