<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkWd(){
		var a = confirm("정말 탈퇴하시겠습니까?");
		if(a == true){
			document.memberWithdrawalForm.submit();
		}else{
			
		}
	}
</script>
<style type="text/css">
h2, h3 {
	color: #6a6763;
}

.denouement {
	margin: 0;
	padding: 10px;
	border-bottom: 1px double gray;
}

.inner {
	margin-top: 2px;
	padding: 5%;
	border-top: 1px double gray;
}

.container {
	width: 818px;
	height: 800px;
	margin: auto;
	padding: 5px;
	text-align: center;
}

.content{
	width: 800px;
	height: 200px;
	border: 2px solid #e3e4e5;
	margin: auto;
	padding: 15px;
}

input,.idlabel {
	margin: 15px;
	padding: 3px;
}
.btn {
	width: 100px;
	height: 35px;
	background-color: #eff1f2;
	color: #6a6763;
	border: 2px solid #e3e4e5;
}

.comp {
	color: #6a6763;
	font-size: 28px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="denouement">
			<h2 align="left">회원탈퇴</h2>
		</div>
		<div class="inner">
			<div class="content">
				<label class="comp">회원탈퇴가 완료되었습니다.</label>
			</div>
		</div>
			
		<div class="btnc">
			<input class="btn" type="button" value="메인화면" onclick="location.href='index.do'"/>
		</div>
	</div>
</body>
</html>