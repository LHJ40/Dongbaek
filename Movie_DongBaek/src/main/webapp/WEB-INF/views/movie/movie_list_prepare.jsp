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


<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
<script>
 	
</script>

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
</style>
</head>
<body>
 <%--네비게이션 바 영역 --%>
 <header id="pageHeader"><%@ include file="../inc/header.jsp"%></header>
 
 <article id="mainArticle">
 <%--본문내용 --%>
	<div class="container">
<%-- 상영작 구분 --%>
	<ul class="nav nav-tabs" style="margin-top: 20px; margin-bottom: 20px">
	  <li class="nav-item">
	    <a class="nav-link" href="movie_list_present">현재상영작</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link active" aria-current="page" href="movie_list_prepare">상영예정작</a>
	  </li>
	</ul>
<%-- 정렬 기준 --%>
	<div class="row"  align="left" style="margin-bottom: 20px">
		<div class="col col-md-10"></div>
		<div class="col col-md-2 d-flex justify-content-end">
		  <select class="custom-select" name="movie_array" >
		    <option value="1" selected="selected">예매순</option>
		    <option value="2">가나다순</option>
		  </select>
		</div>
	</div>
	
	<%-- 영화정보 --%>
	<%-- 한 열당 영화4개출력 => 한 페이지 당 2열 => 총 8개영화출력--%>
	<div class="m-3">
	
		 <%-- 1열 --%>
		<%-- <input type="hidden" value="movie_num=${movieList.movie_num }"> --%>
		<div class="row"  align="left">
		<c:forEach var="movie" items="${movieList}" >
			<div class="col-lg-3 col-mid-4">
				<div class="card border-0 shadow-sm" style="width: 18rem;">
					<%-- 해당영화의 포스터출력 -> 클릭시 상세페이지로 이동 --%>
					<a href="movie_detail_info?movie_num=${movie.movie_num}">
						<img src="${movie.movie_poster}" class="card-img-top" alt="...">
					</a>
					<%-- 해당영화의 등급에 해당하는 이미지 출력, 영화제목 출력--%>
					<div class="card-body">
						<h6 class="card-title">
							<%-- 해당영화의 등급에 해당하는 이미지 출력 --%>
							<c:if test="${movie.movie_grade eq '전체관람가'}">
								<img src="${pageContext.request.contextPath }/resources/img/grade_all.png" alt="전체" class="img-rounded" >
							</c:if>
							<c:if test="${movie.movie_grade eq '12세이상관람가'}">
								<img src="${pageContext.request.contextPath }/resources/img/grade_12.png" alt="12" class="img-rounded" >
							</c:if>
							<c:if test="${movie.movie_grade eq '15세이상관람가'}">
								<img src="${pageContext.request.contextPath }/resources/img/grade_15.png" alt="15" class="img-rounded" >
							</c:if>
							<c:if test="${movie.movie_grade eq '청소년관람불가'}">
								<img src="${pageContext.request.contextPath }/resources/img/grade_18.png" alt="18" class="img-rounded" >
							</c:if>
							${movie.movie_name_kr}
						</h6>
						<p class="card-text">예매율:${movie.movie_booking_rate} 개봉일: ${movie.movie_release_date}</p>
						
						<%--찜하기버튼, 예매버튼 --%>
						<p class="d-flex justify-content-center">
							<button type="button" class="btn btn-outline-danger mr-2">♡찜하기</button>
							<a href="reservation_main?movie_num=${movie.movie_num}" class="btn btn-danger">&nbsp;&nbsp;예매&nbsp;&nbsp;</a>
						</p>
					</div>
				</div>
			</div>
		</c:forEach>
		</div>
		<br>
		
		
<!-- 	<div class="m-3"> -->
<%-- 	<%-- 1열 --%> 
<!-- 		<div class="row"  align="left"> -->
<%-- 			<%-- 카드1 --%> 
<!-- 			<div class="col-lg-3 col-mid-4"> -->
<!-- 				<div class="card border-0 shadow-sm" style="width: 18rem;"> -->
<%-- 				  <img src="${pageContext.request.contextPath }/resources/img/poster02@2.jpg" class="card-img-top" alt="..."> --%>
<!-- 				  <div class="card-body"> -->
<%-- 				    <h3 class="card-title"><img src="${pageContext.request.contextPath }/resources/img/gradeA.png" class="img-rounded">영화명</h3> --%>
<!-- 				    <p class="card-text">예매율 개봉일: 2023.05.12</p> -->
<!-- 				    <p class="d-flex justify-content-center"> -->
<!-- 				    	<button type="button" class="btn btn-outline-danger mr-2">♡찜하기</button> -->
<!-- 				    	<a href="reservation_main" class="btn btn-danger">개봉예정</a> -->
<!-- 				    </p> -->
<!-- 				  </div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<%-- 			<%-- 카드2 --%>
<!-- 			<div class="col-lg-3 col-mid-4"> -->
<!-- 				<div class="card border-0 shadow-sm" style="width: 18rem;"> -->
<%-- 				  <img src="${pageContext.request.contextPath }/resources/img/poster02@2.jpg" class="card-img-top" alt="..."> --%>
<!-- 				  <div class="card-body"> -->
<%-- 				    <h3 class="card-title"><img src="${pageContext.request.contextPath }/resources/img/gradeB.png" class="img-rounded">영화명</h3> --%>
<!-- 				    <p class="card-text">예매율: 45.2% 개봉일: 2023.05.12</p> -->
<!-- 				    <p class="d-flex justify-content-center"> -->
<!-- 				    	<button type="button" class="btn btn-outline-danger mr-2	">♡찜하기</button> -->
<!-- 				    	<a href="reservation_main" class="btn btn-danger">개봉예정</a> -->
<!-- 				    </p> -->
<!-- 				  </div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<%-- 			<%-- 카드3 --%>
<!-- 			<div class="col-lg-3 col-mid-4"> -->
<!-- 				<div class="card border-0 shadow-sm" style="width: 18rem;"> -->
<%-- 				  <img src="${pageContext.request.contextPath }/resources/img/poster02@2.jpg" class="card-img-top" alt="..."> --%>
<!-- 				  <div class="card-body"> -->
<%-- 				    <h3 class="card-title"><img src="${pageContext.request.contextPath }/resources/img/gradeC.png" class="img-rounded">영화명</h3> --%>
<!-- 				    <p class="card-text">예매율: 45.2% 개봉일: 2023.05.12</p> -->
<!-- 				    <p class="d-flex justify-content-center"> -->
<!-- 				    	<button type="button" class="btn btn-outline-danger mr-2	">♡찜하기</button> -->
<!-- 				    	<a href="reservation_main" class="btn btn-danger">개봉예정</a> -->
<!-- 				    </p> -->
<!-- 				  </div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<%-- 			<%-- 카드4 --%>
<!-- 			<div class="col-lg-3 col-mid-4"> -->
<!-- 				<div class="card border-0 shadow-sm" style="width: 18rem;"> -->
<!-- 				  <img src="/resources/img/poster02@2.jpg" class="card-img-top" alt="..."> -->
<!-- 				  <div class="card-body"> -->
<!-- 				    <h3 class="card-title"><img src="/resources/img/gradeD.png" class="img-rounded">영화명</h3> -->
<!-- 				    <p class="card-text">예매율: 45.2% 개봉일: 2023.05.12</p> -->
<!-- 				    <p class="d-flex justify-content-center"> -->
<!-- 				    	<button type="button" class="btn btn-outline-danger mr-2	">♡찜하기</button> -->
<!-- 				    	<a href="reservation_main" class="btn btn-danger">개봉예정</a> -->
<!-- 				    </p> -->
<!-- 				  </div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<br> -->
<%-- 		<%-- 2열 --%>
<!-- 		<div class="row"  align="left"> -->
<%-- 			<%-- 카드1 --%> 
<!-- 			<div class="col-lg-3 col-mid-4"> -->
<!-- 				<div class="card border-0 shadow-sm" style="width: 18rem;"> -->
<%-- 				  <img src="${pageContext.request.contextPath }/resources/img/poster02@2.jpg" class="card-img-top" alt="..."> --%>
<!-- 				  <div class="card-body"> -->
<%-- 				    <h3 class="card-title"><img src="${pageContext.request.contextPath }/resources/img/gradeA.png" class="img-rounded">영화명</h3> --%>
<!-- 				    <p class="card-text">예매율: 45.2% 개봉일: 2023.05.12</p> -->
<!-- 				    <p class="d-flex justify-content-center"> -->
<!-- 				    	<button type="button" class="btn btn-outline-danger mr-2	">♡찜하기</button> -->
<!-- 				    	<a href="reservation_main" class="btn btn-danger">개봉예정</a> -->
<!-- 				    </p> -->
<!-- 				  </div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<%-- 			<%-- 카드2 --%>
<!-- 			<div class="col-lg-3 col-mid-4"> -->
<!-- 				<div class="card border-0 shadow-sm" style="width: 18rem;"> -->
<%-- 				  <img src="${pageContext.request.contextPath }/resources/img/poster02@2.jpg" class="card-img-top" alt="..."> --%>
<!-- 				  <div class="card-body"> -->
<%-- 				    <h3 class="card-title"><img src="${pageContext.request.contextPath }/resources/img/gradeB.png" class="img-rounded">영화명</h3> --%>
<!-- 				    <p class="card-text">예매율: 45.2% 개봉일: 2023.05.12</p> -->
<!-- 				    <p class="d-flex justify-content-center"> -->
<!-- 				    	<button type="button" class="btn btn-outline-danger mr-2	">♡찜하기</button> -->
<!-- 				    	<a href="reservation_main" class="btn btn-danger">개봉예정</a> -->
<!-- 				    </p> -->
<!-- 				  </div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<%-- 			<%-- 카드3 --%> 
<!-- 			<div class="col-lg-3 col-mid-4"> -->
<!-- 				<div class="card border-0 shadow-sm" style="width: 18rem;"> -->
<%-- 				  <img src="${pageContext.request.contextPath }/resources/img/poster02@2.jpg" class="card-img-top" alt="..."> --%>
<!-- 				  <div class="card-body"> -->
<%-- 				    <h3 class="card-title"><img src="${pageContext.request.contextPath }/resources/img/gradeC.png" class="img-rounded">영화명</h3> --%>
<!-- 				    <p class="card-text">예매율: 45.2% 개봉일: 2023.05.12</p> -->
<!-- 				    <p class="d-flex justify-content-center"> -->
<!-- 				    	<button type="button" class="btn btn-outline-danger mr-2	">♡찜하기</button> -->
<!-- 				    	<a href="reservation_main" class="btn btn-danger">개봉예정</a> -->
<!-- 				    </p> -->
<!-- 				  </div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<%-- 			<%-- 카드4 --%> 
<!-- 			<div class="col-lg-3 col-mid-4"> -->
<!-- 				<div class="card border-0 shadow-sm" style="width: 18rem;"> -->
<%-- 				  <img src="${pageContext.request.contextPath }/resources/img/poster02@2.jpg" class="card-img-top" alt="..."> --%>
<!-- 				  <div class="card-body"> -->
<%-- 				    <h3 class="card-title"><img src="${pageContext.request.contextPath }/resources/img/gradeD.png" class="img-rounded">영화명</h3> --%>
<!-- 				    <p class="card-text">예매율: 45.2% 개봉일: 2023.05.12</p> -->
<!-- 				    <p class="d-flex justify-content-center"> -->
<!-- 				    	<button type="button" class="btn btn-outline-danger mr-2" name="">♡찜하기</button> -->
<!-- 				    	<a href="reservation_main" class="btn btn-danger">개봉예정</a> -->
<!-- 				    </p> -->
<!-- 				  </div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
	</div> <%--container 끝 --%>
	
	
	
	
	
	
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
  <footer id="pageFooter"><%@ include file="../inc/footer.jsp"%></footer>
</body>