<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="ledgercss/ledgerViewSearch.css?ver=2" />

<script type="text/javascript">

	$(document).ready(function() {
		<c:if test="${fn:length(ledgerList) ne 0}">	// 검색 결과 O
		var inout = "";	// 수입-지출 문자열
		var money = "";	// 수입 지출에 따른 금액
		var category = "";
		var content = "";
		var contentPlus="";
		
			<c:forEach var="ledgerDTO" items="${ledgerList}">
				// 수입-지출 금액 담기
				<c:if test="${ledgerDTO.inOut eq '수입'}">
					money = "${ledgerDTO.income}";
				</c:if>
				<c:if test="${ledgerDTO.inOut eq '지출'}">
					money ="${ledgerDTO.spand}";
				</c:if>
				
				// 검색 키워드 굵게 표시
				inout = contentBold('${keyword}', '${ledgerDTO.inOut}');
				category = contentBold('${keyword}', '${ledgerDTO.category}');
				money = contentBold('${keyword}', money);
				content = contentBold('${keyword}', '${ledgerDTO.content}');
				contentPlus = contentBold('${keyword}', '${ledgerDTO.contentPlus}');
				
				// 수입-지출 색 지정
				<c:if test="${ledgerDTO.inOut eq '수입'}">
					money = "<span class=\"income\">"+money+"</span>";
				</c:if>
				<c:if test="${ledgerDTO.inOut eq '지출'}">
					money = "<span class=\"spand\">"+money+"</span>";
				</c:if>
				
				$("#contents_center").append("<div class=\"line1\" onclick=\"location.href='ledgerViewDetail.do?stringDate=${ledgerDTO.stringDate }&seq=${ledgerDTO.seq}'\">"
											+"<div class=\"logdate\">${ledgerDTO.logdate}</div>"
											+"<div class=\"inout\">"+inout+"</div>"
											+"<div class=\"category\">"+category+"</div>"
											+"<div class=\"money\">"+money+"</div>"
											+"</div>");
				$("#contents_center").append("<div class=\"line2\">"
											+"<div class=\"content\">"+content+"</div>"
											+"<div class=\"contentplus\">"+contentPlus+"</div>"
											+"</div>");
				
			</c:forEach>
		</c:if>
		
		<c:if test="${fn:length(ledgerList) eq 0}">	// 검색 결과 X
			$("#contents_center").append("<div>검색된 결과가 없습니다.</div>");
		</c:if>
		
		
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

// 검색 키워드가 문자열에 포함되어있을 경우 그 부분만 굵게 표시
function contentBold(keyword, content){
	var result = content.indexOf(keyword);	// 발견시에 찾은 글자의 첫번째를 반환
	var before = "";
	var changeStr = "";
	var afterStr = "";
	if(result != -1){	// 문자 발견
		
		if(result != 0){	// 처음부터 발견하지 못할경우
			before = content.substr(0,result);
		}
		changeStr = "<b>"+content.substr(result, keyword.length)+"</b>";
		afterStr = content.substr((result+keyword.length), content.lenght);
		content = before+changeStr+afterStr;
	}
	return content;
}

	
</script>

<title>검색 보기</title>
</head>
<body>
	
	<!-- 흐릿한 뒷 배경 -->
	<div id="ledger_background"></div>
	
	<div class="ledger_body">

		<div class="top">
			<div class="close" onclick="location.href='calendar.do?cmd=main'">x</div>
			<div class="before" onclick="javascript:history.back()">←</div>
			<div class="subject">검색 결과</div>
		</div>

		<div class="bottom">
			<div class="view_center">
				<div class="info">검색 키워드 : ${keyword }</div><!-- 검색 결과 -->
				<div class="contents">
					<div class="contents_center auto" id="contents_center"></div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>