<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<title></title>
<script type="text/javascript">

window.onload=function(){
	
	 if('${cmd}' == 'modify'){   // 수정 처리 후
         <c:if test="${su > 0}">
            alert("자유게시판에 글이 수정되었습니다.");
      		location.href="FreeBoardView.do?pg=${pg}&seq=${seq}"; 
         </c:if>
         <c:if test="${su eq 0}">
            alert("자유게시판에 글이 수정되지 못하였습니다.");
            location.href="FreeBoardView.do?pg=${pg}&seq=${seq}"; 
         </c:if>
      }
	 
	 if('${cmd}'=='write'){
		 <c:if test="${su > 0}">
         alert("자유게시판에 글이 등록되었습니다.");
   		location.href="FreeBoardList.do"; 
      </c:if>
      <c:if test="${su eq 0}">
         alert("자유게시판에 글이 등록되지 못하였습니다.");
         location.href="FreeBoardWriteForm.do"; 
      </c:if>
	 }
	 
	 if('${cmd}'=='delete'){
		 <c:if test="${su > 0}">
         alert("게시글이 삭제되었습니다.");
   		location.href="FreeBoardList.do"; 
      </c:if>
      <c:if test="${su eq 0}">
         alert("게시글이 삭제되지 못하였습니다.");
         location.href="FreeBoardList.do"; 
      </c:if>
	 }
}
</script>