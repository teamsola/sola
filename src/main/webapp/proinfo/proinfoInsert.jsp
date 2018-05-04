<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="proinfocss/proinfoInsert.css" />

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
<style>

#aa{
	padding-top:20px;
	font-weight: bold;
	text-align:center;
}

#line1{
	border-top: 1px solid #ff8400;
	width:200px;
}

select { 
	background: url(이미지 경로) no-repeat 95% 50%; /* 화살표 모양의 이미지 */ 
	width: 150px; /* 원하는 너비설정 */ 
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

#titleset{
	margin-top:30px;
	margin-left:146px;
	text-align:center;
	float:left;
	width:100%;
}

#subject{
	margin-left:7px;
	border-style: none;
    font-size: 15px;
    padding: 5px;
    position: relative;
    border: 1px solid #ff8400;
    box-sizing: border-box;
}

.select{
	text-align:center;
	float:left;
}

.subject{
	float:left;
}


#contents{
	margin-bottom:10px;
	border: 1px solid #BDBDBD; 
	resize: none;
}

.contents{
	text-align:center;
	float:left;
	width:100%;
}

.imgFile{
	text-align:center;
	float:left;
	width:100%;
}

.insert_btn{
	text-align:center;
	float:left;
	width:100%;
}

#insert_btn{
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

#insert_btn:hover{
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
</style>
<title>전문지식 입력</title>
</head>
<body>
	<div class="container">
      <div id='glayLayer'></div>
      <div id='overLayer'>
         <div class="ol_top" align="right"><input type="button" id="cancel" onclick="location.href='proinfoMain.do'" value="x"/></div>
         
         <form action="proinfoInsert.do" name="proinfoInsert" method="post" enctype="multipart/form-data">
        
        
         <div class="ol_center">
         
        <div id="aa">등록</div>
		<hr id="line1">
	
	 
         <div id="titleset">
         	<div id="select" class="select">		<!-- 카테고리 -->
         		<select name="category" id="category" class="category">
						<option value="0">항목 선택</option>
						<option value="live">입주 전</option>
						<option value="living">입주 중</option>
						<option value="lived">입주 후</option>
				</select>
         	</div>
        
         	
         	
         	<div  class="subject">					<!-- 제목 -->
         		<input type="text" name="subject" id="subject" size="43">
         	</div>
        </div> 	
         	
         	<div class="contents">					<!-- 내용 -->
         		<pre><textarea rows="17"cols="68" name="contents" id="contents" ></textarea></pre>
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