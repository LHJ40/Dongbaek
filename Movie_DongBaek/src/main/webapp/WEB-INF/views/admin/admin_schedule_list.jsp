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
</style>
</head>
<body>
 <%--네비게이션 바 영역 --%>
 <header id="pageHeader"><%@ include file="/resources/inc/header.jsp"%></header>
 
  <article id="mainArticle">
  <%--본문내용 --%>
   <%-- 네이게이션바 --%>
 	<div class="row row-md-12"> 
		<nav class="navbar navbar-expand-xl navbar-light bg-light d-flex justify-content-between">
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		  <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
		  	<div class="col col-md-4">
		    	<a class="navbar-brand" >상영스케줄 관리</a>
		    </div>
	    	<div class="col col-md-10">
			    <form class="form-inline">
			      <select class="form-control mr-sm-2" name="theater">
			      	<option value="">영화관</option>
			      	<option value="영화관1">영화관1</option>
			      	<option value="영화관2">영화관2</option>
			      </select>
			      <div class="input-group">
					  <div class="input-group-prepend">
					    <span class="input-group-text" id="play_date">상영날짜</span>
					  </div>
					  <input type="date" class="form-control" placeholder="상영일(yy-mm-dd)" aria-label="Username" aria-describedby="basic-addon1" id="">
				  </div>
			      <button class="btn btn-outline-danger my-2 my-sm-2 ml-2" type="submit">확인</button>
			    </form>
		    </div>
		  </div>

		</nav>
  	</div>
  	
  	<%-- 본문 테이블 --%>
  	<div class="row">
  	<table class="table table-striped text-center align-middle">
	  <%-- 테이블 헤드 --%>
	  <thead>
	    <tr>
	      <th scope="col">상영관명</th>
	      <th scope="col">1회차</th>
	      <th scope="col">2회차</th>
	      <th scope="col">3회차</th>
	      <th scope="col">4회차</th>
	      <th scope="col">5회차</th>
	      <th scope="col"></th>
	    </tr>
	  </thead>
	  <%-- 테이블 바디--%>
	  <tbody>
	    <%-- 1행 1열 --%>
	    <tr>
		    <th scope="col">
		    	<div class="">동백관</div>
		    	<div class="">
		    	  <select class="form-control mr-sm-2" name="movie_room">
			      	<option value="">영화명</option>
			      	<option value="영화명1">영화명1</option>
			      	<option value="영화명2">영화명2</option>
			      </select>
		    	</div>
		    	<button type="button" class="btn btn-secondary m-2" onclick="">생성</button>
		    </th>
	      	<%-- 1행 2열 --%>
	        <th scope="col">
	        	<label for="scheduelCheck1_1">
		      	<div class="row" id="play_detail_num">
		      		상영번호: 21
		      	</div>
		      	<div class="row" id="paly_start_time">
		      		상영기간: 05-21 ~ 06-05
		      	</div>
		      	<div class="row" id="paly_end_time">
		      		상영시간: 07:00 ~ 08:30
		      	</div>
		      	<div class="row" id="movie_name">
		      		영화명: 신세계
		      	</div>
		      	</label>
		      	<div class="row m-2 d-flex justify-content-center" aria-label="Checkbox for following text input">
		      		<input type="checkbox" id="scheduelCheck1_1">
		      	</div>
	        </th>
	        <%-- 1행 3열 --%>
	        <th scope="col">
	        	<label for="scheduelCheck1_2">
		      	<div class="row" id="play_detail_num">
		      		상영번호: 21
		      	</div>
		      	<div class="row" id="paly_start_time">
		      		상영기간: 05-21 ~ 06-05
		      	</div>
		      	<div class="row" id="paly_end_time">
		      		상영시간: 07:00 ~ 08:30
		      	</div>
		      	<div class="row" id="movie_name">
		      		영화명: 신세계
		      	</div>
		      	</label>
		      	<div class="row m-2 d-flex justify-content-center" aria-label="Checkbox for following text input">
		      		<input type="checkbox" id="scheduelCheck1_2">
		      	</div>
	        </th>
	        <%-- 1행 4열 --%>
	        <th scope="col">
	        	<label for="scheduelCheck1_3">
		      	<div class="row" id="play_detail_num">
		      		상영번호: 21
		      	</div>
		      	<div class="row" id="paly_start_time">
		      		상영기간: 05-21 ~ 06-05
		      	</div>
		      	<div class="row" id="paly_end_time">
		      		상영시간: 07:00 ~ 08:30
		      	</div>
		      	<div class="row" id="movie_name">
		      		영화명: 신세계
		      	</div>
		      	</label>
		      	<div class="row m-2 d-flex justify-content-center" aria-label="Checkbox for following text input">
		      		<input type="checkbox" id="scheduelCheck1_3">
		      	</div>
	        </th>
	        <%-- 1행 5열 --%>
	        <th scope="col">
	        	<label for="scheduelCheck1_4">
		      	<div class="row" id="play_detail_num">
		      		상영번호: 21
		      	</div>
		      	<div class="row" id="paly_start_time">
		      		상영기간: 05-21 ~ 06-05
		      	</div>
		      	<div class="row" id="paly_end_time">
		      		상영시간: 07:00 ~ 08:30
		      	</div>
		      	<div class="row" id="movie_name">
		      		영화명: 신세계
		      	</div>
		      	</label>
		      	<div class="row m-2 d-flex justify-content-center" aria-label="Checkbox for following text input">
		      		<input type="checkbox" id="scheduelCheck1_4">
		      	</div>
	        </th>
	        <%-- 1행 6열 --%>
	        <th scope="col">
	        	<label for="scheduelCheck1_5">
		      	<div class="row" id="play_detail_num">
		      		상영번호: 21
		      	</div>
		      	<div class="row" id="paly_start_time">
		      		상영기간: 05-21 ~ 06-05
		      	</div>
		      	<div class="row" id="paly_end_time">
		      		상영시간: 07:00 ~ 08:30
		      	</div>
		      	<div class="row" id="movie_name">
		      		영화명: 신세계
		      	</div>
		      	</label>
		      	<div class="row m-2 d-flex justify-content-center" aria-label="Checkbox for following text input">
		      		<input type="checkbox" id="scheduelCheck1_5">
		      	</div>
	        </th>
	        <%-- 1행 7열 --%>
	        <th scope="col">
	        	<div class="ml-3 mr-3">
	        	<div class="row"><button type="button" class="btn btn-danger mt-3 mb-2" onclick="">등록</button></div>
				<div class="row"><button type="button" class="btn btn-outline-danger" onclick="">수정</button></div>
	        	</div>
	        </th>
		</tr>
		
	    <%-- 2행 1열 --%>
	    <tr>
		    <th scope="col">
		    	<div class="">1관</div>
		    	<div class="">
		    	  <select class="form-control mr-sm-2" name="movie_room">
			      	<option value="">영화명</option>
			      	<option value="영화명1">영화명1</option>
			      	<option value="영화명2">영화명2</option>
			      </select>
		    	</div>
		    	<button type="button" class="btn btn-secondary m-2" onclick="">생성</button>
		    </th>
	      	<%-- 2행 2열 --%>
	        <th scope="col">
	        	<label for="scheduelCheck2_1">
		      	<div class="row" id="play_detail_num">
		      		상영번호: 21
		      	</div>
		      	<div class="row" id="paly_start_time">
		      		상영기간: 05-21 ~ 06-05
		      	</div>
		      	<div class="row" id="paly_end_time">
		      		상영시간: 07:00 ~ 08:30
		      	</div>
		      	<div class="row" id="movie_name">
		      		영화명: 신세계
		      	</div>
		      	</label>
		      	<div class="row m-2 d-flex justify-content-center" aria-label="Checkbox for following text input">
		      		<input type="checkbox" id="scheduelCheck2_1">
		      	</div>
	        </th>
	        <%-- 2행 3열 --%>
	        <th scope="col">
	        	<label for="scheduelCheck2_2">
		      	<div class="row" id="play_detail_num">
		      		상영번호: 21
		      	</div>
		      	<div class="row" id="paly_start_time">
		      		상영기간: 05-21 ~ 06-05
		      	</div>
		      	<div class="row" id="paly_end_time">
		      		상영시간: 07:00 ~ 08:30
		      	</div>
		      	<div class="row" id="movie_name">
		      		영화명: 신세계
		      	</div>
		      	</label>
		      	<div class="row m-2 d-flex justify-content-center" aria-label="Checkbox for following text input">
		      		<input type="checkbox" id="scheduelCheck2_2">
		      	</div>
	        </th>
	        <%-- 2행 4열 --%>
	        <th scope="col">
	        	<label for="scheduelCheck2_3">
		      	<div class="row" id="play_detail_num">
		      		상영번호: 21
		      	</div>
		      	<div class="row" id="paly_start_time">
		      		상영기간: 05-21 ~ 06-05
		      	</div>
		      	<div class="row" id="paly_end_time">
		      		상영시간: 07:00 ~ 08:30
		      	</div>
		      	<div class="row" id="movie_name">
		      		영화명: 신세계
		      	</div>
		      	</label>
		      	<div class="row m-2 d-flex justify-content-center" aria-label="Checkbox for following text input">
		      		<input type="checkbox" id="scheduelCheck2_3">
		      	</div>
	        </th>
	        <%-- 2행 5열 --%>
	        <th scope="col">
	        	<label for="scheduelCheck2_4">
		      	<div class="row" id="play_detail_num">
		      		상영번호: 21
		      	</div>
		      	<div class="row" id="paly_start_time">
		      		상영기간: 05-21 ~ 06-05
		      	</div>
		      	<div class="row" id="paly_end_time">
		      		상영시간: 07:00 ~ 08:30
		      	</div>
		      	<div class="row" id="movie_name">
		      		영화명: 신세계
		      	</div>
		      	</label>
		      	<div class="row m-2 d-flex justify-content-center" aria-label="Checkbox for following text input">
		      		<input type="checkbox" id="scheduelCheck2_4">
		      	</div>
	        </th>
	        <%-- 2행 6열 --%>
	        <th scope="col">
	        	<label for="scheduelCheck2_5">
		      	<div class="row" id="play_detail_num">
		      		상영번호: 21
		      	</div>
		      	<div class="row" id="paly_start_time">
		      		상영기간: 05-21 ~ 06-05
		      	</div>
		      	<div class="row" id="paly_end_time">
		      		상영시간: 07:00 ~ 08:30
		      	</div>
		      	<div class="row" id="movie_name">
		      		영화명: 신세계
		      	</div>
		      	</label>
		      	<div class="row m-2 d-flex justify-content-center" aria-label="Checkbox for following text input">
		      		<input type="checkbox" id="scheduelCheck2_5">
		      	</div>
	        </th>
	        <%-- 2행 7열 --%>
	        <th scope="col">
	        	<div class="ml-3 mr-3">
	        		<div class="row"><button type="button" class="btn btn-danger mt-3 mb-2" onclick="">등록</button></div>
					<div class="row"><button type="button" class="btn btn-outline-danger" onclick="">수정</button></div>
				</div>
	        </th>
		</tr>
		
		
	    <%-- 3행 1열 --%>
	    <tr>
		    <th scope="col">
		    	<div class="">1관</div>
		    	<div class="">
		    	  <select class="form-control mr-sm-2" name="movie_room">
			      	<option value="">영화명</option>
			      	<option value="영화명1">영화명1</option>
			      	<option value="영화명2">영화명2</option>
			      </select>
		    	</div>
		    	<button type="button" class="btn btn-secondary m-2" onclick="">생성</button>
		    </th>
	      	<%-- 3행 2열 --%>
	        <th scope="col">
	        	<label for="scheduelCheck3_1">
		      	<div class="row" id="play_detail_num">
		      		상영번호: 21
		      	</div>
		      	<div class="row" id="paly_start_time">
		      		상영기간: 05-21 ~ 06-05
		      	</div>
		      	<div class="row" id="paly_end_time">
		      		상영시간: 07:00 ~ 08:30
		      	</div>
		      	<div class="row" id="movie_name">
		      		영화명: 신세계
		      	</div>
		      	</label>
		      	<div class="row m-2 d-flex justify-content-center" aria-label="Checkbox for following text input">
		      		<input type="checkbox" id="scheduelCheck3_1">
		      	</div>
	        </th>
	        <%-- 3행 3열 --%>
	        <th scope="col">
	        	<label for="scheduelCheck3_2">
		      	<div class="row" id="play_detail_num">
		      		상영번호: 21
		      	</div>
		      	<div class="row" id="paly_start_time">
		      		상영기간: 05-21 ~ 06-05
		      	</div>
		      	<div class="row" id="paly_end_time">
		      		상영시간: 07:00 ~ 08:30
		      	</div>
		      	<div class="row" id="movie_name">
		      		영화명: 신세계
		      	</div>
		      	</label>
		      	<div class="row m-2 d-flex justify-content-center" aria-label="Checkbox for following text input">
		      		<input type="checkbox" id="scheduelCheck3_2">
		      	</div>
	        </th>
	        <%-- 3행 4열 --%>
	        <th scope="col">
		      	<label for="scheduelCheck3_3">
		      	<div class="row" id="play_detail_num">
		      		상영번호: 21
		      	</div>
		      	<div class="row" id="paly_start_time">
		      		상영기간: 05-21 ~ 06-05
		      	</div>
		      	<div class="row" id="paly_end_time">
		      		상영시간: 07:00 ~ 08:30
		      	</div>
		      	<div class="row" id="movie_name">
		      		영화명: 신세계
		      	</div>
		      	</label>
		      	<div class="row m-2 d-flex justify-content-center" aria-label="Checkbox for following text input">
		      		<input type="checkbox" id="scheduelCheck3_3">
		      	</div>
	        </th>
	        <%-- 3행 5열 --%>
	        <th scope="col">
		      	<label for="scheduelCheck3_4">
		      	<div class="row" id="play_detail_num">
		      		상영번호: 21
		      	</div>
		      	<div class="row" id="paly_start_time">
		      		상영기간: 05-21 ~ 06-05
		      	</div>
		      	<div class="row" id="paly_end_time">
		      		상영시간: 07:00 ~ 08:30
		      	</div>
		      	<div class="row" id="movie_name">
		      		영화명: 신세계
		      	</div>
		      	</label>
		      	<div class="row m-2 d-flex justify-content-center" aria-label="Checkbox for following text input">
		      		<input type="checkbox" id="scheduelCheck3_4">
		      	</div>
	        </th>
	        <%-- 3행 6열 --%>
	        <th scope="col">
		      	<label for="scheduelCheck3_5">
		      	<div class="row" id="play_detail_num">
		      		상영번호: 21
		      	</div>
		      	<div class="row" id="paly_start_time">
		      		상영기간: 05-21 ~ 06-05
		      	</div>
		      	<div class="row" id="paly_end_time">
		      		상영시간: 07:00 ~ 08:30
		      	</div>
		      	<div class="row" id="movie_name">
		      		영화명: 신세계
		      	</div>
		      	</label>
		      	<div class="row m-2 d-flex justify-content-center" aria-label="Checkbox for following text input">
		      		<input type="checkbox" id="scheduelCheck3_5">
		      	</div>
	        </th>
	        <%-- 3행 7열 --%>
	        <th scope="col">
	        	<div class="ml-3 mr-3">
	        		<div class="row"><button type="button" class="btn btn-danger mt-3 mb-2" onclick="">등록</button></div>
					<div class="row"><button type="button" class="btn btn-outline-danger" onclick="">수정</button></div>
				</div>
	        </th>
		</tr>
		

	    <%-- 밑줄 용 빈칸 --%>
	    <tr>
	     <th scope="row"></th>
	     <th></th>
	     <th></th>
	     <th></th>
	     <th></th>
	     <th></th>
	    </tr>
	
	  </tbody>
	</table>
  	</div>
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


  	
  </article>
  
  <nav id="mainNav">
  <%--왼쪽 사이드바 --%>
  	<%@ include file="/WEB-INF/views/sidebar/sideBar.jsp"%>
<!-- 	  <div class="h3">관리자 페이지</div> -->
<!-- 	  <div class="btn-group btn-group-vertical" role="group" aria-label="Basic example" > -->
<!-- 	  <br> -->
<!-- 	  <button type="button" class="btn btn-light btn-lg border">회원관리</button> -->
<!-- 	  <button type="button" class="btn btn-light btn-lg border">영화관리</button> -->
<!-- 	  <button type="button" class="btn btn-danger btn-lg border">상영스케쥴 관리</button> -->
<!-- 	  <button type="button" class="btn btn-light btn-lg border">결제 관리</button> -->
<!-- 	  <button type="button" class="btn btn-light btn-lg border">CS 관리</button> -->
<!-- 	  <button type="button" class="btn btn-light btn-lg border">혜택관리</button> -->
<!-- 	</div> -->
  </nav>
  
  <div id="siteAds"></div>
  <%--페이지 하단 --%>
  <footer id="pageFooter"><%@ include file="/resources/inc/footer.jsp"%></footer>
 
<%-- 모달 --%>
<div class="modal fade" id="deleteWrite" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">삭제</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       	24번 상영 정보를 삭제하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="history.back()">취소</button>
        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteConfirm">&nbsp;&nbsp;예&nbsp;&nbsp;</button>
      </div>
    </div>
  </div>
</div>
<%-- 모달2 --%>
<div class="modal fade" id="deleteConfirm" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="false">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">삭제</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       	삭제되었습니다!
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="location.href='admin_list_schedule_list.jsp'">확인</button>
      </div>
    </div>
  </div>
</div>


</body>