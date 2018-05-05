<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SOLA</title>
<link rel="stylesheet" type="text/css" href="css/main.css?ver=3"/>
<link rel="stylesheet" type="text/css" href="css/banner.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="js/nav.js?ver=1"></script>
<script src="js/banner.js"></script>
<style type="text/css">
.main_list{display:inline-block;width:1500px;margin:10px auto;text-align: left;}
	.main_list .list_each{display:inline-block;text-align:left;width:400px;margin:30px 25px 40px 25px;height:380px;}
	.main_list .list_each a, .main_list .list_each a:visited{text-decoration: none;color: #ff8400;}
	.main_list .list_each a:hover{color:red;}
	.main_list .list_each img:hover{cursor:pointer;}
</style>
</head>
<body>
<div id="wrapper" class="frame">
<div class="title">
	<nav role="gnb">
		<jsp:include page="/common/nav.jsp" />
	</nav>
	</div>
	<section class="event_banner" style="margin-top:60px;">
 		<div id="banners">
 			<div class="banner current" style="display:block;" id="bn1"><a href="#"><img src="img/main_banner1.jpg" width="auto" height="100%" alt=""></a></div>
			<div class="banner wait" style="display:block;" id="bn2"><a href="place.do"><img src="img/main_banner2.jpg" width="auto" height="100%" alt="" style="right: 0;position: absolute;right: 0;"></a></div>
			<div class="banner wait" style="display:block;" id="bn3"><a href="#"><img src="img/main_banner3.jpg" width="auto" height="100%" alt=""></a></div>
			<div class="arrow" id="before"><img src="img/left.png" width="25" height="50" /></div>
			<div class="arrow" id="post"><img src="img/right.png" width="25" height="50" /></div>
			<ul id="controls">
		    	<li class="active" rel="bn1"><a href="#"><b>●</b></a></li> 
    			<li rel="bn2"><a href="#"><b>●</b></a></li> 
   				<li rel="bn3"><a href="#"><b>●</b></a></li> 
   			</ul>
  		</div>
	</section>
	<%-- <section id="home" align="center">
		<div id="home1" class="frame"><jsp:include page="${home1 }" /></div>
		<div id="home2" class="frame"><jsp:include page="${home2 }" /></div>
	</section> --%>
	<div style="float:left;width: 100%;text-align: center;margin: 0 auto;">
			<div class="main_list">
				<div class="list_each">
						<div style="float:left;width:400px;height: 200px;margin: 0 auto;overflow:hidden;text-align: center;border-radius:15px;">
							<img class="image1" src="/sola/img/main_list1.jpg" width="100%" height="auto" onclick="location.href='mallBoardList.do?pg=1'">
						</div>
						<div style="width:380px; margin:40px 10px 2px 10px;padding-top:10px;border-bottom:1px solid #ff8400;font-size:25px;color:#ff8400; overflow: hidden;">
							<a href="mallBoardList.do?pg=1">MALL > 게시판</a></div>
						<div style="margin: 5px 10px 5px 10px; font-size: 16px;">
							자취생들을 위한 쇼핑 노하우
						</div>
						<div style="width:380px; padding: 10px; height:auto;border:1px dashed #BDBDBD; border-radius: 10px;">
							돈 없으시죠? 어떻게 하면 좋은 상품을 싼 가격에 구매할 수 있을까요? 지금 바로 확인해보세요.
						</div>
						
					</div>
					<div class="list_each" style="text-align: center;">
						<div style="float:left;width:400px;height: 200px;margin: 0 auto;overflow:hidden;text-align: center;border-radius:15px;">
							<img class="image2" src="/sola/img/express_down.jpg" width="100%" height="auto" onclick="location.href='express_view.do'">
						</div>
						<div style="width:380px; margin:40px 10px 2px 10px;padding-top:10px;border-bottom:1px solid #ff8400;font-size:25px;color:#ff8400; overflow: hidden;">
							<a href="express_view.do">TIP > 무인택배</a></div>
						<div style="margin: 5px 10px 5px 10px; font-size: 16px;">
							무인택배 장소 HOT SPOT
						</div>
						<div style="width:380px; padding: 10px; height:auto;border:1px dashed #BDBDBD; border-radius: 10px;">
							안전하게 택배를 받아볼 수 있도록, SOLA 회원들이 공유한 무인택배 장소를 확인해보세요.
						</div>
						
					</div>
					<div class="list_each" style="text-align: right;">
						<div style="float:left;width:400px;height: 200px;margin: 0 auto;overflow:hidden;text-align: center;border-radius:15px;">
							<img class="image3" src="/sola/img/main_list3.jpg" onclick="location.href='search_c.do?keyword_c=live&list_n=0'">
						</div>
						<div style="width:380px; margin:40px 10px 2px 10px;padding-top:10px;border-bottom:1px solid #ff8400;font-size:25px;color:#ff8400; overflow: hidden;">
							<a href="search_c.do?keyword_c=live&list_n=0">전문지식 > 입주 전</a></div>
						<div style="margin: 5px 10px 5px 10px; font-size: 16px;">
							독립을 위한 첫걸음!
						</div>
						<div style="width:380px; padding: 10px; height:auto;border:1px dashed #BDBDBD; border-radius: 10px;">
							오피스텔과 원룸의 차이점을 아시나요? 자취방 구할 때 체크해야 할 점을 지금 확인해보세요.
						</div>
						
					</div>
					<div class="list_each">
						<div style="float:left;width:400px;height: 200px;margin: 0 auto;overflow:hidden;text-align: center;border-radius:15px;">
							<img class="image4" src="/sola/img/main_banner4.jpg" width="100%" height="auto" onclick="location.href='FreeBoardList.do'">
						</div>
						<div style="width:380px; margin:40px 10px 2px 10px;padding-top:10px;border-bottom:1px solid #ff8400;font-size:25px;color:#ff8400; overflow: hidden;">
							<a href="FreeBoardList.do">BOARD > 자유게시판</a></div>
						<div style="margin: 5px 10px 5px 10px; font-size: 16px;">
							우리들의 소통 공간
						</div>
						<div style="width:380px; padding: 10px; height:auto;border:1px dashed #BDBDBD; border-radius: 10px;">
							심심하시죠? 하고 싶은 이야기가 있으신가요? 지금 바로 자유게시판에서 놀아보세요.
						</div>
						
					</div>
					<div class="list_each" style="text-align: center;">
						<div style="float:left;width:400px;height: 200px;margin: 0 auto;overflow:hidden;text-align: center;border-radius:15px;">
							<img class="image5" src="/sola/img/main_list5.jpg" width="100%" height="auto" onclick="location.href='calendar.do?cmd=main'">
						</div>
						<div style="width:380px; margin:40px 10px 2px 10px;padding-top:10px;border-bottom:1px solid #ff8400;font-size:25px;color:#ff8400; overflow: hidden;">
							<a href="calendar.do?cmd=main">LEDGER > 달력보기</a></div>
						<div style="margin: 5px 10px 5px 10px; font-size: 16px;">
							재정 관리를 위한 가계부
						</div>
						<div style="width:380px; padding: 10px; height:auto;border:1px dashed #BDBDBD; border-radius: 10px;">
							혼자 살면 가장 중요한 게 돈관리입니다. 오늘부터 SOLA를 통해 가계부를 작성해보세요.
						</div>
						
					</div>
					<div class="list_each" style="text-align: right;">
						<div style="float:left;width:400px;height: 200px;margin: 0 auto;overflow:hidden;text-align: center;border-radius:15px;">
							<img class="image6" src="/sola/img/main_list6.jpg" onclick="location.href='diaryIndex.do'">
						</div>
						<div style="width:380px; margin:40px 10px 2px 10px;padding-top:10px;border-bottom:1px solid #ff8400;font-size:25px;color:#ff8400; overflow: hidden;">
							<a href="diaryIndex.do">DIARY</a></div>
						<div style="margin: 5px 10px 5px 10px; font-size: 16px;">
							일상 기록을 위한 일기
						</div>
						<div style="width:380px; padding: 10px; height:auto;border:1px dashed #BDBDBD; border-radius: 10px;">
							요새 일기 안 쓰시죠? 어디 한 번 써보시겠어요? 당신을 위해 SOLA는 일기장을 제공합니다.
						</div>
						
					</div>
			</div>
			</div>
	
	<footer><jsp:include page="/common/footer.jsp" /></footer>
</div>
</body>
</html>