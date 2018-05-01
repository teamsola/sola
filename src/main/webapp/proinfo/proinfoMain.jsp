<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="proinfocss/proinfo.css?ver=2" />

</head>
<body>
<form name="proinfoMain" method="post" action="search.do?pg=1">
<input type="hidden" name="list_t" value="${list_t }"/>
	<div class="container">
<div id='glayLayer'></div>
		<div id='overLayer'>
			<div class="ol_top" align="right"><input type="button" id="cancel" value="x"/></div>
			이전 div
			<div class="ol_left" onclick="left_btn_check()"></div>
			
			가운데 div
			<div class="ol_center">검색결과 (리스트) / 상세보기 들어갈 자리</div>
			
			다음 div
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
				class="searchbt" type="submit" value="검색" />
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