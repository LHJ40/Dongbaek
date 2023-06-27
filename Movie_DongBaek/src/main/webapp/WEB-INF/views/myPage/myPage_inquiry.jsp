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
<link href="${pageContext.request.contextPath }/resources/css/sidebar_myPage.css" rel="stylesheet" type="text/css">
<title>영화 예매 사이트</title>
<style>
<%-- a링크 활성화 색상 변경 --%>
a:hover, a:active{
 color:  #ff5050 !important;
	
}
</style>
</head>
<body>
 <%--네비게이션 바 영역 --%>
 <header id="pageHeader"><%@ include file="../inc/header.jsp"%></header>
 
  <article id="mainArticle">
  <%--본문내용 --%>
  <div class="container container-fluid w-900">
	  <div class="mainTop">
		 <h2>문의 내역</h2>
		 <hr>
		 <form action="">
		 	<table class="table table-striped">
					<c:choose>
						<c:when test="${empty myInq}">
							<tr>
								<td>고객님의 최근 문의 내역이 존재하지 않습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="myInq" items="${myinq }">
								<tr>
							 		<th>문의 번호 </th>
							 		<th>문의 유형</th>
							 		<th>문의 제목</th>
							 		<th>문의 내용</th>
							 		<th>답변 여부</th>
							 		<th>문의내역 변경</th>
							 	</tr>
							 	<tr>
							 		<td>{myInq.cs_num }</td><%--{param.inquiry_board_num} --%>
							 		<td>{myInq.cs_type}</td><%--{param.inquiry-category} --%>
							 		<td>{myInq.cs_subject }</td><%--{param.inquiry_board_subject} --%>
							 		<td>{myInq.cs_content }<a href="inqury_content_detail">더보기</a> </td> <%--{param.inquiry_board_content} 팝업으로 --%>
							 		<td><img alt="답변안달렸을때X사진" src="X.jpg"> </td><%--{param.inquiry_board_isanswer} --%>
							 		<td><button value="수정">수정</button> <button value="삭제">삭제</button> </td>
							 	</tr>
							 	<tr>
							 		<td>{myInq.cs_num }</td><%--{param.inquiry_board_num} --%>
							 		<td>{myInq.cs_type}</td><%--{param.inquiry-category} --%>
							 		<td>{myInq.cs_subject }</td><%--{param.inquiry_board_subject} --%>
							 		<td>{myInq.cs_content }<a href="inqury_content_detail">더보기</a> </td> <%--{param.inquiry_board_content} 팝업으로 --%>
							 		<td><img alt="답변안달렸을때X사진" src="X.jpg"> </td><%--{param.inquiry_board_isanswer} --%>
							 		<td><button value="수정">수정</button> <button value="삭제">삭제</button> </td>
							 	</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
		 </form>
	 </div>
  </div>
  </article>
  
  	<nav id="mainNav" class="d-none d-md-block sidebar">
		<%--왼쪽 사이드바 --%>
  		<%@ include file="/WEB-INF/views/sidebar/sideBar_myPage.jsp"%>
  	</nav>
  
<!--   <nav id="mainNav" class="d-none d-md-block sidebar"> -->
<%--   <%--왼쪽 사이드바 --%> --%>
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