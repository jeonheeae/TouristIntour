<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" 
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>

<html>
<head>
<head>
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
<c:choose>
   <c:when test='${msg=="addMember" }'>
      <script>
         window.onload=function(){
            alert("회원을 등록했습니다.");    
         }
      </script>
   </c:when>  
   <c:when test='${msg=="modified" }'>
      <script>
        window.onload=function(){
          alert("회원 정보를 수정했습니다.");     
        }
      </script>
   </c:when>   
   <c:when test= '${msg=="deleted" }'>
      <script>
         window.onload=function(){
            alert("회원 정보를 삭제했습니다.");
        } 
      </script>
   </c:when>
</c:choose>

   <meta charset="UTF-8">
   <title>회원 정보 출력창</title>
   <style>
       .cls1 {
           font-size:40px;
           text-align:center;
       }
       .cls2 {
           font-size:20px;
           text-align:center;
       }
       .btn_baseColor {
	    	background-color: #384d75 
		    color: white; 
		    padding: 3px 10px; 
		    text-align: center;
		    margin: 20px auto;
		}
       .button-container {
    		text-align: center; 
		}

   </style>
</head>

<body>
    <ul class="skipnavi">
 <p class="cls1">회원정보</p>
    </ul>
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
                    <p class="location">관리자 로그인<span class="path">/</span>회원정보</p>
                    <ul class="page_menu clear">
                        <li><a href="javascript:;" class="on">회원정보</a></li>
                    </ul>
                </div>
            </div>
    
      <div class="bodytext_area box_inner">
                <form action="${contextPath}/member/addMember.do" method="POST" class="appForm">
                    <fieldset>
                        <legend>회원가입 입력 양식</legend>
                        <p class="info_pilsoo pilsoo_item">관리자 로그인</p>
                        <ul class="app_list">
   <table align="center" border="1">
   		<table class="bbsListTbl" summary="회원 정보를 제공하는 표">
						<caption class="hdd">회원정보 목록</caption>
						<tbody>
      <tr align="center" bgcolor="#f0f3fa">
         <td width="15%"><b>이메일</b></td>
         <td width="15%"><b>이름</b></td>
         <td width="15%"><b>비밀번호</b></td>
         <td width="15%"><b>연락처</b></td>
         <td width="10%"><b>성별</b></td>
         <td width="5%"><b>수정</b></td>
         <td width="5%"><b>삭제</b></td>
      </tr>
      

<c:choose>
    <c:when test="${empty membersList}">
      <tr>
        <td colspan="8">
          <b>등록된 회원이 없습니다.</b>
       </td>  
      </tr>
   </c:when>     
<c:when test="${!empty membersList}">    
    <c:forEach var="mem" items="${membersList}">
        <tr align="center">
            <td>${mem.email}</td>
            <td>${mem.name}</td>
            <td>${mem.password}</td> 
            <td>${mem.phone}</td>
            <td>${mem.gender}</td>
            <td><a href="${contextPath}/member/modMemberForm.do?email=${mem.email}">수정</a></td>
            <td><a href="${contextPath}/member/delMember.do?email=${mem.email}">삭제</a></td>
        </tr>
    </c:forEach>
</c:when>
</c:choose>

   </table>

<div class="button-container">
    <a href="${contextPath}/member/join.do">
        <p class="cls2 btn_baseColor">회원 가입하기</p>
    </a>
</div>
</body>
</html>
