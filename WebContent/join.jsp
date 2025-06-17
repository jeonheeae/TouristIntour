<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% String signupMessage = (String) session.getAttribute("signupMessage"); %>
<% if (signupMessage != null) { %>
    <script>
        alert("<%= signupMessage %>");
    </script>
    <%
        // 메시지를 사용한 후 세션에서 제거
        session.removeAttribute("signupMessage");
    %>
<% } %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>회원가입 | 투어리스트인투어</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
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

    <div id="wrap">
        <header id="header">
            <div class="header_area box_inner clear">
                <h1><a href="${contextPath}/">Tourist in tour</a></h1>
                <div class="header_cont">
                    <ul class="util clear">
                        <li><a href="${contextPath}/member/login.do">로그인</a></li>
                        <li><a href="${contextPath}/member/join.do">회원가입</a></li>
                    </ul>
                </div>
            </div>
        </header>

        <div id="container">
            <div class="location_area member">
                <div class="box_inner">
                    <h2 class="tit_page">TOURIST <span class="in">in</span> TOUR</h2>
                    <p class="location">MEMBER <span class="path">/</span> 회원가입</p>
                    <ul class="page_menu clear">
                        <li><a href="javascript:;" class="on">회원가입</a></li>
                    </ul>
                </div>
            </div>

            <div class="bodytext_area box_inner">
                <form action="${contextPath}/member/addMember.do" method="POST" class="appForm">
                    <fieldset>
                        <legend>회원가입 입력 양식</legend>
                        <p class="info_pilsoo pilsoo_item">필수입력</p>
                        <ul class="app_list">
                            <li class="clear">
                                <label for="email_lbl" class="tit_lbl pilsoo_item">이메일</label>
                                <div class="app_content email_area">
                                    <input type="text" class="w160" id="email_lbl" name="email" title="이메일 주소" required />
                                </div>
                            </li>
                            <li class="clear">
                                <label for="name_lbl" class="tit_lbl pilsoo_item">이름</label>
                                <div class="app_content">
                                    <input type="text" class="w100p" id="name_lbl" name="name" placeholder="이름을 입력해주세요" required />
                                </div>
                            </li>
                            <li class="clear">
                                <label for="pwd_lbl" class="tit_lbl pilsoo_item">비밀번호</label>
                                <div class="app_content">
                                    <input type="password" class="w100p" id="pwd_lbl" name="password" placeholder="비밀번호를 입력해주세요" required />
                                </div>
                            </li>
                            <li class="clear">
                                <label for="pwd2_lbl" class="tit_lbl pilsoo_item">비밀번호 확인</label>
                                <div class="app_content">
                                    <input type="password" class="w100p" id="pwd2_lbl" name="passwordConfirm" placeholder="비밀번호를 다시 입력해주세요" required />
                                </div>
                            </li>
                            <li class="clear">
                                <label for="phone_lbl" class="tit_lbl pilsoo_item">연락처</label>
                                <div class="app_content">
                                    <input type="tel" class="w100p" id="phone_lbl" name="phone" placeholder="휴대폰 번호" required />
                                </div>
                            </li>
                            <li class="clear">
                                <span class="tit_lbl">성별</span>
                                <div class="app_content radio_area">
                                    <input type="radio" class="css-radio" id="mmm_lbl" name="gender" value="M" required />
                                    <label for="mmm_lbl">남</label>
                                    <input type="radio" class="css-radio" id="www_lbl" name="gender" value="F" required />
                                    <label for="www_lbl">여</label>
                                </div>
                            </li>
                            
							<li class="clear">
							    <span class="tit_lbl">개인정보 활용 동의</span>
							    <div class="app_content checkbox_area">
							        <input type="checkbox" class="css-checkbox" id="agree_lbl" name="agree" value="Y" required />
							        <label for="agree_lbl">동의</label>
							        
							</li>
                            <li class="clear">
                                <p class="btn_line">
                                    <input type="submit" class="btn_baseColor" value="등록" />
                                </p>
                            </li>
                        </ul>
                    </fieldset>
                </form>
            </div>
        </div>

        <footer>
            <div class="foot_area box_inner">
                <h2>투어리스트인투어</h2>
                <p class="copy box_inner">Copyright(c) TouristInTour all right reserved</p>
            </div>
        </footer>
    </div>
</body>
</html>
