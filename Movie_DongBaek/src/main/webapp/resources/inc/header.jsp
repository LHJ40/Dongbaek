<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<nav id="global">

<span id="navbar-memberbox">
	<a href="member_login_form">로그인</a>
	<a href="member_join_step1">회원가입</a> 
	<a href="cs_main">고객센터</a>
</span>
</nav>
<nav class="navbar  navbar-light bg-light" >
     <ul class="nav" >
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  <li class="nav-item" >
    <a class="nav-link menuItem" href="movie_list_present" style="background-color:white; color:black;">영화</a>
  </li>
  <li class="nav-item">
    <a class="nav-link menuItem" href="reservation_main" style="background-color:white; color:black;">예매</a>
  </li>
  <li class="nav-item" style=margin-right:30px>
    <a class="nav-link menuItem" href="theater_main" style="background-color:white; color:black;">영화관</a>
  </li>
  <a class="navbar-brand" href="./">
<<<<<<< HEAD
   <img src="${pageContext.request.contextPath}/resources/img/logo2.png" width="220" alt="">
=======
   <img src="${pageContext.request.contextPath}/resources/img/last-logo.png" width="200" height="48" alt="">
>>>>>>> branch 'main' of https://github.com/itwillbs51/Dongbaek.git
    </a>
  <li class="nav-item" style=margin-left:30px>
    <a class="nav-link active menuItem" href="grade" style="background-color:white; color:black;">멤버십</a>
  </li>
  <li class="nav-item">
    <a class="nav-link menuItem" href="snack_main" style="background-color:white; color:black;">스토어</a>
  </li>
  <li class="nav-item">
    <a class="nav-link menuItem" href="#" style="background-color:white; color:black;">심플모드</a>
  </li>
 
</ul>
  <span class="underline"></span>
  </nav>
<div class="pos-f-t">
  <div class="collapse" id="navbarToggleExternalContent">
    <div class="bg-white p-4">
    
     	<table class="table table-hover" >
   <tbody>
    <tr>
      <th style=color:red;>SITEMAP</th>
      
    </tr>
     <tr>
      
      <th>영화</th>
      <th>극장</th>
      <th>고객센터</th>
      <th>마이페이지</th>
    </tr>
    <tr>
      
      <td><a href="movie_list_present">전체영화</a> </td>
      <td><a href="theater_main">전체극장</a></td>
      <td><a href="cs_main">고객센터홈</a></td>
      <td><a href="#">예매/구매내역</a></td>
    </tr>
    <tr>
     
      <td></td>
      <td></td>
      <td><a href="cs_notice">공지사항</a></td>
      <td><a href="#">나의 리뷰</a></td>
    </tr>
    <tr>
     
      <th>스토어</th>
      <th>예매</th>
      <td><a href="cs_faq">자주묻는질문</a></td>
      <td><a href="#">문의내역</a></td>
    </tr>
    <tr>
     
      <td><a href="snack_main">전체상품</a></td>
       <td><a href="reservation_main">빠른예매</a></td>
      <td><a href="cs_qna_form">1:1 질문</a></td>
      <td><a href="#">등급별혜택</a></td>
    </tr>
     <tr>
    <td></td>
      <td></td>
      <td></td>
      <td><a href="#">개인정보 수정</a></td>
      </tr>
      <td></td>
      <td></td>
      <td></td>
      <td><a href="#">인생영화네컷 만들기</a></td>
      </tr>
  </tbody>
</table>

    </div>
  </div>
</div>