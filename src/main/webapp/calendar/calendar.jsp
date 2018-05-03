<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<!-- <link rel="stylesheet" type="text/css" href="ledgercss/reset.css" /> -->
<link rel="stylesheet" type="text/css" href="ledgercss/calendar.css?ver=1" />

<script type="text/javascript">
	
	$(document).ready(function() { 
		var totalInSum = 0;
		var totalOutSum = 0;
		var totalSum = 0;
		
		<c:forEach var="ledgerDTO" items="${ledgerList }">
			
			<c:if test="${ledgerDTO.inOut eq '수입'}" >	
				totalInSum += Number('${insum+ledgerDTO.income }');
			</c:if>
			<c:if test="${ledgerDTO.inOut eq '지출'}" >
				totalOutSum += Number('${insum+ledgerDTO.spand }');
			</c:if>
			totalSum = totalInSum-totalOutSum;
		</c:forEach>
		
		
		$(".info").html("<span>수입 : </span><span style=\"color:blue\">"+addComma(totalInSum)+"</span> &nbsp;&nbsp;&nbsp; <span>지출 : </span><span style=\"color:red\">"+addComma(totalOutSum)+"</span>&nbsp;&nbsp;&nbsp;");
		if((totalInSum-totalOutSum)>0){
			$(".info").append("<span>합계 : </span><span style=\"color:blue;\" >"+addComma(totalSum)+"</span>");
		}else{
			$(".info").append("<span>합계 : </span><span style=\"color:red\">"+addComma(totalSum)+"</span>");
		}
	
		$(".sat_day, .sun_day, .normal_day").hover(function(){
			$(this).css('background-color','#c9c9c9');
		}, function(){
			$(this).css('background-color','#EFEFEF');
		});
		
		/* $("#search_btn").click(function(){	// 검색버튼 눌림
			if($("#search").val()==""){
				alert("검색어를 입력해주세요");
				$("#search").focus();
			}else{
				location.href="ledgerSearch.do?keyword="+$("#search").val();
			}
		}); */
		
		
	});
	function search_Check(){
		if($("#search").val()==""){
			alert("검색어를 입력해주세요");
			$("#search").focus();
		}else{
			location.href="ledgerSearch.do?keyword="+$("#search").val();
		}
	}
	
	// 숫자 3번째 자리마다 콤마(,) 찍기
	function addComma(num) {
		  var regexp = /\B(?=(\d{3})+(?!\d))/g;
		   return num.toString().replace(regexp, ',');
	}
	
	function enterkey() {
	    if (window.event.keyCode == 13) {
	    	if($("#search").val()==""){
				alert("검색어를 입력해주세요");
				$("#search").focus();
			}else{
				location.href="ledgerSearch.do?keyword="+$("#search").val();
			}
	    }
	}
</script>
<title>달력</title>
</head>
<body class="total_body">
<div class="frame">
<div class="calendar">
<div class="searchBar">
	<div id="search_btn" class="search_btn" onclick="search_Check();"></div>
	<!-- <input type="button" id="search_btn" class="search_btn" value="검색"> -->
	<input type="text" id="search" class="search" name="search" onkeyup="enterkey();">
	
</div>
<!-- 날짜 네비게이션 -->
<div class="navigation">
	<!-- 지난해 -->	
	<a class="before_after_year" href="calendar.do?year=${calendarDTO.year-1 }&month=${calendarDTO.month}">&lt;&lt;</a> 
	<!-- 지난달 -->
	<a class="before_after_month" href="calendar.do?year=${calendarDTO.year }&month=${calendarDTO.month-1}">&lt;</a> 
	<!-- 이번달 -->
	<span class="this_month">${calendarDTO.year }년 &nbsp; ${calendarDTO.month+1 }월</span>
	<!-- 다음달 -->
	<a class="before_after_month" href="calendar.do?year=${calendarDTO.year }&month=${calendarDTO.month+1}">&gt;</a> 
	<!-- 다음해 -->
	<a class="before_after_year" href="calendar.do?year=${calendarDTO.year+1 }&month=${calendarDTO.month}">&gt;&gt;</a> 
</div>

<table class="calendar_body">
	<thead>
		<tr>
			<td colspan="7" align="center" class="info_td">
				<div class="info" id="info"></div>  
			</td>
		</tr>
		<tr bgcolor="#CECECE">
			<td class="day sun">일</td>
			<td class="day">월</td>
			<td class="day">화</td>
			<td class="day">수</td>
			<td class="day">목</td>
			<td class="day">금</td>
			<td class="day sat">토</td>
		</tr>
	</thead>
	<tbody>
		<tr>
		<c:set var="week" value="${calendarDTO.firstWeek }"/>	<!-- 해당 월의 1일의 요일 -->
		
		<!-- 첫 시작 요일이 토요일 전이면 공백처리 -->	
		<c:forEach var="i" begin="1" end="${week-1 }" step="1">
			<td class="normal_day"></td>
		</c:forEach>
		
		
		<!-- 공백 처리 후 날짜 입력 -->
		<c:forEach var="i" begin="0" end="${fn:length(dayList)-1}" step="1">
			
			<!-- 오늘이면 -->
			<%-- <c:if test="${i+1 eq calendarDTO.today }">
				<td class="today">
					<div class="date">
			</c:if> --%>
			
			<!-- 토요일이면 -->
			<c:if test="${week%7==0}">
				<td class="sat_day" onclick="location.href='ledgerViewDay.do?stringDate=${dayList[i] }&cmd=choiceDay'"  style="cursor:pointer;">
						<div class="sat" >
			</c:if>
			
			<!-- 일요일이면 -->
			<c:if test="${week%7==1}">
				<td class="sun_day" onclick="location.href='ledgerViewDay.do?stringDate=${dayList[i] }&cmd=choiceDay'"  style="cursor:pointer;">
					<div class="sun">
			</c:if>
			
			<!-- 그외  -->
			<c:if test="${week%7!=0 && week%7!=1}">
				<td class="normal_day" onclick="location.href='ledgerViewDay.do?stringDate=${dayList[i] }&cmd=choiceDay'"  style="cursor:pointer;">
					<div class="date">
			</c:if>
			
			<!-- 달력 날짜 기입 -->
			${i+1 }
			
			<br>
			
			<!-- 당일에 해당하는 수입/지출 금액 합산 -->
			<c:set var="insum" value="0"/>	<!-- 수입 -->
			<c:set var="outsum" value="0"/>	<!-- 지출 -->
			
			<!-- ----------------- 해당일에 수입-지출 넣기 ---------------------- -->
			<!-- 날짜에 해당하는 list의 size가 0이상일 경우 내용을 for문을 통해서 출력 -->
			<c:set var="list" value="${monthMap[dayList[i]] }"/>	<!-- 키값을 넣고 list 빼옴 -->
			<c:if test="${fn:length(list) ne 0  }"> <!-- 리스트의 사이즈가 0이 아닐때 -->
				<c:forEach var="ledgerDTO" items="${list }">	<!-- 가계부 리스트 for문돌림 -->
					<c:if test="${ledgerDTO.inOut eq '수입'}" >	
						<c:set var="insum" value="${insum+ledgerDTO.income }"/>	<!-- 해당일의 수입 합계 -->
					</c:if>
					<c:if test="${ledgerDTO.inOut eq '지출'}" >
						<c:set var="outsum" value="${outsum+ledgerDTO.spand }"/> 	<!-- 해당일의 지출 합계 -->
					</c:if>
				</c:forEach>
			</c:if>
			
			<div class="date_inout">
			<c:if test="${insum ne 0 }"><!-- 수입O -->
				<div class="insum"><fmt:formatNumber value="${insum}" groupingUsed="true"/></div>
			</c:if>
			<c:if test="${outsum ne 0 }"><!-- 지출O  -->
				<div class="outsum"><fmt:formatNumber value="${outsum}" groupingUsed="true"/></div>
			</c:if>
			</div>
			
		
			</td>
			</div>
			<c:if test="${week%7==0 }"><!-- 토요일 일경우 -->
				</tr><tr>
			</c:if>
			<c:set var="week" value="${week+1 }"/>
		</c:forEach>
		</tr>
	</tbody>
	</table>

</div>
</div>
</body>
</html>