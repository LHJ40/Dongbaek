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
<title>영화 예매 사이트</title>
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
		  <h2>나의 예매내역</h2>
				<hr>
				<table class="table table-striped">
					<tr>
						<th>번호</th>
						<th>포스터</th>
						<th>영화제목</th>
						<th>상영일</th>
						<th>예매 상태 변경</th>
					</tr>
					<tr>
						<td>2</td><%-- {param.board_ticket_num} --%>
						<td><img src="${pageContext.request.contextPath }/resources/img/ticketing_poster.jpg" alt="movie_ticketing_1" id="movie_ticketing"></td><%-- {param.movie.post} --%>
						<td>신세계</td>
						<td>XX-XX-XX ~ XX-XX-XX</td><%-- {param.datetime_start} ~ {param.datetime_end} --%>
						<td>취소불가</td><%-- {param.iscdange??} --%>
					</tr>
					<tr>
						<td>1</td><%-- {param.board_ticket_num} --%>
						<td><img src="${pageContext.request.contextPath }/resources/img/ticketing_poster2.jpg" alt="movie_ticketing_2" id="movie_ticketing"></td>
						<td>마약왕</td>
						<td>XX-XX-XX ~ XX-XX-XX</td><%-- {param.datetime_start} ~ {param.datetime_end} --%>
						<td><a href="취소하는곳">예매취소</a></td><%-- {param.ischange??} --%>
					</tr>
				</table>
				<br>
				<h2>나의 구매 내역</h2>
				<hr>
				<table class="table table-striped">
					<tr>
						<th>번호</th>
						<th>결제일시</th>
						<th>결제한금액</th>
						<th>상세내역</th>
					</tr>
					<tr>
						<td>3</td><%-- {param.board_buy_num} --%>
						<td>XX-YY-ZZ</td> <%-- {param.datetime_buy} - XX XX XX 형태 xx-yy-mm? --%>
						<td>15,000원</td><%-- {param.order_total} --%>
						<td><a href="buy_detail">상세내역보기</a></td> <%--누르면 팝업창으로 구매종류 이름 가격 구매시간 --%>
					</tr>
					<tr>
						<td>2</td><%-- {param.board_buy_num} --%>
						<td>XX-YY-ZZ</td> <%-- {param.datetime_buy} - XX XX XX 형태 xx-yy-mm? --%>
						<td>20,000원</td><%-- {param.order_total} --%>
						<td><a href="buy_detail">상세내역보기</a></td> <%--누르면 팝업창으로 구매종류 이름 가격 구매시간 --%>
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