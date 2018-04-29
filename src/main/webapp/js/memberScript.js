function checkJoin()
{
	if (document.joinForm.name.value == "")
	{
		alert("이름을 입력하세요");
		document.joinForm.name.focus();
	}
	else if (document.joinForm.id.value == "")
	{
		alert("아이디를 입력하세요");
	}
	else if (document.joinForm.pwd.value == "")
	{
		alert("비밀번호를 입력하세요");
	}
	else if (document.joinForm.pwd.value != document.joinForm.pwd2.value)
	{
		alert("비밀번호가 맞지 않습니다");
	}
	else if (document.joinForm.idAuth.value == "no")
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
	if (document.loginForm.id.value == "")
	{
		alert("아이디를 입력하세요.");
		document.loginForm.id.focus();
	}
	else if (document.loginForm.pwd.value == "")
	{
		alert("비밀번호를 입력하세요.");
	}
	else
	{
		document.loginForm.submit();
	}
}

function checkId()
{
	var sId = document.joinForm.id.value;

	if (sId == "")
	{
		alert("먼저 아이디를 입력하세요.");
	}
	else
	{
		window.open("checkId.do?id=" + sId, "",
				"width=350 height=100 left=500 top = 200");
	}
}
