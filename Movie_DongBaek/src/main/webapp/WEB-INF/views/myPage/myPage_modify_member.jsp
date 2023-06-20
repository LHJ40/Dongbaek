<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmf" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
			<c:choose>
				<c:when test ="${empty member_id}">
					<h1> 로그인이 필요합니다! </h1>
				</c:when>
				<c:otherwise>
				 	<c:forEach var="myInfo" items="${myInfoList }">
				 		<h2>개인정보 수정</h2>
						* ${myInfo.member_name } 님의 정보를 정확히 입력해주세요. <br>
						현재 $ } 등급으로 동백시네마와 함께 하고 계십니다!
						<form action="myPage_modify_member" method="post">
							<table border="1">
								<tr>
									<td>아이디</td>
									<td>${myInfo.member_id }</td>
								</tr>
								<tr>
									<td>이름</td>
									<td>${myInfo.member_name } </td>
								</tr>
								<tr>
									<td>비밀번호</td>
									<td>${myInfo.member_pass } </td>
								</tr>
								<tr>
									<td>비밀번호 확인</td>
									<td>${myInfo.member_pass }
										<input type="button" value="비밀번호 변경">
									</td>
								</tr>
								<tr>
									<td>생년월일</td>
									<td>${myInfo.member_birth }</td>
								</tr>
								<tr>
									<td>휴대폰</td>
									<td>${myInfo.member_phone }
										<input type="button" value="휴대폰번호 변경" >
									</td>
								</tr>
								<tr>
									<td>이메일</td>
									<td>${myInfo.member_email }
										<input type="email" placeholder="이메일을 적어주세요" value="">
									</td>
								</tr>
								<tr>
									<td>좋아하는 장르</td>
									<td>${myInfo.member_like_genre } / 변경할 거 구현
<!-- 										<input type="email" placeholder="이메일을 적어주세요" value=""> -->
									</td>
<!-- 										<td> -->
<!-- 											<select name="member_like_genre" class="select"> -->
<%-- 												<option value="선택 안함" <c:if test="${myInfo.member_like_genre eq '선택 안함'} }">selected</c:if>>선택 안함</option> --%>
<%-- 												<option value="로맨스코미디" <c:if test="${myInfo.member_like_genre eq '로맨스코미디'} }">selected</c:if>>로맨스코미디</option> --%>
<%-- 												<option value="스릴러" <c:if test="${myInfo.member_like_genre eq '스릴러'} }">selected</c:if>>스릴러</option> --%>
<%-- 												<option value="공포" <c:if test="${myInfo.member_like_genre eq '공포'} }">selected</c:if>>공포</option> --%>
<%-- 												<option value="SF" <c:if test="${myInfo.member_like_genre eq 'SF'} }">selected</c:if>>SF</option> --%>
<%-- 												<option value="범죄" <c:if test="${myInfo.member_like_genre eq '범죄'} }">selected</c:if>>범죄</option> --%>
<%-- 												<option value="액션" <c:if test="${myInfo.member_like_genre eq '액션'} }">selected</c:if>>액션</option> --%>
<%-- 												<option value="코미디" <c:if test="${myInfo.member_like_genre eq '코미디'} }">selected</c:if>>코미디</option> --%>
<%-- 												<option value="판타지" <c:if test="${myInfo.member_like_genre eq '판타지'} }">selected</c:if>>판타지</option> --%>
<%-- 												<option value="음악" <c:if test="${myInfo.member_like_genre eq '음악'} }">selected</c:if>>음악</option> --%>
<%-- 												<option value="멜로" <c:if test="${myInfo.member_like_genre eq '멜로'} }">selected</c:if>>멜로</option> --%>
<%-- 												<option value="뮤지컬" <c:if test="${myInfo.member_like_genre eq '뮤지컬'} }">selected</c:if>>뮤지컬</option> --%>
<%-- 												<option value="스포츠" <c:if test="${myInfo.member_like_genre eq '스포츠'} }">selected</c:if>>스포츠</option> --%>
<%-- 												<option value="애니메이션" <c:if test="${myInfo.member_like_genre eq '애니메이션'} }">selected</c:if>>애니메이션</option> --%>
<%-- 												<option value="다큐멘터리" <c:if test="${myInfo.member_like_genre eq '다큐멘터리'} }">selected</c:if>>다큐멘터리</option> --%>
<%-- 												<option value="기타" <c:if test="${myInfo.member_like_genre eq '기타'} }">selected</c:if>>기타</option> --%>
<!-- 											</select> -->
<!-- 										</td> -->
											<td>
												
											</td>
								</tr>
							</table>
							<br>
							<input type="button" value="취소" onclick="history.back()"> <input type="button" value="등록 / 변경" onclick="location.href='myPage_modify_member_pro'">
						</form>
					</c:forEach>
				</c:otherwise>
			</c:choose>
  		</div>
	</div>
  </article>
  
  	<nav id="mainNav">
		<%--왼쪽 사이드바 --%>
  		<%@ include file="/WEB-INF/views/sidebar/sideBar_myPage.jsp"%>
  	</nav>
  
<!--   <nav id="mainNav"> -->
<%--   <%--왼쪽 사이드바 --%> --%>
<!-- <!-- 	왼쪽 탭 링크들 --> -->
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