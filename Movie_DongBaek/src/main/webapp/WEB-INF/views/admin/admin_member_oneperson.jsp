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
<title>회원관리 - $.{member.id}</title>
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
<header id="pageHeader"><%@ include file="../inc/header.jsp"%></header>
 
<%--본문내용 --%>
<article id="mainArticle">
<div class="container-fluid w-900 justify-content-center" style="border: 1px solid gray">
	<div class="row">
		<div class="col-md-12 mt-3">
			<h3>
				$.{member.id} 님의 회원정보
			</h3>
		</div>
	</div>


  	<%-- 회원 정보 확인 테이블 시작 --%>
  	<div class="row">
		<div class="col-md-12">
			<table class="table table-bordered text-center">
			    <tr>
			    	<%-- 가로 길이 고정(일시) --%>
			    	<th width="250px">이름</th>
			    	<td width="550px" colspan="2">$.{member.name }</td>
			    </tr>
			    <tr>
			    	<%-- 회원상태 : selectBox , 상태변경 확인버튼 --%>
			    	<%-- --%>
			    	<th>회원상태</th>
			    	<td width="350px">$.{member.type}(회원) // 상태변경 버튼 클릭 시 변화</td>
			    	<td>
				  		<select>
				  			<option>활동중(회원)</option>
				  			<option>탈퇴</option>
				  		</select>
				     
				  		<button type="button" class="btn btn-danger">상태 변경확인</button> 
			    	</td>
			    </tr>
			    <tr>
			    	<th>멤버십</th>
			    	<td colspan="2">$.{member.grade_name}</td>
			    </tr>
			    <tr>
			    	<th>아이디</th>
			    	<td colspan="2">$.{member.id}</td>
			    </tr>
			    <tr>
			    	<th>생년월일</th>
			    	<td colspan="2">$.{member.birth}</td>
			    </tr>
			    <tr>
			    	<th>전화번호</th>
			    	<td colspan="2">$.{member.phone}</td>
			    </tr>
				<tr>
			    	<th>이메일(선택)</th>
			    	<td colspan="2">$.{member.email}</td>
				</tr>
			</table>
		</div>
	</div>
	
	<%-- 버튼 --%>
	<div class="row d-flex justify-content-center mt-3">
		<div class="col-3">
			<button class="w-100 btn btn-outline-red mb-3" type="submit" data-toggle="modal" data-target="#memberTypeChange">삭제</button>
		</div>
		<div class="col-3">
			<button class="w-100 btn btn-outline-red mb-3" type="button" onclick="location.href='admin_member_list'">돌아가기</button>
		</div>
	</div>
  </div>
  
	<%-- '결제취소' 모달 --%>
	<div class="modal fade" id="memberTypeChange" tabindex="-1" role="dialog" aria-labelledby="memberDeleteTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="memberDeleteTitle">회원 삭제확인</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        회원 정보를 삭제 하시겠습니까?
	      </div>
	      <div class="modal-footer justify-content-center">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">아니오</button>
	        <button type="button" class="btn btn-red">&nbsp;&nbsp;&nbsp;&nbsp;예&nbsp;&nbsp;&nbsp;&nbsp;</button>
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

<!--  	<nav id="mainNav"> -->
<!--  	<h1>관리자 페이지</h1> -->
<!--  	<div class="list-group"> -->
<%--  		<%-- 활성화된 페이지는 active로 나타냄 --%> --%>
<!--   		<a href="#" class="list-group-item list-group-item-action active" aria-current="true">회원관리</a> -->
<!--   		<a href="#" class="list-group-item list-group-item-action">영화관리</a> -->
<!--   		<a href="#" class="list-group-item list-group-item-action">상영스케쥴 관리</a> -->
<!-- 		<a href="#" class="list-group-item list-group-item-action">결제 관리</a> -->
<!-- 		<a href="#" class="list-group-item list-group-item-action">CS 관리</a> -->
<!-- 		<a href="#" class="list-group-item list-group-item-action">혜택 관리</a> -->
<!-- 	</div> -->
<!--   </nav> -->
  
  <%--페이지 하단 --%>
  <div id="siteAds"></div>
  <footer id="pageFooter"><%@ include file="../inc/footer.jsp"%></footer>
</body>