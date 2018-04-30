<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../script/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
window.onload=function(){ 
	if(document.proinfoMain.keyword.value != ""){
		$("#glayLayer").fadeIn(300);
		$("#overLayer").fadeIn(200);
		return false;
	}else if(document.proinfoMain.keyword_c.value != ""){
		$("#glayLayer").fadeIn(300);
		$("#overLayer").fadeIn(200);
		return false;
	}
}

	$(function(){
		//링크를 클릭한경우
		$("a.live").click(function(){
			location.href="search_c.do?keyword_c=live&list_n=0";
			//링크의 페이지 이동 중단
			return false;
		});
		
		$("a.living").click(function(){
			//링크의 페이지 이동 중단
			location.href="search_c.do?keyword_c=living&list_n=0";
			return false;
		});
		
		$("a.lived").click(function(){
			location.href="search_c.do?keyword_c=lived&list_n=0";
			return false;
		});
		
   		$(".btn_r").click(function(){
			location.href="search_c.do?keyword_c=${keyword_c}&list_n=${list_n+1}";
			return false;
		});
   		$(".btn_l").click(function(){
			location.href="search_c.do?keyword_c=${keyword_c}&list_n=${list_n-1}";
			return false;
		}); 
		
		$("#cancel").click(function(){
			//배경레이어의 숨김
			$("#glayLayer").fadeOut(300);
			//이미지 레이어의 숨김
			$("#overLayer").fadeOut(200);
			${index = null}
		});
		$("#seq").click(function(){
			//배경레이어의 숨김
			$("#glayLayer").fadeOut(300);
			
			//이미지 레이어의 숨김
			$("#overLayer").fadeOut(200);
		});
	});
</script>
<style type="text/css">
.container {
	width: 100%;
	height: 100%;
}
.modal{
	
}
.inner{
	width: 1100px;
	height: 600px;;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	margin: auto;
	margin-top: 100px;
}
.in{
	margin: 30px;
	width: 300px;
	height: 500px;
	border: 1px solid;
	float: left;
}
div#glayLayer {
	display: none;
	position: fixed;
	left: 0;
	top: 0;
	height: 100%;
	width: 100%;
	background: black;
	filter: alpha(opacity = 60);
	opacity: 0.60;
}

/*이미지가 표현될 레이어를 화면 중앙에 배치 > 기본적으로 표지되지 않도록 설정*/
div#overLayer {
	display: none;
	position: fixed;
	width: 800px;
	height: 600px;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	margin: auto;
}

.ol_top{
	width: 100%;
	height: 50px;
	background-color: black;
}
.ol_center{
	width: 80%;
	height: 550px;
	background-color: white;
	float: left;
}
.ol_left{
	width: 10%;
	height: 550px;
	background-color: gray;
	float: left;
}
.ol_right{
	width: 10%;
	height: 550px;
	background-color: gray;
	float: left;
}
#cancel{
	width: 50px;
	height: 50px;
	color: white;
	font-size: 30px;
	font-weight: bold;
	background-color: black;
	border: none;
	outline: 0;
	cursor: pointer;
}
.s_result{
	width: 400px;
	margin: auto;
}

.v_subject{
	height: 10%;
}
.v_img{
	height: 30%;
}
.v_contents{
	height: 60%;
}
.v_subject,.v_img,.v_contents{
	border: 1px solid;
	width: 80%;
	margin: auto;
}
</style>
</head>
<body>
<form name="proinfoMain" method="post" action="search.do?pg=1"> 
<input type="hidden" name="list_t" value="${list_t }"/>
	<div class="container">
		<div id='glayLayer'></div>
		<div id='overLayer'>
			<div class="ol_top" align="right"><input type="button" id="cancel" value="x"/></div>
			<div class="ol_left">
				<c:if test="${list_t eq 'c'}">
					<c:if test="${list_n gt 0 }">
						<input type="button" class="btn_l" value="이전"/>
					</c:if>
				</c:if>
			</div>
			<div class="ol_center">
			<c:if test="${list_t eq 's'}">
			
				<c:if test="${!empty list}">
					<table border="1" class="s_result">
						<tr>
							<td>seq</td>
							<td>제목</td>
							<td>카테고리</td>
						</tr>
						<c:forEach var="proinfoDTO" items="${list }">
							<tr>
								<c:set var="text" value="${keyword }" />
								<c:set var="len" value="${fn:length(text) }" />
								<td align="center"><a id="seq" href="proinfoView.do?seq=${proinfoDTO.seq }&list_n=0&searchOp=${searchOp}&keyword=${fn:substring(text,1,len-1)}">${proinfoDTO.seq }</a></td>
								<td align="center">${proinfoDTO.subject }</td>
								<td align="center">${proinfoDTO.category }</td>
							</tr>
						</c:forEach>
					</table>
					<div class="s_result_page" align="center">
						<c:if test="${ startPage > 3}">			
							[<a id="paging" href="search.do?pg=${startPage-1}&searchOp=${searchOp}&keyword=${fn:substring(text,1,len-1)}">이전</a>]
						</c:if>
					<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
						<c:if test="${i==pg}">		
							[<a id="currentPaging" href="search.do?pg=${i }&searchOp=${searchOp}&keyword=${fn:substring(text,1,len-1)}">${i }</a>]
						</c:if>
						<c:if test="${i!=pg}">	
							[<a id="paging" href="search.do?pg=${i }&searchOp=${searchOp}&keyword=${fn:substring(text,1,len-1)}">${i }</a>]
						</c:if>
					</c:forEach>
						<c:if test="${endPage < totalP}">			
							[<a id="paging" href="search.do?pg=${endPage+1}&searchOp=${searchOp}&keyword=${fn:substring(text,1,len-1)}">다음</a>]			
						</c:if>
					</div>
				</c:if>
				</c:if>
				<c:if test="${list_t eq 'c'}">			
					<div class="v_subject">${proinfoDTO.subject }</div>
					<div class="v_img"><img alt="" src="../storage/${proinfoDTO.imgFile }" width="100" height="100"></div>
					<div class="v_contents">${proinfoDTO.contents }</div>
				</c:if>
				<c:if test="${empty list}">
				
				</c:if>
			</div>
			<div class="ol_right">
				<c:if test="${list_t eq 'c'}">
					<c:if test="${fn:length(list)-1 > list_n}">
						<input type="button" class="btn_r" value="다음"/>
					</c:if>
				</c:if>
			</div>
		</div>
		<div class="inner">
			<div class="proinfo_s" align="right">
				<select name="searchOp" id="searchOp"
				style="width: 100px; height: 25px; padding: 3px; margin: 3px;">
				<option value="subject"
					<c:out value="${searchOp == 'subject'?'selected':''}"/>>제목</option>
				<option value="contents"
					<c:out value="${searchOp == 'contents'?'selected':''}"/>>내용</option>
			</select>
			<input type="hidden" name="keyword_c" value="${keyword_c }"/>
			<input type="hidden" name="list_n" value="${list_n }"/>
			<c:set var="text" value="${keyword }" />
			<c:set var="len" value="${fn:length(text) }" />
			<input name="keyword" class="keyword" type="text"
				value="${fn:substring(text,1,len-1)}" /> <input name="searchbt"
				class="searchbt" type="submit" value="." />
			</div>
			<div class="in"><a href="#"  class="live">전</a></div>
			<div class="in"><a href="#" class="living">중</a></div>
			<div class="in"><a href="#" class="lived">후</a></div>
		</div>
	</div>
</form>
</body>
</html>