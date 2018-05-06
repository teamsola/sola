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
	 	/* yes */
		 location.href='FreeBoardModifyForm.do?seq=${boardDTO.seq }&&pg=${pg}';
	 	
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

  
 function comment_mff(re_lev,re_ref,re_seq,content,index){
	
  	var result = confirm("댓글을 수정하시겠습니까?");
  	if(result){
  			var html = "";	
  			html+="<div><form id='replymodify' name='replymodify' method='post'>";
  			html+="<input type=\"text\" style='width: 100%; height:25px; font-size:15px;' id='modifycontent' name='content' value='"+content+"'>";
  			html+="<input type='hidden' id='re_lev' name='re_lev' value='"+re_lev+"'/>";
  			html+="<input type='hidden' id='re_ref' name='re_ref' value='"+re_ref+"'/>";
  			html+="<input type='hidden' id='re_seq' name='re_seq' value='"+re_seq+"'/>";
  			html+="</form></div>";
  			alert("html : "+html);
  			$(".commentList_line"+index).html(html);	
  			
  			html_btn = "";
  			/* <img src=\"/sola/img/delete_icon.png\" width=\"17px\" height=\"17px\" onClick='comment_dt("+data[i].re_lev+","+data[i].re_ref+","+data[i].re_seq+")' style='cursor:pointer;'> */
  			html_btn += "<div class=\"btn_line\" style=\"float:right;\" ><img class='modify_btn' src=\"/sola/img/modify_icon.png\" width=\"17px\" height=\"17px\"  class='modify_btn'  href='#' onClick='comment_mf_cf()' style='cursor:pointer; padding-top:10px;' />";
  			html_btn += "<img src=\"/sola/img/delete_icon.png\" width=\"17px\" height=\"17px\"  class='btn'  onClick='comment_dt("+re_lev+","+re_ref+","+re_seq+")'  style='cursor:pointer; padding-top:10px;'></div>";
  			
  			
  			$(".btn_line"+index).html(html_btn);	
  			
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
                	
                
                    
                    html += "<div class=\"comment_box\"><div class=\"comment_title\"><strong>"+data[i].nickname+"</strong>&nbsp;&nbsp;&nbsp;"+data[i].logtime+"</div>";
                    
                    html += "<div class=\"commentList_line"+i+"\">"+data[i].content+"</div>";
                    html +=	"<input type='hidden' id='re_lev' name='re_lev' value="+data[i].re_lev+"/>";
                    html +=	"<input type='hidden' id='re_ref' name='re_ref' value="+data[i].re_ref+"/>";
                    html +=	"<input type='hidden' id='re_seq' name='re_seq' value="+data[i].re_seq+"/>";
     
                   	if(data[i].id=='${memId}'){
                    html += "<div class='btn_line2'><div class=\"btn_line"+i+"\" style=\"float:right;\"><img class='modify_btn' src=\"/sola/img/modify_icon.png\" width=\"17px\" height=\"17px\" onClick='comment_mff("+data[i].re_lev+","+data[i].re_ref+","+data[i].re_seq+",\""+data[i].content+"\","+i+")'  style='cursor:pointer; padding-top:10px;'>";
                    html += "<img src=\"/sola/img/delete_icon.png\" width=\"17px\" height=\"17px\" onClick='comment_dt("+data[i].re_lev+","+data[i].re_ref+","+data[i].re_seq+")' style='cursor:pointer;'></div></div>";
              		}
                   	else if(${fn:length(memId) < 6}){
                   		html += "<div class='btn_line2'><div class=\"btn_line"+i+"\" style=\"float:right;\"> <img src=\"/sola/img/delete_icon.png\" width=\"17px\" height=\"17px\" onClick='comment_dt("+data[i].re_lev+","+data[i].re_ref+","+data[i].re_seq+")' style='cursor:pointer;'>  </div></div>";
                   	}
              		html += "<hr class=\"bottom_line\"></div>";
                }
                
            } else {
             
                html += "<div><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
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

.btn_line2 .modify_btn{
	margin-right:5px;
}

#subject{
	text-align:left;
	padding: 0 20px 0 0;
}
.freecontent{
	vertical-align:baseline;
}
#cont{
	border: 1px solid gray;
	border-radius: 10px;
	padding: 10px;
	margin:left;
}
.container{
	width:800px;
	height:30%;
}

.comment_box{	/* 댓글 박스 */
	margin-top:30px;
}

.btn_line2{		/* 버튼 묶음  */
	width:100%;
	height: 30px;
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
			<td colspan="3" class="freecontent" style="width: 600px; height: 400px;"> <div id="cont">${boardDTO.content }</div>
		</tr>
	</table>

	<div id="btnset">
		<c:choose>
			<c:when test="${memId.equals(boardDTO.id) }">
				<input type=button id="btn" value=수정 onclick="javascript:modifyFunc();">
				<input type=button id="btn" value=삭제 onclick="javascript:deleteFunc();">
			</c:when>
			<c:when test="${fn:length(memId) < 6}">
				<input type=button id="btn" value=삭제 onclick="javascript:deleteFunc();">
			</c:when>
		</c:choose>
		
		<input type="button" id="btn2" value=목록 onclick="location.href='FreeBoardList.do'"/>
	</div>
	
	
</div>
<div class="container">
    <form id="commentForm" name="commentForm" method="post">
        <div>
            <div>
                <span><strong>댓글</strong></span> <span id="cCnt"></span>
            </div>
            <div> 
            	<textarea style="width:100%; resize: none;" rows="3" cols="50" id="comment_content" name="content" placeholder="댓글을 입력하세요"></textarea>
            </div>
            <div>
            	<img src="/sola/img/insert_icon.png" width="19px" height="19px" style="cursor:pointer; float:right" onclick="javascript:check_comment('${boardDTO.seq }')">
               <%--  <input type="button" onclick="javascript:check_comment('${boardDTO.seq }')" id="comment_btn"  class="btn" value="등록" style="float:right;"> --%>
            </div>
           </div>
        <input type="hidden" id="seq" name="seq" value="${boardDTO.seq}" />
        <input type="hidden" id="re_ref" name="re_ref" value="${boardDTO.seq}" />
        <input type="hidden" id="re_lev" name="re_lev" value="${boardDTO.re_lev+1}" />
        <input type="hidden" id="re_seq" name="re_seq" value="${boardDTO.re_seq}" />        
    	
    </form>
</div>
<div class="container">
        <div id="commentList">
        </div>
</div>

 
</body>
</html>