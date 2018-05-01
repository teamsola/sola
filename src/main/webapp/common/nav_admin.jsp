<%@ page language="java" contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

	<ul id="lv1">
		<li id="home"><a href="main.do"><span>Home</span></a></li>
		<li id="manage"><a href="memberList.do?pg=1"><span>회원관리</span></a></li>
		<li id="diary"><a href="diaryIndex.do"><span>일기/가계뿌</span></a></li>
		<li id="mall"><a href="mallIndex.do"><span>Mall</span></a></li>
		<li id="tip"><a href="tip.do"><span>Tip</span></a></li>
		<li id="logout"><a href="logout.do"><span>Logout</span></a></li>
	</ul>
	<div id="progressbar"></div>
	<div id="lv2">
		<ul class="lv2-list" rel="home"></ul>
		<ul class="lv2-list" id="myLv2" rel="manage">
			<li><a href="member.do">기본정보</a></li>
			<li><a href="checkPwd.do">회원정보수정</a></li>
			<li><a href="memberProfile.do">프로필변경</a></li>
			<li><a href="memberWithdrawalForm.do">회원탈퇴</a></li>
		</ul>
		<ul class="lv2-list" id="diaryLv2" rel="diary">
			<li><a href="diaryIndex.do">일기</a></li>
			<li><a href="ledgerMain.do">가계부 로그인</a></li>
		 	<li><a href="calendar.do?cmd=main" >달력 보기</a></li>
		    <li><a href="ledgerViewDay.do?cmd=today">하루 보기</a></li>
		    <li><a href="ledgerViewAll.do?cmd=main">일일 보기</a></li>
		    <li><a href="ledgerViewMonth.do?cmd=main">월별 보기</a></li>
		    <li><a href="ledgerViewClosing.do?cmd=main">결산 보기</a></li>
		    <li><a href="ledgerViewStats.do?cmd=main">통계 보기</a></li>
		</ul>
		<ul class="lv2-list" id="mallLv2" rel="mall">		
			<li><a href="mallIndex.do">쇼핑몰</a></li>
			<li><a href="proinfoMain.do">전문지식</a></li>
		</ul>
		<ul class="lv2-list" id="tipLv2" rel="tip">
			<li class="nav-item"><a href="place.do" class="nav-link">혼밥혼술</a></li>
			<li class="nav-item"><a href="recipe.do" class="nav-link">레시피</a></li>
			<li class="nav-item"><a href="interior.do" class="nav-link">인테리어</a></li>
			<li class="nav-item"><a href="express.do" class="nav-link">무인택배</a></li>
		</ul>
		<ul class="lv2-list" rel="logout"></ul>
	</div>


