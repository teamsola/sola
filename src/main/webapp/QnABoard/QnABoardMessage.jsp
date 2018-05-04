<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	window.onload=function(){
		if('${cmd}'=='write'){
			 <c:if test="${su > 0}">
	         alert("질문&답변에 글이 등록되었습니다.");
	   		location.href="QnABoardList.do"; 
	      </c:if>
	      <c:if test="${su eq 0}">
	         alert("질문&답변에 글이 등록되지 못하였습니다.");
	         location.href="QnABoardWriteForm.do"; 
	      </c:if>
		 }
		
		if('${cmd}'=='delete'){
			 <c:if test="${su > 0}">
	         alert("게시글이 삭제되었습니다.");
	   		location.href="QnABoardList.do"; 
	      </c:if>
	      <c:if test="${su eq 0}">
	         alert("게시글이 삭제되지 못하였습니다.");
	         location.href="QnABoardList.do"; 
	      </c:if>
		 }
		
		if('${cmd}' == 'modify'){   // 수정 처리 후
	         <c:if test="${su > 0}">
	            alert("질문&답변에 글이 수정되었습니다.");
	      		location.href="QnABoardView.do?pg=${pg}&seq=${seq}"; 
	         </c:if>
	         <c:if test="${su eq 0}">
	            alert("질문&답변에 글이 수정되지 못하였습니다.");
	            location.href="QnABoardView.do?pg=${pg}&seq=${seq}"; 
	         </c:if>
	      }
	}
</script>
</head>
</html>