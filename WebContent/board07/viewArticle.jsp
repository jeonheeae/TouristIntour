<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>글보기 | 투어리스트인투어</title>
    <style>
    </style>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="stylesheet" href="${contextPath}/css/common.css" />
    <script src="${contextPath}/js/jquery-1.11.3.min.js"></script>
    <script src="${contextPath}/js/common.js"></script>
    <script src="${contextPath}/js/jquery.smooth-scroll.min.js"></script>
  <script  src="http://code.jquery.com/jquery-latest.min.js"></script> 
   <script type="text/javascript" >
   function backToList() {
       window.location.href = "${contextPath}/board/notice_list.do";
   }

	 function fn_enable(obj){
		 document.getElementById("i_title").disabled=false;
		 document.getElementById("i_content").disabled=false;
		 document.getElementById("i_imageFileName").disabled=false;
		 document.getElementById("tr_btn_modify").style.display="block";
		 document.getElementById("tr_btn").style.display="none";
	 }
	 
	 function fn_modify_article(obj){
		 obj.action="${contextPath}/board/modArticle.do";
		 obj.submit();
	 }
	 
	 function fn_remove_article(url,articleNO){
		 var form = document.createElement("form");
		 form.setAttribute("method", "get");
		 form.setAttribute("action", url);
	     var articleNOInput = document.createElement("input");
	     articleNOInput.setAttribute("type","hidden");
	     articleNOInput.setAttribute("name","articleNO");
	     articleNOInput.setAttribute("value", articleNO);
		 
	     form.appendChild(articleNOInput);
	     document.body.appendChild(form);
	     form.submit();
	 
	 }
	 
	 function fn_reply_form(url, parentNO){
		 var form = document.createElement("form");
		 form.setAttribute("method", "post");
		 form.setAttribute("action", url);
	     var parentNOInput = document.createElement("input");
	     parentNOInput.setAttribute("type","hidden");
	     parentNOInput.setAttribute("name","parentNO");
	     parentNOInput.setAttribute("value", parentNO);
		 
	     form.appendChild(parentNOInput);
	     document.body.appendChild(form);
		 form.submit();
	 }
	 
	 function readURL(input) {
	     if (input.files && input.files[0]) {
	         var reader = new FileReader();
	         reader.onload = function (e) {
	             $('#preview').attr('src', e.target.result);
	         }
	         reader.readAsDataURL(input.files[0]);
	     }
	 }  
 </script>
</head>

<body>
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
            <div class="location_area customer">
                <div class="box_inner">
                    <h2 class="tit_page">TOURIST <span class="in">in</span> TOUR</h2>
                    <p class="location">공지사항 <span class="path">/</span>게시글</p>
                    <ul class="page_menu clear">
                        <li><a href="#" class="on">공지사항</a></li>
                        <li><a href="#">문의하기</a></li>
                    </ul>
                </div>
            </div>

            <div class="bodytext_area box_inner">
                <ul class="bbsview_list">
                    <form name="frmArticle" method="post" action="${contextPath}" enctype="multipart/form-data">
                        <table border="0" align="center">
                            <tr>
                                <td width="150" align="center" bgcolor="#f0f3fa">글번호</td>
                                <td>
                                    <input type="text" value="${article.articleNO}" disabled />
                                    <input type="hidden" name="articleNO" value="${article.articleNO}" />
                                </td>
                            </tr>
                            <tr>
                                <td width="150" align="center" bgcolor="#f0f3fa">작성자 아이디</td>
                                <td>
                                    <input type="text" value="${article.id}" name="writer" disabled />
                                </td>
                            </tr>
                            <tr>
                                <td width="150" align="center" bgcolor="#f0f3fa">제목</td>
                                <td>
                                    <input type="text" value="${article.title}" name="title" id="i_title" disabled />
                                </td>
                            </tr>
                            <tr>
                                <td width="150" align="center" bgcolor="#f0f3fa">내용</td>
                                <td>
                                    <textarea rows="20" cols="60" name="content" id="i_content" disabled>${article.content}</textarea>
                                </td>
                            </tr>
                            <c:if test="${not empty article.imageFileName && article.imageFileName != 'null'}">
                                <tr>
                                    <td width="150" align="center" bgcolor="#f0f3fa" rowspan="2">이미지</td>
                                    <td>
                                        <input type="hidden" name="originalFileName" value="${article.imageFileName}" />
                                        <img src="${contextPath}/download.do?articleNO=${article.articleNO}&imageFileName=${article.imageFileName}" id="preview" /><br />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="file" name="imageFileName" id="i_imageFileName" disabled onchange="readURL(this);" />
                                    </td>
                                </tr>
                            </c:if>
                            <tr>
                                <td width="150" align="center" bgcolor="#f0f3fa">등록일자</td>
                                <td>
                                    <input type="text" value="<fmt:formatDate value='${article.writeDate}' />" disabled />
                                </td>
                            </tr>
                            <tr id="tr_btn_modify" style="display:none;">
                                <td colspan="2" align="center">
                                    <input type="button" value="수정반영하기" onClick="fn_modify_article(frmArticle)" />
                                    <input type="button" value="취소" onClick="backToList(frmArticle)" />
                                </td>
                            </tr>
                            <tr id="tr_btn">
                                <td colspan="2" align="center">
                                    <input type="button" value="수정하기" onClick="fn_enable(this.form)" />
                                    <input type="button" value="삭제하기" onClick="fn_remove_article('${contextPath}/board/removeArticle.do', ${article.articleNO})" />
                                    <input type="button" value="리스트로 돌아가기" onClick="backToList(this.form)" />
                                    <input type="button" value="답글쓰기" onClick="fn_reply_form('${contextPath}/board/replyForm.do', ${article.articleNO})" />
                                </td>
                            </tr>
                        </table>
                    </form>
                </ul>
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
                    <span class="br_line">대표전화 <span class="space0">02-1234-5678</span>
                    <span class="gubun">/</span>
                    <span class="br_line">E-mail : <span class="space0">titour@touristintour.com</span></span>
                    </span>
                </p>
                <p class="copy box_inner">Copyright(c) TouristInTour all right reserved</p>
                <ul class="snslink clear">
                    <li><a href="javascript:;">blog</a></li>
                    <li><a href="javascript:;">facebook</a></li>
                    <li><a href="javascript:;">instagram</a></li>
                </ul>
            </div>
        </footer>
