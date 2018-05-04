<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert_title_here</title>
	<link rel="stylesheet" type="text/css" href="/sola/css/tip.css">
	<script type="text/javascript" src="/sola/js/jquery-3.3.1.min.js"></script>
	<style type="text/css">
	#recipe_content{float:left;width:100%; overflow:hidden; height:auto; margin:0 auto;}
	.recipe_title{padding:20px;line-height:200px;float:left; width:100%;height:200px; background-image: url("/sola/img/food.jpg"); background-size: cover;background-position: center center;}
	#r_add_subtitle{width:1100px;margin:5px 0;display: inline-block; text-align: left;}
	.subtitle_detail{height: auto;overflow: hidden; box-sizing: border-box;}
	.subtitle_detail .left{float:left;width:600px;height:400px;padding: 15px;text-align: center;border:1px solid #BDBDBD;box-sizing: border-box;}
	.subtitle_detail .right{float:right;text-align:center;width:500px;height:400px;padding: 10px;border-top:1px solid #BDBDBD;border-bottom:1px solid #BDBDBD;border-right:1px solid #BDBDBD; box-sizing: border-box;}
	#underBtn{outline:none;border-style: none;border:1px solid #ff8400; background: none; border-radius: 20px; color:#ff8400; width:150px;height:40px;}
	#underBtn:hover, #underBtn:active{background: #ff8400;color:white;outline:none;}
	#newImageWindow{cursor:pointer;display: block;transition:.3s ease;}
	#zoomin_img{transition:.3s ease;opacity:0;position: absolute; top:50%;left: 50%;transform:translate(-50%, -50%);-ms-transform:(-50%, -50%);}
	#img_hov:hover #newImageWindow{opacity:0.8;}
	#zoomin_img:hover{transition:.3s ease;opacity: 1;cursor: pointer;}
	</style>
	<script type="text/javascript">
	function confirmDel(){
		if(confirm("게시물을 삭제하시겠습니까?")){
			location.href="recipe_delete.do?s=${recipeDTO.recipe_seq}&i=${recipeDTO.foodimage}";
		}
	};
	$(function(){
		$('#zoomin_img').click(function(){
			var elem = $('#newImageWindow');
				var winProps=' width=900,height=700, resizable=yes, scrollvars=yes,menubar=no, toolbar=no';
			    var newWin=open(elem.attr('src'),'aWin',winProps);
			
		});
		
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
		<div id="recipe_content">
			<div class="recipe_title">
				<span style="font-size:25px;padding:10px 13px 10px 3px;margin:7px;background: rgba(255,255,255, 0.7);">TIP > 레시피 </span>
			</div>
			<div style="float:left;width:100%;text-align: center;">
				<div id="r_add_subtitle">
				<h2 style="margin-left:20px;">${recipeDTO.name }님이 추천하는 레시피</h2>
				<div class="subtitle_detail">
					
					<div class="left">
						<div id="img_hov" style="width:500px;height: 300px;margin: 30px auto;overflow:hidden;text-align: center;border-radius:10px;position: relative;">
							<c:choose>
								<c:when test="${recipeDTO.foodimage == 'null'}">
								<img class="image" src="/sola/img/recipe_default.png" width="100%" height="auto">
								</c:when>
								<c:otherwise>
								<img class="image" src="/sola/storage/${recipeDTO.foodimage }" id="newImageWindow" width="100%" height="auto">
								<div id="zoomin_img"><img src="/sola/img/zoomin.png" width="500px" height="300px"></div>
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
						
						<span style="border-right:2px solid #ff8400; color:gray;font-size:20px;padding:0 20px;"><img src="/sola/img/timer.png" width="25px" height="25px" style="position: relative; top:5px; box-sizing: border-box;"> 조리시간 : ${recipeDTO.cookingtime }분</span>
						<span style="border-right:2px solid #ff8400; color:gray;font-size:20px;padding:0 20px;"><img src="/sola/img/diff.png" width="25px" height="25px" style="position: relative; top:5px; box-sizing: border-box;"> 난이도 : <c:if test="${ recipeDTO.difficulty == 1}">쉬움</c:if>
						<c:if test="${ recipeDTO.difficulty == 2}">보통</c:if><c:if test="${ recipeDTO.difficulty == 3}">어려움</c:if></span>
						<c:if test="${recipeDTO.price != 0 }">
							<span style="border-right:2px solid #ff8400;color:gray; font-size:20px;padding:0 20px;"><img src="/sola/img/price.png" width="25px" height="25px" style="position: relative; top:5px; box-sizing: border-box;">&nbsp;예상가격 : ${recipeDTO.price }원</span>
						</c:if>
						<span style="font-size:20px;color:gray;padding:0 20px;"><img src="/sola/img/hit.png" width="25px" height="25px" style="position: relative; top:5px; box-sizing: border-box;"> 조회수 : ${recipeDTO.hit }</span>
						
					</div>
					<!-- 아래부터 레시피 -->
					<div style="float:left;width:1100px;box-sizing: border-box;margin-top:30px;padding:70px;height:auto;background: #FFE08C; border-radius: 10px; overflow: hidden;">
						<div style="width:100%;height:50px;float:left;font-size:30px;padding-bottom:10px;border-bottom:1px dashed #ff8400;">
							<img src="/sola/img/ingredients-list.png" width="40px" height="40px">&nbsp;필수재료&nbsp;&nbsp;<span style="font-size:16px;color:#6a6763;">| 반드시 필요한 재료입니다.</span>
						</div>
						<div style="float:left; margin-top:20px;width:94%;font-size:20px;height:auto; padding:3%; margin-bottom:30px;text-align:center;border-radius: 20px; background: #ff8400;">
							${recipeDTO.jaeryo_necessary }
						</div>
						
						<c:if test="${recipeDTO.jaeryo_nonecessary != 'null' }">
						<div style="width:100%;height:50px;float:left;font-size:30px;border-bottom:1px dashed #ff8400;">
							선택재료&nbsp;<span style="font-size:16px;color:#6a6763;">| 기호에 따라 첨가하면 좋은 재료입니다.</span>
						</div>
						<div style="float:left; margin-top:20px;width:94%;font-size:20px;height:auto; padding:3%; margin-bottom:30px; text-align:center;border-radius: 20px; background: #ff8400;">
							${recipeDTO.jaeryo_nonecessary }
						</div>
						</c:if>
						
						<div style="width:100%;height:50px;float:left;font-size:30px;margin-top:50px;padding-bottom:10px;border-bottom:1px dashed #ff8400;">
							<img src="/sola/img/cooking-icon.png" width="60px" height="40px" style="position:relative; top:10px;">&nbsp;레시피&nbsp;&nbsp;<span style="font-size:16px;color:#6a6763;">| 조리 방법입니다.</span>
						</div>
						<div style="float:left; margin-top:20px;width:100%;font-size:20px;height:auto; padding:3% 0; margin-bottom:30px;text-align:center;border-radius: 20px; background: #ff8400;">
						<div style="float:left; color:white; border-right:1px solid white; width:12%;height:100%;font-size:60px;padding:0 1%;">1</div>
						<div style="float:right; margin-top:10px;color:white; width:81%;height:100%;padding:0 2%;">${recipeDTO.recipe0 }</div>
						</div>
						<div style="float:left; margin-top:20px;width:100%;font-size:20px;height:auto; padding:3% 0; margin-bottom:30px;text-align:center;border-radius: 20px; background: #ff8400;">
						<div style="float:left; color:white; border-right:1px solid white; width:12%;height:100%;font-size:60px;padding:0 1%;">2</div>
						<div style="float:right; color:white;margin-top:10px; width:81%;height:100%;padding:0 2%;">${recipeDTO.recipe1 }</div>
						</div>
						<div style="float:left; margin-top:20px;width:100%;font-size:20px;height:auto; padding:3% 0; margin-bottom:30px;text-align:center;border-radius: 20px; background: #ff8400;">
						<div style="float:left; color:white; border-right:1px solid white; width:12%;height:100%;font-size:60px;padding:0 1%;">3</div>
						<div style="float:right; color:white;margin-top:10px; width:81%;height:100%;padding:0 2%;">${recipeDTO.recipe2 }</div>
						</div>
						<div style="float:left; margin-top:20px;width:100%;font-size:20px;height:auto; padding:3% 0; margin-bottom:30px;text-align:center;border-radius: 20px; background: #ff8400;">
						<div style="float:left; color:white; border-right:1px solid white; width:12%;height:100%;font-size:60px;padding:0 1%;">4</div>
						<div style="float:right; color:white;margin-top:10px; width:81%;height:100%;padding:0 2%;">${recipeDTO.recipe3 }</div>
						</div>
						<div style="float:left; margin-top:20px;width:100%;font-size:20px;height:auto; padding:3% 0; margin-bottom:30px;text-align:center;border-radius: 20px; background: #ff8400;">
						<div style="float:left; color:white; border-right:1px solid white; width:12%;height:100%;font-size:60px;padding:0 1%;">5</div>
						<div style="float:right; color:white;margin-top:10px; width:81%;height:100%;padding:0 2%;">${recipeDTO.recipe4 }</div>
						</div>
						<c:if test="${recipeDTO.recipe5 != 'null' }">
							<div style="float:left; margin-top:20px;width:100%;font-size:20px;height:auto; padding:3% 0; margin-bottom:30px;text-align:center;border-radius: 20px; background: #ff8400;">
							<div style="float:left; color:white; border-right:1px solid white; width:12%;height:100%;font-size:60px;padding:0 1%;">6</div>
							<div style="float:right; color:white;margin-top:10px; width:81%;height:100%;padding:0 2%;">${recipeDTO.recipe5 }</div>
							</div>
						</c:if>
						<c:if test="${recipeDTO.recipe6 != 'null' }">
							<div style="float:left; margin-top:20px;width:100%;font-size:20px;height:auto; padding:3% 0; margin-bottom:30px;text-align:center;border-radius: 20px; background: #ff8400;">
							<div style="float:left; color:white; border-right:1px solid white; width:12%;height:100%;font-size:60px;padding:0 1%;">7</div>
							<div style="float:right; color:white;margin-top:10px; width:81%;height:100%;padding:0 2%;">${recipeDTO.recipe6 }</div>
							</div>
						</c:if>
						<c:if test="${recipeDTO.recipe7 != 'null' }">
							<div style="float:left; margin-top:20px;width:100%;font-size:20px;height:auto; padding:3% 0; margin-bottom:30px;text-align:center;border-radius: 20px; background: #ff8400;">
							<div style="float:left; color:white; border-right:1px solid white; width:12%;height:100%;font-size:60px;padding:0 1%;">8</div>
							<div style="float:right; color:white;margin-top:10px; width:81%;height:100%;padding:0 2%;">${recipeDTO.recipe7 }</div>
							</div>
						</c:if>
						<c:if test="${recipeDTO.recipe8 != 'null' }">
							<div style="float:left; margin-top:20px;width:100%;font-size:20px;height:auto; padding:3% 0; margin-bottom:30px;text-align:center;border-radius: 20px; background: #ff8400;">
							<div style="float:left; color:white; border-right:1px solid white; width:12%;height:100%;font-size:60px;padding:0 1%;">9</div>
							<div style="float:right; color:white;margin-top:10px; width:81%;height:100%;padding:0 2%;">${recipeDTO.recipe8 }</div>
							</div>
						</c:if>
						<c:if test="${recipeDTO.recipe9 != 'null' }">
							<div style="float:left; margin-top:20px;width:100%;font-size:20px;height:auto; padding:3% 0; margin-bottom:30px;text-align:center;border-radius: 20px; background: #ff8400;">
							<div style="float:left; color:white; border-right:1px solid white; width:12%;height:100%;font-size:60px;padding:0 1%;">10</div>
							<div style="float:right; color:white;margin-top:10px; width:81%;height:100%;padding:0 2%;">${recipeDTO.recipe9 }</div>
							</div>
						</c:if>
					</div>
					<div style="float:left;width:100%;height:60px;text-align: center;padding:10px 0;">
						<c:if test="${recipeDTO.id == memId || memId == 'admin'}">
						<input type="button" id="underBtn" value="수정" onclick="location.href='recipe_modify.do?s=${recipeDTO.recipe_seq}&p=${pg}&k=${keyword}'">&nbsp;
						<input type="button" id="underBtn" value="삭제" onclick="confirmDel()">&nbsp;
						</c:if>
						<input type="button" id="underBtn" value="목록으로" onclick="location.href='recipe.do?pg=${pg}&keyword=${keyword }'">
					</div>
				</div>
			</div>
			</div>
		</div>
	</body>
</html>