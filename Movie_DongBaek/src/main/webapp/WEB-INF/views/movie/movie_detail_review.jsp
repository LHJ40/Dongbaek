<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!doctype html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<%-- 부트스트랩 이모티콘 --%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<title>영화 예매 사이트</title>
<style>
	div{background-color: transparent;}
	
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
 <%--네비게이션 바 영역 --%>
 <header id="pageHeader"><%@ include file="../inc/header.jsp"%></header>
 
  <article id="mainArticle">
  <%--본문내용 --%>
	<%--top 섹션 include --%>
	<%@include file="movieDetail_top.jsp" %>
		
		  	
	<%-- 2. 두번째 섹션 - 탭 --%>
	<section id="tap">
		 <div class="row">
			 <div class="col">
		  		<ul class="nav nav-tabs">
					<li class="nav-item">
				    	<a class="nav-link" href="movie_detail_info?movie_num=${movie.movie_num }">주요정보</a>
				  	</li>
				  	<li class="nav-item">
				    	<a class="nav-link active" href="movie_detail_review?movie_num=${movie.movie_num }">리뷰</a>
				  	</li>
				  	<li class="nav-item">
				    	<a class="nav-link" href="movie_detail_photo?movie_num=${movie.movie_num }">포토</a>
				  	</li>
				</ul>
			</div>
		</div>
	</section>

	 <%-- 세번째 섹션 --%>
		  	<section id="movie-end">

<%-- 			  		리뷰페이지 --%>
		  	  <div class="p-3">
		  		<div class="row">
			  		<div class="h5" id="review_head">영화명에 대한 리뷰 NN개가 등록되어 있습니다!</div>
		  		</div>
		  		<br>
		  		<div class="row h6" id="review_count">
		  			전체 리뷰 개수 : NN개
		  		</div>
		  		<br>
		  		<%-- 리뷰 본문 --%>
		  		<div id="review01">
			  		<div class="row">
			  		<%-- 프로필 사진& 아이디 --%>
					  <div class="col col-md-2">
					    <div class="row container-md"><img src="/resources/img/anonymous.png" class="rounded float-left rounded-circle" alt="..." width="50px"></div>
					    <p class="row ">사용자 아이디</p>
					  </div>
					<%-- 평점 --%>
					  <div class="col col-md-2">
					    <p class="row h4 container-md">평점</p>
					    <p class="row">
							<i class="bi bi-star-fill"></i>
						  	<i class="bi bi-star"></i>
						  	<i class="bi bi-star"></i>
						  	<i class="bi bi-star"></i>
 						  	<i class="bi bi-star"></i>	
 						</p>
					  </div>
					<%-- 리뷰 --%>
					  	<p class="col col-md-6 text-left">
					  	리뷰 내용<br>
					  	리뷰 내용<br>
					  	리뷰 내용<br>
					  	</p>
					<%-- 공감 --%>
					  <div class="col col-md-2">
					  	 <div class="row"><img src="/resources/img/finger.png" class="rounded float-left" alt="..." width="50px"></div>
					  	 <p class="row">공감수</p>
					  </div>
			  		</div>
		  		</div>
		  		<%-- 리뷰 본문 --%>
		  		<div id="review02">
			  		<div class="row">
			  		<%-- 프로필 사진& 아이디 --%>
					  <div class="col col-md-2">
					    <div class="row container-md"><img src="/resources/img/anonymous.png" class="rounded float-left rounded-circle" alt="..." width="50px"></div>
					    <p class="row">사용자 아이디</p>
					  </div>
					<%-- 평점 --%>
					  <div class="col col-md-2">
					    <p class="row h4 container-md">평점</p>
					    <p class="row">
							<i class="bi bi-star-fill"></i>
						  	<i class="bi bi-star"></i>
						  	<i class="bi bi-star"></i>
						  	<i class="bi bi-star"></i>
 						  	<i class="bi bi-star"></i>	
 						</p>
					  </div>
					<%-- 리뷰 --%>
					  	<p class="col col-md-6 text-left">
					  	리뷰 내용<br>
					  	리뷰 내용<br>
					  	리뷰 내용<br>
					  	</p>
					<%-- 공감 --%>
					  <div class="col col-md-2">
					  	 <div class="row"><img src="/resources/img/finger.png" class="rounded float-left" alt="..." width="50px"></div>
					  	 <p class="row">공감수</p>
					  </div>
			  		</div>
		  		</div>
		  		<%-- 리뷰 본문 --%>
		  		<div id="review03">
			  		<div class="row">
			  		<%-- 프로필 사진& 아이디 --%>
					  <div class="col col-md-2">
					    <div class="row container-md"><img src="/resources/img/anonymous.png" class="rounded float-left rounded-circle" alt="..." width="50px"></div>
					    <p class="row">사용자 아이디</p>
					  </div>				
					<%-- 평점 --%>
					  <div class="col col-md-2">
					    <p class="row h4 container-md">평점</p>
					    <p class="row">
							<i class="bi bi-star-fill"></i>
						  	<i class="bi bi-star"></i>
						  	<i class="bi bi-star"></i>
						  	<i class="bi bi-star"></i>
 						  	<i class="bi bi-star"></i>	
 						</p>
					  </div>
					<%-- 리뷰 --%>
					  	<p class="col col-md-6 text-left">
					  	리뷰 내용<br>
					  	리뷰 내용<br>
					  	리뷰 내용<br>
					  	</p>
					<%-- 공감 --%>
					  <div class="col col-md-2">
					  	 <div class="row"><img src="/resources/img/finger.png" class="rounded float-left" alt="..." width="50px"></div>
					  	 <p class="row">공감수</p>
					  </div>
			  		</div>
		  		</div>
		  		<%-- 리뷰 본문 --%>
		  		<div id="review04">
			  		<div class="row">
			  		<%-- 프로필 사진& 아이디 --%>
					  <div class="col col-md-2">
					    <div class="row container-md"><img src="/resources/img/anonymous.png" class="rounded float-left rounded-circle" alt="..." width="50px"></div>
					    <p class="row">사용자 아이디</p>
					  </div>
					<%-- 평점 --%>
					  <div class="col col-md-2">
					    <p class="row h4 container-md">평점</p>
					    <p class="row">
							<i class="bi bi-star-fill"></i>
						  	<i class="bi bi-star"></i>
						  	<i class="bi bi-star"></i>
						  	<i class="bi bi-star"></i>
 						  	<i class="bi bi-star"></i>	
 						</p>
					  </div>
					<%-- 리뷰 --%>
					  	<p class="col col-md-6 text-left">
					  	리뷰 내용<br>
					  	리뷰 내용<br>
					  	리뷰 내용<br>
					  	</p>
					<%-- 공감 --%>
					  <div class="col col-md-2">
					  	 <div class="row"><img src="/resources/img/finger.png" class="rounded float-left" alt="..." width="50px"></div>
					  	 <p class="row">공감수</p>
					  </div>
			  		</div>
		  		</div>
		  		<%-- 리뷰 본문 --%>
		  		<div id="review05">
			  		<div class="row">
			  		<%-- 프로필 사진& 아이디 --%>
					  <div class="col col-md-2">
					    <div class="row container-md"><img src="/resources/img/anonymous.png" class="rounded float-left rounded-circle" alt="..." width="50px"></div>
					    <p class="row">사용자 아이디</p>
					  </div>
					<%-- 평점 --%>
					  <div class="col col-md-2">
					    <p class="row h4 container-md">평점</p>
					    <p class="row">
							<i class="bi bi-star-fill"></i>
						  	<i class="bi bi-star"></i>
						  	<i class="bi bi-star"></i>
						  	<i class="bi bi-star"></i>
 						  	<i class="bi bi-star"></i>	
 						</p>
					  </div>
					<%-- 리뷰 --%>
					  	<p class="col col-md-6 text-left">
					  	리뷰 내용<br>
					  	리뷰 내용<br>
					  	리뷰 내용<br>
					  	</p>
					<%-- 공감 --%>
					  <div class="col col-md-2">
					  	 <div class="row"><img src="/resources/img/finger.png" class="rounded float-left" alt="..." width="50px"></div>
					  	 <p class="row">공감수</p>
					  </div>
			  		</div>
		  		</div>

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
				    <li class="page-item">
				      <a class="page-link" href="#">&raquo;</a>
				    </li>
				  </ul>
				</nav>
		  	  
		  	  </div>
		  	  
		  	  
		  	  
		  	  
		  	</section><%-- 세번째 섹션 끝--%>
		
			
		</div> <%-- 컨테이너 끝 --%>
  
  </article>
  
  <nav id="mainNav">
  <%--왼쪽 사이드바 --%>
  </nav>
  
  <div id="siteAds"></div>
  <%--페이지 하단 --%>
  <footer id="pageFooter"><%@ include file="../inc/footer.jsp"%></footer>
</body>
