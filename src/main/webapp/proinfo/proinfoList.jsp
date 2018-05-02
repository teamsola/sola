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
<link rel="stylesheet" type="text/css" href="proinfocss/proinfoList.css?ver=2" />
<script type="text/javascript">
	$(document).ready(function(){
		 
        $("#glayLayer").fadeIn(300);
        $("#overLayer").fadeIn(200);
        return false;
        
       
	});
	
	// 검색후 보기버튼 누를때
	$("#seq").click(function(){
		//배경레이어의 숨김
		$("#glayLayer").fadeOut(300);
		//이미지 레이어의 숨김
		$("#overLayer").fadeOut(200);
	});
</script>
</head>
<body>
<div class="container">
<input type="hidden" name="list_t" value="${list_t }"/>
      <div id='glayLayer'></div>
      <div id='overLayer'>
         <div class="ol_top" align="right"><input type="button" id="cancel" onclick="location.href='proinfoMain.do'" value="x"/></div>
         
         <div class="ol_center">
         	<c:if test="${list_t eq 's'}">
			<c:if test="${!empty list}">
				<div class="searchListdiv">
				<c:forEach var="proinfoDTO" items="${list }">
					<c:set var="text" value="${keyword }" />
					<c:set var="len" value="${fn:length(text) }" />
					<div class="searchList" onclick="location.href='proinfoView.do?seq=${proinfoDTO.seq }&list_n=0&searchOp=${searchOp}&keyword=${fn:substring(text,1,len-1)}'">${proinfoDTO.subject }</div>
				</c:forEach>
				</div>
			</c:if>
				
			<!-- 검색 리스트가 없을때 div 에 감싸주어야 한다.  -->
			<c:if test="${empty list}">검색 결과가 없습니다.</c:if>
			</c:if>
         </div>
      </div>
   </div>
</body>
</html>