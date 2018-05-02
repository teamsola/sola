<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css"/> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style type="text/css">
</style>
</head>
<body>
<div id="wrapper" class="frame">
	<div id="left" class="frame">
		<c:if test="${left != null}">
			<jsp:include page="${left}" />
		</c:if>
	</div>
</div>
</body>
</html>