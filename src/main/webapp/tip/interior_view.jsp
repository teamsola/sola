<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert_title_here</title>
	<link rel="stylesheet" type="text/css" href="../css/tip.css">
	<script type="text/javascript" src="../script/jquery-3.3.1.min.js"></script>
	<style type="text/css">
	#interior_content{float:left;width:1100px; overflow:hidden; height:auto; margin:0 auto;}
	.interior_title{padding:20px;line-height:150px;float:left; width:100%;height:150px; background: url("../img/recipe.jpg") no-repeat center center;}
	#r_add_subtitle{float:left;width:100%;margin:5px 0;}
	.subtitle_detail{height: auto;overflow: hidden; box-sizing: border-box;}
	.subtitle_detail .left{float:left;width:600px;height:400px;padding: 15px;text-align: center;border:1px solid #BDBDBD;box-sizing: border-box;}
	.subtitle_detail .right{float:right;text-align:center;width:500px;height:400px;padding: 10px;border-top:1px solid #BDBDBD;border-bottom:1px solid #BDBDBD;border-right:1px solid #BDBDBD; box-sizing: border-box;}
	#underBtn{outline:none;border-style: none;border:1px solid #ff8400; background: none; border-radius: 20px; color:#ff8400; width:150px;height:40px;}
	#underBtn:hover, #underBtn:active{background: #ff8400;color:white;outline:none;}
	</style>
	<script type="text/javascript">
	function confirmDel(){
		if(confirm("게시물을 삭제하시겠습니까?")){
			location.href="recipe_delete.do?s=${recipeDTO.recipe_seq}&i=${recipeDTO.foodimage}";
		}
	};
	$(function(){

		var width = $('.image').width();
		var height = $('.image').height();
		if(width/height > (5/3)){
			$('.image').css({
				"display":"block",
				"margin" : "auto",
				"max-height" : "100%",
				"width" : "auto"
			});
		}else{
			$('.image').css({
				"display":"block",
				"margin" : "auto",
				"max-width" : "100%",
				"height" : "auto"
			});
		}
});
	</script>
	</head>
	<body>
		<div id="interior_content">
			<div class="interior_title">
				<span style="font-size:25px;padding:10px 13px 10px 3px;margin:7px;background: rgba(255,255,255, 0.7);">TIP > 레시피 </span>
			</div>
			<div id="r_add_subtitle">
				<h2 style="margin-left:20px;">${recipeDTO.name }님의 DIY 인테리어</h2>
				<div class="subtitle_detail">
					
					<div class="left">
						<div style="width:500px;height: 300px;margin: 30px auto;overflow:hidden;text-align: center;border-radius:10px;">
							<c:choose>
								<c:when test="${recipeDTO.foodimage == 'null'}">
								<img class="image" src="../img/recipe_default.png" width="100%" height="auto">
								</c:when>
								<c:otherwise>
								<img class="image" src="../storage/${recipeDTO.foodimage }" width="100%" height="auto">
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="right">
						<div style="width:100%; text-align: center;margin:80px auto;font-size:42px;">
						${recipeDTO.foodname }
						</div>
						<div style="width:100%; text-align:center;">
							<hr style="width:100px;">
						</div>
						<div style="width:400px; text-align: center;padding:50px 40px;font-size:28px;font-style: italic;">
						${recipeDTO.foodname_detail }
						</div>
					</div>
					
					<div style="float:left;width:1100px;margin-top:30px; text-align: center;padding:20px; height:70px; border:1px solid #ff8400; border-radius:10px; box-sizing: border-box;">
						
						<span style="border-right:2px solid #ff8400; color:gray;font-size:20px;padding:0 20px;"><img src="../img/timer.png" width="25px" height="25px" style="position: relative; top:5px; box-sizing: border-box;"> 조리시간 : 분</span>
						<span style="border-right:2px solid #ff8400; color:gray;font-size:20px;padding:0 20px;"><img src="../img/diff.png" width="25px" height="25px" style="position: relative; top:5px; box-sizing: border-box;">난이도 : </span>
						<span style="border-right:2px solid #ff8400;color:gray; font-size:20px;padding:0 20px;"><img src="../img/price.png" width="25px" height="25px" style="position: relative; top:5px; box-sizing: border-box;">&nbsp;예상가격 :원</span>
						<span style="font-size:20px;color:gray;padding:0 20px;"><img src="../img/hit.png" width="25px" height="25px" style="position: relative; top:5px; box-sizing: border-box;"> 조회수 :</span>
						
					</div>
					<!-- 아래부터 레시피 -->
					<div style="float:left;width:1100px;box-sizing: border-box;margin-top:30px;padding:70px;height:auto;background: #FFE08C; border-radius: 10px; overflow: hidden;">
						
					</div>
					<div style="float:left;width:100%;height:60px;text-align: center;padding:10px 0;">
						<c:if test="${interiorDTO.id == memId }">
						<input type="button" id="underBtn" value="수정" onclick="">&nbsp;
						<input type="button" id="underBtn" value="삭제" onclick="confirmDel()">&nbsp;
						</c:if>
						<input type="button" id="underBtn" value="목록으로" onclick="">
					</div>
				</div>
			</div>
		</div>
	</body>
</html>