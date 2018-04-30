<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="../proinfocss/proinfoInsert.css" />

<script type="text/javascript">
	$(document).ready(function(){
		
		// 수정 버튼 눌렸을때 
		 $("#modify_btn").click(function(){
			 document.proinfoModify.submit();
	     });
		
		 
        $("#glayLayer").fadeIn(300);
        $("#overLayer").fadeIn(200);
        return false;
        
       
	});
</script>
<title>전문지식 보기</title>
</head>
<body>
	<div class="container">
      <div id='glayLayer'></div>
      <div id='overLayer'>
         <div class="ol_top" align="right"><input type="button" id="cancel" value="x"/></div>
         
         <form action="proinfoModify.do" name="proinfoModify" method="post" enctype="multipart/form-data">
         <div class="ol_center">
         	<input type="hidden" name="seq" value="${proinfoDTO.seq }">
         	<div id="select" class="select">		<!-- 카테고리 -->
         		<select name="category" id="category" class="category">
						<option value="0">항목 선택</option>
						<option value="live">입주 전</option>
						<option value="living">입주 중</option>
						<option value="lived">입주 후</option>
				</select>
         	</div>
         	<div  class="subject">					<!-- 제목 -->
         		<input type="text" name="subject" id="subject" value="${proinfoDTO.subject }">
         	</div>
         	<div class="contents">					<!-- 내용 -->
         		<pre><textarea rows="5"cols="30" name="contents" id="contents" >${proinfoDTO.contents }</textarea></pre>
         	</div>
         	<div id="imgFile" class="imgFile">		<!-- 이미지  -->
         		<input type="file" name="imgFile" size="50">
         		<%-- <input type="hidden" name="beforeImaFile" value="${proinfoDTO.imgFile }"> --%>
         	</div>
         	<div class="insert_btn"> 				<!-- 수정 버튼 -->
         		<input type="button" id="modify_btn" value="수정하기">
         	</div>
         </div>
         </form>
      </div>
   </div>
</body>
</html>