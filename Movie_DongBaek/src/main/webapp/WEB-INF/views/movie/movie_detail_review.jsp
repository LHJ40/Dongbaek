<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				     <div class="col-md-8 d-flex justify-content-start h3">영화명</div>
				  </div> 
				  <div class="row">
				    	<div class="col col-ml-8">		  			
				    	그들이 나를 배신했을 때,<br>
						그는 나를 형제라 불러주었다!
						</div>
				  </div>
				  <br>
				  <div class="row">
				    	<div class="col-md-3 d-flex justify-content-center"><button type="button" class="btn-lg btn-danger">찜하기<br>♡</button>
				    	</div>
				    	<div class="col-md-4">
				    		<div class="card" style="width: 18rem;">
							  <div class="card-body">
							    <h5 class="card-title">아이디</h5>
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
				  		<p class="row h5">평점</p>
				  		<p class="row h4">5.0</p> 
				  		<br>
				  	</div>
				  	<div class="col col-md-6 h5">
				  		<p class="row h5">실제 관람객 수</p>
				  		<p class="row h4">1000만명</p> 
				  		<br>
				  	</div>
				  </div>
			  </div>
			 </div>
			 <%-- 포스트 부분 --%>
			    <div class ="col float-right col-md-3">
					<div class="row">
						<div class="card" style="width: 18rem;">
						  <img src="/resources/img/poster02@2.jpg" class="card-img-top" alt="...">
						  <div class="card-body d-flex justify-content-center">
						    <a href="#" class="btn-lg btn-danger">&nbsp;&nbsp;&nbsp;&nbsp;예매하기&nbsp;&nbsp;&nbsp;&nbsp;</a>
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
				    <a class="nav-link active" href="movie_detail_review.jsp">&nbsp;&nbsp;&nbsp;&nbsp;리뷰&nbsp;&nbsp;&nbsp;&nbsp;</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="movie_detail_photo.jsp">&nbsp;&nbsp;&nbsp;&nbsp;포토&nbsp;&nbsp;&nbsp;&nbsp;</a>
				  </li>
				</ul>
			   </div>
			  </div>
		  	</section><%-- 두번째 섹션 끝 --%>
		  	
		  	<section id="movie-end"> <%-- 세번째 섹션 --%>

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
  <footer id="pageFooter"><%@ include file="/resources/inc/footer.jsp"%></footer>
</body>
