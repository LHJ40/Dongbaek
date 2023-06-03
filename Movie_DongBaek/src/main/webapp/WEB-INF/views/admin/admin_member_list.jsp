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
<title>관리자 - 회원관리</title>
<style>
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
.container-fluid h5{
		text-align: center;
		font-weight: bold;
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
 <header id="pageHeader"><%@ include file="/resources/inc/header.jsp"%></header>
 
  <%--본문내용 --%>
  <article id="mainArticle">
	  <%-- 본문 상단 --%>
	  <%-- 상단 이름, 검색 목록 코드 시작--%>
	  <%-- 페이지 제목 --%>
	<div class="container-fluid w-900" style="border: 1px solid gray">
		<div class="row">
			<div class="col-md-12 mt-3">
				<h3>
					회원관리
				</h3>
			</div>
		</div>
		<%-- 'search' 영역 --%>	
		<div class="row">
		   	<div class="col-md-12 mt-3">
				<nav class="navbar navbar-light bg-light justify-content-end">
					<form class="form-inline">
						<select class="form-control mr-sm-s" name="movie_name">
					    	<option value="1">이름</option>
							<option value="영화명1">아이디</option>
					    	<option value="영화명2">멤버십</option>
					    </select>
				    	<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
				    	<button class="btn btn-outline-secondary my-2 my-sm-0" type="submit">Search</button>
				  </form>
				</nav>
			</div>
		</div>
  		<%-- 상단 이름, 검색 목록 코드 끝 --%>
	   	
  	
	  	<%-- 회원관리 테이블 시작 --%>
	  	<div class="row">
			<div class="col-md-12">
				<table class="table table-striped text-center">
					<thead>
					  	<tr>
					    	<th scope="col">번호</th>
					    	<th scope="col">이름</th>
					    	<th scope="col">아이디</th>
					    	<th scope="col">멤버십</th>
					    	<th scope="col">현재상태</th>
				   		</tr>
		  			</thead>
		  		<%-- 테이블에 채워지는 잉름, 아이디, 멤버십, 현재상태는 데이터베이스에서 가져오기 --%>
			  		<tbody>
				    	<tr>
					    	<th scope="row">24</th>
					    	<td>홍길동</td>
					    	<td>hogn11</td>
					    	<td>플래티넘</td>
					    	<td>
						      	<button type="button" class="btn btn-secondary">회원</button>
				     		</td>
				    	</tr>
				    	<tr>
					    	<th scope="row">23</th>
					    	<td>이순신</td>
					    	<td>leess11</td>
					    	<td>골드</td>
					    	<td>
						      	<button type="button" class="btn btn-secondary">회원</button>
				     		</td>
				    	</tr>
				    	<tr>
					    	<th scope="row">22</th>
					    	<td>강감찬</td>
					    	<td>kkc77</td>
					    	<td>실버</td>
					    	<td>
						      	<button type="button" class="btn btn-secondary">회원</button>
				     		</td>
				    	</tr>
				    	<tr>
					    	<th scope="row">21</th>
					    	<td>맥도날드</td>
					    	<td>macdo</td>
					    	<td>브론즈</td>
					    	<td>
					    		<%-- 탈퇴한 회원을 어느 상태로 처리할지 정해면 하나로 ! --%>
						      	<button type="button" class="btn btn-secondary">휴면</button>
				     		</td>
				    	</tr>
				    	<tr>
					    	<th scope="row">20</th>
					    	<td>버거킹</td>
					    	<td>burgerking</td>
					    	<td>플래티넘</td>
					    	<td>
						      	<button type="button" class="btn btn-secondary">탈퇴</button>
				     		</td>
				    	</tr>
				  </tbody>
				</table>
			</div>
		</div>
	  	<%-- 본문 테이블 끝 --%>
  	  	
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
	  	<%-- 페이징 처리 끝 --%>
	</div> 
	<%-- div container 끝 --%>
	<%-- 본문 끝 --%>
  </article>
  
  	<%--왼쪽 사이드바 --%>
 	<nav id="mainNav" class="d-none d-md-block sidebar">
  		<%@ include file="../sidebar/sideBar3.jsp" %>
  	</nav>
  
  <%--페이지 하단 --%>
  <div id="siteAds"></div>
  	<footer id="pageFooter"><%@ include file="/resources/inc/footer.jsp"%></footer>
  <%--페이지 하단 끝 --%>
</body>