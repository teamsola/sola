<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
#subjectA{
	color:black;
}
#none{
	padding-top:100px;
	padding-bottom:60px;
}
#aa{
	margin-top: 70px;
	font-weight: bold;
	text-align:center;
}

#line1{
	border-top: 1px solid #ff8400;
	width:200px;
}

table{
	margin:auto;
	width:1000px;
}

th{
	background-color:#F6F6F6;
	height:30px;
}


#top{
	margin-top:50px;
	margin-bottom:10px;
}

select { 
	background: url(이미지 경로) no-repeat 95% 50%; /* 화살표 모양의 이미지 */ 
	width: 100px; /* 원하는 너비설정 */ 
	padding: .4em .9em; /* 여백으로 높이 설정 */ 
	font-family: inherit; /* 폰트 상속 */ 
	background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
	border: 1px solid #999; 
	border-radius: 0px; /* iOS 둥근모서리 제거 */ 
	-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
	-moz-appearance: none; 
	appearance: none;
	
} /* IE 10, 11의 네이티브 화살표 숨기기 */ 

select::-ms-expand { 
	display: none; 
}

#category{
	float:left;
}

#writebtn{
	margin-left:1125px;
	outline:none;
	text-decoration:none;
	text-indent:0px;
	line-height:16px;
	text-align:center;
	vertical-align:middle;
	display:inline-block;
	font-size:15px;
	background-color:#ffffff;
	color:#6a6763;
	height:30px;
	border-color:#6a6763;
	border-width:1px;
	border-style:solid;
}

#writebtn:hover{
	
	outline:none;
	background-color:#6a6763;
	color:#ffffff;
	border-color:#6a6763;
	border-style:solid;
}
/* 
#btnset{
	text-align:center;
	float:left;
	width:100%;
} */

#btn{
	margin-top:40px;
	margin-bottom:30px;
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
	color:#ff8400;
	width:150px;
	height:30px;
	border-color:#ff8400;
	border-width:1px;
	border-style:solid;
}

#btn:hover{
	margin-top:40px;
	margin-bottom:30px;
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
	background-color:#ff8400;
	color:#ffffff;
	width:150px;
	height:30px;
	border-color:#ff8400;
	border-width:1px;
	border-style:solid;
}

#line{
    border: 0.5px solid #EAEAEA;
}
#searchset{
	margin-top:30px;
	margin-left:845px;
	float:left;
	text-align:center;
}

#search{
	float:left;
}

#keyword{
	margin-left:7px;
	border-style: none;
    font-size: 15px;
    padding: 5px;
    position: relative;
    bottom: 14px;
    border: 1px solid #ff8400;
    box-sizing: border-box;
}

#paging,#currentPaging{
	text-align:center;
	margin:auto;
}

#paging{
    padding:5px;  
    width:15px;  
    color:#000;  
    font:bold 12px tahoma;  
    border:1px solid #eee;  
    text-align:center;  
    text-decoration:none;  
}

#currentPaging{
    padding:5px;  
    width:15px;  
    background-color:#6a6763;
    color:#ffffff;  
    font:bold 12px tahoma;  
    border:1px solid #6a6763;  
    text-align:center;  
    text-decoration:none;  
}


</style>


<script type="text/javascript">
	function isLogin(seq){
	
		var pg='${pg}';
		location.href="NoticeBoardView.do?seq="+seq+"&pg="+${pg};
	}
	
	function check(){
			
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

<div id="aa">공지사항</div>
	<hr id="line1">
	
	
	
	<div id="top">

	<!-- 글쓰기 버튼 -->
	<div style="width:1000px;display: inline-block;text-align: right;">
	<input type="button" id="writebtn" value="글쓰기" onclick="location.href='NoticeBoardWriteForm.do'">
	</div>
	</div>
	
	
	
	
		<table>
							
				<tr>
					<th width=70>번호</th>
					<!-- <th width=70>분류</th> -->
					<th width=250>제목</th>
					<th width=100>작성자</th>
					<th width=100>날짜</th>
					<th width=70>조회</th>
				</tr>
				
			
			<c:forEach var="noticeboard" items="${list }">
					<tr>
						<td align=center>${noticeboard.seq }
						<%-- <td align=center>${freeboard.category } --%>
						<td><a id = subjectA href="#" onclick="isLogin(${noticeboard.seq})">
							${noticeboard.subject }</a>
							
						<td align = center>${noticeboard.nickname }
						<td align = center>${noticeboard.logtime }
						<td align = center>${noticeboard.hit }
					</tr>
					
					<tr>
						<td colspan="6"><hr id="line">
					</tr>
			</c:forEach>
			<c:if test="${fn:length(list) == 0 }">
				<tr>
					<td>
				</tr>
				
				<tr>
					<td colspan="6" align="center" id="none"> 등록된 글이 없습니다.
				</tr>
			</c:if>		
				<!-- 페이징 -->
				<tr>
					<td colspan=5 align=center>
					<c:if test="${startPage>3}"><!--  [1][2][3]인경우 [이전]보이지않음 -->
						<a id="paging" href="NoticeBoardList.do?pg=${startPage-1}">이전</a>  <!-- 이전 누를시 [startpage-1] 로 이동 -->
					</c:if>
					
					<c:forEach var="i" begin="${startPage}" end="${ endPage}" step="1">
						
						<c:if test="${i==pg}">
							<a id="currentPaging" href="NoticeBoardList.do?pg=${i }">${i }</a>  <!-- 현재페이지=빨간색 -->
						</c:if>
						
						<c:if test="${i!=pg }">
							<a id="paging" href="NoticeBoardList.do?pg=${i }">${i }</a>  <!-- 현재페이지 아닌곳=파란색 -->
						</c:if>
					</c:forEach>
					
					<c:if test="${endPage<totalP}"> <!-- 2페이지까지 있을경우 endPage=totalP-->
						<a id="paging" href="NoticeBoardList.do?pg=${endPage+1}">다음</a>  <!-- endPage가 총 페이지수보다 작을때 [다음] 표시 -->
					</c:if>
				</tr>
	
		</table>
	
	
	
		
		
		
		
		<div id="searchset">
			<div id="search">
				<form action="NoticeBoardList.do" method="post" name="noticesearch" id="noticesearch">
					<input type="text" name="keyword" id ="keyword" placeholder="검색어를 입력하세요"/>
					<img id="keywordbtn" src="/sola/img/searchBtn.png" name="keywordbtn" onclick="check()" width="36px" height="34px">
				</form>
			</div>
		</div>
	
	
	

</body>
</html>