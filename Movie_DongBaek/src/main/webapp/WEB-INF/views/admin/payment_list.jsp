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
				결제관리
			</h3>
		</div>
	</div>
	
	<%-- 'search' 영역 --%>
	<div class="row">
		<div class="col-md-12 mt-3">
			<nav class="navbar navbar-light bg-light justify-content-end">
			  <form class="form-inline">
			    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
			    <button class="btn btn-outline-red my-2 my-sm-0" type="submit">Search</button>
			  </form>
			</nav>
		</div>
	</div>
	
	<%-- 결제관리 테이블 --%>
	<div class="row">
		<div class="col-md-12">
			<table class="table table-striped text-center">
			  <thead>
			    <tr>
			      <th scope="col">주문번호</th>
			      <th scope="col">주문자명</th>
			      <th scope="col">결제일시</th>
			      <th scope="col">주문내역 상세보기</th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <th scope="row">1</th>
			      <td></td>
			      <td></td>
			      <td><a href="#"><input type="button" class="btn btn-outline-red btn-sm" value="상세보기"></a></td>
			    </tr>
			    <tr>
			      <th scope="row">2</th>
			      <td></td>
			      <td></td>
			      <td><a href="#"><input type="button" class="btn btn-outline-red btn-sm" value="상세보기"></a></td>
			    </tr>
			    <tr>
			      <th scope="row">3</th>
			      <td></td>
			      <td></td>
			      <td><a href="#"><input type="button" class="btn btn-outline-red btn-sm" value="상세보기"></a></td>
			    </tr>
			  </tbody>
			</table>
		</div>
	</div>
	
	<%-- 페이징 처리 --%>
	<div class="row">
		<div class="col-md-12">
			<nav aria-label="Page navigation example">
			  <ul class="pagination justify-content-center">
			    <li class="page-item disabled">
			      <a class="page-link">&laquo;</a>
			    </li>
			    <li class="page-item"><a class="page-link" href="#">1</a></li>
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
	</div>
  </div>
 
  
  </article>
  
  <nav id="mainNav" class="d-none d-md-block sidebar">
  <%--왼쪽 사이드바 --%>
  </nav>
  
  <div id="siteAds"></div>
  <%--페이지 하단 --%>
  <footer id="pageFooter"><%@ include file="/resources/inc/footer.jsp"%></footer>
</body>