<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="js/nav.js"></script>
<script>
	var loginCheck = function()
	{
		<c:if test="${memId == null}">
		alert("로그인을 먼저 해주세요.")
		location.href = 'index.do';
		</c:if>
	}
</script>
</head>
<body>
	<div id="wrapper" class="frame">
		<nav role="gnb">
			<jsp:include page="/common/nav.jsp" />
	</nav>
		<div id="body" class="frame">
			<section id="content">
				<c:if test="${content != null}">
					<jsp:include page="${content}" />
				</c:if>
			</section>
		</div>
		<footer><jsp:include page="/common/footer.jsp" /></footer>
	</div>
</body>
</html>