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
<title>결제내역 상세페이지</title>
<style>
.w-900{
	width: 900px;
	margin: 0 auto;
}
.h-500{
	height: 500px;
}

div {
	background-color: transparent;
}
article {
	justify-content: center;
		align-items: center;
		margin: 2em auto;
}
</style>
</head>
<body>
 <%--네비게이션 바 영역 --%>
<header id="pageHeader"><%@ include file="../inc/header.jsp"%></header>
 
<%--본문내용 --%>
<article id="mainArticle">
<div class="container-fluid w-900 justify-content-center" style="border: 1px solid gray">
	<div class="row">
		<div class="col-md-12 mt-3">
			<h3>
				결제내역 상세보기
			</h3>
		</div>
	</div>


  	<%-- 상세보기 테이블 --%>
  	<div class="row">
		<div class="col-md-12">
			<table class="table table-bordered text-center">
			    <tr>
			      <th>결제번호</th> <%-- 결제번호? order_num? --%>
			      <td>${payment.payment_num}</td>
			    </tr>
			    <tr>
			      <th>주문자명</th>
			      <td>${payment.member_name}</td> <%-- 조인(fk) : payments join order_num join member_id 해서 member_name --%>
			    </tr>
			    <tr>
			      <th>결제일</th>
			      <td>${payment.payment_datetime}</td>
			    </tr>
			    <tr>
			      <th>영화명</th>
			      <td>${payment.movie_name_kr}</td> <%-- 조인(fk) : order_num을 참조하는 payments, ordertickets을
			      									   			  조인?하고 ordertickets join play_num join movie_num 해서 
			      									   			  movie_name 가져오기--%>
			    </tr>
			    <tr>
			      <th>극장명</th>
			      <td>${payment.theater_name}</td> <%-- 조인(fk) : payments join order_num(에서 member_id 가져와서) 
			      									   join member_id(에서 theater_num 가져와서) 
			      									   join theaters_num 에서 theater_name 가져오기 --%>
			    </tr>
			    <tr>
			      <th>인원수</th>
			      <td>${payment.headcount }</td> <%-- 조인 (fk) : order_num을 참조하는 PAYMENTS, ORDER_TICKETS를 조인하고 
			      										  ORDER_TICKETS join ticket_type_num,  count(*) as headcount from ticket_type_num --%>
			    </tr>
				<tr>
			      <th>좌석번호</th>
			      <td>${payment.seat_num}</td> <%-- 조인 (fk) : order_num을 참조하는 PAYMENTS, ORDER_TICKETS를 조인하고
			      												order_tickets 에서 seat_num 가져오기 --%>
				</tr>
				<tr>
			      <th>주문한 스낵</th>
			      <td>${payment.snack_name}</td> <%-- 조인 (fk) : order_num을 참조하는 PAYMENTS, ORDER_SNACKS를 조인하고 
			      										   ORDER_SNACKS JOIN SNACKS 에서 snack_name 가져오기 
			      									  	   *snack_quantity 개수 가져와서 어떻게뿌릴지  --%>
				</tr>
				<tr>
			      <th>결제방법</th> <%-- 우리는 카드 --%>
			      <td>${payment.payment_card_name }</td> <%-- 카드회사명 --%>
				</tr>
			     <tr>
			      <th>총결제 금액</th>
			      <td>${payment.payment_total_price }</td> <%-- 결제기능 구현시 최종금액 DB로 저장되니 가져오기만하면될듯? --%>
			     </tr>
			</table>
		</div>
	</div>
	
	<%-- 버튼 --%>
	<div class="row d-flex justify-content-center mt-3">
		<div class="col-3">
			<button class="w-100 btn btn-outline-red mb-3" type="submit" data-toggle="modal" data-target="#paymentCancel">결제취소</button>
		</div>
		<div class="col-3">
			<button class="w-100 btn btn-outline-red mb-3" type="button" onclick="location.href='admin_payment_list'">뒤로가기</button>
		</div>
	</div>
  </div>
  

	<%-- '결제취소' 모달 --%>
	<div class="modal fade" id="paymentCancel" tabindex="-1" role="dialog" aria-labelledby="paymentCancelTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="paymentCancelTitle">결제취소 확인</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        결제를 취소하시겠습니까?
	      </div>
	      <div class="modal-footer justify-content-center">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">아니오</button>
	        <button type="button" class="btn btn-red">&nbsp;&nbsp;&nbsp;&nbsp;예&nbsp;&nbsp;&nbsp;&nbsp;</button>
	      </div>
	    </div>
	  </div>
	</div>
  	<%-- 본문 테이블 끝 --%>
</article>
  
  	<%--왼쪽 사이드바 --%>
  	<nav id="mainNav" class="d-none d-md-block sidebar">
  		<%@ include file="../sidebar/sideBar.jsp" %>
  	</nav>

<!--  	<nav id="mainNav"> -->
<!--  	<h1>관리자 페이지</h1> -->
<!--  	<div class="list-group"> -->
<%--  		<%-- 활성화된 페이지는 active로 나타냄 --%> --%>
<!--   		<a href="#" class="list-group-item list-group-item-action active" aria-current="true">회원관리</a> -->
<!--   		<a href="#" class="list-group-item list-group-item-action">영화관리</a> -->
<!--   		<a href="#" class="list-group-item list-group-item-action">상영스케쥴 관리</a> -->
<!-- 		<a href="#" class="list-group-item list-group-item-action">결제 관리</a> -->
<!-- 		<a href="#" class="list-group-item list-group-item-action">CS 관리</a> -->
<!-- 		<a href="#" class="list-group-item list-group-item-action">혜택 관리</a> -->
<!-- 	</div> -->
  </nav>
  
  <%--페이지 하단 --%>
  <div id="siteAds"></div>
  <footer id="pageFooter"><%@ include file="../inc/footer.jsp"%></footer>
</body>