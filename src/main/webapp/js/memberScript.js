function checkJoin()
{	
	if (document.joinForm.name.value == "")
	{
		alert("이름을 입력하세요");
	}
	else if (document.joinForm.id.value == "")
	{
		alert("아이디를 입력하세요");
	}
	else if (document.joinForm.pwd.value == "")
	{
		alert("비밀번호를 입력하세요");
	}
	else if(document.joinForm.pwd.value.length < 7)
	{
		alert("비밀번호는 최소 8자 입니다.");
		document.joinForm.pwd.value = "";
		document.joinForm.pwd2.value = "";
	}
	else if(!((/\w/.test(document.joinForm.pwd.value) ) && (/\W/.test(document.joinForm.pwd.value))))
	{
		alert("비밀번호는 숫자/영어/특수문자 혼용 입니다.");
		document.joinForm.pwd.value = "";
		document.joinForm.pwd2.value = "";
	}
	else if (document.joinForm.pwd.value != document.joinForm.pwd2.value)
	{
		alert("비밀번호가 맞지 않습니다");
		document.joinForm.pwd.value = "";
		document.joinForm.pwd2.value = "";
	}
	else if (document.joinForm.idAuth.value == "no")
	{
		alert("아이디 중복 확인을 해주세요.");
	}
	else if (document.joinForm.idAuth.value != document.joinForm.id.value)
	{
		alert("아이디 중복 확인을 해주세요.");
	}
	else if (document.joinForm.emailAuth.value == "no")
	{
		alert("이메일 인증을 해주세요.");
	}
	else
	{
		document.joinForm.submit();
	}
}

function checkLogin()
{
	if (document.login.id.value == "")
	{
		alert("아이디를 입력하세요.");
		document.login.id.focus();
	}
	else if (document.login.pwd.value == "")
	{
		alert("비밀번호를 입력하세요.");
	}
	else
	{
		document.login.submit();
	}
}

function checkId()
{
	var sId = document.joinForm.id.value;
	var disable = /[^A-Za-z0-9_.]/;

	if(sId == "")
	{
		alert("먼저 아이디를 입력하세요.");
	}
	else if(sId.length < 6 || sId.length > 14)
	{
		alert("아이디는 6자 이상 14자 이하로 입력해주세요.")
	}
	else if(disable.test(sId))
	{
		alert("사용하실 수 없는 아이디 입니다.")
	}
	else
	{
		window.open("checkId.do?id=" + sId, "",
				"width=350 height=100 left=500 top = 200");
	}
}