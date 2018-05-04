<%@ page language="java" contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<ul id="lv1">
		<li id="logo"><a href="main.do"><img class="logo_img" src="img/logo(org).png"></a></li>
		<li id="mall"><a href="mallIndex.do"><span>Mall</span></a></li>
		<li id="tip"><a href="tip.do"><span>Tip</span></a></li>
		<li id="proinfo"><a href="proinfoMain.do"><span>전문지식</span></li>
		<li id="board"><a href="board.do"><span>게시판</span></a></li>
		<li id="ledger"><a href="calendar.do?cmd=main"><span>가계부</span></a></li>
		<li id="diary"><a href="diaryIndex.do"><span>일기</span></a></li>

		<c:if test="${memId.length() >= 6}">
			<li id="my" class="memberInfo"><a href="member.do"><span class="nameLable" style="text-align: right">${memName} 님</span> <img class="profile_img" src="img/basic_img.png"></a></li>
		</c:if>
		<c:if test="${memId.length() < 6}">
			<li id="manage" class="memberInfo"><a href="member.do"><span class="nameLable" style="text-align: right; padding-right:120px; width:100%;">${memName} 님</span><img class="profile_img" src="img/basic_img.png"></a></li>
		</c:if>

	</ul>
	<div id="progressbar"></div>
	<div id="lv2">
		<ul class="lv2-list" id="logoLv2" rel="logo"></ul>

		<ul class="lv2-list" id="mallLv2" rel="mall"></ul>
		
		<ul class="lv2-list" id="tipLv2" rel="tip">
			<li class="nav-item"><a href="place.do" class="nav-link">혼밥혼술</a></li>
			<li class="nav-item"><a href="recipe.do" class="nav-link">레시피</a></li>
			<li class="nav-item"><a href="interior.do" class="nav-link">인테리어</a></li>
			<li class="nav-item"><a href="express.do" class="nav-link">무인택배</a></li>
		</ul>
		
		<ul class="lv2-list" id="proinfoLv2" rel="proinfo"></ul>
		
		<ul class="lv2-list" id="boardLv2" rel="board">
			<li><a href="FreeBoardList.do">자유게시판</a></li>
         	<li><a href="NoticeBoardList.do">공지사항</a></li>
         	<li><a href="QnABoardList.do">QnA</a></li>
		</ul>
		
		<ul class="lv2-list" id="ledgerLv2" rel="ledger">
			<!-- <li><a href="ledgerMain.do">가계부 로그인</a></li> -->
		 	<li><a href="calendar.do?cmd=main" >달력 보기</a></li>
		    <li><a href="ledgerViewDay.do?cmd=today">하루 보기</a></li>
		    <li><a href="ledgerViewAll.do?cmd=main">일일 보기</a></li>
		    <li><a href="ledgerViewMonth.do?cmd=main">월별 보기</a></li>
		    <li><a href="ledgerViewClosing.do?cmd=main">결산 보기</a></li>
		    <li><a href="ledgerViewStats.do?cmd=main">통계 보기</a></li>
		</ul>
		<ul class="lv2-list" id="diaryLv2" rel="diary"></ul>
		
		
			<c:if test="${memId.length() >= 6}">
				<ul class="lv2-list" id="myLv2" rel="my">
					<li><a href="member.do">기본정보</a></li>
					<li><a href="checkPwd.do">회원정보수정</a></li>
					<li><a href="memberProfile.do">프로필변경</a></li>
					<li><a href="logout.do">로그아웃</a></li>
					<li><a href="memberWithdrawalForm.do">회원탈퇴</a></li>
				</ul>
			</c:if>
			
			<c:if test="${memId.length() < 6}">
				<ul class="lv2-list" id="manageLv2" rel="manage">
					<li><a href="member.do">기본정보</a></li>
					<li><a href="memberList.do">회원관리</a></li>
					<li><a href="logout.do">로그아웃</a></li>
				</ul>
			</c:if>
			
		
		<ul class="lv2-list" id="clearSpaceLv2" rel="clearSpace">
	</div>


