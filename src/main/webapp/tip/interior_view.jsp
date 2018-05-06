<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert_title_here</title>
	<script type="text/javascript" src="/sola/js/jquery-3.3.1.min.js"></script>
	<style type="text/css">
	#interior_content{text-align:center;width:100%; overflow:hidden; height:auto; margin:0 auto;}
	.interior_title{padding:20px;float:left; width:100%;height:200px; background-image: url('/sola/img/interior.jpg'); background-size: cover;background-position: center center;}
	#r_add_subtitle{width:1100px;margin:5px 0;display: inline-block; text-align: left;}
	.subtitle_detail{height: auto;overflow: hidden; box-sizing: border-box;}
	.subtitle_detail .left{float:left;width:600px;height:400px;padding: 15px;text-align: center;border:1px solid #BDBDBD;box-sizing: border-box;}
	.subtitle_detail .right{float:right;text-align:center;width:500px;height:400px;padding: 10px;border-top:1px solid #BDBDBD;border-bottom:1px solid #BDBDBD;border-right:1px solid #BDBDBD; box-sizing: border-box;}
	#underBtn{outline:none;border-style: none;border:1px solid #ff8400; background: none; border-radius: 20px; color:#ff8400; width:150px;height:40px;}
	#underBtn:hover, #underBtn:active{background: #ff8400;color:white;outline:none;}
	#newImageWindow{cursor:pointer;display: block;transition:.3s ease;backface-visibility:hidden;}
	#zoomin_img{transition:.3s ease;opacity:0;position: absolute; top:50%;left: 50%;transform:translate(-50%, -50%);-ms-transform:(-50%, -50%);}
	#img_hov:hover #newImageWindow{opacity:0.8;}
	#zoomin_img:hover{transition:.3s ease;opacity: 1;cursor: pointer;}
	#likeBtn{border-style: none; background:none;width:180px;height:40px;border:1px solid #6a6763;border-radius: 20px;outline:none;}
	#likeDelBtn{border-style: none;width:180px;height:40px;border:1px solid #ff8400;border-radius: 20px;outline:none;background : #ff8400 url('/sola/img/like_white.png') no-repeat center center;background-size : auto 80%;outline : none;}
	</style>
	<script type="text/javascript">
	function confirmDel(){
		if(confirm("게시물을 삭제하시겠습니까?")){
			location.href="interior_delete.do?s=${interiorDTO.interior_seq}&i=${interiorDTO.interior_mainimage}&c=${interiorDTO.interior_content}";
		}
	};
	$(function(){
		var cont = '${interior_content}';
		$('#interior_detail').append(cont);
		$('#interior_detail').find('img').css("width", "100%");
		$('#zoomin_img').click(function(){
			var elem = $('#newImageWindow');
				var winProps=' width=900,height=700, resizable=yes, scrollvars=yes,menubar=no, toolbar=no';
			    var newWin=open(elem.attr('src'),'aWin',winProps);
			
		});
		$('#likeBtn').on("mouseover", function(){
			$(this).css({
				"background" : "#6a6763 url('/sola/img/like_white.png') no-repeat center center",
				"background-size" : "auto 80%",
				"outline" : "none"
			});
			$(this).val("");
		});
		$('#likeBtn').on("mouseleave", function(){
			$(this).css({
				"border-style": "none",
				"background":"none",
				"width":"180px",
				"height":"40px",
				"border":"1px solid #6a6763",
				"border-radius": "20px"
			});
			$(this).val("좋아요");
		});
		$('#likeDelBtn').on("mouseleave", function(){
			$(this).css({
				"background" : "#ff8400 url('/sola/img/like_white.png') no-repeat center center",
				"background-size" : "auto 80%",
				"outline" : "none"
			});
			$(this).val("");
		});
		$('#likeDelBtn').on("mouseover", function(){
			$(this).css({
				"border-style": "none",
				"background":"none",
				"width":"180px",
				"height":"40px",
				"border":"1px solid #ff8400",
				"border-radius": "20px"
			});
			$(this).val("좋아요 취소");
		});
		$('#likeBtn').on("click", function(){
			location.href='likeBtnReq.do?p=${pg}&s=${interiorDTO.interior_seq}&k=${keyword}';
		});
		$('#likeDelBtn').on("click", function(){
			location.href='likeDelBtnReq.do?p=${pg}&s=${interiorDTO.interior_seq}&k=${keyword}';
		});

		var width = $('.image').width();
		var height = $('.image').height();
		if(width/height > (5/3)){
			$('.image').css({
				"display":"block",
				"margin" : "auto",
				"max-height" : "100%",
				"width" : "auto",
				"position" : "relative",
				"left" : (500-width)/2
			});
		}else{
			$('.image').css({
				"display":"block",
				"margin" : "auto",
				"max-width" : "100%",
				"height" : "auto",
				"position" : "relative",
				"top" : (300-height)/2
			});
		}
});
	</script>
	</head>
	<body>
		<div id="interior_content">
			<div class="interior_title">
				<span style="float:left;height:30px;font-size:25px;padding:10px 13px 10px 3px;margin:75px auto auto 7px;background: rgba(255,255,255, 0.7);line-height: 30px;">TIP > 인테리어</span>
			</div>
			<div id="r_add_subtitle">
				<h2 style="margin-left:20px;text-align: left;">${interiorDTO.name }님의 DIY 인테리어<span style="font-size:14px;color:#6a6763;">
				&nbsp;| <img src="/sola/img/timer.png" width="20px" height="20px" style="position: relative; top:5px; box-sizing: border-box;"> ${fn:substring(interiorDTO.logtime,0,4)}년  ${fn:substring(interiorDTO.logtime,5,7)}월  ${fn:substring(interiorDTO.logtime,8,10)}일  ${fn:substring(interiorDTO.logtime,11,13)}시  ${fn:substring(interiorDTO.logtime,14,16)}분</span></h2>
				<div class="subtitle_detail">
					
					<div class="left">
						<div id="img_hov" style="width:500px;height: 300px;margin: 30px auto;overflow:hidden;text-align: center;border-radius:10px;position: relative;">
							<c:choose>
								<c:when test="${interiorDTO.interior_mainimage == 'null'}">
								<img class="image" src="/sola/img/interior_default.png" width="100%" height="auto" style="left: -50px;position: relative;">
								</c:when>
								<c:otherwise>
								<img class="image" src="/sola/storage/${interiorDTO.interior_mainimage }" id="newImageWindow" width="100%" height="auto">
								<div id="zoomin_img"><img src="/sola/img/zoomin.png" width="500px" height="300px"></div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="right">
						<div style="width:100%; text-align: center;margin:60px auto;font-size:36px;">
						<c:choose>
							<c:when test="${interiorDTO.interior_title != null }">
							${interiorDTO.interior_title }
							</c:when>
							<c:otherwise>
							${interiorDTO.name }님의 인테리어
							</c:otherwise>
						</c:choose>
						</div>
						<div style="width:100%; text-align:center;">
							<hr style="width:100px;">
						</div>
						<div style="width:400px; text-align: center;color:#ff8400;padding:40px;font-size:20px;font-style: italic;">

							<c:choose>
								<c:when test="${memId == 'admin' }">
								<br><br><br>관리자 모드입니다.
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${likeStatus == 'exist' }">
										<input type="button" id="likeDelBtn" value=""><br><br><br>
											<c:if test="${interiorDTO.like_num == 1 }">
											회원님이 좋아하는 글입니다. 
											</c:if>
											<c:if test="${interiorDTO.like_num > 1 }">
											회원님 외 ${interiorDTO.like_num-1 }명이 좋아하는 글입니다.
											</c:if>
										</c:when>
										<c:otherwise>
											<c:if test="${memId == interiorDTO.id }">
											<br><br><br>
											회원님의 소중한 정보, 감사합니다
											</c:if>
											<c:if test="${memId != interiorDTO.id }">
											<input type="button" id="likeBtn" value="좋아요">
											<br><br><br>
											지금 바로 좋아요를 남겨보세요!
											</c:if>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
							
							
							
						</div>
					</div>
					
					<div style="float:left;width:1100px;margin-top:30px; text-align: center;padding:20px; height:70px; border:1px solid #ff8400; border-radius:10px; box-sizing: border-box;">
						
						<span style="border-right:2px solid #ff8400;color:gray; font-size:20px;padding:0 20px;"><img src="/sola/img/price.png" width="25px" height="25px" style="position: relative; top:5px; box-sizing: border-box;">&nbsp;예상가격 : ${interiorDTO.price }만 원</span>
						<c:if test="${interiorDTO.roomsize>0 }"><span style="border-right:2px solid #ff8400; color:gray;font-size:20px;padding:0 20px;"><img src="/sola/img/icon-sqm-02.png" width="25px" height="25px" style="position: relative; top:5px; box-sizing: border-box;">&nbsp;방 규모 : ${interiorDTO.roomsize } 평</span></c:if>
						<span style="font-size:20px;color:gray;padding:0 20px;border-right:2px solid #ff8400; "><img src="/sola/img/hit.png" width="25px" height="25px" style="position: relative; top:5px; box-sizing: border-box;">&nbsp;조회수 : ${interiorDTO.hit }</span>
						<span style="font-size:20px;color:gray;padding:0 20px;"><img src="/sola/img/like.png" width="25px" height="25px" style="position: relative; top:5px; box-sizing: border-box;">
						<c:choose>
							<c:when test="${interiorDTO.like_num <=0 }">
							&nbsp;추천이 없습니다
							</c:when>
							<c:when test="${interiorDTO.like_num > 0 }">
							&nbsp;${interiorDTO.like_num }명이 이 글을 좋아합니다
							</c:when>
						</c:choose>
						</span>
						
					</div>
					<!-- 아래부터 인테리어 -->
					<div style="float:left;border:1px solid #6a6763;width:1100px;box-sizing: border-box;margin-top:30px;padding:70px;height:auto;background: none; border-radius: 10px; overflow: hidden;">
						<div id="interior_detail" style="background: white;text-align: justify;">
						
						</div>
					</div>
					<div style="float:left;width:100%;height:60px;text-align: center;padding:10px 0;">
						

					<c:if test="${interiorDTO.id == memId }">
					<input type="button" id="underBtn" value="수정" onclick="location.href='interior_modify.do?s=${interiorDTO.interior_seq }&p=${pg}&k=${keyword}'">&nbsp;
					</c:if>
						<c:if test="${interiorDTO.id == memId ||fn:length(memId) < 6 }">
						<input type="button" id="underBtn" value="삭제" onclick="confirmDel()">&nbsp;
						</c:if>
						<input type="button" id="underBtn" value="목록으로" onclick="location.href='interior.do?pg=${pg}&keyword=${keyword}'">
					</div>
				</div>
			</div>
		</div>
	</body>
</html>