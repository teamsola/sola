<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="ledgercss/ledgerViewAll.css?ver=1" />

<script type="text/javascript">

	$(document).ready(function() {
			var dayincome = 0;	// 하루 수입
			var dayspand = 0;	// 하루 지출
			var totalIncome = 0;// 한달 수입
			var totalSpand = 0;	// 한달 지출
			var inoutHTML = "";	// 수입-지출 div 코드
			var contentHTML="";	// 내용을 담을 변수
			var tempIncome=0;	// 처음에 수입 합산을 위한 변수
			var tempSpand=0;	// 처음에 지출 합산을 위한 변수
			
			<c:set var="count" value="start"/>	// 당일 수입 지출
			<c:set var="compareDate" value="null"/>	// 지금의 날을 비교
			<c:forEach var="ledgerDTO" items="${ledgerList }">
				
				// ============== 하루 수입 - 지출 계산 ==================
				<c:if test="${ledgerDTO.stringDate ne compareDate}">	// 날이 다를때
					dayincome = 0;	
					dayspand = 0;	
				<c:forEach var="ledgerDTO_2" items="${ledgerList }">	// 당일 수입 계산
					<c:if test="${ledgerDTO.stringDate eq ledgerDTO_2.stringDate}">	// 날이 같을때
						<c:if test="${ledgerDTO_2.inOut eq '수입' }">
							dayincome+=Number('${ledgerDTO_2.income }');
						</c:if>
						<c:if test="${ledgerDTO_2.inOut eq '지출' }">
							dayspand+=Number('${ledgerDTO_2.spand }');
						</c:if>
					</c:if>
				</c:forEach>
				</c:if>
			
				// 계산 작업 & 붙일 데이터 모으는 작업
				<c:if test="${ledgerDTO.inOut eq '수입' }">
					totalIncome += Number('${ledgerDTO.income }');	// 한달 수입
					inoutHTML = "<div class=\"inout\"><span class=\"income\">"+addComma('${ledgerDTO.income }')+"</span></div>";
				</c:if>
				<c:if test="${ledgerDTO.inOut eq '지출' }">
					totalSpand += Number('${ledgerDTO.spand }');	// 한달 지출
					inoutHTML = "<div class=\"inout\"><span class=\"spand\">"+addComma('${ledgerDTO.spand }')+"</span></div>";
				</c:if>
				
				<c:if test="${compareDate ne ledgerDTO.stringDate || compareDate eq 'null'}">	// 날이 다르거나 처음일 경우
				<c:set var="compareDate" value="${ledgerDTO.stringDate}"/>
				
					var subTitle1 = "<div class=\"subTitle1\">${ledgerDTO.stringDate }</div>";
					var subTitle2 = "<div class=\"subTitle2\">수입 : "+addComma(dayincome)+" </div>";
					var subTitle3 = "<div class=\"subTitle3\">지출 : "+addComma(dayspand)+"</div>";
					$(".contents_center").append("<div class=\"totalSubTitle\" onclick=\"location.href='ledgerViewDay.do?stringDate=${ledgerDTO.stringDate }&cmd=choiceDay'\">"
											+subTitle1+subTitle2+subTitle3+"</div");
					
					
					StringHTML = ""; 
					<c:set var="compareDate" value="${ledgerDTO.stringDate }"/>
					
				</c:if>
				
				// 해당 카테고리와 내용
				
				<c:if test="${empty ledgerDTO.content}">	// 내용이 없으면
					contentHTML = "<div class=\"category\">${ledgerDTO.category }</div><div class=\"l_content\">내용 없음</div>";
				</c:if>
				
				<c:if test="${!empty ledgerDTO.content}">	// 내용이 있으면
					contentHTML = "<div class=\"category\">${ledgerDTO.category }</div><div class=\"l_content\">${ledgerDTO.content }</div>";
				</c:if>
										
				$(".contents_center").append("<div class=\"contentLine\" "+
								"onclick=\"location.href='ledgerViewDetail.do"+
								"?stringDate=${ledgerDTO.stringDate }&seq=${ledgerDTO.seq}'\">"
										+contentHTML+inoutHTML+"</div>");	
			</c:forEach>
			
			$(".title_income").html("수입 : <span class=\"income\">"+addComma(totalIncome)+"</span>");
			$(".title_spand").html("지출 : <span class=\"spand\">"+addComma(totalSpand)+"</span>");
			$(".title_sum").text("합계 : "+addComma(totalIncome-totalSpand));
			
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

<title>일일 보기</title>
</head>
<body>
	
	<!-- 흐릿한 뒷 배경 -->
	<div id="ledger_background"></div>
	
	<div class="ledger_body">

		<div class="top">
			<div class="close" onclick="location.href='calendar.do?cmd=main'">x</div>
			<div class="before" onclick="javascript:history.back()">←</div>
			<div class="subject">일일 보기</div>
		</div>

		<div class="bottom">
		
			<!-- 이전달 --> 
			<div class="view_before" onclick="location.href='ledgerViewAll.do?year=${calendarDTO.year }&month=${calendarDTO.month-1 }'"
						style="cursor: pointer;">
			</div>
			<div class="view_center">
				<div class="info">${calendarDTO.year }년    ${calendarDTO.month+1 }월</div><!-- 해당년 월 -->
				<div class="contents">
					<div class="contents_top">
						<div class="title_income">수입</div>
						<div class="title_spand">지출</div>
						<div class="title_sum">합계</div>
					</div>
					<div class="contents_center auto"></div>
				</div>
			</div>
			
			<!-- 다음날 --> 
			<div class="view_after" onclick="location.href='ledgerViewAll.do?year=${calendarDTO.year }&month=${calendarDTO.month+1 }'"
							style="cursor: pointer">
			</div>
		</div>
	</div>
	
</body>
</html>