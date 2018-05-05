<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="ledgercss/ledgerViewTitle.css?ver=1" />
<link rel="stylesheet" type="text/css" href="ledgercss/ledgerViewDetail.css?ver=1" />
<script type="text/javascript">
	
	$(function(){
		
		// 수입-지출 분류
		$(document).ready(function() { 
			if('${ledgerDTO.inOut}' == '수입'){	
				$("#money").text(addComma("${ledgerDTO.income}")+"원");
			}else if('${ledgerDTO.inOut}' == '지출'){	
				$("#money").text(addComma("${ledgerDTO.spand}")+"원");
			}
		});
		
		// 삭제 버튼
		$("#deleteButton").click(function(){
			var result = confirm('정말 삭제하시겠습니까?'); 
			if(result) { // yes
				location.href='ledgerDelete.do?stringDate=${stringDate }&seq=${ledgerDTO.seq }';
			}
		});
		
		// 수정 버튼
		$("#modifyButton").click(function(){
			location.href='ledgerModifyForm.do?stringDate=${stringDate }&seq=${ledgerDTO.seq}';
		});
		
		// 불투명 바탕화면 누르면 달력으로
		$("#ledger_background").click(function(){
			location.href='calendar.do?cmd=main';
		});
	});
	//숫자 3번째 자리마다 콤마(,) 찍기
	function addComma(num) {
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		return num.toString().replace(regexp, ',');
	}
</script>
<title>가계부 상세보기</title>
</head>
<body>

<!-- 흐릿한 뒷 배경 -->
<div id="ledger_background"></div>
<div class="container">
	
	<!-- 흐린창 뒤의 배경 이미지 -->
	<div id="title_img">
		<a href="calendar.do?cmd=main" id="title_atag"><span>LEDGER</span></a>
	</div>


<div class="ledger_body">

	<div class="top">
		<div class="close" onclick="location.href='calendar.do?cmd=main'">x</div>
		<div class="before" onclick="javascript:history.back()">←</div>
		<div class="subject">가계부 상세 보기</div>
	</div>
	
	<div class="bottom">
		<ul>
			<li>
				<div class="text_subject">입/출금 : </div>
				<div class="text_desc">
					<label>${ledgerDTO.inOut }</label>
				</div>
			</li>
			<li>
				<div class="text_subject">날짜 : </div>
				<div class="text_desc">
					<label>${stringDate}</label>
				</div>
			</li>
			<li>
				<div class="text_subject">분류 : 	</div>
				<div class="text_desc">
					<label>${ledgerDTO.category }</label>
				</div>
			</li>
			<li>
				<div class="text_subject">금액 : </div>
				<div class="text_desc">
					<label id="money"></label>
				</div>
			</li>
			<li>
				<div class="text_subject">내용 : </div>
				<div class="text_desc">
					<label>${ledgerDTO.content }</label>
				</div>
			</li>
			<li>
				<div class="text_subject">추가내용 : </div>
				<div class="text_desc">
					<label>${ledgerDTO.contentPlus }</label>
				</div>
			</li>
			<li class="button_li">
				<input type="button" class="ledger_btn" id="modifyButton" value="수정" style="cursor: pointer">
				<input type="button" class="ledger_btn" id="deleteButton" value="삭제" style="cursor: pointer">
			</li>
		</ul>
	</div>
</div>
</div>
</body>
</html>