<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<title></title>
<script type="text/javascript">
	window.onload=function(){
		
		if('${cmd}'=='write'){
			 <c:if test="${su > 0}">
	         alert("�������׿� ���� ��ϵǾ����ϴ�.");
	   		location.href="NoticeBoardList.do"; 
	      </c:if>
	      <c:if test="${su eq 0}">
	         alert("�������׿� ���� ��ϵ��� ���Ͽ����ϴ�.");
	         location.href="NoticeBoardWriteForm.do"; 
	      </c:if>
		 }
		
		if('${cmd}'=='delete'){
			 <c:if test="${su > 0}">
	         alert("�������׿� ���� �����Ǿ����ϴ�.");
	   		location.href="NoticeBoardList.do"; 
	      </c:if>
	      <c:if test="${su eq 0}">
	         alert("�������׿� ���� �������� ���Ͽ����ϴ�.");
	         location.href="NoticeBoardList.do"; 
	      </c:if>
		 }
		
		if('${cmd}'=='modify'){
			<c:if test="${su > 0}">
	         alert("�������׿� ���� �����Ǿ����ϴ�.");
	   		location.href="NoticeBoardList.do?pg=${pg}&seq=${seq}"; 
	      </c:if>
	      <c:if test="${su eq 0}">
	         alert("�������׿� ���� �������� ���Ͽ����ϴ�.");
	         location.href="NoticeBoardList.do?pg=${pg}&seq=${seq}"; 
	      </c:if>
		}
	}
</script>
</head>
</html>