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
	margin: 0 auto;
}
.h-500{
	height: 500px;
}

div {
	background-color: transparent;
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
<div class="container-fluid w-900 justify-content-center" style="border: 1px solid gray">
	<div class="row">
		<div class="col-md-12 mt-3">
			<h3>
				영화 등록하기
			</h3>
		</div>
	</div>


  	<%-- 상세보기 테이블 --%>
  	<div class="row">
		<div class="col-md-12">
		<form action="admin_movie_regist_Pro" method="post">
			<table class="table table-bordered text-center">
			    <tr>
			      <th>영화제목</th> 
			      <td><input type="text" placeholder="영화제목을 입력해주세요"></td>
			    </tr>
			    <tr>
			      <th>감독명</th>
			      <td><input type="text" placeholder="감독명 입력해줘"></td> 
			    </tr>
			    <tr>
			      <th>장르</th>
			      <td>
			      	 <select>
					 	<option value="none">선택해주세요</option>
					 	<option value="action">액션</option>
					 	<option value="crime">범죄</option>
					 	<option value="scienceFiction">SF</option>
					 	<option value="comedy">코미디</option>
					 	<option value="romance">로맨스</option>
					 </select>
			      </td>
			    </tr>
			    <tr>
			      <th>러닝타임</th>
			      <td><input type="time"> <%-- 제이쿼리로 오전오후->24시간변경예정 제이쿼리로 오전오후 없애고 24시간으로 변경하기 --%></td>
			    </tr>
			    <tr>
			      <th>등급</th>
			     <td>
			 	 	<select name="movie_grade">
			 	 		<option value="none">선택해주세요</option>
			 	 		<option value="all">전체관람가</option>
			 	 		<option value="12">12세이상관람가</option>
			 	 		<option value="15">15세이상관람가</option>
			 	 		<option value="notTeenager">청소년관람불가</option>
			 	 		<option value="limit">제한상영가</option>
			 	 	</select>
				</td> 
			    </tr>
			    <tr>
			      <th>개봉일</th>
			      <td><input type="date"></td> 
			    </tr>
				<tr>
			      <th>종영일</th>
			      <td><input type="date"></td> 
				</tr>
				<tr>
			      <th>출연진</th>
			      <td><input type="text" placeholder="전우치,홍길동,빠빠빠"></td> 
				</tr>
				<tr>
			      <th>포스터</th> 
			      <td><input type="file"></td> 
				</tr>
			     <tr>
		     	 <th>줄거리</th>
			     	 <td><textarea rows="5" cols="50" placeholder="줄거리를 입력해주세요"></textarea></td> 
			     </tr>
			     <tr>
			     	<td colspan="2">
	     				<input class="btn btn-danger" id="bottom-right" type="submit" value="등록하기"> 
						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#takeMovieAPI">가져오기</button>
			     	</td>
			     </tr>
			</table>
		</form>
		</div>
	</div>
  </div>
  
  <%-- 영화 '가져오기'모달 : select로 영화 선택할수있게? 해서 클릭하면 창에뜨게 --%>
	<div class="modal fade" id="takeMovieAPI" tabindex="-1" role="dialog" aria-labelledby="takeMovieTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="takeMovieTitle">영화정보 가져오기(API)</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      <%-- API로 가져온거 c:foreach로 목록 이름 movie? --%>
	      <%-- <c:foreach> --%>
	      	<select>
	      		<option>$.{movie.name }</option> <%-- 반복으로  --%>
	      	</select>
	      <%-- </c:foreach> --%>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">아니오</button>
	        <button type="button" class="btn btn-primary">&nbsp;&nbsp;&nbsp;&nbsp;예&nbsp;&nbsp;&nbsp;&nbsp;</button>
	      </div>
	    </div>
	  </div>
	</div>
  
  

  	<%-- 본문 테이블 끝 --%>
</article>
  
  	<%--왼쪽 사이드바 --%>
  	<nav id="mainNav" class="d-none d-md-block sidebar">
  		<%@ include file="../sidebar/sideBar.jsp" %>
  	</nav>

  
  <%--페이지 하단 --%>
  <div id="siteAds"></div>
  <footer id="pageFooter"><%@ include file="/resources/inc/footer.jsp"%></footer>
</body>