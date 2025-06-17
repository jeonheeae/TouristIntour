<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	isELIgnored="false" 
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  /> 

<%-- board에서 가져온 것 --%>
<c:set  var="articlesList"  value="${articlesMap.articlesList}" />
<c:set  var="totArticles"  value="${articlesMap.totArticles}" />
<c:set  var="section"  value="${articlesMap.section}" />
<c:set  var="pageNum"  value="${articlesMap.pageNum}" />
 
<%
	request.setCharacterEncoding("UTF-8");
%>    

<!DOCTYPE html>
<html lang="ko">
<head>
	<!-- border 가져온 것 -->
	<style>
	   .no-uline {text-decoration:none;}
	   .sel-page{text-decoration:none;color:red;}
	   .cls1 {text-decoration:none;}
	   .cls2{text-align:center; font-size:30px;}
	</style>
	<!-- //border 가져온 것 -->	
	
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
				<h1><a href="${contextPath}/">Tourist in tour</a></h1>
				<p class="openMOgnb"><a href="#"><b class="hdd">메뉴열기</b> <span></span><span></span><span></span></a></p>
				<!-- header_cont -->
				<div class="header_cont">
					<ul class="util clear">
						<li><a href="${contextPath}/member/login.do">로그인</a></li>
						<li><a href="${contextPath}/member/join.do">회원가입</a></li>
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
			        	              <li><a href="${contextPath}/board/notice_list.do">공지사항</a></li> 
			            	        	<li><a href="javascript:;">문의하기</a></li>
			                    	</ul>
			                	</div>
							</li>
							<li><a href="javascript:;" class="openAll3">상품투어</a>
			                    <div class="gnb_depth gnb_depth2_3">
			                       <ul class="submenu_list">
			                          <li><a href="${contextPath}/program/program.do">프로그램 소개</a></li>
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
				<form action="#" class="minisrch_form" >
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
								<th scope="col">작성자</th>
								<th scope="col">작성일</th>
							</tr>
						</thead>
						<tbody>

	<c:choose>
		<c:when test="${empty articlesList}" >
	    	<tr  height="10">
				<td colspan="4">
	        		<p align="center">
	            		<b><span style="font-size:9pt;">등록된 글이 없습니다.</span></b>
	        		</p>
	      	</td>  
	    	</tr>
		</c:when>
		<c:when test="${!empty articlesList}" >
			<c:forEach  var="article" items="${articlesList }" varStatus="articleNum" >
				<tr align="center">
					<td width="5%">${articleNum.count}</td>
					<td align='left'  width="35%">
		    			<span style="padding-right:30px"></span>    
						<c:choose>
	    					<c:when test='${article.level > 1 }'>  
	         					<c:forEach begin="1" end="${article.level }" step="1">
	             					<span style="padding-left:10px"></span> 
	         					</c:forEach>
	         						<span style="font-size:12px;">[답변]</span>
	               					<a class='cls1' href="${contextPath}/board/viewArticle.do?articleNO=${article.articleNO}">${article.title}</a>
	          				</c:when>
	          				<c:otherwise>
		        				<a class='cls1' href="${contextPath}/board/viewArticle.do?articleNO=${article.articleNO}">${article.title }</a>
		        			</c:otherwise>
		     			</c:choose>
		  			</td>
		  			<td width="10%">${article.id }</td>
		  			<td  width="10%"><fmt:formatDate value="${article.writeDate}" /></td> 
				</tr>
			</c:forEach>
		</c:when>
	</c:choose>
	
						</tbody>
					</table>
				<!-- pagination -->
				<div class="pagination">
		<c:if test="${totArticles != null }" >
	    	<c:choose>
	    		<c:when test="${totArticles >100 }">  <!-- 글 개수가 100 초과인경우 -->
		    		<c:forEach   var="page" begin="1" end="10" step="1" >
		        		<c:if test="${section >1 && page==1 }">
		          			<a class="no-uline" href="${contextPath }/board/notice_list.do?section=${section-1}&pageNum=${(section-1)*10 +1 }">&nbsp; pre </a>
		         		</c:if>
		          			<a class="no-uline" href="${contextPath }/board/notice_list.do?section=${section}&pageNum=${page}">${(section-1)*10 +page } </a>
		         		<c:if test="${page ==10 }">
		          			<a class="no-uline" href="${contextPath }/board/notice_list.do?section=${section+1}&pageNum=${section*10+1}">&nbsp; next</a>
		         		</c:if>
		    		</c:forEach>
	        	</c:when>
	        	<c:when test="${totArticles ==100 }" >  <!--등록된 글 개수가 100개인경우  -->
		    		<c:forEach   var="page" begin="1" end="10" step="1" >
		        		<a class="no-uline"  href="#">${page } </a>
		      		</c:forEach>
	        	</c:when>
	        	<c:when test="${totArticles< 100 }" >   <!--등록된 글 개수가 100개 미만인 경우  -->
		    		<c:forEach   var="page" begin="1" end="${totArticles/10 +1}" step="1" >
		        		<c:choose>
		           			<c:when test="${page==pageNum }">
		            			<a class="sel-page"  href="${contextPath }/board/notice_list.do?section=${section}&pageNum=${page}">${page } </a>
		          			</c:when>
		          			<c:otherwise>
		            			<a class="no-uline"  href="${contextPath }/board/notice_list.do?section=${section}&pageNum=${page}">${page } </a>
		          			</c:otherwise>
		        		</c:choose>
		    		</c:forEach>
		    	</c:when>
		    </c:choose>
	    </c:if>
				</div>
				<!-- //pagination -->
			<br><br>
				<a  class="cls1"  href="${contextPath}/board/articleForm.do"><p class="cls2">글쓰기</p></a>
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
