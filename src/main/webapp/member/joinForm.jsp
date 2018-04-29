<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
<script type="text/javascript" src="js/memberScript.js?v=1"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function execDaumPostcode() 
    {
        new daum.Postcode(
        	{
            	oncomplete: function(data) 
            	{
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname))
                {
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y')
                {
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== '')
                {
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== '')
                {
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                
                $("#post").val(data.zonecode);
                $("#addr1").val(fullRoadAddr);
       	     }
       	 }).open();
    }

    $(document).ready(function()
    		{
    			$("#postButton").click(execDaumPostcode);
    			$("#authEmailBtn").click(function()
    					{
    						var email = $("#email1").val() + "@" + $("#email2").val();						
    						
    						var isEmail = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    					    var isHan = /[ㄱ-ㅎ가-힣]/g;
    					    if (!isEmail.test(email) || isHan.test(email)) 
    					    {
    					        authEmailResult.innerHTML = "이메일 주소를 다시 확인해주세요.";
    					        return false;
    					    }
    						
    						var togo = "authEmail.do?email=" + email;
    						var authEmailWindow = open(togo, "이메일인증", "height=10, width=10, top=0, left=0, location, resizable");
    						if(authEmailWindow.close)
    							{
										$("#authEmailResult").html("이메일이 발송되었습니다.");
    							}
    					});
    			
    			$("#authEmailText").keyup(function()
    					{
    				var url="ajax/memberAjax/auth.jsp";
    				var rand=this.value;

    				var ajax=$.post(url,{"rand":rand},function(data){
    					//xml에서 result태그와 message태그의 내용 추출
    					var result=$(data).find("result").text();
    					var message=$(data).find("message").text();
    					
    					//result값은 boolean형으로 변환
    					var result_value=eval(result);
    					
    					//결과에 따른 후속 처리
    					if(result_value){
    						$("#authEmailResult").html(message);
    						$("#authEmailText").attr("disabled", "disabled");
    						$("#email1").attr("readonly", "readonly");
    						$("#email2").attr("readonly", "readonly");
    						$("#emailSel").attr("disabled", "disabled");
    						$("#emailAuth").val("ok");
    					}else{
    						$("#authEmailResult").html(message);
    					}
    				}).fail(function(){
    					$("#authEmailResult").html("error");
    				}).always(function(){

    				})
    					});
    			$("#emailSel").change(function()
    					{
    						if($("#emailSel").val() == "직접 입력")
    							{
    								$("#email2").val(null);
    								$("#email2").show();
    							}
    						else
    							{
    								$("#email2").val($("#emailSel").val());
    								$("#email2").hide();
    							}
    					})
    		});
</script>
</head>
<body>
		<h3>회원가입</h3>
		<hr>
		<form name="joinForm" action="join.do" method="post">
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" required="required"> <input type="button" value="중복확인" id="duplCheck" onclick="checkId()"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pwd" id="pwd" required="required"></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" id="pwd2"><span id="pwCheck" required="required"></span></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" required="required"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<input type="radio" name="gender" value="m">남
						<input type="radio" name="gender" value="f">여
					</td>
				</tr>
				<tr>
					<td>별명</td>
					<td><input type="text" name="nickname" required="required"></td>
				</tr>
				<tr><td>전화번호</td>
					<td>
						<select name="tel1">
							<option>02<option>031<option>032<option>033<option>041<option>042<option>043<option>044<option>051
							<option>052<option>053<option>054<option>055<option>061<option>062<option>063<option>064
						</select>
						-<input type="text" name="tel2" required="required">-<input type="text" name="tel3" required="required">
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						<input type="text" id="email1" name="email1" required="required"> @
						<input type="text" name="email2" id="email2" value="hanmail.net" style="display:none">
						<select id="emailSel">
							<option>hanmail.net
							<option>naver.com
							<option>nate.com
							<option>gmail.com
							<option>직접 입력
						</select>
					</td>
				</tr>
				<tr>
					<td><input type="button" id="authEmailBtn" value="이메일인증받기"></td>
					<td><input type="text" id="authEmailText" name="authEmailText"><span id="authEmailResult"></span></td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td><input type="text" name="post" id="post" readonly="readonly"> <input type="button" value="찾기" id="postButton"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="addr1" id="addr1" readonly="readonly"></td>
				<tr>
				<tr>
					<td></td>
					<td><input type="text" name="addr2"></td>
				<tr>
			</table>
			<input type="hidden" name="idAuth" value="no" />
			<input type="hidden" name="emailAuth" value="no" />
			<input type="button" value="회원가입" onclick="javascript:checkJoin()">
		</form>
		joinDate, grade, score,profile
</body>
</html>