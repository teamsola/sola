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
	<script type="text/javascript" src="/sola/js/jquery-3.3.1.min.js"></script>
	<style type="text/css">
	#interior_content{float:left;width:100%; overflow:hidden; height:auto; margin:0 auto; text-align: center;}
	.interior_title{padding:20px;line-height:200px;float:left; width:100%;height:200px; background-position:center center; background-size:100% auto; background-image: url("/sola/img/interior.jpg");text-align: left;}
	.interior_srch{float:left;width:96%;margin:10px 0 20px 0;padding:0 2%; border-bottom: 1px solid #6a6763;}
	#keyword{border-style:none;font-size:16px; padding:7px; position:relative;bottom:13px;border:1px solid #6a6763;box-sizing: border-box;}
	#keyword:focus{outline:none;border:2px solid #6a6763;box-sizing: border-box;transition:.3s ease;}
	#searchimg{cursor: pointer;}
	#interior_add_btn{background: url("/sola/img/interior_btn.png") no-repeat 6px; font-weight:bold; border-style:none; border:1px solid black; border-radius:20px; background-size:120px 30px; width: 162px; height: 35px;font-size:15px;}
	#interior_add_btn:hover, #interior_add_btn:active{cursor:pointer; outline:none;transition:.3s ease; background:#6a6763 url("/sola/img/interior_btn_hover.png") no-repeat 6px; border:none; background-size:120px 30px;color:white;}
	.interior_list{display:inline-block;margin:10px auto; width:1500px;text-align: left;}
	.interior_list .list_each{ display:inline-block;text-align:left;width:400px;margin:30px 25px 40px 25px;height:380px;}
	.interior_list .list_each a, .interior_list .interior_list a:visited{text-decoration: none;color: black;}
	.interior_list .list_each a:hover{color:#ff8400;transition:.3s ease;}
	.interior_list .list_each img:hover{cursor:pointer;transition:.3s ease;}
	#pagingBtn{outline:none;color:#6a6763;font-size:15px;border-style: none; width:160px; height:35px;background: none; border:1px solid #6a6763; border-radius:20px;}
	#pagingBtn:hover, #pagingBtn:active{background:#6a6763; color:white;outline:none;transition:.3s ease;}
	</style>
	<script type="text/javascript">
	function goToInterior(){
		document.getElementById("keyword").value = "";
		document.interiorSearchForm.submit();
	};
	function interiorSrch(){
		$('#interiorSearchForm').submit();
	};
	$(function(){
		
		if('${keyword}' != ''){
			$('#keyword').val('${keyword}');
		}
		
		$('#keyword').on('keyup', function(e){
			if(e.keyCode == 13){
				interiorSrch();
			}
		});
		
		<c:forEach begin="1" end="6" var="i" step="1">
		var width = $('.image'+${i}).width();
		var height = $('.image'+${i}).height();
		if(width/height > 2){
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
	
	
	if('${listStatus}' =='empty'){
		alert("검색 결과가 없습니다.");
		document.getElementById("keyword").value = "";
		document.interiorSearchForm.submit();
	}
	
	});
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
	
	</script>
	</head>
	<body>
		<div id="interior_content">
			
			<div class="interior_title">
				<span style="cursor:pointer;font-size:25px;padding:10px 13px 10px 3px;margin:7px;background: rgba(255,255,255, 0.7);" onclick="javascript:goToInterior()">TIP > 인테리어 </span>
			</div>
			
			
			<div class="interior_srch">
			<form action="interior.do" method="post" id="interiorSearchForm" name="interiorSearchForm">
			<div style="float:left;">
				<input type="hidden" value="1" id="pg" name="pg">
				<input type="text" id="keyword" placeholder="검색어를 입력하세요" name="keyword">
				<img id="searchimg" src="/sola/img/i_searchBtn.png" width="36px" height="36px" style="margin-top:5px;" onclick="javascript:interiorSrch()">
			</div>
			</form>
			<div style="float:right;margin:5px;">
			지금 바로 인테리어를 등록해보세요! >&nbsp;&nbsp;&nbsp;&nbsp;<input id="interior_add_btn" type="button" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;인테리어 작성" onclick="location.href='interior_add.do'">
			</div>
			</div>
			
			
			<div style="float:left;width: 100%;text-align: center;margin: 0 auto;">
			<div class="interior_list">
				<c:forEach items="${list }" var="item" varStatus="i">
					<div class="list_each">
						<div style="float:left;width:400px;height: 200px;margin: 0 auto;overflow:hidden;text-align: center;border-radius:15px;">
						<c:choose>
							<c:when test="${item.interior_mainimage == 'null' }">
							<img class="image${i.count }" src="/sola/img/interior_default.png" onclick="location.href='interior_view.do?p=${pg }&s=${item.interior_seq}&k=${keyword }'">
							</c:when>
							<c:otherwise>
							<img class="image${i.count }" src="/sola/storage/${item.interior_mainimage }" onclick="location.href='interior_view.do?p=${pg }&s=${item.interior_seq}&k=${keyword }'">
							</c:otherwise>
						</c:choose>
						</div>
						<div style="width:380px; margin:40px 10px 2px 10px;padding-top:10px;border-bottom:1px solid black;font-size:25px;color:black; overflow: hidden;">
						<a href="interior_view.do?p=${pg }&s=${item.interior_seq}&k=${keyword }">${item.name }님의 DIY 인테리어</a></div>
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
						<div style="width:39	0px; padding: 0 5px; height:50px;border:1px dashed #BDBDBD; border-radius: 10px;line-height:50px;">
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
						<span style="float:right;"><img src="/sola/img/hit.png" width="15px" height="12px" style="margin-top:12px;margin-right:3px;cursor:default;">${item.hit }</span>
						<span style="float:right;"><img src="/sola/img/like.png" width="15px" height="12px" style="overflow:hidden;margin-top:12px;margin-right:3px;cursor:default;">
						<c:choose>
							<c:when test="${item.like_num <= 0 }">
							0&nbsp;|&nbsp;
							</c:when>
							<c:otherwise>
							${item.like_num }&nbsp;|&nbsp;
							</c:otherwise>
						</c:choose>
						</span>
						</div>
					</div>
				</c:forEach>
			</div>
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