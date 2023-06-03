<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css">

<meta charset="UTF-8">
<title>영화 예매 사이트</title>
<style>
footer{
	background-color: #ef4f4f;
}
</style>
</head>
<body>
<!-- <aside id=left-sidebar> -->
<!-- <div id=left-margin></div> -->
<!-- <!-- 왼쪽 사이드바 내용 입력 --> -->
<!-- </aside> -->
<%--header include --%>
<header id=header>
<%@ include file="/resources/inc/header.jsp"%>      
</header>

<%--컨텐츠 섹션(본문내용) 시작  --%>
<section id=content>
<div id=content-margin>
</div>
<!-- 본문 내용 입력-->

<%-- 극장선택탭 include --%>
<%@ include file="theater_tap.jsp"%>
<br>
<br>

<%-- 북마크 버튼 --%>
<div class="container" align="right" >
<a href="#">
	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bookmark" viewBox="0 0 16 16">
	  <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
	</svg>
	My 영화관
</a>
<br>
</div>


<%-- 탭  --%>
<div class="container" align="center" >
	<%-- 탭제목 --%>
	<div class="row-col-my-5">
		<nav>
		  <div class="nav nav-tabs" id="nav-tab" role="tablist">
		    <button class="nav-link" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true" >
		    	극장정보
		    </button>
		    <button class="nav-link active" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">
		    	상영시간표
		    </button>
		    <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">
		    	요금안내
		    </button>
		  </div>
		</nav>
	</div>	
	<%-- 탭 내용 - collpse --%>
	<div class="row-col-my-5" >
		<div class="tab-content" id="nav-tabContent">
		  <div class="tab-pane fade show active my-3 mx-6" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab" tabindex="0">
			  	<div class="row">
				  <div class="col">
				  	<h5>XXX지점</h5><br>
				  	<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1645890.219410453!2d126.72779374253922!3d36.32129450891771!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3568eb7a9ffb035f%3A0x8e030b4b8ef4a2dd!2z7JWE7J207Yuw7JyMIOu2gOyCsOq1kOycoeyEvO2EsA!5e0!3m2!1sko!2skr!4v1684826116604!5m2!1sko!2skr" width="350" height="350" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
				  	<br>
				  </div>
				  <div class="col" >
				  	<h5>주차 / 교통안내</h5> 
				  	<br>
				  	▷ 주차안내<br>
				  	  1.주차장<br>
				  	  2.지원주차장<br><br>
				  	▷ 주차확인<br>
				  	  당일관람고객 한해 3시간 무료적용(주차도장)<br><br>
				  	▷ 대중교통<br>
				  	  - 버스 <br>
				  	  - 지하철<br>
				  </div>
				  <div class="col"> 
				  	<h5>공지사항</h5>
				  	<br>
				  	▷ 공지사항1<br>
				  	▷ 공지사항2<br>
				  	▷ 공지사항3<br>
				  	▷ 공지사항4<br>
				  </div>
				</div>
		  </div>
		  <%-- 두번째탭 내용--%>
		  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab" tabindex="0">
		  	<h6>상영시간표</h6>
		  </div>
		  
		  <%-- 세번째탭 내용--%>
		  <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab" tabindex="0">
		  	<h6>관람료</h6>
		  </div>
		</div>
		</div>
	</div>
	<div>
</div>	
<%--컨텐츠 섹션 끝 ------------------------------------------------------------------------------------- --%>
</section>
<footer id=footer>
<%@ include file="/resources/inc/footer.jsp"%>
</footer>
</body>
</html>