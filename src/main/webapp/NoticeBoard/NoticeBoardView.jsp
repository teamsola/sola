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
	
		 location.href='NoticeBoardModifyForm.do?seq=${boardDTO.seq }&&pg=${pg}';
	 
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
                   	else if(${fn:length(memId) < 6}){
                   		html += "<input type='button' id='btn_reply' value='삭제' onClick='comment_dt("+data[i].re_lev+","+data[i].re_ref+","+data[i].re_seq+")'/>";
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
table{
	padding-top: 70px;
	margin:auto;
	width: 700px;
}

#line{
    border: 0.5px solid #EAEAEA;
}
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
width:800px;
height:50%;
}

#btnset{
	text-align:center;
	float:left;
	width:100%;
}
#cont{
	border: 1px solid gray;
	border-radius: 10px;
	padding: 10px;
	margin:left;
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

#btn2{
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

#btn2:hover{
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
#subject{	/* 제목 */
	text-align:center;
	padding: 0 20px 0 0;
}
</style>
</head>
<body>
<div id="body">
	<table>
		<tr>
			<td colspan="3" style="font-size:20px;" id="subject"><span style="color:white;font-weight:bold;border-radius:5px;background: #ff8400;float:left;text-align:center;width:100px;">${boardDTO.category }</span>&nbsp;&nbsp;&nbsp;${boardDTO.subject }
		</tr>
		
		<tr>
			<td colspan="3"><hr id="line">
		</tr>
		
		<tr>
			<td width="250" style="color:#8C8C8C;"><img src="/sola/img/write_icon.png" width="17px" height="17px">${boardDTO.nickname }
			<td width="350" style="color:#8C8C8C;"><img src="/sola/img/timer.png" width="17px" height="17px"><c:out value="${fn:substring(boardDTO.logtime, 0,16) }"/>
			<td width="100" style="color:#8C8C8C;"><img src="/sola/img/hit.png" width="17px" height="17px">&nbsp;${boardDTO.hit }
		</tr>
		
		<tr>
			<td colspan="3"><hr id="line">
		</tr>
		
		<tr>
			<td colspan="3" class="noticecontent" style="width: 600px; height: 400px;"><div id="cont">${boardDTO.content }</div>
		</tr>
	</table>

	<div id="btnset">
		<c:if test="${fn:length(memId) < 6}">
		<input type=button id="btn" value=수정 onclick="javascript:modifyFunc();">
		<input type=button id="btn" value=삭제 onclick="javascript:deleteFunc();">
		</c:if>
		
		
		<input type="button" id="btn2" value=목록 onclick="location.href='NoticeBoardList.do'"/>
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