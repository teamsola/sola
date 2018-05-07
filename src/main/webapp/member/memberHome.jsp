<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	h3
	{
		border-bottom: 2px dashed #e3e4e5; 
	}
	.container{
		text-align: center;
		background-color: white;
		width: 100%;
		min-height: 900px;
		margin: 0;
		padding: 0;
	}
	.in{
		border: 1px solid #e3e7ed;
		width: 400px;
		height: 250px;
		padding: 15px;
		margin: auto;
		margin-top: 30px;
	}
	.profileImg,h3{
		margin-left: 10px;
	}
	label{
		display: inline-block;
		font-weight: bold;
		width: 100px;
		padding: 3px;
	}
	.content{
		margin-left: 10px;
		padding: 3px;
		height: 80%;
	}
	.btn{
		width: 100px;
		height: 35px;
		background-color: #eff1f2;
		color: #6a6763;
		border: 2px solid #e3e4e5;
	}
	.memberHome_top{
		width: 1800px;
		height: 200px;
		background-image: url(/sola/img/123.png);
		background-size: 1530px 200px;
		text-align:left;
		vertical-align:middle; 
		display:table-cell;
	}
	.top_title{
		width: 270px;
		height: 35px;
		font-size:25px;
		padding:10px 13px 10px 3px;
		background: rgba(255,255,255, 0.7);
		
	}
	.top_in{
		margin-left: 20px;
		display:inline-block;
	}
</style>
</head>
<body>
<div class="container">
	<div class="memberHome_top">
		<div class="top_in">
			<span class="top_title">My Info > 기본정보 </span>
		</div>
	</div>
	<div class="in">
	<div class="content" align="left">
		<h3 align="left">프로필</h3><br>
			<table>
				<tr>
					<td>
						<div class="profileImg" align="left">
							<a href="memberProfile.do">
							<img alt="" src="/sola/storage/${memberDTO.profile }" width="100" height="100" /></a>
						</div>
					</td>
					<td>
						<div class="content" align="left">
						<label>별명</label>${memberDTO.nickname }<br>
						<label>등급</label>${memberDTO.grade }<br>
						</div>
					</td>
				</tr>
			</table>
			<br>
		</div>
<!-- 			<div><input type="button" class="btn" value="프로필 설정" onclick="location.href='memberProfile.do'"/></div> -->
	</div>
	<div class="in">
		<div class="content" align="left">
		<h3 align="left">개인정보</h3><br>
		<label>이메일</label>
		<c:set var="text" value="${memberDTO.email1 }"/>
		<c:set var="len" value="${fn:length(text) }"/>
		${fn:substring(text,0,2)}
		<c:forEach var="i" begin="1" end="${fn:length(text)-2}" step="1">
			<c:out value="*"></c:out>
		</c:forEach>
		@
		<c:set var="text" value="${memberDTO.email2 }"/>
		<c:set var="len" value="${fn:length(text) }"/>
		${fn:substring(text,0,2)}
		<c:forEach var="i" begin="1" end="${fn:length(text)-2}" step="1">
			<c:out value="*"></c:out>
		</c:forEach><br>
		<label>휴대전화</label>
		${memberDTO.tel1 }-
		<c:set var="text" value="${memberDTO.tel2 }"/>
		<c:set var="len" value="${fn:length(text) }"/>
		${fn:substring(text,0,1)}
		<c:forEach var="i" begin="1" end="${fn:length(text)-1}" step="1">
			<c:out value="*"/>
		</c:forEach>-
		<c:set var="text" value="${memberDTO.tel2 }"/>
		<c:set var="len" value="${fn:length(text) }"/>
		<c:forEach var="i" begin="1" end="${fn:length(text)-1}" step="1">
			<c:out value="*"/>
		</c:forEach>
		${fn:substring(text,0,1)}<br><br><br><br>
		</div>
<!-- 		<div><input type="button" class="btn" value="개인정보 수정" onclick="location.href='checkPwd.do'"/></div> -->
	</div>
</div>
</body>
</html>