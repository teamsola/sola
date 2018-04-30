<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
body{
	padding-top:100px;
}

a{
	text-decoration:none;
}

#aa{
	font-weight: bold;
	text-align:center;
}

#line1{
	border-top: 1px solid #ff8400;
	width:200px;
}

table{
	margin:auto;
}

th{
	background-color:#F6F6F6;
	height:30px;
}

#top{
	margin-left:530px;
	margin-top:50px;
	margin-bottom:10px;
}
#category{
	float:left;
}

#writebtn{
	margin-left:495px;
	outline:none;
	text-decoration:none;
	text-indent:0px;
	line-height:16px;
	text-align:center;
	vertical-align:middle;
	display:inline-block;
	font-size:15px;
	background-color:#ff8400;
	color:#FFFFFF;
	height:30px;
	border-color:#ff8400;
	border-width:1px;
	border-style:solid;
}

#btnset{
	text-align:center;
	float:left;
	width:100%;
}

#btn{
	margin-top:100px;
	outline:none;
	text-decoration:none;
	text-indent:0px;
	line-height:16px;
	-moz-border-radius:100px;
	-webkit-border-radius:100px;
	border-radius:100px;
	text-align:center;
	vertical-align:middle;
	display:inline-block;
	font-size:15px;
	background-color:#ffffff;
	color:#5D5D5D;
	width:150px;
	height:30px;
	border-color:#4a4949;
	border-width:2px;
	border-style:solid;
}

#line{
    border: 0.5px solid #EAEAEA;
}

#paging,#currentPaging{
	margin:auto;
}
</style>


<script type="text/javascript">
	function isLogin(board_seq){
	
		//var id ='${id}';
		var pg='${pg}';
		
		/* if(id==null){
			alert("먼저 로그인하세요");
		}else{ */
			location.href="mallBoardView.do?board_seq="+board_seq+"&pg="+pg;
		//}
	}
</script>
</head>
<body>

<div id="aa">중고장터</div>
	<hr id="line1">
	
	
	
	<div id="top">

	<!-- 글쓰기 버튼 -->
	<input type="button" id="writebtn" value="글쓰기" onclick="location.href='mallBoardWriteForm.do'">
	</div>
	
	
	
	
		<table>
				<tr>
					<th width=70>번호</th>
					<th width=70>카테고리</th>
					<th width=200>제목</th>
					<th width=100>작성자</th>
					<th width=100>날짜</th>
					<th width=70>조회</th>
				</tr>
				
			<c:forEach var="boardDTO" items="${list }">
					<tr>
						<td align=center>${boardDTO.board_seq }
						<td align=center>${boardDTO.category }
						<td><a id = subjectA href="#" onclick="isLogin(${boardDTO.board_seq})">
							${boardDTO.subject }</a>
							
						<td align = center>${boardDTO.nickname }
						<td align = center>${boardDTO.logtime }
						<td align = center>${boardDTO.hit }
					</tr>
					
					<tr>
						<td colspan="6"><hr id="line">
					</tr>
			</c:forEach>
				
				<!-- 페이징 -->
				<tr>
					<td colspan=5 align=center>
					<c:if test="${startPage>3}"><!--  [1][2][3]인경우 [이전]보이지않음 -->
						<a id="paging" href="boardList.do?pg=${startPage-1}">이전</a>  <!-- 이전 누를시 [startpage-1] 로 이동 -->
					</c:if>
					
					<c:forEach var="i" begin="${startPage}" end="${ endPage}" step="1">
						
						<c:if test="${i==pg}">
							<a id="currentPaging" href="boardList.do?pg=${i }">${i }</a>  <!-- 현재페이지=빨간색 -->
						</c:if>
						
						<c:if test="${i!=pg }">
							<a id="paging" href="boardList.do?pg=${i }">${i }</a>  <!-- 현재페이지 아닌곳=파란색 -->
						</c:if>
					</c:forEach>
					
					<c:if test="${endPage<totalP}"> <!-- 2페이지까지 있을경우 endPage=totalP-->
						<a id="paging" href="boardList.do?pg=${endPage+1}">다음</a>  <!-- endPage가 총 페이지수보다 작을때 [다음] 표시 -->
					</c:if>
				</tr>
	
		</table>
	
	
	
		<!-- 카테고리,키워드 검색 -->
		<form action="mallBoardList.do" method="post">
		
		<div id="category">
			<select name="category">
				<option value="전체" name="전체보기">전체보기</option>
				<option value="판매" name="판매">판매</option>
				<option value="구매" name="구매">구매</option>
			</select>
		</div>
	
		<input type="text" id="keyword" name="keyword">
		<input type="submit" id="keywordbtn" name="keywordbtn" value="찾기">
		</form>
	
	
	
	
	<div id="btnset">
		<input type="button" id="btn" value="메인" onclick="location.href='mallIndex.do'">
	</div>

</body>
</html>