<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmf" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/myPage.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/sidebar_myPage.css" rel="stylesheet" type="text/css">
<title>영화 예매 사이트</title>
<style>

</style>
</head>
<body>
 <%--네비게이션 바 영역 --%>
 <header id="pageHeader"><%@ include file="../inc/header.jsp"%></header>
 
  <article id="mainArticle">
  <%--본문내용 --%>
  	<div class="container">
  		<div class="mainTop">
			<h2>나의 구매 내역</h2>
			<br>
				<hr>
				<%-- 상세보기 테이블 --%>
  	<div class="row">
		<div class="col-md-12">
			<table class="table table-bordered text-center">
			    <tr>
			      <th>주문자명</th>
			      <td>${myPayment.member_name}</td> <%-- 조인(fk) : payments join order_num join member_id 해서 member_name --%>
			    </tr>
			    <tr>
			      <th>결제일</th>
			      <td>${myPayment.payment_datetime}</td>
			    </tr>
				<tr>
			      <th>결제수단</th> <%-- 우리는 카드 --%>
			      <td>${myPayment.payment_card_name }</td> <%-- 카드회사명 --%>
				</tr>
			     <tr>
			     	<th>총결제 금액</th>
			     	<td>${myPayment.payment_total_price }</td> <%-- 결제기능 구현시 최종금액 DB로 저장되니 가져오기만하면될듯? --%>
			     </tr>
			     <tr>
			     	<th>결제 상태</th>
			     	<td>${myPayment.payment_status }</td>
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
			</div>
	  </div>
  </article>
  
  	<nav id="mainNav">
		<%--왼쪽 사이드바 --%>
  		<%@ include file="/WEB-INF/views/sidebar/sideBar_myPage.jsp"%>
  	</nav>
  
<!--   <nav id="mainNav"> -->
<%--   <%--왼쪽 사이드바 --%>
<!--   <!-- 	왼쪽 탭 링크들 -->
<!--   	<h3>마이페이지</h3> -->
<!-- 		<ul class="left-tap"> -->
<!-- 			<li class="myPage-ticketing-buy"><a class="nav-link" href="myPage_reservation_buy_history">예매 -->
<!-- 					/ 구매내역</a></li> -->
<!-- 			<li class="myPage-review"><a class="nav-link" href="myPage_myReview">나의 리뷰</a></li> -->
<!-- 			<li class="myPage-moviefourcut"><a class="nav-link" href="myPage_moviefourcut">영화네컷</a></li> -->
<!-- 			<li class="myPage-quest"><a class="nav-link" href="myPage_inquiry">문의 내역</a></li> -->
<!-- 			<li class="myPage-grade"><a class="nav-link" href="myPage_grade">등급별 혜택</a></li> -->
<!-- 			<li class="myPage-privacy"><a class="nav-link" href="myPage_modify_check">개인정보수정</a></li> -->
<!-- 		</ul> -->
<!--   </nav> -->
  
  <div id="siteAds"></div>
  <%--페이지 하단 --%>
  <footer id="pageFooter"><%@ include file="../inc/footer.jsp"%></footer>
</body>