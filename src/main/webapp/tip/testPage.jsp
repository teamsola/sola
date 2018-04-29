<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert_title_here</title>
	<script type="text/javascript" src="../script/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$('#test').html('${content}');
		});
	</script>
	</head>
	<body>
		<div id="test">
		
		</div>
	</body>
</html>