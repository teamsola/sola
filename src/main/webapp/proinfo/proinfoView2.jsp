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
			 location.href="proinfoModifyForm.do?seq=${proinfoDTO.seq}";
	     });
		
		// 삭제 버튼 눌렸을때 
		 $("#delete_btn").click(function(){
			 location.href="proinfoDelete.do?seq=${proinfoDTO.seq}";
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
         
         <div class="ol_center">
         	<div id="select" class="select">		<!-- 카테고리 -->
         		<label>카테고리 : ${proinfoDTO.category }</label>
         	</div>
         	<div  class="subject">					<!-- 제목 -->
         		<label>제목 : ${proinfoDTO.subject }</label>
         	</div>
         	<div class="contents">					<!-- 내용 -->
         		<label>내용 : ${proinfoDTO.contents }</label>
         	</div>
         	<div id="imgFile" class="imgFile">		<!-- 이미지  -->
         		이미지 : <img src="../proinfoimg/${proinfoDTO.imgFile }" width="130" height="150">
         	</div>
         	<div class="insert_btn"> 				<!-- 수정 삭제 버튼 -->
         		<input type="button" id="modify_btn" value="수정">
         		<input type="button" id="delete_btn" value="삭제">
         	</div>
         </div>
      </div>
   </div>
</body>
</html>