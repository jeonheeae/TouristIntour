<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
  request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정창 | 투어리스트인투어</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
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
                    <p class="location">MEMBER <span class="path">/</span> 회원 정보 수정</p>
                    <ul class="page_menu clear">
                        <li><a href="javascript:;" class="on">회원 정보 수정</a></li>
                    </ul>
                </div>
            </div>

            <div class="bodytext_area box_inner">
                <h1 class="cls1">회원 정보 수정창</h1>
                
                <form method="post" action="${contextPath}/member/modMember.do">
                    <table align="center">
                        <tr>
                            <td width="200"><p align="right">이메일</p></td>
                            <td width="400">
                                <input type="text" name="email" value="${memInfo.email}" readonly class="email-input">
                            </td>
                        </tr>
                        <tr>
                            <td width="200"><p align="right">비밀번호</p></td>
                            <td width="400"><input type="password" name="password" value="${memInfo.password}"></td>
                        </tr>
                        <tr>
                            <td width="200"><p align="right">이름</p></td>
                            <td width="400"><input type="text" name="name" value="${memInfo.name}"></td>
                        </tr>
                        <tr>
                            <td width="200"><p align="right">연락처</p></td>
                            <td width="400"><input type="text" name="phone" value="${memInfo.phone}"></td>
                        </tr>
                        <tr>
                            <td width="200"><p align="right">성별</p></td>
                            <td width="400">
                                <select name="gender">
                                    <option value="M" ${memInfo.gender == 'M' ? 'selected' : ''}>남성</option>
                                    <option value="F" ${memInfo.gender == 'F' ? 'selected' : ''}>여성</option>
                                </select>
                            </td>
                        </tr>
                        <tr align="center">
                            <td colspan="2" width="400">
                                <input type="submit" class="btn_baseColor" value="수정하기">
                                <input type="reset"class="btn_baseColor" value="다시입력">
                            </td>
                        </tr>
                    </table>
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
