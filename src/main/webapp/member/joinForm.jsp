<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
html,body{width:100%;margin:0;padding: 0;display: block;}
#joinForm table
{
	width: 600px;
	margin:80px auto 0 auto;
	border-spacing: 15px;
}
#joinForm table td{color: #ff8400;font-weight: bold;font-size: 16px;}
#joinForm table span{font-size:12px;}
tr.sub
{
	font-size: 14px;
	text-align: left;
}
tr.inp
{
	text-align: left;
}
tr.inp>td>.inp_text, #id, #emailSel, #authEmailText.inp_text, #post
{
	border-style: none;border-bottom:1px solid black;height:30px;font-size: 16px;padding-left:5px;outline:none;
}
#post{width:35%;}
tr.inp>td>.inp_text:focus, #id:focus, #authEmailText.inp_text:focus
{
	transition:.5s ease; border-bottom:2px solid #ff8400;outline:none;box-sizing: content-box;font-size: 14px;
}
tr.inp>td>.inp_text{width: 100%;}
#duplCheck{outline:none;background:#ff8400;border-style: none;text-align: center;width:100%;height:33px;font-size: 15px;color:white;border-radius: 4px;}
#id{width:95%;}
.inp_hid{width:30%;border-style: none;height:30px;font-size: 16px;padding-left:5px;outline:none;border-bottom: none;}
#authEmailBtn, #postButton{outline:none;background:#ff8400;border-style: none;text-align: center;width:25%;height:33px;font-size: 15px;color:white;border-radius: 4px;}
.inp_div
{
	float: left;
	width: 80%;
}

.inp_div_btn
{
	position: absolute;
	width:20%;
	right: 0px;
	z-index: 10;
	float: right;
}
.gender_label
{
    background-color: none;
    width: 49%;
    border-radius:10px;
    border:1px solid #ff8400;
    cursor: pointer;
    display: inline-table;
    text-align: center;
}
.finalBtn:hover, .finalBtn:active{outline:none;background: #ff8400;color: white;}
.finalBtn{outline:none;width:45%; height: 40px; border-style: none;border:1px solid #ff8400;border-radius: 20px;text-align: center;font-size:16px;color: #ff8400;background: none;}
</style>
<script type="text/javascript" src="js/memberScript.js?v=1"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function cancelB(){
	if(confirm("가입을 취소하시겠습니까?")){
		location.href="/sola/index.jsp";
	}
}
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
    			$("#post").click(execDaumPostcode);
    			$("#postButton").click(execDaumPostcode);
    			$("#hid_auth").hide();
    			$("#authEmailBtn").click(function()
    					{
    						var email = $("#email1").val() + "@" + $("#email2").val();						
    						
    						var isEmail = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    					    var isHan = /[ㄱ-ㅎ가-힣]/g;
    					    if (!isEmail.test(email) || isHan.test(email)) 
    					    {
    					        authEmailResult.innerHTML = "<font color=red>이메일 주소를 다시 확인해주세요.</font>";
    					        return false;
    					    }
    						
    					    $("#hid_auth").show();
    						var togo = "authEmail.do?email=" + email;
    						var authEmailWindow = open(togo, "이메일인증", "width=450, height=150, location, resizable");
    						if(authEmailWindow.close)
    							{
										$("#authEmailResult").html("<font color=blue>이메일이 발송되었습니다.</font>");
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
    						$("#authEmailResult").html("<font color=blue>" + message + "</font>");
    						$("#email1").attr("readonly", "readonly");
    						$("#email2").attr("readonly", "readonly");
    						$("#emailSel").attr("disabled", "disabled");
    						$("#sub_auth").hide();
    						$("#hid_auth").hide();
    						$("#emailAuth").val("ok");
    					}else{
    						$("#authEmailResult").html("<font color=red>" + message + "</font>");
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
    								$("#email2").removeClass();
    								$("#email2").addClass('inp_text');
    								$("#email2").css("width", "30%");
    								$("#email2").attr("readonly", false);
    								$("#email2").focus();
    							//	$("#email2").show();
    							}
    						else
    							{
    								$("#email2").val($("#emailSel").val());
    								$("#email2").removeClass();
    								$("#email2").addClass('inp_hid');
    								$("#email2").attr("readonly", true);
    							//	$("#email2").hide();
    							}
    					});
    			$("#pwd2").keyup(function()
    					{
    						var pwd = $("#pwd").val();
    						var pwd2 = $("#pwd2").val();
    						if(pwd == pwd2)
    							{
    								$("#span_pwd2").html("<font color=blue>비밀번호가 일치합니다.</font>");
    							}
    						else
    							{
    								$("#span_pwd2").html("<font color=red>비밀번호가 일치하지 않습니다.</font>");
    							}
    					});
    			$(".gender_radio").change(function()
    					{
    						var id = $(this).attr("id");
    						
    						if(id == "male") {var otherId = "female";}
    						else {var otherId = "male";}	
    						$("#label_" + id).css("background-color", '#ff8400');
    						$("#label_" + id).css("color", 'white');
    						$("#label_" + otherId).css("background", 'none');
    						$("#label_" + otherId).css("color", '#ff8400');
    					});
/* 				$("#pwd").keyup(function()
						{
							var pwd = $("#pwd").val();
							if(/\w\W/.test(pwd))
								{
								$("#span_pwd").html("<font color=blue>perfect</font>");
								}
							else
								{
								$("#span_pwd").html("<font color=red>false</font>");
								}
						}); */
    		});
</script>
</head>
<body>
		<div style="width:100%;background: #ff8400;height:50px;display:block;z-index:100; padding-top:20px;font-size: 26px;color:white;font-weight: bold;position:fixed;min-height: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원가입&nbsp;&nbsp;
		<span style="color: white;font-size:12px;">&nbsp;&nbsp; * 는 필수 입력사항입니다.</span><img src="img/logo(whi).png" height="25px" style="float: right;margin-top: 25px;"></div>
		
		
		<form id="joinForm" name="joinForm" action="join.do" method="post">
			<table align="center">
				<tr class="sub">
					<td>*아이디<br><span id="span_id">영문과 숫자 6자 이상, 특수문자는 .과 _만 허용됩니다.</span></td>
				</tr>
				<tr class="inp">
					<td style="position:relative">
						<div class="inp_div"><input type="text" id="id" name="id" required="required" class="inp_text" placeholder="아이디 입력"></div>
						<div class="inp_div_btn"><input type="button" value="중복확인" id="duplCheck" onclick="checkId()"></div>
					</td>
				</tr>
				<tr><td style="height:30px;"></td></tr>
				<tr class="sub">
					<td>*비밀번호<br><span id="span_pwd">8자 이상, 영문과 숫자 혼용</span></td>
				</tr>
				<tr class="inp">
					<td><input type="password" name="pwd" id="pwd" required="required" class="inp_text" placeholder="비밀번호 입력"></td>
				</tr>
				<tr><td style="height:30px;"></td></tr>
				<tr class="sub">
					<td>*비밀번호 확인<br><span id="span_pwd2"></span></td>
				</tr>
				<tr class="inp">
					<td><input type="password" id="pwd2" class="inp_text" placeholder="비밀번호 다시 입력"></td>
				</tr>
				<tr><td style="height:30px;"></td></tr>
				<tr class="sub">
					<td>*이름</td>
				</tr>
				<tr class="inp">
					<td><input type="text" name="name" required="required" class="inp_text" placeholder="이름 입력"></td>
				</tr>
				<tr><td style="height:30px;"></td></tr>
				<tr class="sub">
					<td>*성별</td>
				</tr>
				<tr class="inp">
					<td>
						<label class="gender_label" for="male" id="label_male"><input type="radio" name="gender" class="gender_radio" value="m" id="male" hidden>남</label>
						<label class="gender_label" for="female" id="label_female"><input type="radio" name="gender" class="gender_radio" value="f" id="female" hidden>여</label>
					</td>
				</tr>
				<tr><td style="height:30px;"></td></tr>
				<tr class="sub">
					<td>*별명<br><span id="span_nickname"></span></td>
				</tr>
				<tr class="inp">
					<td><input type="text" name="nickname" required="required" class="inp_text" placeholder="별명 입력"></td>
				</tr>
				<tr><td style="height:30px;"></td></tr>
				<tr class="sub">
					<td>*전화번호</td>
				</tr>
				<tr class="inp">
					<td>
						<select name="tel1" class="inp_text" style="width:20%">
							<option selected="selected">010</option>
							<option>011</option>
							<option>017</option>
							<option>019</option>
							<option>02</option>
							<option>031</option>
							<option>032</option>
							<option>033</option>
							<option>041</option>
							<option>042</option>
							<option>043</option>
							<option>044</option>
							<option>051</option>
							<option>052</option>
							<option>053</option>
							<option>054</option>
							<option>055</option>
							<option>061</option>
							<option>062</option>
							<option>063</option>
							<option>064</option>
						</select>&nbsp;&nbsp;-
						<input type="text" name="tel2" style="width:34%" required="required" class="inp_text" placeholder="전화번호(가운데 3~4자리)">&nbsp;&nbsp;-
						<input type="text" name="tel3" style="width:34%" required="required" class="inp_text" placeholder="전화번호(뒷 4자리)">
					</td>
				</tr>
				<tr><td style="height:30px;"></td></tr>
				<tr class="sub">
					<td>*이메일<br><span id="authEmailResult" style="text-align: right"></span></td>
				</tr>
				<tr class="inp">
					<td>
						<select id="emailSel" style="width:100%;">
							<option>hanmail.net
							<option>naver.com
							<option>nate.com
							<option>gmail.com
							<option>직접 입력
						</select>
					</td>
				</tr>
				<tr class="inp">
					<td>	
						<input type="text" id="email1" name="email1" required="required" class="inp_text" placeholder="이메일 입력" style="width:35%;">
						@<input type="text" name="email2" id="email2" value="hanmail.net" class="inp_hid" readonly="readonly">&nbsp;&nbsp;<input type="button" id="authEmailBtn" value="이메일인증받기">
					</td>
				</tr>
				
				<tr class="sub" id="sub_auth">
					<td></td>
				</tr>
				<tr class="hid" id="hid_auth">	
					<td>인증번호 : <input type="text" id="authEmailText" name="authEmailText" class="inp_text"></td>
				</tr>
				<tr><td style="height:30px;"></td></tr>
				<tr class="sub">
					<td>우편번호</td>
				</tr>
				<tr class="inp">
					<td style="position:relative">
						<div class="inp_div"><input type="text" name="post" id="post" readonly="readonly" class="inp_text" placeholder="우편번호">&nbsp;&nbsp;<input type="button" value="찾기" id="postButton"></div> 
					</td>
				</tr>
				<tr class="sub">
					<td>주소</td>
				</tr>
				<tr class="inp">
					<td><input type="text" name="addr1" id="addr1" readonly="readonly" class="inp_text" placeholder="주소"></td>
				<tr>
				<tr class="sub">
					<td class="sub"></td>
				</tr>
				<tr class="inp">
					<td><input type="text" name="addr2" class="inp_text" placeholder="상세주소 입력"></td>
				<tr>
				<tr class="sub">
					<td align="center">
			<input type="hidden" id="idAuth" name="idAuth" value="no" />
			<input type="hidden" id="emailAuth" name="emailAuth" value="no" />
			<input type="button" class="finalBtn" value="취소" onclick="cancelB()">&nbsp;&nbsp;&nbsp;<input type="button" class="finalBtn" value="회원가입" onclick="javascript:checkJoin()"></td>
				<tr>
			</table>
		</form>
</body>
</html>