<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%> 
<head>
<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="stylesheet" href="${contextPath}/css/common.css" />
    <script src="${contextPath}/js/jquery-1.11.3.min.js"></script>
    <script src="${contextPath}/js/common.js"></script>
    <script src="${contextPath}/js/jquery.smooth-scroll.min.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

function backToList() {
    window.location.href = "${contextPath}/board/notice_list.do";
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
<title>답글쓰기 페이지</title>
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
                    <p class="location">답글쓰기</p>
                </div>
            </div>

 <div class="bodytext_area box_inner">
  <ul class="bbsview_list">
  <form name="frmReply" method="post"  action="${contextPath}/board/addReply.do"   enctype="multipart/form-data">
   <table border="0" align="center">
    <tr>
			 <td width="150" align="center" bgcolor="#f0f3fa">글쓴이:&nbsp; </td>
			<td><input type="text" size="5" value="lee" disabled /> </td>
		</tr>
		<tr>
			 <td width="150" align="center" bgcolor="#f0f3fa">글제목:&nbsp;  </td>
			<td><input type="text" size="67"  maxlength="100" name="title" /></td>
		</tr>
		<tr>
			 <td width="150" align="center" bgcolor="#f0f3fa"><br>글내용:&nbsp; </td>
			<td><textarea name="content" rows="10" cols="65" maxlength="4000"> </textarea> </td>
		</tr>
		<tr>
			 <td width="150" align="center" bgcolor="#f0f3fa">이미지파일 첨부:  </td>
			<td> <input type="file" name="imageFileName"  onchange="readURL(this);" /></td>
            <td><img  id="preview" src="#"   width=200 height=200/></td>
		</tr>
		<tr>
			<td align="right"> </td>
			<td>
				<input type=submit value="답글반영하기" />
				<input type=button value="취소"onClick="backToList(this.form)" />
				
			</td>
		</tr>
    </table>
  </form>
</body>
</html>