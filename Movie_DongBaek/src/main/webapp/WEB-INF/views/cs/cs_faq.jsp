<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<title>영화 예매 사이트</title>
<style>
#mainNav{
/* 		border: 1px solid #f00; */
		padding: 8rem 2rem;
		
	}
	
	#mainNav>ul{
		list-style: none;
	}
</style>

</head>
<body>
 <header id="pageHeader">
 <%--네비게이션 바 영역 --%>
  <%@ include file="/resources/inc/header.jsp"%>
 </header>
 
  <article id="mainArticle">
  <%--본문내용 --%>
  
   <div class="container-fluid w-900" >
  

    
 <nav aria-label="breadcrumb">
  <ol class="breadcrumb bg-white">
    <li class="breadcrumb-item"><a href="#">고객센터 홈</a></li>
    <li class="breadcrumb-item active" aria-current="page">자주묻는 질문</li>
  </ol>
</nav>

<br><h1>자주묻는 질문</h1>
<div class="btn-group " role="group" aria-label="Basic example">
  <button type="button" class="btn btn-outline-secondary">전체</button>
  <button type="button" class="btn btn-outline-secondary">예매</button>
  <button type="button" class="btn btn-outline-secondary">멤버십</button>
  <button type="button" class="btn btn-outline-secondary">결제수단</button>
  <button type="button" class="btn btn-outline-secondary">극장</button>
  <button type="button" class="btn btn-outline-secondary">스토어</button>
  <button type="button" class="btn btn-outline-secondary">할인혜택</button>
  <hr>
  </div>
  <hr>
<table  class="table table-striped">
  <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">유형</th>
      <th scope="col">제목</th>
      <th scope="col">등록</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>유형유형유형유형유형유형유형유형유형</td>
      <td>제목제목제목제목제목제목제목제목제목</td>
      <td>등록일등록일등록일등록일등록일등록일</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>Larry</td>
      <td>the Bird</td>
      <td>@twitter</td>
    </tr>
  </tbody>
</table>


       
		

  
  </article>
  
  <nav id="mainNav">
  <%--왼쪽 사이드바 --%>
	<ul>
  		<li>고객센터홈</li>
  		<li>공지사항</li>
  		<li>자주묻는질문</li>
  		<li>1:1문의</li>
  		
  	</ul>
  </nav>
  
  <div id="siteAds"></div>
  <%--페이지 하단 --%>
  <footer id="pageFooter"><%@ include file="/resources/inc/footer.jsp"%></footer>
</body>