<%@ page language="java" contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	int rand = Integer.parseInt(request.getParameter("rand"));

	boolean result = true;
	String message = "인증이 완료되었습니다.";
	
	if (result) {
		if (rand != (int)session.getAttribute("rand")) {
			result = false;
			message = "인증이 실패하였습니다.";
		}
	}
	if (result) {
		session.setAttribute("auth", true);
	}
%>
<?xml version='1.0' encoding='UTF-8'?>
<auth>
	<result><%=result%></result>
	<message><%=message%></message>
</auth>