<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/myPage.css" rel="stylesheet" type="text/css">
<title>영화 예매 사이트</title>
<style>

</style>
</head>
<body>
 <%--네비게이션 바 영역 --%>
 <header id="pageHeader"><%@ include file="/resources/inc/header.jsp"%></header>
 
  <article id="mainArticle">
  <%--본문내용 --%>
  <div class="container">
  <div class="mainTop">
 	<h1>나의 리뷰</h1>
 	<hr>
 	<table class="table table-striped">
 		<tr>
 			<th>번호</th>
 			<th>영화 제목</th>
 			<th>리뷰 내용</th>
 			<th>공감 수</th>
 			<th>평점</th>
 			<th>등록일</th>
 			<th>수정 및 삭제</th>
 			<th>리뷰 작성</th>
 		</tr>
 		<tr>
	 		<td>2</td> <%-- {param.myreview_num} 최신순이 위로 --%>
	 		<td>아바타</td> <%-- {param.movie_name} --%>
	 		<td>정말재밌어...<a href="review_detail">더보기</a><%-- 알림창으로 뜨니까 href 아닌데 현재 생각안남--%></td>
	 		<td>15</td> <%-- {param.sympathy_num}구현할지안할지 --%>
	 		<td>4</td> <%-- {param.avg_review_point} --%>
	 		<td>XX-XX-XX</td> <%-- {param.review_datetime} --%>
	 		<td><a href="modify_review">수정</a> <a href="modify_delete">삭제</a></td>
	 		<td>작성완료</td>
 		</tr>
 		<tr>
	 		<td>1</td> <%-- {param.myreview_num} 최신순이 위로 --%>
	 		<td>신세계</td> <%-- {param.movie_name} --%>
	 		<td><%-- 알림창으로 뜨니까 href 아닌데 현재 생각안남--%></td>
	 		<td></td> <%-- {param.sympathy_num}구현할지안할지 --%>
	 		<td></td> <%-- {param.avg_review_point} --%>
	 		<td></td> <%-- {param.review_datetime} --%>
	 		<td></td>
	 		<td><a href="review_write">작성하기</a></td>
 		</tr>
 	
 	</table>
  </div>
  </div>
  
  </article>
  
  <nav id="mainNav">
  <%--왼쪽 사이드바 --%>
  <!-- 	왼쪽 탭 링크들 -->
		 <div class="d-flex justify-content-center">
		  <div class="col-10">
		    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
		      <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">고객센터홈</a>
		      <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">공지사항</a>
		      <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">자주묻는 질문</a>
		      <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">1:1 문의</a>
		    </div>
		  </div>
		  </div>
  </nav>
  
  <div id="siteAds"></div>
  <%--페이지 하단 --%>
  <footer id="pageFooter"><%@ include file="/resources/inc/footer.jsp"%></footer>
</body>