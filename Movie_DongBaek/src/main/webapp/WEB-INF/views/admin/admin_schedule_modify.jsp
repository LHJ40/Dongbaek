admin_schedule.jsp<%@ page language="java" contentType="text/html; charset=UTF-8"
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

</style>
</head>
<body>
 <%--네비게이션 바 영역 --%>
 <header id="pageHeader"><%@ include file="..//inc/header.jsp"%></header>
 
  <article id="mainArticle">
  <%--본문내용 --%>
  	<div class="container">
  		<div class="border m-3 p-5" > <%-- 마진설정 --%>
  			<div class="row-md-6">
		 		<p class="h3">상영 스케줄 관리 글수정</p>
		  		<br><br>
	  		</div>
	  		<form action="" method="post">
		  		<div class="row-md-6">
		  		<%-- 영화관 --%>
				  <div class="col col-md-6 p-0">
					<div class="input-group w-100">
							<div class="input-group mb-3">
							  <div class="input-group-prepend">
							    <label class="input-group-text" for="inputGroupSelect01">&nbsp;영화관&nbsp;</label>
							  </div>
							  <select class="custom-select" id="movie_name">
							    <option selected>영화관</option>
							    <option value="1">아이티윌점</option>
							    <option value="2">서면점</option>
							  </select>
							</div>
					</div>
				  </div>
				 <br>
				<%-- 상영관 --%>				
					  <div class="col col-md-6 p-0">
						<div class="input-group mb-6 w-100">
							<div class="input-group mb-3">
							  <div class="input-group-prepend">
							    <label class="input-group-text" for="inputGroupSelect01">&nbsp;상영관&nbsp;</label>
							  </div>
							  <select class="custom-select" id="movie_name">
							    <option selected>상영관</option>
							    <option value="1">1관</option>
							    <option value="2">2관</option>
							  </select>
							</div>
						</div>
					  </div>
					<br>
				<%-- 영화명 --%>
				  <div class="col col-md-6 p-0">
					<div class="input-group w-100">
							<div class="input-group mb-3">
							  <div class="input-group-prepend">
							    <label class="input-group-text" for="inputGroupSelect01">&nbsp;영화명&nbsp;</label>
							  </div>
							  <select class="custom-select" id="movie_name">
							    <option selected>영화명</option>
							    <option value="1">신세계</option>
							    <option value="2">도둑들</option>
							  </select>
							  
							</div>
					</div>
				  </div>
				 <br>
				<%-- 상영시간 --%>
	  			<div class="row input-group mb-2">
					  <div class=" col col-md-2 input-group-prepend">
					    <span class="input-group-text" id="room_time">상영시간</span>
					  </div>
					    <input class="btn btn-secondary" type="button" value="&nbsp;&nbsp;생성&nbsp;&nbsp;">
				</div>
					  &nbsp;
				<%-- 회차 생성창 --%>
				<div class="col input-group">	  
					  <div class="row col col-md-10 input-group mb-3">
						  <div class="input-group-prepend">
						    <div class="input-group-text">
						      <input type="checkbox" aria-label="room-time" name="room_time" value="1" id="time1">
						    </div>
						  </div>
						  <input type="text" class="form-control" aria-label="time1" value="1회차 : 07:00 ~ 08:30">
					  </div>
					  <div class="row col col-md-10 input-group mb-3">
						  <div class="input-group-prepend">
						    <div class="input-group-text">
						      <input type="checkbox" aria-label="room-time" name="room_time" value="2" id="time2">
						    </div>
						  </div>
						  <input type="text" class="form-control" aria-label="time1" value="2회차 : 11:30 ~ 13:00">
					  </div>
					  <div class="row col col-md-10 input-group mb-3">
						  <div class="input-group-prepend">
						    <div class="input-group-text">
						      <input type="checkbox" aria-label="room-time" name="room_time" value="3" id="time3">
						    </div>
						  </div>
						  <input type="text" class="form-control" aria-label="time1" value="3회차 : 16:00 ~ 18:30">
					  </div>
					  <div class="row col col-md-10 input-group mb-3">
						  <div class="input-group-prepend">
						    <div class="input-group-text">
						      <input type="checkbox" aria-label="room-time" name="room_time" value="4" id="time4">
						    </div>
						  </div>
						  <input type="text" class="form-control" aria-label="time1" value="4회차 : 19:00 ~ 20:30">
					  </div>
					  <div class="row col col-md-10 input-group mb-3">
						  <div class="input-group-prepend">
						    <div class="input-group-text">
						      <input type="checkbox" aria-label="room-time" name="room_time" value="5" id="time5">
						    </div>
						  </div>
						  <input type="text" class="form-control" aria-label="time1" value="5회차 : 21:30 ~ 23:00">
					  </div>
				</div>
				
				
				<%-- 상영기간 --%>
		  			<div class="input-group mb-6 w-50">
					  <div class="input-group-prepend">
					    <span class="input-group-text" id="movie_date">상영기간</span>
					  </div>
					  <input type="date" class="form-control" placeholder="시작일(yy-mm-dd)" aria-label="Username" aria-describedby="basic-addon1">&nbsp;&nbsp;-&nbsp;&nbsp; 
					  <input type="date" class="form-control" placeholder="종료일(yy-mm-dd)" aria-label="Username" aria-describedby="basic-addon1">
					</div>
					<br>
				
				<%-- 버튼 그룹 --%>
					<div class="input-group mb-3 justify-content-center">
					  <div class="">
						<input class="btn btn-danger" type="submit" value="&nbsp;&nbsp;수정&nbsp;&nbsp;">
						<input class="btn btn-secondary" type="reset" value="&nbsp;&nbsp;리셋&nbsp;&nbsp;">
						<input class="btn btn-secondary" type="button" value="&nbsp;&nbsp;취소&nbsp;&nbsp;" onclick="history.back()">
					  </div>
					</div>
				</div>
			</form>

  		</div>
  	</div>
  </article>
  
  <nav id="mainNav" class="d-none d-md-block sidebar">
  <%--왼쪽 사이드바 --%>
  </nav>
  
  <div id="siteAds"></div>
  <%--페이지 하단 --%>
  <footer id="pageFooter"><%@ include file="..//inc/footer.jsp"%></footer>
</body>