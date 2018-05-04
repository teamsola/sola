<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css?ver=3"/>
<link rel="stylesheet" type="text/css" href="css/banner.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="js/nav.js?ver=1"></script>
<script src="js/banner.js"></script>
<script type="text/javascript">

 $(document).ready(function(){

	 
 });
</script>
<style type="text/css">

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
 			<div class="banner current" style="display:block;" id="bn1"><a href="#"><img src="img/1.png" width="1300px" height="500px" alt=""></a></div>
			<div class="banner wait" style="display:block;" id="bn2"><a href="#"><img src="img/2.png" width="1300px" height="500px" alt=""></a></div>
			<div class="banner wait" style="display:block;" id="bn3"><a href="#"><img src="img/3.png" width="1300px" height="500px" alt=""></a></div>
			<div class="arrow" id="before"><img src="img/left.png" width="25" height="50" /></div>
			<div class="arrow" id="post"><img src="img/right.png" width="25" height="50" /></div>
			<ul id="controls">
		    	<li class="active" rel="bn1"><a href="#"><b>●</b></a></li> 
    			<li rel="bn2"><a href="#"><b>●</b></a></li> 
   				<li rel="bn3"><a href="#"><b>●</b></a></li> 
   			</ul>
  		</div>
	</section>
	<section id="home" align="center">
		<div id="home1" class="frame"><jsp:include page="${home1 }" /></div>
		<div id="home2" class="frame"><jsp:include page="${home2 }" /></div>
	</section>
	<footer><jsp:include page="/common/footer.jsp" /></footer>
</div>
</body>
</html>