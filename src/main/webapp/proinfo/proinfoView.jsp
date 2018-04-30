<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="proinfocss/proinfo.css?ver=1" />

<script type="text/javascript">
	$(document).ready(function(){
		
		// 수정 버튼 눌렸을때 
		 $("#modify_btn").click(function(){
			 location.href="proinfoModifyForm.do?seq=${proinfoDTO.seq}";
	     });
		
		// 삭제 버튼 눌렸을때 
		 $("#delete_btn").click(function(){
			 location.href="proinfoDelete.do?seq=${proinfoDTO.seq}";
	     });
		
		 
        $("#glayLayer").fadeIn(300);
        $("#overLayer").fadeIn(200);
        return false;
        
       
       
	});
	
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

</script>
<title>전문지식 보기</title>
</head>
<body>
	<div class="container">
	<c:set var="text" value="${keyword }" />
	<c:set var="len" value="${fn:length(text) }" />
	<input type="hidden" name="keyword_c" value="${keyword_c }"/>
	<input type="hidden" name="list_n" value="${list_n }"/>
	<input type="hidden" name="list_t" value="${list_t }"/>
      <div id='glayLayer'></div>
      <div id='overLayer'>
         <div class="ol_top" align="right">
         <c:if test="${list_t eq 's' }">
         <input type="button" id="cancel" onclick="location.href='search.do?keyword=${fn:substring(text,1,len-1)}'" value="x"/>
         </c:if>
         <c:if test="${list_t eq 'c' }">
         <input type="button" id="cancel" onclick="location.href='proinfoMain.do'" value="x"/>
         </c:if>
         </div>
         <div class="ol_left" onclick="left_btn_check()"></div>
         <div class="ol_center">
         	<div id="select" class="select">		<!-- 카테고리 -->
         		<label>카테고리 : ${proinfoDTO.category }</label>
         	</div>
         	<div  class="subject">					<!-- 제목 -->
         		<label>제목 : ${proinfoDTO.subject }</label>
         	</div>
         	<div class="contents">					<!-- 내용 -->
         		<label>내용 : ${proinfoDTO.contents }</label>
         	</div>
         	<div id="imgFile" class="imgFile">		<!-- 이미지  -->
         		이미지 : <img src="../proinfoimg/${proinfoDTO.imgFile }" width="130" height="150">
         	</div>
         	<div class="insert_btn"> 				<!-- 수정 삭제 버튼 -->
         		<input type="button" id="modify_btn" value="수정">
         		<input type="button" id="delete_btn" value="삭제">
         	</div>
         </div>
         <div class="ol_right" onclick="right_btn_check()"></div>
      </div>
   </div>
</body>
</html>