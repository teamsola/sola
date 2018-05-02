<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="ledgercss/ledgerViewTitle3.css?ver=3" />
<link rel="stylesheet" type="text/css" href="ledgercss/ledgerViewClosing.css?ver=2" />
<script type="text/javascript">
$(document).ready(function() { 
	<c:set var="incash" value="0"/>	<!-- 총 수입 -->
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
	</c:forEach>
	
	<c:set var="outcash" value="0"/><!-- 총 지출 -->
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
	</c:forEach>
	
	$("#total_month").html("수입 : <span style=\"color:blue\">"+addComma('${incash}')+"</span> &nbsp;&nbsp;&nbsp; 지출 : <span style=\"color:red\">"+addComma('${outcash}')+"</span>&nbsp;&nbsp;&nbsp;")
	if(('${incash-outcash}')>0){
		$("#total_month").append("<span>합계 : </span><span style=\"color:blue;\" >"+addComma('${incash-outcash}')+"</span>");
	}else{
		$("#total_month").append("<span>합계 : </span><span style=\"color:red\">"+addComma('${incash-outcash}')+"</span>");
	}
	
	// 이전 마우스 올릴때
	$(".view_before").hover(function(){
		$(this).css("background","url('ledgerimg/arrowleft_hover.png') no-repeat");
	}, function(){
		$(this).css("background","url('ledgerimg/arrowleft.png') no-repeat");
	});
	
	// 다음 마우스 올릴때
	$(".view_after").hover(function(){
		$(this).css("background","url('ledgerimg/arrowright_hover.png') no-repeat");
	}, function(){
		$(this).css("background","url('ledgerimg/arrowright.png') no-repeat");
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
<title>결산 보기</title>
</head>
<body>
<!-- 흐릿한 뒷 배경 -->
	<div id="ledger_background"></div>
	<div class="container">
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
				<div class="info">${calendarDTO.year }년 &nbsp; ${calendarDTO.month+1 } 월</div><!-- 해당년 월 -->
				<div class="contents">
				<div class="contents_left">
					<ul>
						<li class="income_closing" id="income_closing">
							<div class="income"><b>[수입결산]</b></div>
							<div class="title1">항목</div>
							<div class="title2">금액</div>
						</li>
					</ul>
				</div>
				<div class="contents_right">
					<ul>
						<li class="spand_closing" id="spand_closing">
							<div class="spand"><b>[지출결산]</b></div>
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