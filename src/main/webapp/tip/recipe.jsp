<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>SOLA > TIP > 레시피</title>
	<link rel="stylesheet" type="text/css" href="/sola/css/tip.css">
	<script type="text/javascript" src="/sola/js/jquery-3.3.1.min.js"></script>
	<style type="text/css">
	#recipe_content{float:left;width:100%; overflow:hidden; height:auto; margin:0 auto;}
	.recipe_title{padding:20px;line-height:150px;float:left; width:100%;height:150px; background: url("/sola/img/recipe.jpg") no-repeat center center;}
	.recipe_srch{margin:20px;}
	#keyword{border-style:none;font-size:16px; padding:7px; position:relative;bottom:13px;border:1px solid #ff8400;box-sizing: border-box;}
	#keyword:focus{outline:none;border:2px solid #ff8400;box-sizing: border-box;}
	#searchimg{cursor: pointer;}
	.recipe_list{float:left;margin:10px; width:100%;}
	.recipe_list .list_each{float:left;width:330px;margin:30px 15px 40px 15px;height:380px;}
	.recipe_list .list_each a, .recipe_list .list_each a:visited{text-decoration: none;color: #ff8400;}
	.recipe_list .list_each a:hover{color:red;}
	.recipe_list .list_each img:hover{cursor:pointer;}
	#recipe_add_btn{background: url("/sola/img/write_btn.png") no-repeat 6px; color:#ff8400; font-weight:bold; border-style:none; border:1px solid #ff8400; border-radius:20px; background-size:120px 30px; width: 150px; height: 35px;font-size:15px;}
	#recipe_add_btn:hover, #recipe_add_btn:active{cursor:pointer; outline:none; background:#ff8400 url("/sola/img/write_btn_hover.png") no-repeat 6px; background-size:120px 30px;color:white;}
	#pagingBtn{color:#ff8400;font-size:15px;border-style: none; width:160px; height:35px;background: none; border:1px solid #ff8400; border-radius:20px;}
	#pagingBtn:hover, #pagingBtn:active{background:#ff8400; color:white;outline:none;}
	</style>
	<script type="text/javascript">
		function goToRecipe(){
			document.getElementById("keyword").value = "";
			document.recipeSearchForm.submit();
		};
		$(function(){
			if('${keyword}' != ''){
				$('#keyword').val('${keyword}');
			}
			
			$('#recipe_search').on('keyup', function(e){
				if(e.keyCode == 13){
					recipeSrch();
				}
			});

			if('${listStatus}' =='empty'){
				alert("검색 결과가 없습니다.");
				document.getElementById("keyword").value = "";
				document.recipeSearchForm.submit();
			}
			
			 /* style="display:block; margin:auto;" */
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
		});

		function recipeSrch(){
			$('#recipeSearchForm').submit();
		};
		function pagingBtn_p(){
			document.getElementById("pg").value = '${pg-1}';
			document.getElementById("keyword").value = '${keyword}';
			document.recipeSearchForm.submit();
		}
		function pagingBtn_n(){
			document.getElementById("pg").value = '${pg+1}';
			document.getElementById("keyword").value = '${keyword}';
			document.recipeSearchForm.submit();
		}
		
	</script>
	</head>
	<body>
		<div id="recipe_content">
			
			<div class="recipe_title">
				<span style="cursor:pointer;font-size:25px;padding:10px 13px 10px 3px;margin:7px;background: rgba(255,255,255, 0.7);" onclick="javascript:goToRecipe()">TIP > 레시피 </span>
			</div>
			
			<form action="recipe.do" method="post" id="recipeSearchForm" name="recipeSearchForm">
			<div class="recipe_srch">
			<div style="float:left;">
				<input type="hidden" value="1" id="pg" name="pg">
				<input type="text" id="keyword" placeholder="검색어를 입력하세요" name="keyword">
				<img id="searchimg" src="/sola/img/searchBtn.png" width="36px" height="36px" style="margin-top:5px;" onclick="javascript:recipeSrch()">
			</div>
			<div style="float:right;margin:5px;">
			지금 바로 레시피를 등록해보세요! >&nbsp;&nbsp;&nbsp;&nbsp;<input id="recipe_add_btn" type="button" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;레시피 작성" onclick="location.href='recipe_add.do'">
			</div>
			</div>
			</form>
			
			<div class="recipe_list">
				<c:forEach items="${list }" var="item" varStatus="i">
					<div class="list_each">
						<div style="float:left;width:330px;height: 200px;margin: 0 auto;overflow:hidden;text-align: center;border-radius:15px;">
						<c:choose>
							<c:when test="${item.foodimage == 'null' }">
							<img class="image${i.count }" src="/sola/img/recipe_default.png" onclick="location.href='recipe_view.do?p=${pg }&s=${item.recipe_seq }&k=${keyword }'">
							</c:when>
							<c:otherwise>
							<img class="image${i.count }" src="../storage/${item.foodimage }" onclick="location.href='recipe_view.do?p=${pg }&s=${item.recipe_seq }&k=${keyword }'">
							</c:otherwise>
						</c:choose>
						</div>
						<div style="width:310px; margin:40px 10px 2px 10px;padding-top:10px;border-bottom:1px solid #ff8400;font-size:25px;color:#ff8400; overflow: hidden;">
						<a href="recipe_view.do?p=${pg }&s=${item.recipe_seq }&k=${keyword }">${item.foodname }</a></div>
						<div style="margin: 5px 10px 5px 10px; font-size: 16px;">
						 <c:choose>
				           <c:when test="${fn:length(item.foodname_detail) > 23}">
				            <c:out value="${fn:substring(item.foodname_detail,0,22)}"/>...
				           </c:when>
				           <c:otherwise>
				            <c:out value="${item.foodname_detail}"/>
				           </c:otherwise> 
				          </c:choose>
						</div>
						<div style="width:320px; padding: 0 5px; height:50px;border:1px dashed #BDBDBD; border-radius: 10px;line-height:50px;">
						<span style="color:#6a6763; font-size: 13px; padding:5px 8px;">
						<c:if test="${item.cookingtime <= 60 }">${item.cookingtime }분</c:if>
						<c:if test="${item.cookingtime > 60 }"><fmt:parseNumber var="hour" integerOnly="true" value="${item.cookingtime/60 }"/>
						${hour }시간 ${item.cookingtime - hour*60 }분</c:if>
						</span>
						
						<c:if test="${item.difficulty == 1}">
						<span style="color:#6a6763; font-size: 13px; padding:5px 8px; border-left: 1px dashed #BDBDBD;">난이도:<span style="color:green;">쉬움</span></span>
						</c:if>
						<c:if test="${item.difficulty == 2}">
						<span style="color:#6a6763; font-size: 13px; padding:5px 8px; border-left: 1px dashed #BDBDBD;">난이도:<span style="color:orange;">중간</span></span>
						</c:if>
						<c:if test="${item.difficulty == 3}">
						<span style="color:#6a6763; font-size: 13px; padding:5px 8px; border-left: 1px dashed #BDBDBD;">난이도:<span style="color:red;">어려움</span></span>
						</c:if>
						<c:if test="${item.price != 0}">
						<span style="color:#6a6763; font-size: 13px; padding:5px 8px; border-left: 1px dashed #BDBDBD;">예상비용:${item.price }원</span>
						</c:if>
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
						<span style="float:right;"><img src="/sola/img/hit.png" width="15px" height="12px" style="margin-top:12px;margin-right:5px;">${item.hit }</span>
						</div>
					</div>
				</c:forEach>
			</div>
			<div style="float:left;text-align:center;font-weight:bold;width: 100%; color:#ff8400; font-size:15px; margin-bottom:5px;">page ${pg }</div>
			<div style="float:left;text-align:center; margin: 0 2%;width:96%;height:50px;border-top:1px dashed #ff8400;">
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