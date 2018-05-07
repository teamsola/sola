<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="/sola/resources_board/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
</head>
<script type="text/javascript">



/*제목 입력칸 글자수 제한  */
function chkword(obj, maxByte) {

    var strValue = obj.value;
    var strLen = strValue.length;
    var totalByte = 0;
    var len = 0;
    var oneChar = "";
    var str2 = "";


    for (var i = 0; i < strLen; i++) {
        oneChar = strValue.charAt(i);
        if (escape(oneChar).length > 4) {
            totalByte += 2;
        } else {
            totalByte++;
        }
        if (totalByte <= maxByte) {
            len = i + 1;
        }
    }
    if (totalByte > maxByte) {

    	alert("최대입력 글자수를 초과하셨습니다:최대"+maxByte+"byte");
        str2 = strValue.substr(0, len);
        obj.value = str2;
        chkword(obj, 4000);
    }
}

</script>
<script type="text/javascript">
	$(function(){
	    var obj = [];              
	    nhn.husky.EZCreator.createInIFrame({
	        oAppRef: obj,
	        elPlaceHolder: "qnawritecontent",
	        sSkinURI: "/sola/resources_board/editor/SmartEditor2Skin.html",
	        htParams : {
	        	bUseToolbar : true,            
	            bUseVerticalResizer : true,    
	            bUseModeChanger : true,
	        }
	    });
	    $("#insertBoard").click(function(){
	         obj.getById["qnawritecontent"].exec("UPDATE_CONTENTS_FIELD", []);
	       
	         if($("#subject").val()==""){
	        	 alert("제목을 입력하세요");
	        	 $("#subject").focus();
	         }else if($("#qnawritecontent").val()=="" || $("#qnawritecontent").val()=='<p>&nbsp;</p>'){
	        	 alert("내용을 입력하세요");
	        	 $("#qnawritecontent").focus();
	       	}else{
	       		var result = confirm("선택하신 카테고리가 "+$("#category").val()+"(이)가 맞습니까?");
	       		if(result){
	        	 $("#insertBoardFrm").submit();
	         }
	       	}
	         
	    });
	    
	   
	    
	});
	
</script>
<style>

table{
	width:100%;
	
	margin:auto;
}

#aa{
	margin-top:70px;
	font-weight: bold;
	text-align:center;
}

#line1{
	border-top: 1px solid #ff8400;
	width:200px;
}

#btnset{
	text-align:center;
	float:left;
	width:100%;
}

#insertBoard{
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

#insertBoard:hover{
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
#category,#subject
{
	border-style: none;border-bottom:1px solid black;height:30px;font-size: 16px;padding-left:5px;outline:none;width:98%;margin:0 1%;
}
#category{
	border:1px solid #6A6763;
}

#category:focus,#subject:focus
{
	transition:.5s ease; border-bottom:2px solid #ff8400;outline:none;box-sizing: content-box;font-size: 14px;
}
</style>
</head>
<body>

	<div id="aa">Q&A 글작성</div>
	<hr id="line1">

	<form action="QnABoardWrite.do" method="post" id="insertBoardFrm" name="insertBoardForm" enctype="multipart/form-data">
	
	<div style="float:left; width:100%; text-align: center;">
		<div style="width:800px; display:inline-block;">
		<table>
		<tr>
			<td colspan="2"><hr id="line">
		</tr>
					
		<tr>		
			
			<td><select name="category" id="category" name="category">
				<option value="솔라사용법">솔라사용법</option>
				<option value="건의사항">건의사항</option>
				
			</select>
			<td><input type="text" placeholder="제목을 입력하세요" id="subject" name="subject" onkeyup="chkword(this,20)">
		</tr>
		
		<tr>
			<td colspan="2"><hr id="line">
		</tr>
		
		
		
	
		<tr>	
        	<td id="contents" colspan="2"><textarea name="content" class="editor" id="qnawritecontent" style="width: 100%; height: 400px;"></textarea>
        </tr>
        
     </table>
	</div>
	</div>
      
        <div id="btnset">
        	<input type="button" id="insertBoard" value="등록" />
      		<input type="button" id="btn" value="취소" onclick="location.href='QnABoardList.do'">
      		<!-- 엔터키막기 -->
			<input style="VISIBILITY: hidden; WIDTH: 0px">
      	</div>
    </form>
    
	
</body>
</html>