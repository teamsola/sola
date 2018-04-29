<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>SOLA > 팁</title>
	<script type="text/javascript" src="../script/jquery-3.3.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="../css/tip.css?ver=3">
	<script type="text/javascript">
		
	</script>
	<style type="text/css">
	html{
		width:100%;
		margin: 0;
		padding: 0;
	}
	body {
	  font:14px/1.8 Arial, Helvetica, sans-serif;
	}
	.frame {
	  width: 100%;
	  margin: 0 auto;
	  border: 1px solid #aaa;
	  height: auto;
	}
	.header {
	  padding:40px 10px;
	  text-align: center;
	  background: #eee;
	  margin-bottom: 20px;
	}
	.logo {
	  font-size: 2em;
	  font-weight: bold;
	  background: #5457de;
	  color: #fff;
	  display: inline-block;
	  padding: 0 8px;
	}
	.container {
	  display: table;
	  overflow: hidden;
	}
	.nav {
	  float: left;
	  width: 150px;
	  background: #ff8400;
	  color: #fff;
	  margin-right: 50px;
	}
	.nav-list {
	  list-style: none;
	  margin: 0;
	  padding: 10px 0;
	}
	.nav-item {
	  margin: 4px 0;
	}
	.nav-link {
	  display: block;
	  text-decoration: none;
	  padding: 4px 10px;
	  color: #fff;
	}
	.nav-link:hover {
	  background: #6a6763;
	}
	.content {
	  float: left;
	  width: 1100px;
	  background: #fff;
	  height: auto;
	}
	.nav, .content {
	  display: table-cell;
	}
	#map {
		float: left;
        height: 400px;
        width: 100%;
        background-color: gray;
       }
	</style>
	</head>
	<body>
		<div class="frame">
		  <div class="container">
		    <div class="nav">
		      <ul class="nav-list">
		        <li class="nav-item"><a href="/sola/tip/place.do" class="nav-link">혼밥혼술</a></li>
		        <li class="nav-item"><a href="/sola/tip/recipe.do?cmd=" class="nav-link">레시피</a></li>
		        <li class="nav-item"><a href="/sola/tip/interior.do?cmd=" class="nav-link">인테리어</a></li>
		        <li class="nav-item"><a href="/sola/tip/express.do" class="nav-link">무인택배</a></li>
		      </ul>
		    </div>
		    <!-- //nav -->
		    <div class="content">
		    <c:if test="${page==null }">
		    	<jsp:include page="main.jsp"></jsp:include>
		    </c:if>
		    <c:if test="${page!=null }">
			    <jsp:include page="${page}.jsp"></jsp:include>
		    </c:if>
    		</div>
		  </div>
		  <!-- //container -->
		</div>
		<!-- //frame -->
	</body>
</html>