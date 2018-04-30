<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="../proinfocss/proinfo.css?ver=2" />
<script type="text/javascript">

function right_btn_check(){
	<c:if test="${list_t eq 'c'}">
		// 다음 리스트가 없을 경우
		<c:if test="${fn:length(list)-1 > list_n}">
			location.href="search_c.do?keyword_c=${keyword_c}&list_n=${list_n+1}";
		</c:if>
		<c:if test="${fn:length(list)-1 <= list_n}">
			alert("다음 페이지가 없습니다.");
		</c:if>
	</c:if>
}

function left_btn_check(){
	<c:if test="${list_t eq 'c'}">
		<c:if test="${list_n gt 0 }">
			location.href="search_c.do?keyword_c=${keyword_c}&list_n=${list_n-1}";
		</c:if>
		<c:if test="${list_n <= 0 }">
			alert("이전 페이지가 없습니다.");
		</c:if>
	</c:if>
}


window.onload=function(){ 
	alert("온로드 들어옴")
	// 검색할 때 
	if(document.proinfoMain.keyword.value != ""){
		alert("검색 눌림");
		$("#glayLayer").fadeIn(300);
		$("#overLayer").fadeIn(200);
		return false;
		
	// 카테고리 누를때
	}else if(document.proinfoMain.keyword_c.value != ""){
		alert("카테고리 눌림");
		$("#glayLayer").fadeIn(300);
		$("#overLayer").fadeIn(200);
		return false;
	}
}

	$(function(){
		
		// 닫기 버튼
		$("#cancel").click(function(){
			//배경레이어의 숨김
			$("#glayLayer").fadeOut(300);
			//이미지 레이어의 숨김
			$("#overLayer").fadeOut(200);
			
			// 이전-다음 정보 리셋
			${list_n = null}
		});
		
		// 검색후 보기버튼 누를때
		$("#seq").click(function(){
			//배경레이어의 숨김
			$("#glayLayer").fadeOut(300);
			//이미지 레이어의 숨김
			$("#overLayer").fadeOut(200);
		});
		
		
		<!-- 검색결과 (리스트) -->
		<c:if test="${list_t eq 's'}">
			<c:if test="${!empty list}">
				// searchListdiv 붙임
				$(".ol_center").append("<div class=\"searchListdiv\"></div>")
				<c:forEach var="proinfoDTO" items="${list }">
					<c:set var="text" value="${keyword }" />
					<c:set var="len" value="${fn:length(text) }" />
						$(".searchListdiv").append("<div class=\"searchList\" onclick=\"location.href='proinfoView.do?seq=${proinfoDTO.seq }&list_n=0&searchOp=${searchOp}&keyword=${fn:substring(text,1,len-1)}'\">${proinfoDTO.subject }</div>");
				</c:forEach>
			</c:if>
			/* 검색 리스트가 없을때 div 에 감싸주어야 한다. */
			<c:if test="${empty list}">검색 결과가 없습니다.</c:if>
		</c:if>
		
		<!-- 상세보기 -->
		<c:if test="${list_t eq 'c'}">	
			$(".ol_center").append("<div class=\"v_subject\">${proinfoDTO.subject }</div>");
			$(".ol_center").append("<div class=\"v_img\"><img alt="" src=\"../proinfoimg/${proinfoDTO.imgFile }\" width=\"100\" height=\"100\"></div>");
			$(".ol_center").append("<div class=\"v_contents\">${proinfoDTO.contents }</div>");
			/* 카테고리 리스트가 없을때 div 에 감싸주어야 한다. */
			<c:if test="${empty list}">검색 결과가 없습니다.</c:if>
		</c:if>
	});
</script>
</head>
<body>
<form name="proinfoMain" method="post" action="search.do?pg=1"> 
<input type="hidden" name="list_t" value="${list_t }"/>
	<div class="container">
		<div id='glayLayer'></div>
		<div id='overLayer'>
			<div class="ol_top" align="right"><input type="button" id="cancel" value="x"/></div>
			<!-- 이전 div -->
			<div class="ol_left" onclick="left_btn_check()"></div>
			
			<!-- 가운데 div -->
			<div class="ol_center"><!-- 검색결과 (리스트) / 상세보기 들어갈 자리 --></div>
			
			<!-- 다음 div -->
			<div class="ol_right" onclick="right_btn_check()"></div>
		</div>
		
		<!-- 메인 div -->
		<div class="inner">
			<!-- 검색 오른쪽 상단 -->
			<div class="proinfo_s" align="right">
				<select name="searchOp" id="searchOp"
				style="width: 100px; height: 25px; padding: 3px; margin: 3px;">
				<option value="subject"
					<c:out value="${searchOp == 'subject'?'selected':''}"/>>제목</option>
				<option value="contents"
					<c:out value="${searchOp == 'contents'?'selected':''}"/>>내용</option>
				</select>
			<input type="hidden" name="keyword_c" value="${keyword_c }"/>
			<input type="hidden" name="list_n" value="${list_n }"/>
			<c:set var="text" value="${keyword }" />
			<c:set var="len" value="${fn:length(text) }" />
			<input name="keyword" class="keyword" type="text"
				value="${fn:substring(text,1,len-1)}" /> <input name="searchbt"
				class="searchbt" type="submit" value="." />
			</div>
			
			<!-- 전, 중, 후 -->
			<div class="in" onclick="location.href='search_c.do?keyword_c=live&list_n=0'">전</div>
			<div class="in" onclick="location.href='search_c.do?keyword_c=living&list_n=0'">중</div>
			<div class="in" onclick="location.href='search_c.do?keyword_c=lived&list_n=0'">후</div>
			
			 <a href="proinfoInsertForm.do">전문지식 입력</a>
		</div>
	</div>
</form>
</body>
</html>