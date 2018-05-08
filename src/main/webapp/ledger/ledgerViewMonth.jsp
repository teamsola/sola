<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="ledgercss/ledgerViewTitle2.css?ver=1" />
<link rel="stylesheet" type="text/css" href="ledgercss/ledgerViewMonth.css?ver=1" />
<script type="text/javascript">

$(document).ready(function() {
	<c:forEach var="i" begin="1" end="12" step="1">
	<!-- 당일에 해당하는 수입/지출 금액 합산 -->
	<c:set var="insum" value="0"/>	<!-- 수입 -->
	<c:set var="outsum" value="0"/>	<!-- 지출 -->
	
		<c:set var="list" value="${yearMap[i] }"/>	<!-- 키(달)값을 넣고 list 빼옴 -->
		<c:if test="${fn:length(list) ne 0  }"> <!-- 리스트의 사이즈가 0이 아닐때 -->
			<c:forEach var="ledgerDTO" items="${list}">	<!--  -->
				<c:if test="${ledgerDTO.inOut eq '수입'}" >	
					<c:set var="insum" value="${insum+ledgerDTO.income }"/>	<!-- 해당일의 수입 합계 -->
					<c:set var="totalin" value="${totalin+ledgerDTO.income}"/>	<!-- 해당월의 수입 합계 -->
				</c:if>
				<c:if test="${ledgerDTO.inOut eq '지출'}" >
					<c:set var="outsum" value="${outsum+ledgerDTO.spand }"/> 	<!-- 해당일의 지출 합계 -->
					<c:set var="totalout" value="${totalout+ledgerDTO.spand}"/><!-- 해당월의 지출 합계 -->
				</c:if>
			</c:forEach>
		</c:if>
		
		
		var monthHTML = "<div class=\"month\">${i }월</div>";
		var incomeHTML = "<div class=\"income\">"+addComma('${insum }')+"</div>";
		var spandHTML = "<div class=\"spand\">"+addComma('${outsum }')+"</div>";
		var totalHTML = "<div class=\"total\">"+addComma('${insum-outsum }')+"</div>";
		
		$(".contents_center").append("<div class=\"contentline\" "+
				"onclick=\"location.href='ledgerViewClosing.do?year=${year }&month=${i-1 }'\" style=\"cursor: pointer\">"
						+monthHTML+incomeHTML+spandHTML+totalHTML+"</div>");
		
	</c:forEach>
	
	
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
<title>월별 보기</title>
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
			<div class="subject">가계부 월별</div>
		</div>

		<div class="bottom">
		
			<!-- 이전달 --> 
			<div class="view_before" onclick="location.href='ledgerViewMonth.do?year=${year-1 }'"
						style="cursor: pointer;">
			</div>
			<div class="view_center">
				<div class="info">${year } 년</div><!-- 해당년 월 -->
				<div class="contents">
					<div class="contents_top">
						<div class="title">월</div>
						<div class="title">수입</div>
						<div class="title">지출</div>
						<div class="title">합계</div>
					</div>
						
					<div class="contents_center">			
						
					</div>
				</div>
			</div>
			<!-- 다음날 --> 
			<div class="view_after" onclick="location.href='ledgerViewMonth.do?year=${year+1 }'"
							style="cursor: pointer">
			</div>
		</div>
	</div>
</div>

		
</body>
</html>