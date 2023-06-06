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
div {
background-color: transparent;
}

<%-- 페이징 색상변경 --%>
.page-link {
  color: #000; 
  background-color: #fff;
  border: 1px solid #ccc; 
}

.page-item.active .page-link {
 z-index: 1;
 color: #555;
 font-weight:bold;
 background-color: #f1f1f1;
 border-color: #ccc;
 
}

.page-link:focus, .page-link:hover {
  color: #000;
  background-color: #fafafa; 
  border-color: #ccc;
}

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
  	<%-- 본문 테이블 --%>
  	<div class="row">
  	<table class="table table-striped text-center align-middle">
	  <%-- 테이블 헤드 --%>
	  <thead>
	    <tr>
	      <th scope="col">번호</th>
	      <th scope="col">유형</th>
	      <th scope="col" width="600px">제목</th>
	      <th scope="col">작성자</th>
	      <th scope="col">등록일</th>
	    </tr>
	  </thead>
	  <%-- 테이블 바디--%>
	  <tbody>
	    <tr>
	      <td scope="col" class="align-middle">24</th>
	      <td scope="col" class="align-middle">예매</td>
	      <td scope="col" class="align-middle">안녕하세요</td>
	      <td scope="col" class="align-middle">관리자</td>
	      <td scope="col" class="align-middle">2022-02-02</td>
	    </tr>

	    <%-- 밑줄 용 빈칸 --%>
	    <tr>
	     <th scope="row"></th>
	     <th></th>
	     <th></th>
	     <th></th>
	     <th></th>
	    </tr>
	
	  </tbody>
	</table>
  	</div>
  			<div class="row col flex-row-reverse"><button type="button" class="btn btn-danger" onclick="location.href='admin_cs_qna'">등록</button></div>
	<div class="col col-md-1"></div>
 <%-- 페이징 --%>
 
 <nav aria-label="...">
  <ul class="pagination pagination-md justify-content-center">
    <li class="page-item disabled">
      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">&laquo;</a>
    </li>
    <li class="page-item active" aria-current="page">
      <a class="page-link" href="#">1 <span class="sr-only">(current)</span></a>
    </li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item"><a class="page-link" href="#">4</a></li>
    <li class="page-item"><a class="page-link" href="#">5</a></li>
    <li class="page-item">
      <a class="page-link" href="#">&raquo;</a>
    </li>
  </ul>
</nav>


       
  </div>
  
  </article>
  
  <nav id="mainNav">
  <%--왼쪽 사이드바 --%>
  	<%@ include file="/WEB-INF/views/sidebar/sideBar.jsp"%>
  </nav>
  
  <div id="siteAds"></div>
  <%--페이지 하단 --%>
  <footer id="pageFooter"><%@ include file="/resources/inc/footer.jsp"%></footer>
</body>