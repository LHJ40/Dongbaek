<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/ss/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/sidebar.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/button.css" rel="stylesheet" type="text/css">
<title>영화 예매 사이트</title>
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

/* 확인용 */
.container-fluid{
	border: 1px solid gray;
}

#mainNav{
	border: 1px solid blue;
}
</style>
</head>
<body>
 <%--네비게이션 바 영역 --%>
 <header id="pageHeader"><%@ include file="/resources/inc/header.jsp"%></header>
 
  <article id="mainArticle">
  <%--본문내용 --%>
  <div class="container-fluid w-900">
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
			      <th>주문번호</th>
			      <td></td>
			    </tr>
			    <tr>
			      <th>주문자명</th>
			      <td></td>
			    </tr>
			    <tr>
			      <th>결제일</th>
			      <td></td>
			    </tr>
			    <tr>
			      <th>영화명</th>
			      <td></td>
			    </tr>
			    <tr>
			      <th>극장명</th>
			      <td></td>
			    </tr>
			    <tr>
			      <th>인원수</th>
			      <td></td>
			    </tr>
				<tr>
			      <th>좌석번호</th>
			      <td></td>
				</tr>
				<tr>
			      <th>주문한 스낵</th>
			      <td></td>
				</tr>
				<tr>
			      <th>결제방법</th>
			      <td></td>
				</tr>
			     <tr>
			      <th>총결제 금액</th>
			      <td></td>
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
			<button class="w-100 btn btn-outline-red mb-3" type="button">뒤로가기</button>
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
 
  
  </article>
  
  <nav id="mainNav" class="d-none d-md-block sidebar">
  	<%-- 사이드바(최대 width:200px, 최소 width:150px, 전체 화면 사이즈 middle 이하되면 사라짐) --%>
  </nav>
  
  <div id="siteAds"></div>
  <%--페이지 하단 --%>
  <footer id="pageFooter"><%@ include file="/resources/inc/footer.jsp"%></footer>
</body>