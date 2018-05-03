<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/sola/proinfocss/proinfoView.css?v=1" />

<script type="text/javascript">
	$(document).ready(function(){
		
		// 수정 버튼 눌렸을때 
		 $("#modify_btn").click(function(){
			 location.href="proinfoModifyForm.do?seq=${proinfoDTO.seq}";
	     });
		
		// 삭제 버튼 눌렸을때 
		 $("#delete_btn").click(function(){
			 location.href="proinfoDelete.do?seq=${proinfoDTO.seq}";
	     });
		
		
        $("#glayLayer").fadeIn(300);
        $("#overLayer").fadeIn(200);
        $("#overLayer_s").fadeIn(200);
        return false;
        
       
       
	});
	
	 function right_btn_check(){
 		<c:if test="${list_t eq 'c'}">
 			// 다음 리스트가 없을 경우
 			<c:if test="${fn:length(list)-1 > list_n}">
 				location.href="search_c.do?keyword_c=${keyword_c}&list_n=${list_n+1}";
 			</c:if>
 			<c:if test="${fn:length(list)-1 <= list_n}">
 				alert("다음 페이지가 없습니다.");
 			</c:if>
 		</c:if>
 	}

	function left_btn_check(){
		<c:if test="${list_t eq 'c'}">
			<c:if test="${list_n gt 0 }">
				location.href="search_c.do?keyword_c=${keyword_c}&list_n=${list_n-1}";
			</c:if>
			<c:if test="${list_n <= 0 }">
				alert("이전 페이지가 없습니다.");
			</c:if>
		</c:if>
	}

</script>
<title>전문지식 보기</title>
</head>
<body>
	<div class="container">
		<c:set var="text" value="${keyword }" />
		<c:set var="len" value="${fn:length(text) }" />
		<input type="hidden" name="keyword_c" value="${keyword_c }" /> <input
			type="hidden" name="list_n" value="${list_n }" /> <input
			type="hidden" name="list_t" value="${list_t }" />
		<c:if test="${list_t eq 'c'}">
			<c:set var="list_len" value="${fn:length(list) }" />
		</c:if>
		<c:if test="${list_t eq 's'}">
			<c:set var="list_len" value="${fn:length(list) + 1}" />
		</c:if>
		<div id='glayLayer'></div>

		<c:if test="${list_t eq 'c'}">
			<div id='overLayer'>
				<div class="ol_top">
					<div id="category" class="category">
						<!-- 카테고리 -->
						<label style="color: white;"> 
				<c:if test="${proinfoDTO.category eq 'live'}">입주 전</c:if>
				<c:if test="${proinfoDTO.category eq 'living'}">입주 중</c:if>
				<c:if test="${proinfoDTO.category eq 'lived'}">입주 후</c:if>
						</label>
					</div>

					<div class="cancel_c">
						<input type="button" id="cancel"
							onclick="location.href='proinfoMain.do'" value="x" />
					</div>

					<div class="ol_left" onclick="left_btn_check()"></div>

					<div class="ol_center">
						<div class="searchListdiv">
							<c:if test="${list_len > 0}">
								<div class="subject">
									<!-- 제목 -->
									<label>${proinfoDTO.subject }</label>
								</div>
								<div id="imgFile" class="imgFile">
									<!-- 이미지  -->
									<img src="/sola/proinfoimg/${proinfoDTO.imgFile }">
								</div>
								<div class="contents" align="left">	<!-- 내용 -->
									<pre><label>${proinfoDTO.contents }</label></pre>
								</div>
								<div class="insert_btn" align="right">
									<!-- 수정 삭제 버튼 -->
									<c:set var="id_len" value="${fn:length(memId) }" />
									<c:if test="${id_len < 6 }">
									<input type="button" id="modify_btn" class="btn" value="수정"> <input
									type="button" id="delete_btn" class="btn" value="삭제">
									</c:if>
								</div>
							</c:if>
							<c:if test="${list_len == 0}">작성된 글이 없습니다</c:if>

						</div>
					</div>
					<div class="ol_right" onclick="right_btn_check()"></div>
				</div>
			</div>
		</c:if>



		<c:if test="${list_t eq 's' }">
			<div id='overLayer_s'>
				<div class="ol_top_s">
					<div class="category_s"></div>
					<div class="cancel_c">
						<input type="button" id="cancel"
							onclick="location.href='search.do?pg=1&keyword=${fn:substring(text,1,len-1)}&searchOp=${searchOp}'"
							value="x" />
					</div>
				</div>


				<div class="ol_center_s">
					<div class="searchListdiv">
						<c:if test="${list_len > 0}">
							<div class="subject">
								<!-- 제목 -->
								<label>${proinfoDTO.subject }</label>
							</div>
							<div id="imgFile" class="imgFile">
								<!-- 이미지  -->
								<img src="/sola/proinfoimg/${proinfoDTO.imgFile }">
							</div>
							<div class="contents">	<!-- 내용 -->
								<pre><label>${proinfoDTO.contents }</label></pre>
							</div>
							<div class="insert_btn" align="right">
								<!-- 수정 삭제 버튼 -->
							<c:set var="id_len" value="${fn:length(memId) }" />
							<c:if test="${id_len < 6 }">
								<input type="button" id="modify_btn" class="btn" value="수정"> <input
									type="button" id="delete_btn" class="btn" value="삭제">
							</c:if>
							</div>

						</c:if>
						<c:if test="${list_len == 0}">작성된 글이 없습니다</c:if>
					</div>
				</div>
			</div>
		</c:if>

	</div>
</body>
</html>