<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	window.onload=function(){
		<c:if test="${su>0}">
		alert("수정되었습니다");
		location.href="mall/mallBoardList.do?pg=1";
		</c:if>
		<c:if test="${su<=0}">
		alert("등록실패");
		</c:if>
	}
</script>
</head>
<body>

</body>
</html>