<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<link
	href="${pageContext.request.contextPath }/resources/css/default.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath }/resources/css/sidebar.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath }/resources/css/button.css"
	rel="stylesheet" type="text/css">
<title>관리자 - 영화관리</title>
<style>
.w-900 {
	width: 900px;
}

.h-500 {
	height: 500px;
}

div {
	background-color: transparent;
}

/* 확인용 */
.container-fluid {
	border: 1px solid gray;
}

#mainNav {
	border: 1px solid blue;
}
</style>
</head>
<body>
	<%--네비게이션 바 영역 --%>
	<header id="pageHeader"><%@ include
			file="/resources/inc/header.jsp"%></header>

	<article id="mainArticle">
		<%--본문내용 --%>
		<div class="container-fluid w-900">
			<div class="row">
				<div class="col-md-12 mt-3">
					<h3>영화관리</h3>
				</div>
			</div>

			<%-- 'search' 영역 --%>
			<div class="row">
				<div class="col-md-12 mt-3">
					<nav class="navbar navbar-light bg-light justify-content-end">
						<form class="form-inline">
							<input class="form-control mr-sm-2" type="search"
								placeholder="Search" aria-label="Search">
							<button class="btn btn-outline-red my-2 my-sm-0" type="submit">Search</button>
						</form>
					</nav>
				</div>
			</div>

			<%-- 영화관리 테이블 시작 --%>
			<div class="row">
				<div class="col-md-12">
					<table class="table table-striped text-center">
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">영화제목</th>
								<th scope="col">개봉일시</th>
								<th scope="col">종영일시</th>
								<th scope="col">수정 및 삭제</th>
							</tr>
						</thead>
						<%-- 테이블에 채워지는 영화제목, 개봉일시, 종영일시, 수정 및 삭제 (제목,개봉/종영 일시 = DB에서가져오기) --%>
						<%-- 뿌리기 코드 <c:forEach var="movie" items="${movie }"> --%>
						<tbody>
							<tr>
								<th scope="row">24</th>
								<td>달마야놀다</td>
								<%-- ${movie.name} --%>
								<td>2023.02.21</td>
								<%-- ${movie.release_date} --%>
								<td>2023.05.22</td>
								<%-- ${movie.close_date} --%>
								<td>
									<button class="btn btn-danger" value="수정">수정</button>
									<button class="btn btn-danger" value="삭제">삭제</button>
								</td>
							</tr>
							<tr>
								<th scope="row">23</th>
								<td>아바타</td>
								<%-- ${movie.name} --%>
								<td>2023.01.15</td>
								<%-- ${movie.release_date} --%>
								<td>2023.02.12</td>
								<%-- ${movie.close_date} --%>
								<td>
									<button class="btn btn-danger" value="수정">수정</button>
									<button class="btn btn-danger" value="삭제">삭제</button>
								</td>
							</tr>
							<tr>
								<th scope="row">22</th>
								<td>범죄도시3</td>
								<%-- ${movie.name} --%>
								<td>2022.08.20</td>
								<%-- ${movie.release_date} --%>
								<td>2023.12.22</td>
								<%-- ${movie.close_date} --%>
								<td>
									<button class="btn btn-danger" value="수정">수정</button>
									<button class="btn btn-danger" value="삭제">삭제</button>
								</td>
							</tr>
							<tr>
								<th scope="row">21</th>
								<td>아바타2</td>
								<%-- ${movie.name} --%>
								<td>2021.10.01</td>
								<%-- ${movie.release_date} --%>
								<td>2022.08.22</td>
								<%-- ${movie.close_date} --%>
								<td>
									<button class="btn btn-danger" value="수정">수정</button>
									<button class="btn btn-danger" value="삭제">삭제</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				
		<div class="col-12 d-flex justify-content-center">
  			<button type="button" class="btn btn-primary btn-lg btn-danger mr-3" onclick="location.href='admin_movie_regist'">등록</button>
  		</div>
  		
	</div>
			</div>

			<%-- 페이징 처리 --%>
			<div class="row">
				<div class="col-md-12">
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<li class="page-item disabled"><a class="page-link">&laquo;</a>
							</li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">4</a></li>
							<li class="page-item"><a class="page-link" href="#">5</a></li>
							<li class="page-item"><a class="page-link" href="#">&raquo;</a>
							</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>


	</article>

	<nav id="mainNav" class="d-none d-md-block sidebar">
		<%--왼쪽 사이드바 --%>
		<%@ include file="/WEB-INF/views/sidebar/sideBar.jsp"%>
	</nav>

	<div id="siteAds"></div>
	<%--페이지 하단 --%>
	<footer id="pageFooter"><%@ include
			file="/resources/inc/footer.jsp"%></footer>
</body>