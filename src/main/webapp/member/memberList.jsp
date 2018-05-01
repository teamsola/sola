<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function isLogin(id) {	
		if('${adId}' == null) { 
			alert("먼저 로그인 하세요");
		} else { 			
			location.href="memberView.do?id=" + id + "&pg=" + ${pg};
		}
	}
	$(#memId).on('click',function(e)){
		e.stopPropagation();
	}
</script>
<style type="text/css">
.container {
	width: 1000px;
	height: 800px;
	margin: auto;
	margin-top: 50px;
}

th {
	font-size: 14px;
}

td {
	font-size: 12px;
}

#memId {
	font-weight: bold;
	text-decoration: none;
	color: black;
}

table {
	margin: auto;
	width: 800px;
	border: 2px solid #6a6763;
	border-spacing: 0;
}

th {
	border-bottom: 2px solid #6a6763;
	border-left: none;
	border-right: none;
}

.t_page {
	margin-top: 10px;
}

.t_page a {
	text-decoration: none;
}

h2 {
	margin-left: 200px;
	margin-top: 0;
	margin-bottom: 70px;
}

.search {
	width: 1000px;
	margin: auto;
}

.searchbt {
	margin-right: 120px;
	width: 30px;
	height: 25px;
}

.keyword {
	width: 150px;
	height: 20px;
}
.searchR{
	margin-bottom: 15px;
	margin-left: 150px;
}
</style>
</head>
<body>
	<h2>회원 목록</h2>
	<form name=" " method="post" action="searchList.do?pg=1">
		<div class="search" align="right">
			<select name="searchOp" id="searchOp"
				style="width: 100px; height: 25px; padding: 3px; margin: 3px;">
				<option value="id"
					<c:out value="${searchOp == 'id'?'selected':''}"/>>아이디</option>
				<option value="name"
					<c:out value="${searchOp == 'name'?'selected':''}"/>>성명</option>
				<option value="nickname"
					<c:out value="${searchOp == 'nickname'?'selected':''}"/>>별명</option>
				<option value="grade"
					<c:out value="${searchOp == 'grade'?'selected':''}"/>>등급</option>
			</select>
			<c:set var="text" value="${keyword }" />
			<c:set var="len" value="${fn:length(text) }" />
			<input name="keyword" class="keyword" type="text"
				value="${fn:substring(text,1,len-1)}" /> <input name="searchbt"
				class="searchbt" type="submit" value="." />
		</div>

		<div class="container">
		<div class="searchR">
		<c:if test="${!empty totalS}">
			<label >검색결과 ${totalS }건</label>
		</c:if>
		<c:if test="${empty totalS}">
		</c:if>
		</div>
			<table cellpadding="5">
				<tr>
					<th width="140">아이디</th>
					<th width="100">성명</th>
					<th width="100">별명</th>
					<th width="160">전화번호</th>
					<th width="100">가입일자</th>
					<th width="100">등급</th>
					<th width="100">스코어</th>
				</tr>
				<c:if test="${!empty list}">
					<c:forEach var="memberDTO" items="${list }">
						<tr>
							<td align="center"><a id="memId"
								href="memberView.do?id=${memberDTO.id}"event)" >${memberDTO.id }</a></td>
							<td align="center">${memberDTO.name }</td>
							<td align="center">${memberDTO.nickname }</td>
							<td align="center">${memberDTO.tel1 }-${memberDTO.tel2 }-${memberDTO.tel3 }</td>
							<td align="center">${memberDTO.joinDate }</td>
							<td align="center">${memberDTO.grade }</td>
							<td align="center">${memberDTO.score }</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty list}">
					<tr>
						<td colspan="7" align="center">검색 결과가 없습니다.</td>
					</tr>
				</c:if>
			</table>
			<!-- 페이징 -->
			<div class="t_page" align="center">
				<c:if test="${empty keyword }">
					<c:if test="${ startPage > 3}">			
				[<a id="paging" href="memberList.do?pg=${startPage-1}">이전</a>]
			</c:if>
					<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
						<c:if test="${i==pg}">		
						[<a id="currentPaging" href="memberList.do?pg=${i }">${i }</a>]
					</c:if>
						<c:if test="${i!=pg}">	
						[<a id="paging" href="memberList.do?pg=${i }">${i }</a>]
					</c:if>
					</c:forEach>
					<c:if test="${endPage < totalP}">			
					[<a id="paging" href="memberList.do?pg=${endPage+1}">다음</a>]			
			</c:if>
				</c:if>
				<c:if test="${!empty keyword }">
					<c:if test="${ startPage > 3}">			
				[<a id="paging"
							href="searchList.do?pg=${startPage-1}&searchOp=${searchOp}&keyword=${fn:substring(text,1,len-1)}">이전</a>]
			</c:if>
					<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
						<c:if test="${i==pg}">		
						[<a id="currentPaging"
								href="searchList.do?pg=${i }&searchOp=${searchOp}&keyword=${fn:substring(text,1,len-1)}">${i }</a>]
					</c:if>
						<c:if test="${i!=pg}">	
						[<a id="paging"
								href="searchList.do?pg=${i }&searchOp=${searchOp}&keyword=${fn:substring(text,1,len-1)}">${i }</a>]
					</c:if>
					</c:forEach>
					<c:if test="${endPage < totalP}">			
					[<a id="paging"
							href="searchList.do?pg=${endPage+1}&searchOp=${searchOp}&keyword=${fn:substring(text,1,len-1)}">다음</a>]			
			</c:if>
				</c:if>

			</div>

		</div>
	</form>
</body>
</html>