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
<title>NoticeBoardView</title>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
function check_comment(comment){
	
	if($("#comment_content").val()==""){
		alert("댓글을 입력해주세요");
		$("#comment_content").focus();
	}else{
		
		fn_comment(comment);
	}
	
	
}

function comment_mf_cf(){
	if($("#modifycontent").val()==""){
		alert("수정할 댓글내용을 입력해주세요");
		$("#replymodifycheck").focus();
	}else{
		comment_mf();
	}
}


function modifyFunc(){
	 var result = confirm("게시글을 수정하시겠습니까?");
	 
	 if(result){	/* yes */
		 location.href='NoticeBoardModifyForm.do?seq=${boardDTO.seq }&&pg=${pg}';
	 }
} 

function deleteFunc(){
	 var result = confirm("정말로 삭제하시겠습니까?");
	 
	 if(result){	/* yes */
		 location.href='NoticeBoardDelete.do?seq=${boardDTO.seq }&&${pg}';
	 }
}
</script>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
/**
 * 초기 페이지 로딩시 댓글 불러오기
 */ 
	$(function(){
/* 	alert("getCommentList초기페이지로딩"); */
    getCommentList();
    
});
 
/**
 * 댓글 불러오기(Ajax)
 */
function getCommentList(){
   
   
    $.ajax({
        type:'GET',
        url : "<c:url value='NoticeBoardCommentList.do'/>",
        dataType : "json",
        data:{'seq':${seq}},
        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
        success : function(data){
            
            var html = "";
            var cCnt = data.length;
            
            if(data.length > 0){
                
                for(i=0; i<data.length; i++){
                	
                	
                	/*  alert("data["+i+"].re_lev : "+data[i].re_lev);
               	  alert("data["+i+"].re_ref : "+data[i].re_ref);
               	  alert("data["+i+"].re_seq : "+data[i].re_seq); */
                    
                    html += "<div><table class='table'><h6><strong>"+data[i].nickname+data[i].logtime+"</strong></h6>";
                    html += data[i].content + "<tr><td></td></tr>";
                    html +=	"<input type='hidden' id='re_lev' name='re_lev' value="+data[i].re_lev+"/>";
                    html +=	"<input type='hidden' id='re_ref' name='re_ref' value="+data[i].re_ref+"/>";
                    html +=	"<input type='hidden' id='re_seq' name='re_seq' value="+data[i].re_seq+"/>";
                   	if(data[i].id=='${memId}'){
                    html += "<input type='button' id='btn_replydt' value='삭제' onClick='comment_dt("+data[i].re_lev+","+data[i].re_ref+","+data[i].re_seq+")'/>";
                    html += "<input type='button' id='btn_replymf' value='수정' onClick='comment_mff("+data[i].re_lev+","+data[i].re_ref+","+data[i].re_seq+",\""+data[i].content+"\")'/>";
                   	}
              		html += "</table></div>";
              		
                    
                }
                
            } else {
              /*  alert("댓글없음"); */
                html += "<div>";
                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                html += "</table></div>";
                html += "</div>";
                
            }
            
            $("#cCnt").html(cCnt);
            $("#commentList").html(html);
            
        },
        error:function(request,status,error){
        	
       }
        
    });
}
/*
 * 댓글 등록하기(Ajax)
 */
function fn_comment(code){
   
   $.ajax({
       type:'POST',
       url : "<c:url value='NoticeBoardAddComment.do'/>",
       data:$("#commentForm").serialize(),
       success : function(data){
           if(data=="success")
           {
           	 
               getCommentList(); // 초기 페이지 로딩시에 댓글 블러오는 함수
               
           }
       },
       error:function(request,status,error){
      
      },complete:function(){
   	  	
			getCommentList();
			$("#comment_content").val("");
			alert("댓글이 등록되었습니다.");
		}
   });
}
/*
* 댓글 삭제
*/
 function comment_dt(re_lev,re_ref,re_seq){
	var result = confirm("댓글을 삭제하시겠습니까?");
		if(result){
	  /* alert("comment_dt  들어옴");
	  alert("re_lev : "+re_lev);
	  alert("re_ref : "+re_ref);
	  alert("re_seq : "+re_seq); */
	  var arr = new Array();
	  var obj = new Object();
	  
	  obj.re_lev=re_lev;
	  obj.re_ref=re_ref;
	  obj.re_seq=re_seq;
	  arr.push(obj);

	$.ajax({
		type:'POST',
		url : "<c:url value='NoticeBoardDeleteComment.do'/>",
		data:JSON.stringify(arr),
		dataType:'json',
		contentType:'application/json',
		success:function(data){
			if(data=="success"){
				
			}
		},
		error:function(request,status,error){

		},complete:function(){
			getCommentList();
			alert("댓글이 삭제되었습니다.");
		}
	});
		}
}  
/*
* 댓글 수정폼
*/
function comment_mff(re_lev,re_ref,re_seq,content){
	var result = confirm("댓글을 수정하시겠습니까?");
	if(result){
/* 	alert("comment_mff의 content값:"+content);
	alert("re_lev값:"+re_lev); */
			var html = "";	
			html+="<form id='replymodify' name='replymodify' method='post'><div>";
			html+="<textarea style='width: 800px' rows='1' cols='10' id='modifycontent' name='content'>"+content+"</textarea>";
			html+="<input type='button' href='#' onClick='comment_mf_cf()' value='댓글수정'/>";
			html+="<input type='hidden' id='re_lev' name='re_lev' value='"+re_lev+"'/>";
			html+="<input type='hidden' id='re_ref' name='re_ref' value='"+re_ref+"'/>";
			html+="<input type='hidden' id='re_seq' name='re_seq' value='"+re_seq+"'/>";
			html+="</div></form>";
			$("#replymodifydiv").html(html);
	}
}
/*
* 댓글수정
*/
function comment_mf(){
	/*  alert("comment_mf실행");*/
	$.ajax({
			type:'POST',
			url : "<c:url value='NoticeBoardModifyComment.do'/>",
			data:$("#replymodify").serialize(),
			success:function(data){
				if(data=="success"){
					
					getCommentList();
				}
			},
			error:function(request,status,error){

			},complete:function(){
				$("#replymodifydiv").html("");
				getCommentList();
				alert("댓글이 수정되었습니다.");
			}
	});
}

 
</script>
<style type="text/css">
#body{	/* 전체 글+댓글 */
width:500px;
height:100%;

}

#noticeboardview{	/* 글 본문 */
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
<h1>공지사항 글상세보기</h1>
<div id="body">
	<div id="noticeboardview">
		<div id="top">
			<div id="content_no">No.${boardDTO.seq }</div>
			<div id="category">공지사항 > ${boardDTO.category }</div>
			<div id="n_name">닉네임 ${boardDTO.nickname }</div>
		</div>
		<div id="title">
			<div id="subject">제목 ${boardDTO.subject}</div>
		</div>
		<div id="center">
			<div id="content">${boardDTO.content }</div>
		</div>
	</div>
	
	<div id="bottom">
	<c:if test="${fn:length(memId) < 6 }">
		<div id="btn_delete"><input type="button" class="btn_delete" value="글삭제" onclick="javascript:deleteFunc();"/></div>
		<div id="btn_modify"><input type="button" class="btn_modify" value="글수정" onclick="javascript:modifyFunc();"/></div>
	</c:if>
		<div id="btn_list"><a href="NoticeBoardList.do"><input type="button" value="글목록"/></a></div>
	</div>
</div>
<div class="container">
    <form id="commentForm" name="commentForm" method="post">
    <br><br>
        <div>
            <div>
                <span><strong>댓글</strong></span> <span id="cCnt"></span>
            </div>
            <div>
                <table class="table">                    
                    <tr>
                        <td>
                            <textarea style="width: 1100px" rows="3" cols="30" id="comment_content" name="content" placeholder="댓글을 입력하세요"></textarea>
                            <br>
                            <div>
                                <a href='#' onClick="javascript:check_comment('${boardDTO.seq }')" class="btn pull-right btn-success">등록</a>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <input type="hidden" id="seq" name="seq" value="${boardDTO.seq}" />
        <input type="hidden" id="re_ref" name="re_ref" value="${boardDTO.seq}" />
        <input type="hidden" id="re_lev" name="re_lev" value="${boardDTO.re_lev+1}" />
        <input type="hidden" id="re_seq" name="re_seq" value="${boardDTO.re_seq}" />        
    	
    </form>
</div>
<div class="container">
    <form id="commentListForm" name="commentListForm" method="post">
        <div id="commentList">
        </div>
    </form>
</div>
 <div class="container">
 	<div id="replymodifydiv">
 	</div>
 </div>


</body>
</html>