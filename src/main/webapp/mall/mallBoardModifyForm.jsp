<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">
    $(function(){
        //전역변수
        var obj = [];              
        //스마트에디터 프레임생성
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: obj,
            elPlaceHolder: "editor",
            sSkinURI: "/sola/resources/editor/SmartEditor2Skin.html",
           /* sSkinURI: "./SmartEditor2Skin.html", */
            htParams : {
                // 툴바 사용 여부
                bUseToolbar : true,            
                // 입력창 크기 조절바 사용 여부
                bUseVerticalResizer : true,    
                // 모드 탭(Editor | HTML | TEXT) 사용 여부
                bUseModeChanger : true,
            }
        });
        //전송버튼
        $("#modifyBoard").click(function(){
        	
        	if($('input:radio[name=category]').is(':checked')==false){
        		alert("카테고리를 선택해주세요");
        		return false;
        	}if($("#subject").val()==''){
        		alert("제목을 입력해주세요");
        		$("#subject").focus();
        		return false;
        	}
        	
            //id가 smarteditor인 textarea에 에디터에서 대입
            obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
            //폼 submit
            $("#modifyBoardFrm").submit();
        });
    });
</script>
<style>
body{
	padding-top:100px;
}

table{
	margin:auto;
}

#aa{
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

#modifyBoard{
	margin-top:70px;
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

#btn{
	margin-top:70px;
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
</style>

</head>
<body>

	<div id="aa">글수정</div>
	<hr id="line1">


	<form action="./mallBoardModify.do?board_seq=${board_seq}" method="post" id="modifyBoardFrm" enctype="multipart/form-data">
	
	<table>
		<tr>
			<td>	
			<c:if test="${ boardDTO.category eq '판매'}">
				<input type="radio" name="category" id="category" value="판매" checked>판매
				<input type="radio" name="category" id="category" value="구매">구매
			</c:if>
			
			
			<c:if test="${ boardDTO.category eq '구매'}">
				<input type="radio" name="category" id="category" value="판매">판매
				<input type="radio" name="category" id="category" value="구매" checked>구매
			</c:if>
		</tr>
		
		<tr>
			<td><hr id="line">
		</tr>
		
		<tr>
			<td><input type="text" value="${boardDTO.subject }" id="subject" name="subject" size="100">
		</tr>
        
        <tr>
			<td><hr id="line">
		</tr>
		
		<tr>
			<td><textarea name="editor" id="editor" style="width: 700px; height: 400px;">${boardDTO.content }</textarea>
    	</tr>
     </table>
	
	
      
      
        <div id="btnset">
        	<input type="button" id="modifyBoard" value="수정" />
        	<input type=button id="btn" value="취소" onclick="location.href='mallBoardView.do?board_seq=${board_seq}&pg=${pg}'">
    	</div>
    </form>


</body>
</html>