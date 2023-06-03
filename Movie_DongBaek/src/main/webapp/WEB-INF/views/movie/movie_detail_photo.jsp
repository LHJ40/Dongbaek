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
	div{background-color: transparent;}
</style>
</head>
<body>
 <%--네비게이션 바 영역 --%>
 <header id="pageHeader"><%@ include file="/resources/inc/header.jsp"%></header>
 
  <article id="mainArticle">
  <%--본문내용 --%>

		<div class="container">
		
			<section id="movie-head"> <%-- 첫번째 섹션 --%>
			<div class="row bg-secondary p-5">
		 	 <div class=" col-md-8 d-flex"><%-- 왼쪽 창 --%>
			  <div class="col float-left" >
			  	  <div class="row">
			  	  <br><br><br>
			  	  </div>
				  <div class="row">
				     <div class="col-md-8 justify-content-start h3 p-0">영화명</div>
				  </div> 
				  <div class="row">
				    	<div class="col-ml-8">		  			
				    	그들이 나를 배신했을 때,<br>
						그는 나를 형제라 불러주었다!
						</div>
				  </div>
				  <br>
				  <div class="row">
				    	<div class="col-md-2"><button type="button" class="btn btn-primary">찜♡</button>
				    	</div>
				    	<div class="col-md-3">
				    		<div class="card" style="width: 18rem;">
							  <div class="card-body">
							    <h5 class="card-title">닉네임</h5>
							    <p class="card-text">리뷰하는 내용 어쩌구 저쩌구 어쨋든 재미있다는 내용</p>
							  </div>
							</div>
						</div>
				  </div>
				  <%-- 평점 --%>
				  <br>
				  <br>
				  <div class="row">
				  	<div class="col col-md-3 h5">
						<br>
				  		평점 : 5.0
				  		<br>
				  	</div>
				  	<div class="col col-md-6 h5">
				  		<br>
				  		실제 관람객 수 : 1000만명
				  		<br>
				  	</div>
				  </div>
			  </div>
			 </div>
			 <%-- 포스트 부분 --%>
			    <div class ="col float-right col-md-3">
					<div class="row">
						<div class="card" style="width: 18rem;">
						  <img src="${pageContext.request.contextPath }/resources/img/poster02@2.jpg" class="card-img-top" alt="...">
						  <div class="card-body">
						    <a href="#" class="btn btn-primary">예매하기</a>
						  </div>
						</div>
					</div>
				</div> <%-- 오른쪽 창 끝 --%>		
			</div>
		  	</section><%-- 첫번째 섹션 끝 --%>
		  	
		  	<section id=""> <%-- 두번째 섹션 --%>
		  	  <div class="row">
		  	   <div class="col">
		  		<ul class="nav nav-tabs">
				  <li class="nav-item">
				    <a class="nav-link" href="movie_detail_info.jsp">주요정보</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="movie_detail_review.jsp">리뷰</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link  active" href="movie_detail_photo.jsp">포토</a>
				  </li>
				</ul>
			   </div>
			  </div>
		  	</section><%-- 두번째 섹션 끝 --%>
		  	
		  	<section id="movie-end"> <%-- 세번째 섹션 --%>
		  	  <div class="container p-3">
		  	  	
		  	  	<%-- 썸네일 이미지 --%>
		  	  	<%-- 1열 --%>
		  	  	<div class="row row-md-12">
		  	  		<div class="col col-md-3">
				  	  	<img src="${pageContext.request.contextPath }/resources/img/poster02@2.jpg" alt="..." class="img-thumbnail" onclick="window.open('${pageContext.request.contextPath }/resources/img/poster02@2.jpg','pop01','top=200 left=600 width=900 height=600');">
		  	  		</div>
		  	  		<div class="col col-md-3">
				  	  	<img src="${pageContext.request.contextPath }/resources/img/poster02@2.jpg" alt="..." class="img-thumbnail" onclick="window.open('${pageContext.request.contextPath }/resources/img/poster02@2.jpg','pop01','top=200 left=600 width=900 height=600');">
		  	  		</div>
		  	  		<div class="col col-md-3">
				  	  	<img src="${pageContext.request.contextPath }/resources/img/poster02@2.jpg" alt="..." class="img-thumbnail" onclick="window.open('${pageContext.request.contextPath }/resources/img/poster02@2.jpg','pop01','top=200 left=600 width=900 height=600');">
		  	  		</div>
		  	  		<div class="col col-md-3">
				  	  	<img src="${pageContext.request.contextPath }/resources/img/poster02@2.jpg" alt="..." class="img-thumbnail" onclick="window.open('${pageContext.request.contextPath }/resources/img/poster02@2.jpg','pop01','top=200 left=600 width=900 height=600');">
		  	  		</div>
		  	  	</div>
		  	  	<br>
		  	  	<%-- 2열 --%>
		  	  	<div class="row row-md-12">
		  	  		<div class="col col-md-3">
				  	  	<img src="${pageContext.request.contextPath }/resources/img/poster02@2.jpg" alt="..." class="img-thumbnail" onclick="window.open('${pageContext.request.contextPath }/resources/img/poster02@2.jpg','pop01','top=200 left=600 width=900 height=600');">
		  	  		</div>
		  	  		<div class="col col-md-3">
				  	  	<img src="${pageContext.request.contextPath }/resources/img/poster02@2.jpg" alt="..." class="img-thumbnail" onclick="window.open('${pageContext.request.contextPath }/resources/img/poster02@2.jpg','pop01','top=200 left=600 width=900 height=600');">
		  	  		</div>
		  	  		<div class="col col-md-3">
				  	  	<img src="${pageContext.request.contextPath }/resources/img/poster02@2.jpg" alt="..." class="img-thumbnail" onclick="window.open('${pageContext.request.contextPath }/resources/img/poster02@2.jpg','pop01','top=200 left=600 width=900 height=600');">
		  	  		</div>
		  	  		<div class="col col-md-3">
				  	  	<img src="${pageContext.request.contextPath }/resources/img/poster02@2.jpg" alt="..." class="img-thumbnail" onclick="window.open('${pageContext.request.contextPath }/resources/img/poster02@2.jpg','pop01','top=200 left=600 width=900 height=600');">
		  	  		</div>
		  	  	</div>
		  	  	<br>  	  	
		  	  </div>
		  	</section><%-- 세번째 섹션 끝--%>
		
			
		</div> <%-- 컨테이너 끝 --%>
  
  </article>
  
  <nav id="mainNav">
  <%--왼쪽 사이드바 --%>
  </nav>
  
  <div id="siteAds"></div>
  <%--페이지 하단 --%>
  <footer id="pageFooter"><%@ include file="/resources/inc/footer.jsp"%></footer>
</body>
