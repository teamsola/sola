<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA</title>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
function modifyFunc(){
	 var result = confirm("게시글을 수정하시겠습니까?");
	 
	 if(result){	/* yes */
		 location.href='../QnABoard/QnABoardModifyForm.do?seq=${boardDTO.seq }&&pg=${pg}';
	 }
} 

function deleteFunc(){
	 var result = confirm("정말로 삭제하시겠습니까?");
	 
	 if(result){	/* yes */
		 location.href='../QnABoard/QnABoardDelete.do?seq=${boardDTO.seq }&&${pg}';
	 }
}
</script>
<style type="text/css">
#body{	/* 전체 글+댓글 */
width:500px;
height:100%;

}

#freeboardview{	/* 글 본문 */
width:100%;
height:90%;
}

#bottom{		/* 버튼들 div */
	width:100%;
height:10%;

}

#top{	/* 상단 */
	width:100%;
	height:10%;
}


#content_no{	/* 글 번호 */
	width:33%;
	height:100%;
	float:left;
}

#category{	/* 글 카테고리 */
	width:33%;
	height:100%;
	float:left;
}

#n_name{	/* 닉네임 */
	width:33%;
	height:100%;
	float:left;
}

#title{
	width:100%;
	height:10%;
}

#subject{	/* 제목 */
	width:100%;
	height:100%;
}

#center{
	width:100%;
	height: 80%;
}

#content{	/* 글 내용 */
	
}


#btn_delete{	/* 삭제버튼 */
	width: 70px;
	height:30px;
	float:left;
}
#btn_modify{	/* 수정버튼 */
	width: 70px;
	height:30px;
	float:left;
}
#btn_list{	/* 목록버튼 */
	width: 70px;
	height:30px;
	float:left;
}

button{
	widht:60px;
	height:30px;
	
}

button:hover{
background-color:gray;
}

</style>
</head>
<body>
	<h1>Q&A</h1>
<div id="body">	
	<div id="qnaboardview">
		<div id="top">
			<div id="content_no">No.${boardDTO.seq }</div>
			<div id="category">QnA > ${boardDTO.category }</div>
			<div id="n_name">닉네임 ${boardDTO.nickname }</div>
		</div>
		<div id="title">
			<div id="subject">${boardDTO.subject }</div>
		</div>
		<div id="center">
			<div id="content">${boardDTO.content }</div>
		</div>
	</div>
	
	<div id="bottom">
	<c:if test="${fn:length(memId) < 6 }">
		<div id="btn_delete"><input type="button" value="글삭제" onclick="javascript:deleteFunc();"/></div>
		<div id="btn_modify"><input type="button" value="글수정" onclick="javascript:modifyFunc();"/></div>
	</c:if>
		<div id="btn_list"><a href="QnABoardList.do"><input type="button" value="글목록"/></a></div>
	</div>
</div>
<a href="QnABoardList.do">글목록</a>
</body>
</html>