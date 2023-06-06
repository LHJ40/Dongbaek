<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<title>영화 예매 사이트</title>
<style>
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
	
	.breadcrumb-item {
  	color: color-yiq;
	}
</style>
</head>
<body>
 <%--네비게이션 바 영역 --%>
 <header id="pageHeader"><%@ include file="/resources/inc/header.jsp"%></header>
 
  <article id="mainArticle">
  <%--본문내용 --%>
<%-- 상영작 구분 --%>
	<div class="container">
		<ul class="nav nav-tabs">
		  <li class="nav-item">
		    <a class="nav-link active" aria-current="page" href="movie_list_present">현재상영작</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="movie_list_prepare">상영예정작</a>
		  </li>
		</ul>
<%-- 정렬 기준 --%>
	<div class="row"  align="left">
		<div class="col col-md-10"></div>
		<div class="col col-md-2 d-flex justify-content-end">
		  <select class="custom-select" name="movie_array">
		    <option selected>정렬순</option>
		    <option value="1">예매순</option>
		    <option value="2">평점순</option>
		  </select>
		</div>
	</div>
	<%-- 영화정보 --%>
	<div class="m-3">
		<div class="row"  align="left"> <%-- 1열 --%>
			<div class="col-lg-3 col-mid-4">
				<div class="card border-0 shadow-sm" style="width: 18rem;">
				  <img src="/resources/img/poster02@2.jpg" class="card-img-top" alt="...">
				  <div class="card-body">
				    <h3 class="card-title"><img src="/resources/img/gradeA.png" class="img-rounded" onclick="location.href='movie_detail_info'">영화명</h3>
				    <p class="card-text">예매율: 45.2% 개봉일: 2023.05.12</p>
				    <p class="d-flex justify-content-center">
				    	<button type="button" class="btn btn-outline-danger mr-2	">♡찜하기</button>
				    	<a href="#" class="btn btn-danger">&nbsp;&nbsp;예매&nbsp;&nbsp;</a>
				    </p>
				  </div>
				</div>
			</div>
			<div class="col-lg-3 col-mid-4">
				<div class="card border-0 shadow-sm" style="width: 18rem;">
				  <img src="/resources/img/poster02@2.jpg" class="card-img-top" alt="...">
				  <div class="card-body">
				    <h3 class="card-title"><img src="/resources/img/gradeB.png" class="img-rounded">영화명</h3>
				    <p class="card-text">예매율: 45.2% 개봉일: 2023.05.12</p>
				    <p class="d-flex justify-content-center">
				    	<button type="button" class="btn btn-outline-danger mr-2	">♡찜하기</button>
				    	<a href="#" class="btn btn-danger">&nbsp;&nbsp;예매&nbsp;&nbsp;</a>
				    </p>
				  </div>
				</div>
			</div>
			<div class="col-lg-3 col-mid-4">
				<div class="card border-0 shadow-sm" style="width: 18rem;">
				  <img src="/resources/img/poster02@2.jpg" class="card-img-top" alt="...">
				  <div class="card-body">
				    <h3 class="card-title"><img src="/resources/img/gradeC.png" class="img-rounded">영화명</h3>
				    <p class="card-text">예매율: 45.2% 개봉일: 2023.05.12</p>
				    <p class="d-flex justify-content-center">
				    	<button type="button" class="btn btn-outline-danger mr-2	">♡찜하기</button>
				    	<a href="#" class="btn btn-danger">&nbsp;&nbsp;예매&nbsp;&nbsp;</a>
				    </p>
				  </div>
				</div>
			</div>
			<div class="col-lg-3 col-mid-4">
				<div class="card border-0 shadow-sm" style="width: 18rem;">
				  <img src="/resources/img/poster02@2.jpg" class="card-img-top" alt="...">
				  <div class="card-body">
				    <h3 class="card-title"><img src="/resources/img/gradeD.png" class="img-rounded">영화명</h3>
				    <p class="card-text">예매율: 45.2% 개봉일: 2023.05.12</p>
				    <p class="d-flex justify-content-center">
				    	<button type="button" class="btn btn-outline-danger mr-2	">♡찜하기</button>
				    	<a href="#" class="btn btn-danger">&nbsp;&nbsp;예매&nbsp;&nbsp;</a>
				    </p>
				  </div>
				</div>
			</div>
		</div>
		<br>
		<div class="row"  align="left"> <%-- 2열 --%>
			<div class="col-lg-3 col-mid-4">
				<div class="card border-0 shadow-sm" style="width: 18rem;">
				  <img src="/resources/img/poster02@2.jpg" class="card-img-top" alt="...">
				  <div class="card-body">
				    <h3 class="card-title"><img src="/resources/img/gradeA.png" class="img-rounded">영화명</h3>
				    <p class="card-text">예매율: 45.2% 개봉일: 2023.05.12</p>
				    <p class="d-flex justify-content-center">
				    	<button type="button" class="btn btn-outline-danger mr-2	">♡찜하기</button>
				    	<a href="#" class="btn btn-danger">&nbsp;&nbsp;예매&nbsp;&nbsp;</a>
				    </p>
				  </div>
				</div>
			</div>
			<div class="col-lg-3 col-mid-4">
				<div class="card border-0 shadow-sm" style="width: 18rem;">
				  <img src="/resources/img/poster02@2.jpg" class="card-img-top" alt="...">
				  <div class="card-body">
				    <h3 class="card-title"><img src="/resources/img/gradeB.png" class="img-rounded">영화명</h3>
				    <p class="card-text">예매율: 45.2% 개봉일: 2023.05.12</p>
				    <p class="d-flex justify-content-center">
				    	<button type="button" class="btn btn-outline-danger mr-2	">♡찜하기</button>
				    	<a href="#" class="btn btn-danger">&nbsp;&nbsp;예매&nbsp;&nbsp;</a>
				    </p>
				  </div>
				</div>
			</div>
			<div class="col-lg-3 col-mid-4">
				<div class="card border-0 shadow-sm" style="width: 18rem;">
				  <img src="/resources/img/poster02@2.jpg" class="card-img-top" alt="...">
				  <div class="card-body">
				    <h3 class="card-title"><img src="/resources/img/gradeC.png" class="img-rounded">영화명</h3>
				    <p class="card-text">예매율: 45.2% 개봉일: 2023.05.12</p>
				    <p class="d-flex justify-content-center">
				    	<button type="button" class="btn btn-outline-danger mr-2	">♡찜하기</button>
				    	<a href="#" class="btn btn-danger">&nbsp;&nbsp;예매&nbsp;&nbsp;</a>
				    </p>
				  </div>
				</div>
			</div>
			<div class="col-lg-3 col-mid-4">
				<div class="card border-0 shadow-sm" style="width: 18rem;">
				  <img src="/resources/img/poster02@2.jpg" class="card-img-top" alt="...">
				  <div class="card-body">
				    <h3 class="card-title"><img src="/resources/img/gradeD.png" class="img-rounded">영화명</h3>
				    <p class="card-text">예매율: 45.2% 개봉일: 2023.05.12</p>
				    <p class="d-flex justify-content-center">
				    	<button type="button" class="btn btn-outline-danger mr-2" name="">♡찜하기</button>
				    	<a href="#" class="btn btn-danger">&nbsp;&nbsp;예매&nbsp;&nbsp;</a>
				    </p>
				  </div>
				</div>
			</div>
		</div>
	</div>
	
	<%-- 하단 페이지 바 --%>
	<nav aria-label="Page navigation example">
	  <ul class="pagination justify-content-center">
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	      </a>
	    </li>
	    <li class="page-item"><a class="page-link" href="#">1</a></li>
	    <li class="page-item"><a class="page-link" href="#">2</a></li>
	    <li class="page-item"><a class="page-link" href="#">3</a></li>
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	      </a>
	    </li>
	  </ul>
	</nav>
	<hr>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	</div>
  
  </article>
  
  <nav id="mainNav">
  <%--왼쪽 사이드바 --%>
  </nav>
  
  <div id="siteAds"></div>
  <%--페이지 하단 --%>
  <footer id="pageFooter"><%@ include file="/resources/inc/footer.jsp"%></footer>
</body>