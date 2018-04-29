<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 수정</title>
<style type="text/css">
h2, h3{color: #6a6763;}

.denouement{
	margin: 0;
	padding: 10px;
}
.inner{
	margin-top: 2px;
	padding: 5%;
}
.in, .addr{
	text-align: center;
	padding: 3px;
	margin: 5px;
}
.tel{
	padding: 3px;
	margin: 5px;
}

.addr{
	width: 400px;
}
.title{
	display: inline-block;
	width: 150px;
	margin: 20px;
	font-size: 14px;
	font-weight: bold;
	padding: 3px;
	color: #6a6763;
}

.btn{
		width: 100px;
		height: 35px;
		background-color: #eff1f2;
		color: #6a6763;
		border: 2px solid #e3e4e5;
	}
	
.container {
	width: 818px;
	height: 1200px;
	margin: auto;
	padding: 5px;
	text-align: center;
}

.pwfield, .memberinfofield {
	width: 800px;
	vertical-align: middle;
	margin-top: 20px;
	padding: 15px;
}

table{
		border-collapse:collapse;
		margin: auto;
	}
th,td { border:1px solid #6a6763; }
table td:first-child{border-left: none; background-color: #e3e7ed; width: 200px;}
table td:last-child{border-right: none; width: 650px;}

.pwfield.in, .memberinfofield.in{
	margin: 10;
	
}

#command{
	color: skyblue;
	width: 400px;
	border: none;
	font-size: 12px;
}
</style>
<script type="text/javascript">
	function checkPw() {
		if (document.memberPw.expwd.value == "") {
			alert("기존 비밀번호를 입력하세요");
		} else if (document.memberPw.pwd.value == "") {
			alert("새 비밀번호를 입력하세요");
		} else if (document.memberPw.pwd.value != document.memberPw.repwd.value) {
			alert("비밀번호가 맞지 않습니다");
		} else if (document.memberPw.pwd.value.length < 8) {
			alert("비밀번호는 영문(대소문자구분),숫자를 혼용하여 8~16자를 입력해주세요.");
			return false;
		} else if (!document.memberPw.pwd.value.match(/([a-zA-Z0-9])/)) {
			alert("비밀번호는 영문(대소문자구분),숫자를 혼용하여 8~16자를 입력해주세요.");
			return false;
		} else {
			document.memberPw.submit();
		}
	}
	
	function checkPwInfo(){
		if(document.memberInfo.pwd.value == ""){
			alert("비밀번호를 입력하세요");
		} else {
			document.memberInfo.submit();
		}
	}
	
	//이메일 입력방식 선택
	function checkemailaddy(){
	        if (memberInfo.email_select.value == '1') {
	        	memberInfo.email2.readonly = false;
	        	memberInfo.email2.value = '';
	        	memberInfo.email2.focus();
	        }
	        else {
	        	memberInfo.email2.readonly = true;
	        	memberInfo.email2.value = memberInfo.email_select.value;
	        }
	    }
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('post').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('addr1').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('addr2').focus();
					}
				}).open();
	}
</script>
</head>
<body>
	<div class="container">
	<div class="denouement">
	<h2 align="left">개인정보 수정</h2>
	</div>
		<div class="inner">
		<form name="memberInfo" method="post" action="memberInfoUpdate.do">
			<div class="memberinfofield">
			<h3 align="left">나의 정보 관리</h3>
			<table>
				<tr>
					<td><label class="title">성명</label></td>
					<td>
						<div align="left">
					 		<input type="text" class="in" name="name"	value="${memberDTO.name }" />
						</div>
					</td>
				</tr>
				
				<tr>
					<td><label class="title">주소</label></td>
					<td>
						<div align="left">
							<input type="text" class="in" name="post" id="post"
							value="${memberDTO.post }" readonly="readonly"/> <input type="button"
							onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
							<input type="text" class="addr" name="addr1" id="addr1" value="${memberDTO.addr1 }" readonly="readonly" /><br>
							<input type="text" class="addr" name="addr2" id="addr2" value="${memberDTO.addr2 }" />
						</div>
					</td>
				</tr>
				
				<tr>
					<td><label class="title">전화번호</label></td>
					<td>
						<div align="left">	
							<input type="text" class="tel" name="tel1" value="${memberDTO.tel1 }" size="3"/> -
							<input type="text" class="tel" name="tel2" value="${memberDTO.tel2 }" size="3"/> - 
							<input type="text" class="tel" name="tel3" value="${memberDTO.tel3 }" size="3"/>
						</div>
					</td>
				</tr>
				
				<tr>
					<td><label class="title">이메일</label></td>
					<td>
						<div align="left">
							 <input class="in" type="text" id="email1" name="email1"
							value="${memberDTO.email1 }" /> @ <input class="in" type="text"
							name="email2" id="email2" value="${memberDTO.email2 }" />
							<select name="email_select" class="box" id="email_select" onChange="checkemailaddy();" style="width: 100px; height: 25px; padding: 3px; margin: 3px;">
    							<option value="" selected>선택하세요</option>
   								<option value="naver.com">naver.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="hanmail.com">hanmail.com</option>
								<option value="nate.com">nate.com</option>
    							<option value="1">직접입력</option>
							</select>
							
						</div>
					</td>
				</tr>
				
				<tr>
					<td><label class="title">비밀번호확인</label></td>
					<td>
						<div align="left">
					 		<input class="in" name="pwd" type="password" />
						</div>
					</td>
				</tr>
		
			</table>
				<br>
				<div align="center">
					<input class="btn" type="button" value="나의정보 수정" onclick="checkPwInfo()"/>
				</div>
			</div>
		</form>
		<br> <br> <br> <br>
		<form name="memberPw" method="post" action="memberPwUpdate.do">
			<div class="pwfield">
			<h3 align="left">비밀번호 수정</h3>
			<table>
				<tr>
					<td><label class="title">기존 비밀번호</label></td>
					<td>
						<div align="left">
							 <input class="in" name="expwd" type="password" />
						</div>
					</td>
				</tr>
				<tr>
					<td><label class="title">새 비밀번호</label></td>
					<td>
						<div align="left">
							<input class="in" name="pwd" type="password" />
						</div>
						<label id="command">
							비밀번호는 영문(대소문자구분),숫자를 혼용하여 8~16자를 입력해주세요.</label>
					</td>
				</tr>
				<tr>
					<td><label class="title">새 비밀번호 확인</label></td>
					<td>
						<div align="left">
					 		<input class="in" name="repwd" type="password" />
						</div>
													<label id="command">
							비밀번호 확인을 위해 한번더 입력해주세요.</label>
					</td>
				</tr>
			</table>
				<br>	
				<div align="center">
					<input type="button" class="btn" value="비밀번호 수정" onclick="javascript:checkPw()" />
				</div>
			</div>
		</form>
		</div>
	</div>
</body>
</html>