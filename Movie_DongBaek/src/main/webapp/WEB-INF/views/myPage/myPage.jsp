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
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/myPage.css" rel="stylesheet" type="text/css">
<title>영화 예매 사이트</title>
<style>
</style>
</head>
<body>
	<%--네비게이션 바 영역 --%>
	<header id="pageHeader"><%@ include
			file="/resources/inc/header.jsp"%></header>

	<article id="mainArticle">
		<%--본문내용 --%>
		<div class="container">
			<div class="mainTop">
				<h1><img src="${pageContext.request.contextPath }/resources/img/gold.png" id="myPage_GOLD"><span><b>OOO{param.name]님</b> <br> 좋은 하루 되세요!</span></h1>
			</div>
			<a href="">회원정보수정</a> <br>
			<br>
			<div class="myTicketing">
				<h1>나의예매내역</h1>
				<hr class="my-4">
				<table class="table table-striped">
					<tr>
						<th>번호</th>
						<th>영화제목</th>
						<th>상영일</th>
						<th>상태</th>
						<th>변경</th>
					</tr>
					<tr>
						<td>1</td>
						<td>영화다</td>
						<td>{param.date_start}~{param.date_end}</td>
						<td><img src="${pageContext.request.contextPath }/resources/img/playBefore.png" alt="상영전이미지"></td>
						<td><a href="ticketing_cancel">예매취소</a></td>
					</tr>
					<tr>
						<td>2</td>
						<td>하아..</td>
						<td>{param.date_start}~{param.date_end}</td>
						<td><img src="${pageContext.request.contextPath }/resources/img/playAfter.png" alt="상영완료이미지"></td>
						<td>취소불가</td>
					</tr>
				</table>
			</div>

			<div class="grade">
				<h1>등급별 혜택</h1>
				<hr class="my-4">
				<b>OOO님의 현재 등급 : </b><img src="${pageContext.request.contextPath }/resources/img/gold.png" id="myPage_nowGrade"><br>
				<b>혜택</b> : 영화 금액 <b>{param.grade_discount}%할인</b>
				<br> 
				<b>다음 등급 : </b><img src="${pageContext.request.contextPath }/resources/img/gold.png" id="myPage_nowGrade"><br>
				<b>혜택</b> :영화 금액의 <b>{param_grade_discount}%할인</b>
				<br> 
				<a href="all_grade">전체 등급 혜택 확인하러 가기 click</a>
			</div>

			<div class="myQuest">
				<h1>나의 문의 내역</h1>
				<hr class="my-4">
				<table  class="table table-striped">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>답변 상태</th>
					</tr>
					<tr>
						<td>1</td>
						<td>결제 관련</td>
						<td>X</td>
					</tr>
				</table>
			</div>
		</div>

	</article>

	<nav id="mainNav">
		<%--왼쪽 사이드바 --%>
		<!-- 	왼쪽 탭 링크들 -->
		 <div class="d-flex justify-content-center">
		  <div class="col-10">
		    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
		      <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">고객센터홈</a>
		      <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">공지사항</a>
		      <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">자주묻는 질문</a>
		      <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">1:1 문의</a>
		    </div>
		  </div>
		  </div>
<!-- 		<ul class="left-tap"> -->
<!-- 			<li class="myPage-ticketing-buy"><a class="nav-link" href="#">예매 -->
<!-- 					/ 구매내역</a></li> -->
<!-- 			<li class="myPage-review"><a class="nav-link" href="#">나의 리뷰</a></li> -->
<!-- 			<li class="myPage-quest"><a class="nav-link" href="#">문의 내역</a></li> -->
<!-- 			<li class="myPage-grade"><a class="nav-link" href="#">등급별 혜택</a></li> -->
<!-- 			<li class="myPage-privacy"><a class="nav-link" href="#">개인정보수정</a></li> -->
<!-- 		</ul> -->
	</nav>

	<div id="siteAds"></div>
	<%--페이지 하단 --%>
	<footer id="pageFooter"><%@ include
			file="/resources/inc/footer.jsp"%></footer>
</body>