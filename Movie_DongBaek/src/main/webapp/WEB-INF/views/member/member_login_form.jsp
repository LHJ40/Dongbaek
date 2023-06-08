<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/sidebar.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/button.css" rel="stylesheet" type="text/css">
<title>동백시네마 회원로그인</title>
<style>
.jumbotron{
	padding: 1rem 1rem;
}

.jumbotron div, .jumbotron p{
	background-color: inherit;
}
.w-900{
	width: 900px;
}
.w-500{
	width: 500px;
}
.h-500{
	height: 500px;
}

div {
	background-color: transparent;
}

/* 회원로그인/비회원로그인/비회원예매 확인 탭 */
.nav-pills .nav-link.active {
	color: #fff;
	background-color: #ef4f4f;
}

.nav-link:hover {
	color: #ef4f4f;
}

/* 확인용 */
.container-fluid{
	border: 1px solid gray;
}

#mainNav{
	border: 1px solid blue;
}

</style>
<script type="text/javascript">
	$(function() {
		$("#button-addon1").on("click", function() {
			$("#button-addon1").attr("value", "재전송");			
		});
	});
	
	$(function() {
		$("#button-addon2").on("click", function() {
			$("#button-addon2").attr("value", "확인완료");			
		});
	});
	
</script>

</head>
<body>
  <%--네비게이션 바 영역 --%>
  <header id="pageHeader"><%@ include file="/resources/inc/header.jsp"%></header>
 
  <article id="mainArticle">
  <%--본문내용(width: 900px) --%>
  <div class="container-fluid w-900">
 	<%-- 
	  .nav-link:hover 시 글자색 #ef4f4f 
	  .nav-link.active 배경색 #ef4f4f
	  --%>
	<header class="d-flex justify-content-center py-3">
      <ul class="nav nav-pills">
        <li class="nav-item"><a href="#" class="nav-link active" aria-current="page">회원로그인</a></li>
        <li class="nav-item"><a href="no_member_login_form" class="nav-link">비회원로그인</a></li>
        <li class="nav-item"><a href="no_member_reservation_check_form" class="nav-link">비회원예매 확인</a></li>
      </ul>
    </header>
	
	<div class="row d-flex justify-content-center mt-3">
	  <div class="col-8" style="border: 1px solid red">	<%-- 전체 12개의 col중에 가운데 8개의 col 사용 --%>
		<form>
		    <p class="mb-3 fw-normal">아이디와 비밀번호를 입력하신 후, 로그인 버튼을 눌러주세요.</p>
			
			<%-- 아이디 --%>
			<div class="row mb-3">
              <label for="id" class="col-2 text-nowrap">아이디</label>
              <div class="col-10">
	              <input type="text" class="form-control" name="id" id="id" placeholder="아이디" required="required">
              </div>
	        </div>
	        
	        <%-- 비밀번호 --%>
			<div class="row mb-3">
              <label for="passwd" class="col-2 text-nowrap">비밀번호</label>
              <div class="col-10">
	              <input type="text" class="form-control" name="passwd" id="passwd" placeholder="비밀번호" required="required">
              </div>
	        </div>
		
			<%-- 아래 버튼들... --%>
		    <div class="row checkbox mb-3">
		      <label class="col-4" >
		        <input type="checkbox" value="remember-me" > 아이디 저장
		      </label>
		      <span class="col-4 d-flex justify-content-end">
		        <a href="#">회원가입</a>
		      </span>
		      <span class="col-4 d-flex justify-content-end">
		        <a href="#" >아이디, 비밀번호 찾기</a>
		      </span>
		    </div>
		    
		    <%-- '로그인' 버튼 --%>
		    <button class="w-100 btn btn-lg btn-red mb-3" type="submit">로그인</button>
		    
		    <%-- 다른 로그인 방법 --%>
		    <div class="row mb-3 d-flext justify-content-center">
		    	<%-- 네이버 --%>
		    	<div class="col-2">
			    	<a href="#"><img alt="naver" src="${pageContext.request.contextPath }/resources/img/naver.png" width="50px" height="50px"></a>
		    	</div>
		    	<%-- 카카오 --%>
		    	<div class="col-2">
			    	<a href="#"><img alt="kakao" src="${pageContext.request.contextPath }/resources/img/kakao.png" width="50px" height="50px"></a>
		    	</div>
		    	<%-- qr --%>
		    	<div class="col-2">
			    	<a href="#"><img alt="qr" src="${pageContext.request.contextPath }/resources/img/qr.png" width="50px" height="50px"></a>
		    	</div>
		    </div>
		</form>
      </div>
	</div>
  </div>
  </article>
  
  <nav id="mainNav" class="d-none d-md-block sidebar">
  	<%-- 사이드바(최대 width:200px, 최소 width:150px, 전체 화면 사이즈 middle 이하되면 사라짐) --%>
  </nav>
  
  <div id="siteAds"></div>
  <%--페이지 하단 --%>
  <footer id="pageFooter"><%@ include file="/resources/inc/footer.jsp"%></footer>
</body>