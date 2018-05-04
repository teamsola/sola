<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
<script type="text/javascript">
function view(seq){
	location.href="NoticeBoardView.do?seq="+seq+"&pg="+${pg};
}

function search(){
	
	if($('#keyword').val()==''){
		alert("검색어를 입력하세요");
		$('#keyword').focus();
		return false;
	}
		$('#noticesearch').submit();
};

</script>
</head>
<body>
<div id="wrapper">
	
	
	
		<!-- 키워드 검색 -->
		<form action="NoticeBoardList.do" method="post" name="noticesearch" id="noticesearch">
			<div>
			<input type="text" name="keyword" id ="keyword" placeholder="검색어를 입력하세요"/>
			<input type="button" src="/sola/imgsearchBtn.png" name="searchbtn" onclick="search()">
			</div>
		</form>
		
		
		
	
	<div id="body">
		<c:forEach var="noticeboard" items="${list }">
			<div id="article">
				<div>글번호:${noticeboard.seq }</div>
				<div><a href="#" onclick="view(${noticeboard.seq})">제목:${noticeboard.subject }</a></div>
				<div>닉네임:${noticeboard.nickname }</div>
				<div>조회수:${noticeboard.hit }</div>
				<div>작성일시:${noticeboard.logtime }</div>
			</div>
		</c:forEach>
	</div>                                    
</div>
<div id="paging">
		<c:if test="${ startPage > 3}">			
				[<a id="paging" href="NoticeBoardList.do?pg=${startPage-1}">이전</a>]
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">	
					<c:if test="${i==pg}">		
						[<a id="currentPaging" href="NoticeBoardList.do?pg=${i }" >${i }</a>]
					</c:if>	
					<c:if test="${i!=pg}">	
						[<a id="paging" href="NoticeBoardList.do?pg=${i }" >${i }</a>]
					</c:if>
			</c:forEach>	
		
			<c:if test="${endPage < totalP}">			
					[<a id="paging" href="NoticeBoardList.do?pg=${endPage+1}">다음</a>]			
			</c:if>
	</div>
	<div id="bottom">
		<c:if test="${fn:length(memId) < 6 }">	
			<a href="NoticeBoardWriteForm.do">글작성하기</a>
		</c:if>		
			<a href="FreeBoardList.do">자유게시판</a>
			<a href="NoticeBoardList.do">공지사항</a>
			<a href="QnABoardList.do">질문&답변</a>
	</div>
</body>
</html>