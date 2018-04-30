<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="../proinfocss/proinfoInsert.css" />

<script type="text/javascript">
	$(document).ready(function(){
		
		// 입력 버튼 눌렸을때 
		 $("#insert_btn").click(function(){
			 	
	        	document.proinfoInsert.submit();
	        });
		 
        $("#glayLayer").fadeIn(300);
        $("#overLayer").fadeIn(200);
        return false;
        
       
	});
</script>
<title>전문지식 입력</title>
</head>
<body>
	<div class="container">
      <div id='glayLayer'></div>
      <div id='overLayer'>
         <div class="ol_top" align="right"><input type="button" id="cancel" value="x"/></div>
         
         <form action="proinfoInsert.do" name="proinfoInsert" method="post" enctype="multipart/form-data">
         <div class="ol_center">
         	<div id="select" class="select">		<!-- 카테고리 -->
         		<select name="category" id="category" class="category">
						<option value="0">항목 선택</option>
						<option value="live">입주 전</option>
						<option value="living">입주 중</option>
						<option value="lived">입주 후</option>
				</select>
         	</div>
         	<div  class="subject">					<!-- 제목 -->
         		<input type="text" name="subject" id="subject">
         	</div>
         	<div class="contents">					<!-- 내용 -->
         		<pre><textarea rows="5"cols="30" name="contents" id="contents" ></textarea></pre>
         	</div>
         	<div id="imgFile" class="imgFile">		<!-- 이미지  -->
         		<input type="file" name="imgFile" size="50">
         	</div>
         	<div class="insert_btn"> 				<!-- 입력 버튼 -->
         		<input type="button" id="insert_btn" value="입력">
         	</div>
         </div>
         </form>
      </div>
   </div>
</body>
</html>