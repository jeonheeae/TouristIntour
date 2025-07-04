<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	isELIgnored="false" 
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />  
<%
	request.setCharacterEncoding("UTF-8");
%>    
<!DOCTYPE html>
<html lang="ko">
<head>
<title> 공지사항 | 고객센터 | 투어리스트인투어 </title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="${contextPath}/css/common.css">
<script src="${contextPath}/js/jquery-1.11.3.min.js"></script>
<script src="${contextPath}/js/common.js"></script>  
<script src="${contextPath}/js/jquery.smooth-scroll.min.js"></script> 
<!--[if lte IE 9]>
    <script src="js/html5shiv.js"></script>
	<script src="js/placeholders.min.js"></script>
<![endif]-->
</head>

<body>
<ul class="skipnavi">
    <li><a href="#container">본문내용</a></li>
</ul>
<!-- wrap -->
<div id="wrap">

	<header id="header">
		<div class="header_area box_inner clear">	
			<h1><a href="javascript:;">Tourist in tour</a></h1>
			<p class="openMOgnb"><a href="#"><b class="hdd">메뉴열기</b> <span></span><span></span><span></span></a></p>
			<!-- header_cont -->
			<div class="header_cont">
				<ul class="util clear">
					<li><a href="javascript:;">로그인</a></li>
					<li><a href="javascript:;">회원가입</a></li>
				</ul>		
				<nav>
				<ul class="gnb clear">
					<li><a href="javascript:;" class="openAll1">여행정보</a>

                        <div class="gnb_depth gnb_depth2_1">
                            <ul class="submenu_list">
                                <li><a href="javascript:;">국내</a></li>
                                <li><a href="javascript:;">해외</a></li>
                            </ul>
                        </div>
					</li>
					<li><a href="javascript:;" class="openAll2">고객센터</a>
				        <div class="gnb_depth gnb_depth2_2">
                            <ul class="submenu_list">
                                <li><a href="javascript:;">공지사항</a></li>
                                <li><a href="javascript:;">문의하기</a></li>
                            </ul>
                        </div>
					</li>
					<li><a href="javascript:;" class="openAll3">상품투어</a>
                        <div class="gnb_depth gnb_depth2_3">
                            <ul class="submenu_list">
                                <li><a href="javascript:;">프로그램 소개</a></li>
                                <li><a href="javascript:;">여행자료</a></li>
                            </ul>
                        </div>
					</li>
					<li><a href="javascript:;" class="openAll4">티켓/가이드</a>
                        <div class="gnb_depth gnb_depth2_4">
                            <ul class="submenu_list">
                                <li><a href="javascript:;">항공</a></li>
                                <li><a href="javascript:;">호텔</a></li>
                            </ul>
                        </div>
					</li>
				</ul>
                </nav>
				<p class="closePop"><a href="javascript:;">닫기</a></p>
			</div>
			<!-- //header_cont -->
		</div>
	</header>
	
	<div id="container">
		<!-- location_area -->
		<div class="location_area customer">
			<div class="box_inner">
				<h2 class="tit_page">TOURIST <span class="in">in</span> TOUR</h2>
				<p class="location">고객센터 <span class="path">/</span> 공지사항</p>
				<ul class="page_menu clear">
					<li><a href="#" class="on">공지사항</a></li>
					<li><a href="#">문의하기</a></li>
				</ul>
			</div>
		</div>	
		<!-- //location_area -->

		<!-- bodytext_area -->
		<div class="bodytext_area box_inner">
			<form action="#" class="minisrch_form">
				<fieldset>
					<legend>검색</legend>
					<input type="text" class="tbox" title="검색어를 입력해주세요" placeholder="검색어를 입력해주세요">
					<a href="javascript:;" class="btn_srch">검색</a>
				</fieldset>
			</form>
			<table class="bbsListTbl" summary="번호,제목,조회수,작성일 등을 제공하는 표">
				<caption class="hdd">공지사항  목록</caption>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">조회수</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td class="tit_notice"><a href="javascript:;">이번 여름 휴가 제주 갈까? 미션 투어 (여행경비 50만원 지원)</a> </td>
						<td>123</td>
						<td>2018-08-01</td>
					</tr>
					<tr>
						<td>2</td>
						<td class="tit_notice"><a href="${contextPath}/board/notice_view.do">박물관 미션 투어 응모 당첨자 발표</a> </td>
						<td>123</td>
						<td>2018-08-01</td>
					</tr>
					<tr>
						<td>3</td>
						<td class="tit_notice"><a href="javascript:;">추석 연휴 티켓/투어 배송 및 직접 수령 안내</a> </td>
						<td>123</td>
						<td>2018-08-01</td>
					</tr>
					<tr>
						<td>4</td>
						<td class="tit_notice"><a href="javascript:;">하롱베이 서비스 OPEN! (여행정보, 가이드북, 가이드맵)</a> </td>
						<td>123</td>
						<td>2018-08-01</td>
					</tr>
					<tr>
						<td>5</td>
						<td class="tit_notice"><a href="javascript:;">투어리스트인투어 서비스 점검 안내 - 투어리스트인투어에서 매월 실시하는 정기점검 안내</a> </td>
						<td>123</td>
						<td>2018-08-01</td>
					</tr>
					<tr>
						<td>6</td>
						<td class="tit_notice"><a href="javascript:;">이번 여름 휴가 제주 갈까? 미션 투어 (여행경비 50만원 지원)</a> </td>
						<td>123</td>
						<td>2018-08-01</td>
					</tr>
					<tr>
						<td>7</td>
						<td class="tit_notice"><a href="javascript:;">박물관 미션 투어 응모 당첨자 발표</a> </td>
						<td>123</td>
						<td>2018-08-01</td>
					</tr>
					<tr>
						<td>8</td>
						<td class="tit_notice"><a href="javascript:;">추석 연휴 티켓/투어 배송 및 직접 수령 안내</a> </td>
						<td>123</td>
						<td>2018-08-01</td>
					</tr>
					<tr>
						<td>9</td>
						<td class="tit_notice"><a href="javascript:;">하롱베이 서비스 OPEN! (여행정보, 가이드북, 가이드맵)</a> </td>
						<td>123</td>
						<td>2018-08-01</td>
					</tr>
					<tr>
						<td>10</td>
						<td class="tit_notice"><a href="javascript:;">투어리스트인투어 서비스 점검 안내</a> </td>
						<td>123</td>
						<td>2018-08-01</td>
					</tr>
				</tbody>
			</table>
			<!-- pagination -->
			<div class="pagination">
				<a href="javascript:;" class="firstpage  pbtn"><img src="${contextPath}/img/btn_firstpage.png" alt="첫 페이지로 이동"></a>
				<a href="javascript:;" class="prevpage  pbtn"><img src="${contextPath}/img/btn_prevpage.png" alt="이전 페이지로 이동"></a>
				<a href="javascript:;"><span class="pagenum currentpage">1</span></a>
				<a href="javascript:;"><span class="pagenum">2</span></a>
				<a href="javascript:;"><span class="pagenum">3</span></a>
				<a href="javascript:;"><span class="pagenum">4</span></a>
				<a href="javascript:;"><span class="pagenum">5</span></a>
				<a href="javascript:;" class="nextpage  pbtn"><img src="${contextPath}/img/btn_nextpage.png" alt="다음 페이지로 이동"></a>
			</div>
			<!-- //pagination -->
			
		</div>
		<!-- //bodytext_area -->

	</div>
	<!-- //container -->

	<footer>
		<div class="foot_area box_inner">
			<ul class="foot_list clear">
				<li><a href="javascript:;">이용약관</a></li>
				<li><a href="javascript:;">개인정보취급방침</a></li>
			</ul>
			<h2>투어리스트인투어</h2>
            <p class="addr">서울특별시 종로구 혜화동 9길 청운빌딩 5층 <span class="gubun">/</span>        
				<span class="br_line">대표전화 <span class="space0">02-1234-5678</span> <span class="gubun">/</span>        
					<span class="br_line">E-mail : <span class="space0"> titour@touristintour.com</span></span>
				</span>
			</p>
			<p class="copy box_inner">Copyright(c) TouristInTour all right reserved</p>
			<ul class="snslink clear">
				<li><a href="javascript:;">blog</a></li>
				<li><a href="javascript:;">facebook</a></li>
				<li><a href="javascript:;">instargram</a></li>
			</ul>
		</div>
	</footer>

</div>
<!-- //wrap -->

<h2 class="hdd">빠른 링크 : 전화 문의,카카오톡,오시는 길,꼭대기로</h2>
<div class="quick_area">
	<ul class="quick_list">
		<li><a href="tel:010-7184-4403"><h3>전화 문의</h3><p>010-1234-5678</p></a></li>
		<li><a href="javascript:;"><h3>카카오톡 <em>상담</em></h3><p>1:1상담</p></a></li>
		<li><a href="javascript:;"><h3 class="to_contact">오시는 길</h3></a></li>
	</ul>
	<p class="to_top"><a href="#layout0" class="s_point">TOP</a></p>
</div>

</body>
</html>
