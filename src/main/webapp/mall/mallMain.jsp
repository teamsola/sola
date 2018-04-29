<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
a{
	text-decoration:none;
}


#title{
	text-decoration:bold;
	margin-top:40px;
	font-size:40px;
	text-align:center;
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
	margin-top:100px;
}
	
#old{
	background-color:#FAE0D4;
   	
	width:50%;
	height:100%;
	float:left;
	box-sizing:border-box;
	border-right-color:#993800;
  	border-right-style: solid;
   	border-right-width: 1px;
}

#new{
	background-color:#FAE0D4;
	
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
	width:50%;
	height:30%;
	font-size:14px;
}

#more{
	margin-left:650px;
}
</style>
</head>
<body>



	<p id="title">
	MALL
	</p>
	
	
	
<div id="wrapper2">
	
	
	<!-- 중고 게시판 -->
	<div id="old">
	
	
	
	<table id="oldtable">
		<tr>
			<td id="oldtd"><a href="mallBoardList.do?pg=1"><img src="../image/2.JPG" id="oldimg1" width="250" height="300"></a>
			<td id="oldtd"><a href="mallBoardWriteForm.do"><img src="../image/1.JPG" id="oldimg2" width="250" height="300"></a>
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
								<a href="${mallDTO.mallurl }"><img src="../storage/${mallDTO.img }" width="100" height="120"></a>
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
								<img src="../storage/${mallDTO.img }" width="100" height="120">
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
								<img src="../storage/${mallDTO.img }" width="100" height="120">
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


	<a href="mallUpdateBefore.do">(관리자일경우만 보임)수정/삭제</a><br>
	<a href="mallInsertForm.do">(관리자일경우만 보임)등록</a><br>


</body>
</html>