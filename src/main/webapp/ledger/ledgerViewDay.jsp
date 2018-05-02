<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="ledgercss/ledgerViewTitle.css" />
<link rel="stylesheet" type="text/css" href="ledgercss/ledgerViewDay.css?ver=3" />

<script type="text/javascript">

$(document).ready(function() { 
	var totalInSum = 0;	// 하루 총 수입
	var totalOutSum	=0;	// 하루 총 지출
	var numberFormat;
	<c:forEach var="list" items="${todayList}">
		
		<c:if test="${list.income ne 0 }">	<!-- 수입이 0이 아닐경우 -->
			totalInSum += Number('${list.income }');
			numberFormat = addComma('${list.income }');
			$(".cateinout").append("<div class=\"inner\" onclick=\"location.href='ledgerViewDetail.do?stringDate=${stringDate }&seq=${list.seq}'\"> <div class=\"cate\">${list.category }</div><div class=\"inout\"> <span style=\"color:blue\">"+numberFormat+"</span></div></div><br>");
		</c:if>
		<c:if test="${list.spand ne 0 }">	<!-- 지출이 0이 아닐경우 -->
			totalOutSum +=Number('${list.spand }');
			numberFormat = addComma('${list.spand }');
			$(".cateinout").append("<div class=\"inner\" onclick=\"location.href='ledgerViewDetail.do?stringDate=${stringDate }&seq=${list.seq}'\"> <div class=\"cate\">${list.category }</div><div class=\"inout\"> <span style=\"color:red\">"+numberFormat+"</span></div></div><br>");
		</c:if>
		$(".inner").css("cursor","pointer");
		
		
	</c:forEach>
	<c:if test="${fn:length(todayList) eq 0  }">
		$(".cateinout").text("등록된 가계부가 없습니다.");
	</c:if>
	if(totalInSum!=0 || totalOutSum!=0){
		$(".info").html("수입 : <span style=\"color:blue\">"+addComma(totalInSum)+"</span> &nbsp;&nbsp;&nbsp; 지출 : <span style=\"color:red\">"+addComma(totalOutSum)+"</span>");
	}
	
	// 이전 마우스 올릴때
	$(".view_before").hover(function(){
		$(this).css("background","url('ledgerimg/arrowleft_hover.png') no-repeat");
	}, function(){
		$(this).css("background","url('ledgerimg/arrowleft.png') no-repeat");
	});
	
	/* // 이전 클릭되었을때
	$(".view_before").action(function(){
		$(this).html("<img src=\"ledgerimg/arrowleft_active.png\"/>");
	}); */
	
	// 다음 마우스 올릴때
	$(".view_after").hover(function(){
		$(this).css("background","url('ledgerimg/arrowright_hover.png') no-repeat");
	}, function(){
		$(this).css("background","url('ledgerimg/arrowright.png') no-repeat");
	});
	
	
	/* // 다음 클릭되었을때
	$(".view_after").action(function(){
		$(this).html("<img src=\"ledgerimg/arrowright_active.png\"/>");
	}); */
	
	// 등록 버튼 색
	$(".ledger_insertform_btn").hover(function(){
		$(this).css('color','#ff8400');
	}, function(){
		$(this).css('color','white');
	})
	
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
<style>
</style>
<title>하루 보기</title>
</head>
<body>
	<!-- 흐릿한 뒷 배경 -->
	<div id="ledger_background"></div>
	<div class="container">
	<div class="ledger_body">

		<div class="top">
			<div class="close" onclick="location.href='calendar.do?cmd=main'">x</div>
			<div class="before" onclick="javascript:history.back()">←</div>
			<div class="subject">가계부 하루보기</div>
		</div>

		<div class="bottom">
		
			<!-- 이전날 --> 
			<div class="view_before" onclick="location.href='ledgerViewDay.do?stringDate=${stringDate }&cmd=before'"
						style="cursor: pointer;">
			</div>
			<div class="view_center">
				<div class="info"></div><!-- 수입/지출 들어갈 자리 -->
				
				<div class="contents">
					<div class="contents_top">
						<div class="text_subject">날짜 :</div>
						<div class="text_desc">
							<label class="text_type1">${stringDate }</label>
						</div>
					</div>
					<div class="contents_center">			
						<div class="text_subject">항목 :</div>
						<div class="text_desc2 auto">
							<div class="cateinout"></div>
						</div>
					</div>
					<div class="contents_bottom">		
							<!-- 가계부 등록 -->
							<button type="button" class="ledger_insertform_btn pointer"
									onclick="location.href='ledgerInsertForm.do?stringDate=${stringDate }'" style="cursor: pointer">
									가계부 등록</button>
					</div>	
				</div>
			</div>
			<!-- 다음날 --> 
			<div class="view_after" onclick="location.href='ledgerViewDay.do?stringDate=${stringDate }&cmd=after'"
							style="cursor: pointer;">
			</div>
		</div>
	</div>
	</div>
</body>
</html>