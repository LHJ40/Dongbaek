<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<link
	href="${pageContext.request.contextPath }/resources/css/default.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath }/resources/css/sidebar.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath }/resources/css/button.css"
	rel="stylesheet" type="text/css">
<title>영화 예매 사이트</title>
<style>
#mainNav{
/* 		border: 1px solid #f00; */
}
	
#mainNav>ul{
	list-style: none;
}
div {
background-color: transparent;
}

<%-- 페이징 색상변경 --%>
.page-link {
  color: #000; 
  background-color: #fff;
  border: 1px solid #ccc; 
}

.page-item.active .page-link {
 z-index: 1;
 color: #555;
 font-weight:bold;
 background-color: #f1f1f1;
 border-color: #ccc;
 
}

.page-link:focus, .page-link:hover {
  color: #000;
  background-color: #fafafa; 
  border-color: #ccc;
}

</style>

</head>
<body>
 <header id="pageHeader">
 <%--네비게이션 바 영역 --%>
  <%@ include file="/resources/inc/header.jsp"%>
 </header>
 
  <article id="mainArticle">
  <%--본문내용 --%>
  
   <div class="container-fluid w-900" >

	  <%-- 네이게이션바 --%>
 	<div class="row row-md-12"> 
		<nav class="navbar navbar-expand-xl navbar-light bg-light d-flex justify-content-between">
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		  <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
		  	<div class="col col-md-4">
		    	<a class="navbar-brand" >공지사항 관리</a>
		    </div>

		  </div>

		</nav>
  	</div>
  	
  	<%-- 본문 테이블 --%>
  	<div class="row">
  	<table class="table table-striped text-center align-middle">
	  <%-- 테이블 헤드 --%>
	  <thead>
	    <tr>
	      <th scope="col">번호</th>
	      <th scope="col" width="600px">제목</th>
	      <th scope="col">작성자</th>
	      <th scope="col">등록일</th>
	      <th scope="col"></th>
	    </tr>
	  </thead>
	  <%-- 테이블 바디--%>
	  <tbody>
	    <tr>
	      <td scope="col" class="align-middle">24</th>
	      <td scope="col" class="align-middle">안녕하세요</td>
	      <td scope="col" class="align-middle">홍길동</td>
	      <td scope="col" class="align-middle">2022-02-02</td>
	      <td scope="col" class="align-middle">
<!-- 	      <td  class="align-middle"> -->
<!-- 		  	<select class="form-control mr-sm-2 text-center" name="movie_play"> -->
<!-- 		      	<option value="play1">1회차: 07:00 ~ 08:30</option> -->
<!-- 		      	<option value="paly2">2회차: 11:30 ~ 13:00</option> -->
<!-- 		      	<option value="play3">3회차: 16:30 ~ 15:30</option> -->
<!-- 		      	<option value="play4">4회차: 19:00 ~ 20:30</option> -->
<!-- 		      	<option value="play5">5회차: 21:30 ~ 23:00</option> -->
<!-- 			</select> -->
		  </td>
	    </tr>

	    <%-- 밑줄 용 빈칸 --%>
	    <tr>
	     <th scope="row"></th>
	     <th></th>
	     <th></th>
	     <th></th>
	     <th></th>
	    </tr>
	
	  </tbody>
	</table>
  	</div>
		<div class="row col flex-row-reverse"><button type="button" class="btn btn-danger" onclick="location.href='admin_cs_notice_form'">등록</button></div>
	<div class="col col-md-1"></div>
 <%-- 페이징 --%>
 
 <nav aria-label="...">
  <ul class="pagination pagination-md justify-content-center">
    <li class="page-item disabled">
      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">&laquo;</a>
    </li>
    <li class="page-item active" aria-current="page">
      <a class="page-link" href="#">1 <span class="sr-only">(current)</span></a>
    </li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item"><a class="page-link" href="#">4</a></li>
    <li class="page-item"><a class="page-link" href="#">5</a></li>
    <li class="page-item">
      <a class="page-link" href="#">&raquo;</a>
    </li>
  </ul>
</nav>
		

  
  </article>
  

  <%--왼쪽 사이드바 --%>
	<nav id="mainNav" class="d-none d-md-block sidebar">
		<%@ include file="/WEB-INF/views/sidebar/sideBar.jsp"%>
	</nav>
  
  <div id="siteAds"></div>
  <%--페이지 하단 --%>
  <footer id="pageFooter"><%@ include file="/resources/inc/footer.jsp"%></footer>
</body>