<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

#title{
	padding:20px;
	line-height:150px;
	float:left; 
	width:100%;
	height:150px; 
	background-image: url('/sola/storage/몰타이틀.JPG'); 
	background-size:cover; 
	background-position:center; 
	background-repeat: no-repeat;
}

a{
	color:black;
	text-decoration:none;
}

#newtext{
	margin-top:15px;
	text-align:center;
	font-size:15px;
	color:black;
}

table{
	text-align:center;
	margin:0 auto;
}

#oldtable{
	margin-top:130px;
}

tr{
	width:100%;
	height:100%;
}

#newtd{
	width:33%;
	height:100%;
	padding-bottom:10px;
}
	
#oldtd{
	width:50%;
	height:100%;
}	

#oldimg1{
	width:80%;
	height:80%;
}

#oldimg2{
	width:80%;
	height:80%;
}
	
#wrapper2{
	background-color:#ffffff;
	width:100%;
	height:600px;
	box-sizing:border-box;
}
	
#old{
	width:50%;
	height:100%;
	float:left;
	box-sizing:border-box;
	border-right-color:#BDBDBD;
  	border-right-style: solid;
   	border-right-width: 1px;
}

#new{
	width:50%;
	height:100%;
	float:right;
	box-sizing:border-box;
}

#introduce{
	height:70%;
	text-align:center;
	margin:0 auto;
	margin-top:20px;
}
	
#one{
	height:100%;
}
	
#picture{
	width:100%;
	height:70%;
}

#subject{
	margin:auto;
	width:60%;
	height:30%;
	font-size:14px;
}

#more{
	margin-left:550px;
}

#btn{
	text-align:center;
	float:left;
	width:100%;
}

#goback{
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
</style>
</head>
<body>



	
		<div id="title">
				<span style="font-size:25px;padding:10px 13px 10px 3px;margin:7px;background: rgba(255,255,255, 0.7);">M A L L</span>
			</div>
		
	
	
	
<div id="wrapper2">
	
	
	<!-- 중고 게시판 -->
	<div id="old">
	
	
	
	<table id="oldtable">
		<tr>
			<td id="oldtd"><a href="mallBoardList.do?pg=1"><img src="image/2.JPG" id="oldimg1" width="250" height="300"></a>
			<td id="oldtd"><a href="mallBoardWriteForm.do"><img src="image/1.JPG" id="oldimg2" width="250" height="300"></a>
		</tr>
	</table>
	
	</div>
	
	
	
	
	
	
	
	
	
	<!-- 신상 소개 -->
	<div id="new">
	<div id="newtext">NEW</div>
	
	
	<!-- dto에 저장된것 불러오기 -->
	<div id="introduce">
			
			<table>
			
				<tr>
					<!-- 9개만 보이게하기 -->
						<c:forEach var="mallDTO" items="${list2 }" begin="0" end="2" step="1">
							<td id="newtd">
							<div id="one">
								<div id="picture">
								<a href="${mallDTO.mallurl }"><img src="storage/${mallDTO.img }" width="100" height="120"></a>
								</div>
								<div id="subject">
								<a href="${mallDTO.mallurl}">${mallDTO.subject }</a>
								</div>
							</div>
							</td>
						</c:forEach>	
				</tr>
				
				<tr>
						<c:forEach var="mallDTO" items="${list2 }" begin="3" end="5" step="1">
							<td id="newtd">
							<div id="one">
								<div id="picture">
								<img src="storage/${mallDTO.img }" width="100" height="120">
								</div>
								<div id="subject">
								<a href="${mallDTO.mallurl}">${mallDTO.subject }</a>
								</div>
							</div>
							</td>
						</c:forEach>
				
				</tr>
				
				<tr>
						<c:forEach var="mallDTO" items="${list2 }" begin="6" end="8" step="1">
							<td id="newtd">
							<div id="one">
								<div id="picture">
								<img src="storage/${mallDTO.img }" width="100" height="120">
								</div>
								<div id="subject">
								<a href="${mallDTO.mallurl}">${mallDTO.subject }</a>
								</div>
							</div>
							</td>
						</c:forEach>
				
				
				</tr>
				
			</table>		

		<div id="more">
		<a href="mallDetail.do">더보기...</a>
		</div>
	</div>
	</div>

</div>

		<%-- <c:if test="${memId.equals('admin') }"> --%>
		<div id="btn">
			<input type="button" id="goback" value="수정/삭제" onclick='location.href="mallUpdateBefore.do"'>
			<input type="button" id="goback" value="등록" onclick='location.href="mallInsertForm.do"'>
		</div>
		<%-- </c:if> --%>
	


</body>
</html>