<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<title>동백시네마 회원가입 1.본인인증</title>
<style>
.w-900{
	width: 900px;
}
.h-500{
	height: 500px;
}

div {
	background-color: transparent;
}

th{
	width: 200px;
}
</style>
</head>
<body>
	<%--네비게이션 바 영역 --%>
	<header id="pageHeader"><%@ include file="/resources/inc/header.jsp"%></header>
 
	<%--본문내용 --%>
	<article id="mainArticle">
	<%-- 본문 내용을 div로 감싸 전체 폭 조절 --%>
	<%-- 폭 조절 div 끝 --%>
		<!-- 4단계 탭 -->
 	 	<%-- 네이게이션 중앙 정렬 : justify-content-center --%>
 		<nav class=	"nav nav-pills justify-content-center">
 			<%-- 해당 탭에서는 클릭 시 다음 단계로 이동 불가 --%>
  			<a class="nav-link active btn-danger" aria-current="page" href="#">본인인증</a>
 			<a class="nav-link" >약관동의</a>
			<a class="nav-link"  href="member_join_step3">정보입력</a>
			<a class="nav-link" >가입완료</a>
		</nav>
		
		<hr>
	<div class="container-fluid w-900">
		<div align="center">
			<%-- 상단 문구 구역 --%>
			<div>
				<h3>회원 가입을 위한 본인 인증 단계 입니다.</h3>
				<h5>원하시는 인증방법을 선택해주세요.</h5>
			</div>
			
			<br>
			
			<%-- 인증 형식 선택 --%>
			<%-- 사진을 클릭 시 해당 인증 방식으로 이동 --%>
			<div class="container">
	  			<div class="row">
	  				<%-- 사진 간격을 위한 div 태그 삽입( 내용 없음 ) --%>
	  				<div class="col"></div>
	    			<div class="col">
	    				<%-- 핸드폰 인증 방식 --%>
	      				<div class="text-center">
	  						<img src="/resources/img/member_join_step1_phone.jpg" class="rounded" alt="...">
						</div>
	    			</div>
	    			<div class="col">	
	    				<%-- 아이핀 인증 방식 --%>
	      				<div class="text-center">
	  						<img src="/resources/img/member_join_step1_ipin.jpg" class="rounded" alt="...">
						</div>
				    </div>
	  				<%-- 사진 간격을 위한 div 태그 삽입( 내용 없음 ) --%>
	  				<div class="col"></div>
	  			</div>
	  		</div>
	  		
	  		<br>
	  		<%-- 하단 안내 문구 --%>
	  		<div>
				<h6>14세 미만 어린이는 보호자 인증을 추가로 완료한 후 가입이 가능합니다.</h6>
				<h6>본인인증 시 제공되는 정보는 해당 인증기관에서 직접 수집하며,
					인증 이외의 용도로 이용 또는 저장되지 않습니다.</h6>
			</div>
  		</div>
  		
		</div> <%-- 폭 조절 div 끝 --%>
  	</article>
  <nav id="mainNav" class="d-none d-md-block sidebar">
  	<%-- 사이드바(최대 width:200px, 최소 width:150px, 전체 화면 사이즈 middle 이하되면 사라짐) --%>
  </nav>
  
  <div id="siteAds"></div>
  <%--페이지 하단 --%>
  <footer id="pageFooter"><%@ include file="/resources/inc/footer.jsp"%></footer>
</body>
