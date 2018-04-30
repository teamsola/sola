<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<title>전문지식 결과</title>
<script type="text/javascript">
	$(document).ready(function() {
		
		if('${cmd}' == 'insert'){	// 입력 처리 후
			<c:if test="${su > 0}">
				alert("전문지식이 저장되었습니다.");
				location.href="proinfoMain.do";
			</c:if>
			<c:if test="${su eq 0}">
				alert("전문지식이 저장되지 못하였습니다.");
				/* location.href="ledgerViewDay.do?cmd=insert&stringDate=${stringDate}";  */
			</c:if>
		}else if('${cmd}' == 'update'){
			<c:if test="${su > 0}">
				alert("전문지식이 수정되었습니다.");
				location.href="proinfoMain.do";
			</c:if>
			<c:if test="${su eq 0}">
				alert("전문지식이 저장되지 못하였습니다.");
				/* location.href="ledgerViewDay.do?cmd=insert&stringDate=${stringDate}";  */
			</c:if>
		}else if('${cmd}' == 'delete'){
			<c:if test="${su > 0}">
			alert("전문지식이 삭제되었습니다.");
			location.href="proinfoMain.do";
		</c:if>
		<c:if test="${su eq 0}">
			alert("전문지식이 삭제되지 못하였습니다.");
			/* location.href="ledgerViewDay.do?cmd=insert&stringDate=${stringDate}";  */
		</c:if>
	}
	});
</script>
