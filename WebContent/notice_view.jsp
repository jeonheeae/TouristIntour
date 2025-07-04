<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" 
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>
      박물관 미션 투어 당첨자 발표 | 공지사항 | 고객센터 | 투어리스트인투어
    </title>
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"
    />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="stylesheet" href="${contextPath}/css/common.css" />
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
          <h1><a href="${contextPath}/" :;>Tourist in tour</a></h1>
          <p class="openMOgnb">
            <a href="#"
              ><b class="hdd">메뉴열기</b> <span></span><span></span
              ><span></span
            ></a>
          </p>
          <!-- header_cont -->
          <div class="header_cont">
            <ul class="util clear">
              <li><a href="${contextPath}/member/login.do">로그인</a></li>
              <!-- 클릭할 수 있는 링크, 로그인 메뉴 -->
              <li><a href="${contextPath}/member/join.do">회원가입</a></li>
              <!-- 클릭할 수 있는 링크, 회원가입 메뉴 -->
            </ul>
            <nav>
              <ul class="gnb clear">
                <!-- 네비게이션 메뉴를 나타내는 요소-->
                <li>
                  <a href="javascript:;" class="openAll1">여행정보</a>

                  <div class="gnb_depth gnb_depth2_1">
                    <!-- 클릭할 수 있는 링크, 여행정보 메인 메뉴 -->
                    <ul class="submenu_list">
                      <li><a href="javascript:;">국내</a></li>
                      <!--텍스트 링크, 국내 서브 메뉴 -->
                      <li><a href="javascript:;">해외</a></li>
                      <!--텍스트링크, 해외 서브 메뉴 -->
                    </ul>
                  </div>
                </li>
                <li>
                  <a href="javascript:;" class="openAll2">고객센터</a>
                  <!-- 클릭할 수 있는 링크, 고객센터 메인 메뉴 -->
                  <div class="gnb_depth gnb_depth2_2">
                    <ul class="submenu_list">
                       <li><a href="${contextPath}/board/notice_list.do">공지사항</a></li>
                      <!-- 텍스트 링크, 공지사항 서브 메뉴 -->
                      <li><a href="javascript:;">문의하기</a></li>
                      <!-- 텍스트링크, 문의하기 서브 메뉴 -->
                    </ul>
                  </div>
                </li>
                <li>
                  <a href="javascript:;" class="openAll3">상품투어</a>
                  <!-- 클릭할 수 있는 링크, 상품투어 메인 메뉴 -->
                  <div class="gnb_depth gnb_depth2_3">
                    <ul class="submenu_list">
                         <li><a href="${contextPath}/program/program.do">프로그램 소개</a></li>
                      <!--텍스트링크, 프로그램 소개 서브 메뉴 -->
                      <li><a href="javascript:;">여행자료</a></li>
                      <!-- 텍스트링크, 여행자료 서브 메뉴 -->
                    </ul>
                  </div>
                </li>
                <li>
                  <a href="javascript:;" class="openAll4">티켓/가이드</a>
                  <!-- 클릭할 수 있는 링크, 티켓가이드 메인 메뉴 -->
                  <div class="gnb_depth gnb_depth2_4">
                    <ul class="submenu_list">
                      <li><a href="javascript:;">항공</a></li>
                      <!-- 텍스트링크, 항공 서브 메뉴 -->
                      <li><a href="javascript:;">호텔</a></li>
                      <!-- 텍스트링크, 호텔 서브 메뉴 -->
                    </ul>
                  </div>
                </li>
              </ul>
            </nav>
            <p class="closePop"><a href="javascript:;">닫기</a></p>
            <!--모바일에서만 나타나는 메뉴상자 닫기 버튼을 closePop 클래스로 지정 -->
          </div>
          <!-- //header_cont -->
        </div>
      </header>

      <div id="container">
        <!-- location_area -->
        <div class="location_area customer">
          <div class="box_inner">
            <h2 class="tit_page">TOURIST <span class="in">in</span> TOUR</h2>
            <!-- 공지사항 사이트 상단부에 PC와 모바일 모두 나타나는 글자 -->
            <p class="location">
              고객센터 <span class="path">/</span> 공지사항
              <!-- PC에서 공지사항 사이트 상단부에 나타나는 글자 -->
            </p>
            <ul class="page_menu clear">
              <li><a href="#" class="on">공지사항</a></li>
              <li><a href="#">문의하기</a></li>
              <!-- 모바일에서 공지사항 사이트 상단부에 나타나는 글자링크 설정 -->
            </ul>
          </div>
        </div>
        <!-- //location_area -->

        <!-- bodytext_area -->
        <div class="bodytext_area box_inner">
          <ul class="bbsview_list">
            <li class="bbs_title">박물관 미션 투어 응모 당첨자 발표</li>
            <!-- 게시글 제목 표시 -->
            <li class="bbs_hit">작성일 : <span>2018.08.09</span></li>
            <!-- 게시글 작성일 표시 -->
            <li class="bbs_date">조회수 : <span>235</span></li>
            <!-- 게시글 조회수 표시 -->
            <li class="bbs_content">
              <div class="editer_content">
                안녕하세요. 믿을 수 있는 여행정보, 투어리스트인투어입니다.<br />
                박물관 미션투어에 관심과 참여 감사드립니다. <br />
                선정되신 분들도 진심으로 축하드립니다. <br />
                앞으로도 큰 관심 부탁드리며, 메일로도 안내 예정이니 참고하시기
                바랍니다. <br />
                감사합니다. <br /><br />
                [당첨자]<br />
                김용* kimyong***@naver.com <br />
                인봉* in2018a***@naver.com<br />
                예경* yyhong***@naver.com<br />
                한진* haha***@naver.com<br />
                박수* pky**@naver.com<br />
                명진* mma5**@nate.com<br />
                김영* rtfg6*@naver.com<br />
                서영* seo20**@gmail.com<br />
                윤소* yoon2***@naver.com<br />
                지은* ji***@daum.net
              </div>
            </li>
            <!-- 게시글 내용 표시 -->
          </ul>
          <p class="btn_line txt_right">
            <a href="${contextPath}/board/notice_list.do" class="btn_bbs">목록</a>
          </p>
          <!-- 공지사항 목록으로 되돌아가기 버튼 -->
          <ul class="near_list mt20">
            <li>
              <h4 class="prev">다음글</h4>
              <a href="javascript:;"
                >추석 연휴 티켓/투어 배송 및 직접 수령 안내</a
              >
            </li>
            <!-- 현재 게시글을 기준으로 다음 게시글 페이지로 이동하는 버튼 -->
            <li>
              <h4 class="next">이전글</h4>
              <a href="javascript:;"
                >이번 여름 휴가 제주 갈까? 미션 투어 (여행경비 50만원 지원)</a
              >
            </li>
            <!-- 현재 게시글을 기준으로 이전 게시글 페이지로 이동하는 버튼 -->
          </ul>
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
          <p class="addr">
            서울특별시 종로구 혜화동 9길 청운빌딩 5층
            <span class="gubun">/</span>
            <span class="br_line"
              >대표전화 <span class="space0">02-1234-5678</span>
              <span class="gubun">/</span>
              <span class="br_line"
                >E-mail :
                <span class="space0"> titour@touristintour.com</span></span
              >
            </span>
          </p>
          <p class="copy box_inner">
            Copyright(c) TouristInTour all right reserved
          </p>
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
        <li>
          <a href="tel:010-7184-4403"
            ><h3>전화 문의</h3>
            <p>010-1234-5678</p></a
          >
        </li>
        <li>
          <a href="javascript:;"
            ><h3>카카오톡 <em>상담</em></h3>
            <p>1:1상담</p></a
          >
        </li>
        <li>
          <a href="javascript:;"><h3 class="to_contact">오시는 길</h3></a>
        </li>
      </ul>
      <p class="to_top"><a href="#layout0" class="s_point">TOP</a></p>
    </div>
  </body>
</html>