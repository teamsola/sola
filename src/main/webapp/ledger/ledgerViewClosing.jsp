<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="ledgercss/ledgerViewTitle3.css?ver=3" />
<link rel="stylesheet" type="text/css" href="ledgercss/ledgerViewClosing.css?ver=4" />
<script type="text/javascript">
$(document).ready(function() { 
	excelHTML = "";	// 엑셀에 저장될  string
	
	excelHTML += "<table><tr><th>${calendarDTO.year }년 ${calendarDTO.month+1 }월 결산</th></tr><tr></tr></table>"
	
	<c:set var="incash" value="0"/>	<!-- 총 수입 -->
	
	// 엑셀 저장(수입)
	excelHTML +="<table><tr><th>수입결산</th><th></th></tr>"
		+"<tr><td>항목</td><td>금액</td></tr>";
		
	<c:forEach var="cate" items="${categoryIn}" >
	<c:set var="cash" value="0"/>
			$("#income_closing").append("<div class=\"text_subject\">${cate }</div>");
				<c:forEach var="ledgerDTO" items="${ledgerList}">
					<c:if test="${cate eq ledgerDTO.category }">
						<c:set var="cash" value="${cash+ledgerDTO.income }"/>
					</c:if>
				</c:forEach>
				<c:set var="incash" value="${incash+cash }"/>
				var dateFormat = addComma('${cash }');
			$("#income_closing").append("<div class=\"text_desc\">"+dateFormat+"</div>");
			// 엑셀 저장 데이터
			excelHTML +="<tr><td>${cate}</td><td>${cash }</td></tr>";
	</c:forEach>
	
	excelHTML +="<tr></tr></table>";
	
	<c:set var="outcash" value="0"/><!-- 총 지출 -->
	// 엑셀 저장(지출)
	excelHTML +="<table><tr><th>지출결산</th><th></th></tr>"
		+"<tr><td>항목</td><td>금액</td></tr>";
		
	<c:forEach var="cate" items="${categoryOut}" >
	<c:set var="cash" value="0"/>
		$("#spand_closing").append("<div class=\"text_subject\">${cate }</div>");
			<c:forEach var="ledgerDTO" items="${ledgerList}">
				<c:if test="${cate eq ledgerDTO.category }">
					<c:set var="cash" value="${cash+ledgerDTO.spand }"/>
				</c:if>
			</c:forEach>
			<c:set var="outcash" value="${outcash+cash }"/>
			var dateFormat = addComma('${cash }');
		$("#spand_closing").append("<div class=\"text_desc\"><label class=\"text_type1\">"+dateFormat+"</label></div>");
		// 엑셀 저장 데이터
		excelHTML +="<tr><td>${cate}</td><td>${cash }</td></tr>";
	</c:forEach>
	
	excelHTML +="<tr></tr></table>";
	
	excelHTML +="<table><tr><th>수입</td><td>${incash}</td></tr>"
				+"<tr><th>지출</td><td>${outcash}</td></tr>"
				+"<tr><th>합계</td><td>${incash-outcash}</td></tr></table>";
	
	$("#total_month").html("수입 : <span style=\"color:blue\">"+addComma('${incash}')+"</span> &nbsp;&nbsp;&nbsp; 지출 : <span style=\"color:red\">"+addComma('${outcash}')+"</span>&nbsp;&nbsp;&nbsp;")
	if(('${incash-outcash}')>0){
		$("#total_month").append("<span>합계 : </span><span style=\"color:blue;\" >"+addComma('${incash-outcash}')+"</span>");
	}else{
		$("#total_month").append("<span>합계 : </span><span style=\"color:red\">"+addComma('${incash-outcash}')+"</span>");
	}
	
	// 불투명 바탕화면 누르면 달력으로
	$("#ledger_background").click(function(){
		location.href='calendar.do?cmd=main';
	});
	
	$("#save_btn").click(function(){
		alert("excelHTML : "+excelHTML);
	    window.open('data:application/vnd.ms-excel,' + excelHTML);
	    e.preventDefault();
	});
});

//숫자 3번째 자리마다 콤마(,) 찍기
function addComma(num) {
	var regexp = /\B(?=(\d{3})+(?!\d))/g;
	return num.toString().replace(regexp, ',');
}
</script>

<style>
#save_btn{	/* 버튼 설정 */
	border:0;
	outline:0;
	background-color:#ff8400;
	color:white;
	border-radius: 12px;
}

#save_btn:hover{	/* 버튼 이벤트 */
	color:black;
	cursor:pointer;	
}
</style>

<title>결산 보기</title>
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
			<div class="subject">가계부 결산</div>
		</div>

		<div class="bottom">
		
			<!-- 이전달 --> 
			<div class="view_before" onclick="location.href='ledgerViewClosing.do?year=${calendarDTO.year }&month=${calendarDTO.month-1 }'"
						style="cursor: pointer;">
			</div>
			<div class="view_center">
				<div class="info">${calendarDTO.year }년 &nbsp; ${calendarDTO.month+1 }월</div><!-- 해당년 월 -->
				<div class="contents">
				<div class="fileSave_btn" style="width: 100%; height:5%; text-align: right;">
					<input type="button" class="save_btn" id="save_btn" value="엑셀저장"></div>
				<div class="contents_left">
					<ul>
						<li class="income_closing" id="income_closing">
							<div class="income"><b>[수입결산]</b></div><br>
							<div class="title1">항목</div>
							<div class="title2">금액</div>
						</li>
					</ul>
				</div>
				<div class="contents_right">
					<ul>
						<li class="spand_closing" id="spand_closing">
							<div class="spand"><b>[지출결산]</b></div><br>
							<div class="title1">항목</div>
							<div class="title2">금액</div>
						</li>
					</ul>
				</div>
				<div class="contents_bottom">
					<ul>
						<li class="total_month" id="total_month">
							<!-- <div class="total_sum" id="total_sum"></div> -->
						</li>
					</ul>
				</div>
				</div>
			</div>
			<!-- 다음날 --> 
			<div class="view_after" onclick="location.href='ledgerViewClosing.do?year=${calendarDTO.year }&month=${calendarDTO.month+1 }'"
							style="cursor: pointer;">
			</div>
		</div>
	</div>
	</div>
</body>
</html>