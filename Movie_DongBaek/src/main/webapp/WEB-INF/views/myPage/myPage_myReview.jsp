<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmf" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/myPage.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/sidebar_myPage.css" rel="stylesheet" type="text/css">
<title>영화 예매 사이트</title>
<style>

</style>
</head>
<body>
<%--네비게이션 바 영역 --%>
<header id="pageHeader"><%@ include file="../inc/header.jsp"%></header>
 
<article id="mainArticle">
	<%--본문내용 --%>
	<div class="container">
	<div class="mainTop">
 		<h1>나의 리뷰</h1>
 		<hr>
 		<span> 회원님이 작성하신 리뷰를 확인하실 수 있습니다! </span>
 		
 		<table class="table">
 			<c:choose>
 				<c:when test="${empty myReviewList}">
 					<tr>
						<td>고객님께서 작성하신 리뷰는 존재하지 않습니다.</td>
					</tr>
 				</c:when>
	 			<c:otherwise>
		 			<tr>
			 			<th>번호</th>
			 			<th>영화 제목</th>
			 			<th>리뷰 내용</th>
<!-- 			 			<th>공감 수</th> -->
			 			<th>평점</th>
			 			<th>등록일</th>
			 			<th>수정 및 삭제</th>
<!-- 			 			<th>리뷰 작성</th> -->
			 			<th>리뷰 작성 상태</th>
	 				</tr>
	 				<c:forEach var="myReviewList" items="${myReviewList }" begin="0" end="3" step="1" varStatus="status">
		 				<tr>
					 		<td>
					 			${status.index+1}
					 		</td> <%-- {param.myreview_num} 최신순이 위로 --%>
					 		
					 		<td>
<%-- 					 		${myReviewList.movie_name_kr } --%>
					 		</td> 
					 		
					 		<td>
					 			${myReviewList.review_content }
					 			<a href="review_detail">더보기</a><%-- 알림창으로 뜨니까 href 아닌데 현재 생각안남--%>
					 		</td>

<%-- 					 	<td>
								공감 수
							</td> {param.sympathy_num}구현할지안할지 --%>
					 		
					 		<td>
					 			${myReviewList.review_rating }
					 		</td> <%-- {param.avg_review_point} --%>
					 		
					 		<td>
<%-- 					 			<fmt:formatDate value="${myReviewList.review_date}	" pattern="yy-MM-dd HH:mm" />  --%>
<%-- 					 			<fmf:formatDate value=" --%>
					 			${myReviewList.review_date}	
<%-- 					 			"/>				 			"/> --%>
					 		</td> <%-- {param.review_datetime} --%>
					 		
					 		<c:choose>
					 			<c:when test="${empty myReviewList.review_content}">
							 		<td>
							 			<a href="myPage_reviewWrite">작성하기</a>
							 		</td>
						 		</c:when>
						 		<c:otherwise>
							 		<td>
							 			<a href="modify_review">수정 및 삭제</a>
<!-- 							 			<a href="modify_delete">삭제</a> -->
							 		</td>
							 		
							 		<td>
							 			작성완료
							 		</td>
						 		</c:otherwise>
					 		</c:choose>
				 		</tr>
	 				
	 				</c:forEach>
	 			</c:otherwise>	
 			</c:choose>
 	</table>
  </div>
  </div>
  
  </article>
  
  	<nav id="mainNav">
		<%--왼쪽 사이드바 --%>
  		<%@ include file="/WEB-INF/views/sidebar/sideBar_myPage.jsp"%>
  	</nav>
  
  
  <div id="siteAds"></div>
  <%--페이지 하단 --%>
  <footer id="pageFooter"><%@ include file="../inc/footer.jsp"%></footer>
</body>