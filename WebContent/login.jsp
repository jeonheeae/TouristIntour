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
    <title>로그인 | 투어리스트인투어</title>
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
    <script type="text/javascript">
      $(document).ready(function () {
        $(".switch").click(function () {
          $(this).toggleClass("switchOn");
        });
        $(".quick_area").hide(); 
      });
    </script>
  </head>

  <body>
    <ul class="skipnavi">
      <li><a href="#container">본문내용</a></li>
    </ul>
    <!-- wrap -->
    <div id="wrap" class="s_point">
      <div id="container" id="layout0">
        <!-- bodytext_area -->
        <div class="bodytext_area box_inner">
          <!-- login-wrap -->
          <div class="login_wrap">
            <h1 class="loginTit">
              <a href="${contextPath}/">
                <img src="${contextPath}/img/tit_login.png" alt="TOURIST IN TOUR"
              /></a>
            </h1>
            <ul class="login_list">
              <li class="kakao">
                <a href="javascript:;"><strong>카카오톡</strong> 로그인</a>
              </li>
              
              <li class="naver">
                <a href="javascript:;"><strong>네이버</strong> 로그인</a>
              </li>
              
              <li class="facebook">
                <a href="javascript:;"><strong>페이스북</strong> 로그인</a>
              </li>
              
              <li class="cellphone">
                <a href="javascript:;"><strong>이메일 주소</strong> 로그인</a>
      		  </li>
      		  
			   <li class="cellphone">
			    <a href="${contextPath}/member/listMembers.do"><strong>관리자</strong> 로그인</a>
			</li>
            </ul>
            
            <div class="btnonoff_line">
              <div class="switch"></div>
              <p>
                <a href="#" class="btn_onoff" onclick="return false;"
                  >로그인 유지</a
                >
              </p>
            </div>
          </div>
        </div>
      </div>


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
  </body>
</html>
