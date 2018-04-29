<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<title>가계부 입력 결과</title>
<script type="text/javascript">
	$(document).ready(function() {
		
		if('${cmd}' == 'insert'){	// 입력 처리 후
			<c:if test="${su > 0}">
				alert("가계부가 저장되었습니다.");
				location.href="ledgerViewDay.do?cmd=insert&stringDate=${stringDate}"; 
			</c:if>
			<c:if test="${su eq 0}">
				alert("가계부가 저장되지 못하였습니다.");
				location.href="ledgerViewDay.do?cmd=insert&stringDate=${stringDate}"; 
			</c:if>
			
		}else if('${cmd}' == 'delete'){	// 삭제 처리 후
			<c:if test="${su > 0}">
				alert("가계부가 삭제되었습니다.");
				location.href="ledgerViewDay.do?cmd=delete&stringDate=${stringDate}"; 
			</c:if>
			<c:if test="${su eq 0}">
				alert("가계부가 삭제되지 못하였습니다.");
				location.href="ledgerViewDay.do?cmd=delete&stringDate=${stringDate}"; 
			</c:if>
			
		}else if('${cmd}' == 'modify'){	// 수정 처리 후
			<c:if test="${su > 0}">
			alert("가계부가 수정되었습니다.");
			location.href="ledgerViewDay.do?cmd=modify&stringDate=${stringDate}"; 
		</c:if>
		<c:if test="${su eq 0}">
			alert("가계부가 수정되지 못하였습니다.");
			location.href="ledgerViewDay.do?cmd=modify&stringDate=${stringDate}"; 
		</c:if>
		}
		
		// 불투명 바탕화면 누르면 달력으로
		$("#ledger_background").click(function(){
			location.href='calendar.do?cmd=main';
		});
	});
</script>
