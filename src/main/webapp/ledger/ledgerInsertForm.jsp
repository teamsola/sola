<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="ledgercss/ledgerInsert.css?ver=1" />

<script type="text/javascript">
$(function(){
		$("#inOut").change(function(){	// 입-출금이 눌렸을 때 
			var categoryList = new Array();
			$("select[name='category'] option").remove();
			
			if($("#inOut option:selected").val() =='수입'){ 			// 수입 선택
				$("#category").append("<option value='0'>--선택--</option>");
				<c:forEach items="${categoryIn}" var="item">
					categoryList.push("${item}");
				</c:forEach>
				
			}else if($("#inOut option:selected").val() == '지출'){	// 지출 선택
				$("#category").append("<option value='0'>--선택--</option>");
				<c:forEach items="${categoryOut}" var="item">
				categoryList.push("${item}");
				</c:forEach>
			}else if($("#inOut option:selected").val() == '선택'){	// 미 선택
				$("#category").append("<option value='0'>--- 입/출금선택 ---</option>");
			}
			 for(var i in categoryList){	// 해당 카테고리 출력
				$("#category").append
				("<option value='"+categoryList[i]+"'>"+categoryList[i]+"</option>");
			}
		}); 
		
		// 유효성 검사
		$("#insertButton").click(function(){	// 입력 버튼이 눌렸을때
			if($("#inOut").val()=='선택'){
				alert("입/출금을 선택해주세요.");
				$("#inOut").focus(); 
			}else if($("#category").val()=='0'){
				alert("분류를 선택해주세요.");
				$("#category").focus(); 
			}else if($("#money").val()==""){
				alert("금액을 입력해주세요.")
				$("#money").focus(); 
			}else if(isNaN($("#money").val())){
				alert("금액에는 숫자만 입력 가능합니다.");
				$("#money").focus(); 
			}else if($("#content").val().length>10){
				alert("내용은 10자까지만 가능합니다.");
				$("#content").focus(); 
			}else if($("#contentPlus").val().length>20){
				alert("추가 내용은 20자까지만 가능합니다.");
				$("#contentPlus").focus(); 
			}else{
				document.ledgerInsert.submit();
			}
		});
		
		// 불투명 바탕화면 누르면 달력으로
		$("#ledger_background").click(function(){
			location.href='calendar.do?cmd=main';
		});
		
		// 금액을 입력할때 이벤트 발생
		$("#money").keyup(function(){
			if($("#money").val()==""){
				$("#moneyCheck").text("금액을 적어주세요");
				$("#moneyCheck").css("color", "black");
			}else if(isNaN($("#money").val())){
				$("#moneyCheck").text("숫자만 가능합니다");
				$("#moneyCheck").css("color", "red");
			}else if(!isNaN($("#money").val())){
				$("#moneyCheck").text("입력 가능합니다");
				$("#moneyCheck").css("color", "blue");
			};
		});
		
		// content, contentPlus 글자수 제한
		$("#content, #contentPlus").keyup(function(){
			var tagId = $(this).attr('id');
			var checkId = "";
			var numChar = $(this).val().length;
			var maxNum = 0;
			 	if(tagId=='content'){ 	// content 
			 		maxNum = 10;
			 		checkId = "#"+tagId+"Check";
			 	}else{					// contentPlus
			 		maxNum = 20;
			 		checkId = "#"+tagId+"Check";
			 	}
			 	
			    if($(this).val()==""){	// 입력값이 없을경우 (입력하지 않아도 됨)
			    	/* $(checkId).text("내용을 입력해주세요");
			    	$(checkId).css("color", "black"); */
			    }else if(numChar>maxNum){	// 10자가 넘을 경우
			    	$(checkId).text(maxNum+"자까지만 가능합니다.");
			    	$(checkId).css("color", "red");
			    }else if(numChar<maxNum && numChar>0){
			    	$(checkId).text(numChar+"/"+maxNum);
			    	$(checkId).css("color", "blue");
			    }
		});
});
</script>

<title>가계부 입력</title>
</head>
<body>
<!-- 흐릿한 뒷 배경 -->
<div id="ledger_background"></div>

<div class="ledger_body">

	<div class="top">
		<div class="close" onclick="location.href='calendar.do?cmd=main'">x</div>
		<div class="before" onclick="javascript:history.back()">←</div>
		<div class="subject">가계부 입력</div>
	</div>
	
	<form action="ledgerInsert.do" name="ledgerInsert" method="post" enctype="multipart/form-data">
	<div class="bottom">
		<ul>
			<li>
				<div class="text_subject">입/출금 : </div>
				<div class="text_desc">
				<select name="inOut" id="inOut" class="inOut">
					<option value="선택">선택</option>
					<option value="수입">수입</option>
					<option value="지출">지출</option>
				</select>
				</div>
			</li>
			<li>
				<div class="text_subject">날짜 : </div>
				<div class="text_desc">
					<label id="logdate" class="text_type1">${stringDate}</label>
				</div>
				<input type="hidden" name="logdate" value="${stringDate }" /><!-- 편집된 날짜 히든으로 보냄 -->
			</li>
			<li>
				<div class="text_subject">분류 : 	</div>
				<div class="text_desc">
					<select name="category" id="category" class="category">
						<option value="0">--- 입/출금선택 ---</option>
					</select>
				</div>
			</li>
			<li>
				<div class="text_subject">금액 : </div>
				<div class="text_desc">
					<input type="text" class="text_insert" id="money" name="money">
					<label class="text_check" id="moneyCheck"></label>
				</div>
			</li>
			<li>
				<div class="text_subject">내용 : </div>
				<div class="text_desc">
					<input type="text" class="text_insert" id="content" name="content">
					<label class="text_check" id="contentCheck"></label>
				</div>
			</li>
			<li>
				<div class="text_subject">추가내용 : </div>
				<div class="text_desc">
					<textarea class="text_insert2" id="contentPlus" name="contentPlus"></textarea>
					<!-- <input type="text" class="text_insert" id="contentPlus" name="contentPlus"> -->
					<label class="text_check" id="contentPlusCheck"></label>
				</div>
			</li>
			<li class="button_li">
				<input type="button" class="ledger_btn" id="insertButton" value="저장하기" style="cursor: pointer">
			</li>
		</ul>
	</div>
</form>
</div>
</body>
</html>