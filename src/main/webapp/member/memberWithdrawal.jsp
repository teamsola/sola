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
}

.inner {
	margin-top: 2px;
	padding: 5%;
}

.container {
	width: 818px;
	height: 800px;
	margin: auto;
	padding: 5px;
	text-align: center;
}

table {
	border-collapse: collapse;
	width: 800px;
	margin: auto;
}

th, td {
	border: 1px solid black;
}

table th {
	border-left: none;
	background-color: #e3e7ed;
	font-size: 14px;
	width: 200px;
}

table td {
	border-right: none;
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

label {
	color: #6a6763;
}
</style>
</head>
<body>
<form name="memberWithdrawalForm" method="post" enctype="multipart/form-data"  action="memberWithdrawal.do">
	<input type="hidden" name="id" value="${id }"/>
	<div class="container">
		<div class="denouement">
			<h2 align="left">회원탈퇴</h2>
		</div>
		<div class="inner">
			<h3 align="left">본인확인</h3>
			<table>
				<tr>
					<th width="100"><label>아이디</label></th>
					<td>
						<div class="idlabel" align="left">
							<label>${id }</label>
						</div>
					</td>
				</tr>
				<tr>
					<th><label>비밀번호</label></th>
					<td>
						<div align="left">
							<input type="password" name="pwd"/>
						</div>
					</td>
				</tr>
			</table>
			<br>
		</div>
		<div class="btnc">
			<input class="btn" type="button" value="탈퇴하기" onclick="javascript:checkWd()"/> <input class="btn"
				type="button" value="취소" onclick="location.href='member.do'" />
		</div>
	</div>
</form>
</body>
</html>