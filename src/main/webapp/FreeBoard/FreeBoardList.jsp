<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
<script type="text/javascript">
	function view(seq){
		location.href="FreeBoardView.do?seq="+seq+"&pg="+${pg};
	}
	
	function search(){
		
		if($('#keyword').val()==''){
			alert("검색어를 입력하세요");
			$('#keyword').focus();
			return false;
		}
			$('#freesearch').submit();
	};

</script>
</head>
<body>
<div id="wrapper">

		<!-- 키워드 검색 -->
	
		<form action="FreeBoardList.do" method="post" name="freesearch" id="freesearch">
			<div>
			<input type="text" name="keyword" id ="keyword" placeholder="검색어를 입력하세요"/>
			<input type="button" src="/sola/imgsearchBtn.png" name="searchbtn" onclick="search()">
			</div>
		</form>

		<div id="body">
			<c:forEach var="freeboard" items="${list }">
				<div id="article">
					<div>No.${freeboard.seq }</div>
					<div><a href="#" onclick="view(${freeboard.seq})">제목:${freeboard.subject }</a></div>
					<div>닉네임:${freeboard.nickname }</div>
					<div>조회수:${freeboard.hit }</div>
					<div>작성일시:${freeboard.logtime }</div>
				</div>
		</c:forEach>
	</div>
</div>
	<div id="paging">
		<c:if test="${ startPage > 3}">			
				[<a id="paging" href="FreeBoardList.do?pg=${startPage-1}">이전</a>]
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">	
					<c:if test="${i==pg}">		
						[<a id="currentPaging" href="FreeBoardList.do?pg=${i }" >${i }</a>]
					</c:if>	
					<c:if test="${i!=pg}">	
						[<a id="paging" href="FreeBoardList.do?pg=${i }" >${i }</a>]
					</c:if>
			</c:forEach>	
		
			<c:if test="${endPage < totalP}">			
					[<a id="paging" href="FreeBoardList.do?pg=${endPage+1}">다음</a>]			
			</c:if>
	</div>
	
<c:if test="${memId != null }">
	<a href="FreeBoardWriteForm.do">글작성하기</a>
</c:if>
	<a href="FreeBoardList.do?pg=1">자유게시판</a>
	<a href="NoticeBoardList.do?pg=1">공지사항</a>
	<a href="QnABoardList.do?pg=1">질문&답변</a>
</body>
</html>