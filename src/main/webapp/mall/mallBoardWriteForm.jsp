<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>


<script>
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
        chkword(obj, 8000);
    }
}
</script>

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
        $("#insertBoard").click(function(){
        	
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
            $("#insertBoardFrm").submit();
    		
        });
    });
</script>

<style>

table{
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

</style>
</head>
<body>

	<div id="aa">글쓰기</div>
	<hr id="line1">

	<form action="./insertBoard.do" method="post" id="insertBoardFrm" enctype="multipart/form-data">
	
	<table>
		<tr>
			<td>
			<input type="radio" name="category" id="category" value="판매">판매
			<input type="radio" name="category" id="category" value="구매">구매
		</tr>
		
		<tr>
			<td><hr id="line">
		</tr>
					
		<tr>		
			<td><input type="text" placeholder="제목을 입력하세요" id="subject" name="subject" size="95" onkeyup="chkword(this,20)">
		</tr>
		
		<tr>
			<td><hr id="line">
		</tr>
	
		<tr>	
        	<td id="contents"><textarea name="editor" class="editor" id="editor" style="width: 700px; height: 400px;"></textarea>
        </tr>
        
     </table>
      
        <div id="btnset">
        	<input type="button" id="insertBoard" value="등록" />
      		<input type="button" id="btn" value="취소" onclick="location.href='mallBoardList.do?pg=1'">
      		<input style="VISIBILITY: hidden; WIDTH: 0px">
      	</div>
    </form>
    
	
</body>
</html>