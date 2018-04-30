<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert_title_here</title>
	<script type="text/javascript" src="../script/jquery-3.3.1.min.js"></script>
	<style type="text/css">
	#interior_content{float:left;width:100%; overflow:hidden; height:auto; margin:0 auto;}
	.interior_title{padding:20px;line-height:150px;float:left; width:100%;height:150px; background: url("../img/interior.jpg") no-repeat center center;}
	.interior_srch{margin:20px;}
	#keyword{border-style:none;font-size:16px; padding:7px; position:relative;bottom:13px;border:1px solid #6a6763;box-sizing: border-box;}
	#keyword:focus{outline:none;border:2px solid #6a6763;box-sizing: border-box;}
	#searchimg{cursor: pointer;}
	#interior_add_btn{background: url("../img/interior_btn.png") no-repeat 6px; font-weight:bold; border-style:none; border:1px solid black; border-radius:20px; background-size:120px 30px; width: 162px; height: 35px;font-size:15px;}
	#interior_add_btn:hover, #interior_add_btn:active{cursor:pointer; outline:none; background:#6a6763 url("../img/interior_btn_hover.png") no-repeat 6px; border:none; background-size:120px 30px;color:white;}
	.interior_list{float:left;margin:10px; width:100%;}
	.interior_list .list_each{float:left;width:330px;margin:30px 15px 40px 15px;height:380px;}
	.interior_list .list_each a, .interior_list .interior_list a:visited{text-decoration: none;color: black;}
	.interior_list .list_each a:hover{color:red;}
	.interior_list .list_each img:hover{cursor:pointer;}
	#pagingBtn{color:#ff8400;font-size:15px;border-style: none; width:160px; height:35px;background: none; border:1px solid #6a6763; border-radius:20px;}
	#pagingBtn:hover, #pagingBtn:active{background:#6a6763; color:white;outline:none;}
	</style>
	<script type="text/javascript">
	$(function(){
		<c:forEach begin="1" end="6" var="i" step="1">
		var width = $('.image'+${i}).width();
		var height = $('.image'+${i}).height();
		if(width/height > (33/20)){
			$('.image'+${i}).css({
				"display":"block",
				"margin" : "auto",
				"max-height" : "100%"
			});
		}else{
			$('.image'+${i}).css({
				"display":"block",
				"margin" : "auto",
				"max-width" : "100%"
			});
		}
	</c:forEach>
	function interiorSrch(){
		$('#interiorSearchForm').submit();
	};
	function pagingBtn_p(){
		document.getElementById("pg").value = '${pg-1}';
		document.getElementById("keyword").value = '${keyword}';
		document.interiorSearchForm.submit();
	};
	function pagingBtn_n(){
		document.getElementById("pg").value = '${pg+1}';
		document.getElementById("keyword").value = '${keyword}';
		document.interiorSearchForm.submit();
	};
	
	});
	</script>
	</head>
	<body>
		<div id="interior_content">
			
			<div class="interior_title">
				<span style="cursor:pointer;font-size:25px;padding:10px 13px 10px 3px;margin:7px;background: rgba(255,255,255, 0.7);" onclick="javascript:goToRecipe()">TIP > 인테리어 </span>
			</div>
			
			<form action="interior.do" method="post" id="interiorSearchForm" name="interiorSearchForm">
			<div class="interior_srch">
			<div style="float:left;">
				<input type="hidden" value="1" id="pg" name="pg">
				<input type="text" id="keyword" placeholder="검색어를 입력하세요" name="keyword">
				<img id="searchimg" src="../img/i_searchBtn.png" width="36px" height="36px" style="margin-top:5px;" onclick="javascript:interiorSrch()">
			</div>
			<div style="float:right;margin:5px;">
			지금 바로 인테리어를 등록해보세요! >&nbsp;&nbsp;&nbsp;&nbsp;<input id="interior_add_btn" type="button" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;인테리어 작성" onclick="location.href='interior_add.do'">
			</div>
			</div>
			</form>
			
			<div class="interior_list">
				<c:forEach items="${list }" var="item" varStatus="i">
					<div class="list_each">
						<div style="float:left;width:330px;height: 200px;margin: 0 auto;overflow:hidden;text-align: center;border-radius:15px;">
						<c:choose>
							<c:when test="${item.interior_mainimage == 'null' }">
							<img class="image${i.count }" src="../img/recipe_default.png" onclick="location.href='interior_view.do?s=${item.interior_seq}'">
							</c:when>
							<c:otherwise>
							<img class="image${i.count }" src="../storage/${item.interior_mainimage }" onclick="location.href='interior_view.do?s=${item.interior_seq}'">
							</c:otherwise>
						</c:choose>
						</div>
						<div style="width:310px; margin:40px 10px 2px 10px;padding-top:10px;border-bottom:1px solid black;font-size:25px;color:black; overflow: hidden;">
						<a href="interior_view.do?s=${item.interior_seq }">${item.name }님의 DIY 인테리어</a></div>
						<div style="margin: 5px 10px 5px 10px; font-size: 16px;">
						 <c:choose>
				           <c:when test="${fn:length(item.interior_title) > 23}">
				            <c:out value="${fn:substring(item.interior_title,0,22)}"/>...
				           </c:when>
				           <c:otherwise>
				            <c:if test="${item.interior_title == null }">한줄소개가 없습니다</c:if>
				            <c:if test="${item.interior_title != null }"><c:out value="${item.interior_title}"/></c:if>
				           </c:otherwise> 
				          </c:choose>
						</div>
						<div style="width:320px; padding: 0 5px; height:50px;border:1px dashed #BDBDBD; border-radius: 10px;line-height:50px;">
						<span style="color:#6a6763; font-size: 13px; padding:5px 8px;">
						${item.roomsize }평
						</span>
						<span style="color:#6a6763; font-size: 13px; padding:5px 8px; border-left: 1px dashed #BDBDBD;">예상비용:${item.price }만원</span>
						</div>
						<div>
						<span style="float:left;color:#6a6763; font-size: 13px;">
						작성시간 | <c:choose>
							<c:when test="${fn:substring(item.logtime, 2,3) == ':' }">
								오늘 <c:out value="${fn:substring(item.logtime,0,5) }"/>
							</c:when>
							<c:otherwise>
								<c:out value="${fn:substring(item.logtime,0,4) }"/>년 <c:out value="${fn:substring(item.logtime,5,7) }"/>월 <c:out value="${fn:substring(item.logtime,8,10) }"/>일
							</c:otherwise>
						</c:choose>
						</span>
						<span style="float:right;"><img src="../img/hit.png" width="15px" height="12px" style="margin-top:12px;margin-right:5px;">${item.hit }</span>
						</div>
					</div>
				</c:forEach>
			</div>
			<div style="float:left;text-align:center;font-weight:bold;width: 100%; color:#6a6763; font-size:15px; margin-bottom:5px;">page ${pg }</div>
			<div style="float:left;text-align:center; margin: 0 2%;width:96%;height:50px;border-top:1px dashed #6a6763;">
			<c:if test="${pg>1 }">
			<div id="pagingBefore" style="float:left;margin-top:10px;"><input type="button" id="pagingBtn" value="&lt; Previous Page" onclick="javascript:pagingBtn_p()"></div>
			</c:if>
			<fmt:parseNumber integerOnly="true" value="${(totalN+5)/6 }" var="endPage"/>
			<c:if test="${pg < endPage }">
			<div id="pagingAfter" style="float:right;margin-top:10px;"><input type="button" id="pagingBtn" value="Next Page &gt;" onclick="javascript:pagingBtn_n()"></div>
			</c:if>
			</div>
			
			
		</div>
	</body>
</html>