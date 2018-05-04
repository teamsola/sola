<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>FreeBoardView</title>
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
		 location.href='FreeBoardModifyForm.do?seq=${boardDTO.seq }&&pg=${pg}';
	 }
} 

function deleteFunc(){
	 var result = confirm("정말로 삭제하시겠습니까?");
	 
	 if(result){	/* yes */
		 location.href='FreeBoardDelete.do?seq=${boardDTO.seq }&&${pg}';
	 }
}



</script>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">



 
function fn_comment(code){
   
    $.ajax({
        type:'POST',
        url : "<c:url value='FreeBoardAddComment.do'/>",
        data:$("#commentForm").serialize(),
        success : function(data){
            if(data=="success")
            {
            	 
                getCommentList(); 
                
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

  function comment_dt(re_lev,re_ref,re_seq){
	var result= confirm("댓글을 삭제하시겠습니까?");
		if(result){
	  
 	  var arr = new Array();
	  var obj = new Object();
	  
 	  obj.re_lev=re_lev;
	  obj.re_ref=re_ref;
	  obj.re_seq=re_seq;
	  arr.push(obj);

	$.ajax({
		type:'POST',
		url : "<c:url value='FreeBoardDeleteComment.do'/>",
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


  
 function comment_mff(re_lev,re_ref,re_seq,content){
	
  	var result = confirm("댓글을 수정하시겠습니까?");
  	if(result){
  			var html = "";	
  			html+="<form id='replymodify' name='replymodify' method='post'><div>";
  			/* html+="<input type='text' id='modifycontent' name='content' value='"+content+"'/>"; */
  			html+="<textarea style='width: 800px' rows='1' cols='10' id='modifycontent' name='content'>"+content+"</textarea>";
  			html+="<input type='button' href='#' onClick='comment_mf_cf()' value='댓글수정'/>";
  			html+="<input type='hidden' id='re_lev' name='re_lev' value='"+re_lev+"'/>";
  			html+="<input type='hidden' id='re_ref' name='re_ref' value='"+re_ref+"'/>";
  			html+="<input type='hidden' id='re_seq' name='re_seq' value='"+re_seq+"'/>";
  			html+="</div></form>";
  			$("#replymodifydiv").html(html);	
  	}
   }  
   

  

 function comment_mf(){
	
	$.ajax({
			type:'POST',
			url : "<c:url value='FreeBoardModifyComment.do'/>",
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

 
	$(function(){

    getCommentList();
    
});
 

function getCommentList(){
  
   
    $.ajax({
        type:'GET',
        url : "<c:url value='FreeBoardCommentList.do'/>",
        dataType : "json",
        data:{'seq':${seq}},
        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
        success : function(data){
            
            var html = "";
            var cCnt = data.length;
            
            if(data.length > 0){
                
                for(i=0; i<data.length; i++){
                	
                
                    
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


 
</script>
<style type="text/css">
a{
	text-decoration:none;
}
#a:link{
	color:black;
}

#a:visited{
	color:orange;
}
#a:hover{
	color:red;
}

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
<h1 class="title">자유게시판 글상세보기</h1>
<div id="body">
	<div id="freeboardview">
		<div id="top">
			<div id="content_no">No.${boardDTO.seq }</div>
			<div id="category">자유게시판 > ${boardDTO.category }</div>
			<div id="n_name">닉네임 ${boardDTO.nickname }</div>
		</div>
		<div id="title">
			<div id="subject">제목${boardDTO.subject } </div>	
		</div>
		<div id="center">
			<div id="articlecontent">${boardDTO.content }</div>
		</div>
	</div>
	
	<div id="bottom">
		<c:if test="${boardDTO.id eq memId }">
			<div id="btn_delete"><input type="button" class="btn_delete" value="글삭제" onclick="javascript:deleteFunc();"/></div>
			<div id="btn_modify"><input type="button" class="btn_modify" value="글수정" onclick="javascript:modifyFunc();"/></div>
		</c:if>
		<div id="btn_list"><a href="FreeBoardList.do"><input type="button" value="글목록"/></a></div>
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
                                <a href='#' onclick="javascript:check_comment('${boardDTO.seq }')" class="btn pull-right btn-success" id="comment_btn">등록</a>
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