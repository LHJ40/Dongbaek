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
<script type="text/javascript">
$(document).ready(function() {
	let myReview = $("tr.myReview");
	myReview.each(function() {
		if($("input[type=hidden]").val() == "상영완료") {
			let movieNum = $(".movieName").attr("data-movie-num");
			let memberId = $(".movieName").attr("data-member-id");
			let playNum = $(".movieName").attr("data-play-num");
			let playStatus = $("movieName").attr("data-play-status");
				getReview(memberId, playNum, playStatus);
		}		
	});
	
});


function getReview() {	
	let movieNum = $(".movieName").attr("data-movie-num");
	let memberId = $(".movieName").attr("data-member-id");
	let playNum = $(".movieName").attr("data-play-num");
	let playStatus = $("input[type=hidden]").val(); 
	
	$.ajax({
		type : "post", 
		url : "GetReivew", 
		data : {"member_id" : memberId, "play_num" : playNum, "play_status" : playStatus}, 
		dataType : "json",
	})
	.done(function(theater) {
		alert("요청성공");
	})
	.fail(function() { // 요청 실패 시
		alert("요청 실패!");
	});
}
</script>

</head>
<body>
<%--네비게이션 바 영역 --%>
<header id="pageHeader"><%@ include file="../inc/header.jsp"%></header>
 
<article id="mainArticle">
	<%--본문내용 --%>
	<div class="container container-fluid w-900">
	<div class="mainTop">
 		<h1>나의 리뷰</h1>
 		<hr>
 		<span> 회원님이 작성하신 리뷰를 확인하실 수 있습니다! </span>
 		
 		<table class="table">
 			<c:choose>
 				
<%--  				<c:when test="${myReviewList.play_change }"> --%>
 				<c:when test="${empty myReviewList }">
 					<tr>
						<td>고객님께서 작성하신 리뷰는 존재하지 않습니다.</td>
					</tr>
 				</c:when>
	 			<c:otherwise>
		 			<tr>
		 				<th>번호</th>
			 			<th>영화 제목</th>
			 			<th>리뷰 내용</th>
			 			<th>평점</th>
			 			<th>등록일</th>
				 		<th>수정 및 삭제</th>
				 		<th>리뷰 작성 상태</th>
	 				</tr>
	 				<c:forEach var="myReviewList" items="${myReviewList }" begin="0" end="3" step="1" varStatus="status">
		 				<tr class="myReview">
					 		<td>
					 			${status.index+1}
					 		</td> 
					 		
					 		<td class="movieName" data-movie-num="${myReviewList.movie_num }" data-member-id="${myReviewList.member_id }" data-play-num="${myReviewList.play_num }" data-play-status="${myReviewList.play_status }">
					 			${myReviewList.movie_name_kr }
					 			<input type="hidden" value="${myReviewList.play_status }">
					 		</td> 
					 		
					 		<td>
					 			${myReviewList.review_content }
					 		</td>

					 		<td>
					 			${myReviewList.review_rating }
					 		</td> <%-- {param.avg_review_point} --%>
					 		
					 		<td>
					 			${myReviewList.review_date}	
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
  
  	<%-- 페이징 처리 시작 --%>
  	<nav aria-label="...">
		<ul class="pagination pagination-md justify-content-center">
			<%-- 이전 페이지로 이동 --%>
			<c:choose>
			    <c:when test="${pageInfo.startPage > 1}">
			    	<li class="page-item">
			    		<a class="page-link" href="myPage_myReview?pageNo=${pageInfo.startPage - 1}" tabindex="-1" aria-disabled="false">&laquo;</a>
			    	</li>
			    </c:when>
			    <c:otherwise>
			    	<li class="page-item disabled">
			    		<a class="page-link" href="#" tabindex="-1" aria-disabled="true">&laquo;</a>
			   		</li>
			    </c:otherwise>
			</c:choose>
			
			<%-- 각 페이지 번호마다 하이퍼링크 설정(현재 페이지는 하이퍼링크 제거) --%>
			<c:forEach var="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
				<c:choose>
					<%-- 현재 페이지 --%>
					<c:when test="${pageNo eq i}">
						<li class="page-item active" aria-current="page">
							<a class="page-link">${i} <span class="sr-only">(current)</span></a>
						</li>
					</c:when>
					
			    	<%-- 다른 페이지 --%>
		        	<c:otherwise>
						<li class="page-item">
							<a class="page-link" href="myPage_myReview?pageNo=${i}">${i}</a>
						</li>
					</c:otherwise>
	       		</c:choose>
			</c:forEach>
			
			<%-- 다음 페이지로 이동 --%>
			<c:choose>
				<c:when test="${pageInfo.endPage < pageInfo.maxPage}">
			    	<li class="page-item">
			        	<a class="page-link" href="myPage_myReview?pageNo=${pageInfo.endPage + 1}">&raquo;</a>
			        </li>
			    </c:when>
			    <c:otherwise>
			    	<li class="page-item disabled">
			        	<a class="page-link" href="#" tabindex="-1" aria-disabled="true">&raquo;</a>
			        </li>
			    </c:otherwise>
			</c:choose>
		</ul>
	</nav>
			
  </div>
  
  </article>
  
  	<nav id="mainNav" class="d-none d-md-block sidebar">
		<%--왼쪽 사이드바 --%>
  		<%@ include file="/WEB-INF/views/sidebar/sideBar_myPage.jsp"%>
  	</nav>
  
  
  <div id="siteAds"></div>
  <%--페이지 하단 --%>
  <footer id="pageFooter"><%@ include file="../inc/footer.jsp"%></footer>
</body>