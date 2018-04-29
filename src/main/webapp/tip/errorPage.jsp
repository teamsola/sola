<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset=UTF-8">
	<title>ERROR</title>
	<script type="text/javascript">
			var msg = '${msg}';
			var returnUrl = '${url}';
			alert(msg);
			document.location.href= returnUrl;
	</script>
	</head>
	<body>
		
	</body>
</html>