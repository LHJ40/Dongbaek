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
<title>개인정보 수정 확인 창</title>
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
			<table class="table table-striped">
				<tr>
					<td>아이디</td>
					<td>{param.getId]</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password"><input type="button" value="확인" onclick="location.href='myPage_modify_member'"></td> <!-- 패스워드 서블릿에서 if로 맞는지안맞는지 -->
				</tr>
			</table>
		</div>
	</div>
  
  </article>
  
  <nav id="mainNav">
  <%--왼쪽 사이드바 --%>
  <!-- 	왼쪽 탭 링크들 -->
  	<h3>마이페이지</h3>
		<ul class="left-tap">
			<li class="myPage-ticketing-buy"><a class="nav-link" href="myPage_reservation_buy_history">예매
					/ 구매내역</a></li>
			<li class="myPage-review"><a class="nav-link" href="myPage_myReview">나의 리뷰</a></li>
			<li class="myPage-moviefourcut"><a class="nav-link" href="myPage_moviefourcut">영화네컷</a></li>
			<li class="myPage-quest"><a class="nav-link" href="myPage_inquiry">문의 내역</a></li>
			<li class="myPage-grade"><a class="nav-link" href="myPage_grade">등급별 혜택</a></li>
			<li class="myPage-privacy"><a class="nav-link" href="myPage_modify_check">개인정보수정</a></li>
		</ul>
  </nav>
  
  <div id="siteAds"></div>
  <%--페이지 하단 --%>
  <footer id="pageFooter"><%@ include file="/resources/inc/footer.jsp"%></footer>
</body>