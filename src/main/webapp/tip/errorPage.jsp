<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<script type="text/javascript" src="../script/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
			$(function(){
				var msg = '${msg}';
				$('#errorAfterForm').attr("action", "/mainFrame.jsp");
				$('#t_content').val('${content}');
				alert(msg);
				$('#errorAfterForm').submit();
			});
	</script>
	</head>
	<body>
		<form action="#" method="post" id="errorAfterForm" name="errorAfterForm">
			<input type="hidden" value="" id="t_content" name="t_content">
		</form>
	</body>
</html>