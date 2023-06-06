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
		 <h1>영화관리</h1>
		 <hr>
		 <table class="table table-striped">
		 	<tr>
		 		<th>영화번호</th>
		 		<th>영화제목</th>
		 		<th>등록일시</th> <%--XXXX.XX.XX OO:OO 형태 --%>
		 		<th>수정 및 삭제</th>
		 	</tr>
		 	<tr>
		 		<td>2</td><%-- {param.movie_num} --%>
		 		<td>달마야놀자</td><%-- {param.movie_name} --%>
		 		<td>2032.13.12. 12:13:33</td><%-- {param.movie_regist_datetime} --%>
		 		<td><button class="btn btn-danger" value="수정">수정</button> <button class="btn btn-danger" value="삭제">삭제</button></td>
		 	</tr>
		 	<tr>
		 		<td>1</td><%-- {param.movie_num} --%>
		 		<td>타짜</td><%-- {param.movie_name} --%>
		 		<td>2032.13.12. 02:23:53</td><%-- {param.movie_regist_datetime} --%>
		 		<td><button class="btn btn-danger" value="수정">수정</button> <button class="btn btn-danger" value="삭제">삭제</button></td>
		 	</tr>
		 </table>
		 <button class="btn btn-danger" id="bottom-right" value="regist">등록</button> <%--css로 오른쪽 옮기고 형태변경 --%>
	 </div>
  </div>
  </article>
  
  <nav id="mainNav">
  <%--왼쪽 사이드바 --%>
<!--   	<div class="d-flex justify-content-center"> -->
<!-- 		  <div class="col-10"> -->
<!-- 		    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical"> -->
<!-- 		      <a class="nav-link active" id="v-pills-member-management-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">회원관리</a> -->
<!-- 		      <a class="nav-link" id="v-pills-movie-management-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">영화관리</a> -->
<!-- 		      <a class="nav-link" id="v-pills-schedule-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">상영스케쥴 관리</a> -->
<!-- 		      <a class="nav-link" id="v-pills-payments-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">결제관리</a> -->
<!-- 		      <a class="nav-link" id="v-pills-notice-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">공지사항 관리</a> -->
<!-- 		      <a class="nav-link" id="v-pills-csPQ-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">1:1 질문 관리</a> -->
<!-- 		      <a class="nav-link" id="v-pills-faq-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">자주 묻는 질문 관리</a> -->
<!-- 	   		 </div> -->
<!-- 		  </div> -->
<!-- 	</div> -->
  	<%@ include file="/WEB-INF/views/sidebar/sideBar.jsp"%>
  </nav>
  
  <div id="siteAds"></div>
  <%--페이지 하단 --%>
  <footer id="pageFooter"><%@ include file="/resources/inc/footer.jsp"%></footer>
</body>



