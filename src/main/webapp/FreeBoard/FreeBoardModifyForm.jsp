<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
editor{
width: 800px;
height: 400px;
}
</style>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="/sola/resources_board/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	$(function(){
	    var obj = [];              
	    nhn.husky.EZCreator.createInIFrame({
	        oAppRef: obj,
	        elPlaceHolder: "freemodifycontent",
	        sSkinURI: "/sola/resources_board/editor/SmartEditor2Skin.html",
	        htParams : {
	        	bUseToolbar : true,            
	            bUseVerticalResizer : true,    
	            bUseModeChanger : true,
	        }
	    });
	    $("#modifyBoard").click(function(){
	         obj.getById["freemodifycontent"].exec("UPDATE_CONTENTS_FIELD", []);
	       
	         if($("#subject").val()==""){
	        	 alert("제목을 입력하세요");
	        	 $("#subject").focus();
	         }else if($("#freemodifycontent").val()=="" || $("#freemodifycontent").val()=='<p>&nbsp;</p>'){
	        	 alert("내용을 입력하세요");
	        	 $("#freemodifycontent").focus();
	       	}else{
	       		var result = confirm("선택하신 카테고리가 "+$("#category").val()+"(이)가 맞습니까?");
	       		if(result){
	         $("#modifyBoardForm").submit();
	       		}
	       	}
	    });
	});
</script>
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
<body>
<div id="title">
	<label for="page">자유게시판 글수정</label>
</div>
<div id="body">
	<form action="FreeBoardModify.do" method="post" id="modifyBoardForm" name="modifyBoardForm">
		<div>글번호:${boardDTO.seq }</div>
		<div>제목:<input type="text" id="subject" name="subject" value="${boardDTO.subject }" onkeyup="chkword(this,20)"/></div>
		<div id="categorylist">카테고리:
			<select name="category" id="category">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
			</select>
		</div>
		<div><textarea name="content" id="freemodifycontent">${boardDTO.content }</textarea></div>
		<input type="hidden" id="seq" name="seq" value="${seq}"/>
		<input type="hidden" id="pg" name="pg" value="${pg}"/>
		<div id="btn_submit"><input type="button" id="modifyBoard" value="수정"/></div>	
		<!-- 엔터키막기 -->
		<input style="VISIBILITY: hidden; WIDTH: 0px"> 
	</form>
</div>
</body>
</html>