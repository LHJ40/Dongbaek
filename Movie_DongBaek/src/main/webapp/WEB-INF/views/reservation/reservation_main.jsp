<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/reservation.css" rel="stylesheet" type="text/css">
<title>영화 예매 사이트</title>
<style>

</style>
<script type="text/javascript">
$(function() {
	// [영화선택] 영역의 네비바 클릭 시
	$(".nav-link").on("click", function(){
		$(".nav-link").removeClass("active");
		$(this).addClass("active");
		$("#selectMovie li").removeClass("selected");
		$("#selectTheater li").empty();
		$("#selectDate").css("display", "none");
		
		// [예매율순] 클릭 시
		if($("#descBookingRate").hasClass("active")){
			$.ajax({
				type : "get", 
				url : "descBookingRate", 
				dataType : "json", 
			})
			.done(function(movie) {
				let res = "<ul>";
				for(let i = 0; i < movie.length; i++) {
					res += "<li><a href='#'><i><img src='${pageContext.request.contextPath }/resources/img/grade_15.png' alt='15세'></i>"
					res += "<span class='text' data-movie-num=" + movie[i].movie_num + " data-movie-name=" + movie[i].movie_name_kr + ">" + movie[i].movie_name_kr + "</span></a></li>"
				}
				res += "</ul>";
				
				$("#selectMovie").html(res);
			})
			.fail(function() { // 요청 실패 시
				alert("요청 실패!");
			});
			
		}else{	// [가나다순] 클릭 시			
			$.ajax({
				type : "get", 
				url : "ascMovieName", 
				dataType : "json", 
			})
			.done(function(movie) {
				let res = "<ul>";
				for(let i = 0; i < movie.length; i++) {
					res += "<li><a href='#'><i><img src='${pageContext.request.contextPath }/resources/img/grade_15.png' alt='15세'></i>"
					res += "<span class='text' data-movie-num=" + movie[i].movie_num + " data-movie-name=" + movie[i].movie_name_kr  + " data-movie-poster=" + movie[i].movie_poster + ">" + movie[i].movie_name_kr + "</span></a></li>"
				}
				res += "</ul>";
				
				$("#selectMovie").html(res);
			})
			.fail(function() { // 요청 실패 시
				alert("요청 실패!");
			});
		}
	});
	
	
	// [영화명] 클릭시
	$(document).on("click", "#selectMovie li", function(){
		$("#selectMovie li").removeClass("selected");
		$(this).addClass("selected");
		
		let movieNum = $(".selected span").attr("data-movie-num");
		let movieName = $(".selected span").attr("data-movie-name");
		let moviePoster = $(".selected span").attr("data-movie-poster");

		$("#movieInfo").css("display", "flex");
		$(".movie_name_kr").html(movieName);	// [선택정보] 영역에 영화명 출력
		$(".movie_poster img").attr("src", moviePoster);	// [선택정보] 영역에 영화포스터 출력
		
		// 극장명 출력
		$("#selectTheater").css("display", "flex");
		$.ajax({
			type : "post", 
			url : "ReservationStep1Servlet", 
			data : {"movie_num" : movieNum}, 
			dataType : "json", 
		})
		.done(function(theater) {
			let res = "<ul>";
			for(let i = 0; i < theater.length; i++) {
				res += "<li><a href='#'><span class='text' data-theater-num=" + theater[i].theater_num + " data-theater-name=" + theater[i].theater_name + ">" + theater[i].theater_name + "</span></a></li>"
			}
			res += "</ul>";
			
			$("#selectTheater").html(res);
		})
		.fail(function() { // 요청 실패 시
			$("#selectTheater").html("요청 실패!");
		});
	});
	
	
	// [극장명] 클릭 시
	$(document).on("click", "#selectTheater li", function() {
		$("#selectTheater li").removeClass("selected");
		$(this).addClass("selected");
		
		let theaterName = $("#selectTheater .selected span").text();
		$("#theaterInfo").html("극장 (" + theaterName + ")");	// [선택정보] 영역에 극장명 출력
		
		// 날짜 출력
		$("#selectDate").css("display", "flex");
		let movieNum = $("#selectMovie .selected span").attr("data-movie-num");
		let theaterNum = $("#selectTheater .selected span").attr("data-theater-num");
		$.ajax({
			type : "post", 
			url : "ReservationStep2Servlet", 
			data : {"movie_num" : movieNum, "theater_num" : theaterNum}, 
			dataType : "json", 
		})
		.done(function(date) {
			
			const playDate = new Date();
			let year = playDate.getFullYear();
			let month = playDate.getMonth() + 1;
			let dataDay = playDate.getDate();
			let dayLabel = playDate.getDay();	// 요일
			let dayNumber = Number(dataDay);
			
			$(".playMonth").html("<h4>" + month + "<small>월</small></h4>");
						
		})
		.fail(function() { // 요청 실패 시
			$("#selectDate").html("요청 실패!");
		});
	});
});
</script>
</head>
<body>
 <%--네비게이션 바 영역 --%>
 <header id="pageHeader"><%@ include file="../inc/header.jsp"%></header>
 
  <article id="mainArticle">
  <%--본문내용 --%>
		<h2>영화 예매</h2>
		<div class="container-fluid reservation_con" >
	            <div class="row row1">
	            	<%-- 영화목록 파트 --%>
	                <div class="col-4">
	                	<h5>영화</h5>
	                	<ul class="nav nav-tabs">
							<li class="nav-item">
								<a class="nav-link active" href="#">예매율순</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#">가나다순</a>
							</li>
						</ul>
					 	<br>
					 	<div id="selectMovie">
					 		<ul>
					 			<c:forEach var="movie" items="${movieList }">
						 			<li>
	 						 			<a href="#">
						 					<i><img src="${pageContext.request.contextPath }/resources/img/grade_15.png" alt="15세"></i>
						 					<span class="text" data-movie-num="${movie.movie_num }" data-movie-name="${movie.movie_name_kr}" data-movie-poster="${movie.movie_poster }">${movie.movie_name_kr }</span>
						 				</a>
						 			</li>					 				
					 			</c:forEach>
					 		</ul>
				 		</div>
	                </div>
	                
	                <%-- 극장목록 파트 --%>
	               <div class="col-2">
		                <h5>극장</h5>
					 	<br>
					 	<div id="selectTheater" style="display: none;">
					 	</div>	
	               </div>
	                
	                <%-- 날짜목록 파트 --%>
	                <div class="col-1">
						<h5>날짜</h5>
						<br>
						<div id="selectDate" style="display: none;">
							<div class="playMonth"></div>
							<div class="day">
								<span class="playWeekday"></span>
								<span class="playDate"></span>								
							</div>
						</div>
					</div>
					
					<%-- 상영목록 파트 --%>
	                <div class="col-4">
	                	<h5>시간</h5>
				  		<div id="playType">
				  			<img src="${pageContext.request.contextPath }/resources/img/sun.png" alt="해" width="15px"> 조조
				  			<img src="${pageContext.request.contextPath }/resources/img/moon.png" alt="달" width="15px"> 심야
				  		</div>
				  		<div id="playTable">
					  		<table>
					  			<tr>
					  				<th>1관 (총 60석)</th>
					  			</tr>
					  			<tr>
					  				<td>
					  					<button>12:10</button> n석 &nbsp;&nbsp;
					  					<button>15:25</button> n석 &nbsp;&nbsp;<br>
					  					<button>18:52</button> n석 &nbsp;&nbsp;
					  				</td>
					  			</tr>
					  			<tr>
				  					<th>동백관 (총 60석)</th>
					  			</tr>
					  			<tr>
					  				<td>
					  					<button>09:00</button>
					  						<img src="${pageContext.request.contextPath }/resources/img/sun.png" alt="해" width="15px"> n석 &nbsp;&nbsp;
					  					<button>14:10</button> n석 &nbsp;&nbsp;
					  				</td>
					  			</tr>
					  		</table>
				  		</div>
                	</div>
            	</div>
	            
	            <%-- 선택사항 안내 구간, 다음으로 넘어가기 --%>
	            <div class="row row2">
	            	<%-- 선택한 영화 포스터와 영화명 노출 --%>
	                <div class="col-3">
						<h5>선택 정보</h5>
						<div class="row p-0" id="movieInfo"  style="display: none;">
							<div class="col-4 movie_poster"><img src="" alt="선택영화포스터" height="90px"></div>
					  		<div class="col-8 movie_name_kr"></div><br>
						</div>
					</div>
					<%-- 선택한 상영스케줄 노출 --%>
	                <div class="col-3">
<%-- 	                	<table> 선택요소들이 ()안에 들어가게 하기 (인원은 x) --%>
<!-- 				  			<tr><td id="theaterInfo"></td></tr> -->
<!-- 				  			<tr><td>일시 (yyyy.mm.dd(k) hh:jj)</td></tr> -->
<!-- 				  			<tr><td>상영관 (n관 m층)</td></tr> -->
<!-- 				  		</table> -->
						<div id="theaterInfo"></div>
						<div id="dateInfo"></div>
						<div id="roomInfo"></div>
	                </div>
	                <%-- 미선택 사항 노출 --%>
	                <div class="col-3">
	                	<b>좌석 선택 &nbsp;&nbsp;> &nbsp;결제</b>
	                </div>
	                <%-- 다음 페이지 이동 버튼 --%>
	                <div class="col-3">
			  			<button class="btn btn-danger" id="nextBtn" onclick="location.href='reservation_seat'"> next ></button>
	                </div>
	            </div>
	        </div>
  
  </article>
  
  <nav id="mainNav">
  <%--왼쪽 사이드바 --%>
  </nav>
  
  <div id="siteAds"></div>
  <%--페이지 하단 --%>
  <footer id="pageFooter"><%@ include file="../inc/footer.jsp"%></footer>
</body>
