<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
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
		
		// 1) 메인페이지(home.jsp) 네비바의 [영화] 클릭 후 각 영화의 예매하기 버튼 클릭 시
		// 2) 영화 상세정보의 [예매하기] 버튼 클릭 시
		// => 파라미터로 넘어온 영화번호에 해당하는 영화를 찾아서 "selected" 클래스 추가하기
		let movie_num = $("#movieNum").val();
		
		if(movie_num != undefined){
			
			for(let i = 0; i < 10000; i++) {
						
				let movieNum = $("#selectMovie li a span").eq(i).attr("data-movie-num");
				
				if(movieNum == movie_num){
					$("#selectMovie li").eq(i).addClass("selected");
				}
			}
		} else {
			alert("movie_num " + movie_num +"입니다");
		}

		// [영화선택] 영역의 네비바 클릭 시
		$(".nav-link").on("click", function(){
			$(".nav-link").removeClass("active");	// 기존에 선택된 네바바 선택 해제
			$(this).addClass("active");				// 선택한 네비바 표시
			
			$("#selectMovie li").removeClass("selected");	// 선택된 영화 선택 해제
			$("#selectMovie li").removeClass("selected");	// 선택된 영화 선택 해제
			$("#selectTheater li").css("display", "none");	// 극장 목록 안 보이게 하기
			$("#selectDate").css("display", "none");		// 날짜 목록  안 보이게 하기
			$("#selectTime").css("display", "none");		// 시간 목록  안 보이게 하기
			$("#selectTime li").empty();					// 시간 목록에서 선택된 시간 선택 해제
			
			
			let url = "";
			
			if($("#descBookingRate").hasClass("active")){	// [예매율순] 클릭 시
				url = "DescBookingRate";
				
			}else{	// [가나다순] 클릭 시
				url = "AscMovieName";
			}
			$.ajax({
				type : "get", 
				url : url,  
				dataType : "json", 
			})
			.done(function(movie) {
				let res = "";
				res += "<ul>";
				for(let i = 0; i < movie.length; i++) {
					let movieGrade = "";
					if(movie[i].movie_grade == '전체관람가'){
						movieGrade = "all";
					}
					if(movie[i].movie_grade == '12세이상관람가'){
						movieGrade = "12";
					}
					if(movie[i].movie_grade == '15세이상관람가'){
						movieGrade = "15";
					}
					if(movie[i].movie_grade == '청소년관람불가'){
						movieGrade = "18";
					}
					res += "<li>" + 
								"<a href='#'>" + 
									"<i><img src='${pageContext.request.contextPath }/resources/img/grade_" + movieGrade + ".png' alt='15세'></i>" + 
									"<span class='text' data-movie-num='" + movie[i].movie_num + "' data-movie-name=" + movie[i].movie_name_kr  + " data-movie-poster=" + movie[i].movie_poster + ">" + movie[i].movie_name_kr + "</span>" + 
								"</a>" + 
							"</li>"
				}
				res += "</ul>";
				
				$("#selectMovie").html(res);
			})
			.fail(function() { // 요청 실패 시
				alert("요청 실패!");
			});
		});
		
		
		// [영화명] 클릭시 ==============================================================================================================
		$(document).on("click", "#selectMovie li", function(){
			$("#selectMovie li").removeClass("selected");	// 기존에 선택된 영화 선택 해제
			$(this).addClass("selected");					// 선택한 영화 표시
			selectMovieAction();
		});	
		
		if($("#selectMovie li").hasClass("selected")){
			selectMovieAction();			
		}
					
		
		// [극장명] 클릭 시 ============================================================================================================
		$(document).on("click", "#selectTheater li", function() {
			$("#selectTheater li").removeClass("selected");		// 기존에 선택된 극장 선택 해제
			$("#selectDate").css("display", "none");		// 날짜 목록  안 보이게 하기
			$("#selectTime").css("display", "none");		// 시간 목록  안 보이게 하기
			$("#selectTime li").empty();					// 시간 목록에서 선택된 시간 선택 해제
			
			$(this).addClass("selected");	// 선택된 극장 표시
			
			let theaterName = $("#selectTheater .selected span").text();
			
			// [선택정보] 출력
			$("#theaterInfo span").eq(1).html("<b>" + theaterName  + "</b>");	// 극장명 출력
			
			// 날짜 출력
			$("#selectDate").css("display", "flex");
	
			const now = new Date("2023-06-19");
			let year = now.getFullYear();
			let month = now.getMonth();
			let thisMonth = month + 1;
			let date = now.getDate();	
			let lastDate = new Date(year, month + 1, 0).getDate();	// 달의 마지막 날
			
			let today = new Date(year, month, date);
			let dayLabel = today.getDay();	// 요일
			let weekDay = ['일', '월', '화', '수', '목', '금', '토'];
			let todayLabel = weekDay[today.getDay()];
			let showDateRange = 10;	// 보여주기로 한 날짜 범위(10일)
			let dateDiff = lastDate - date;	// 오늘과 달의 마지막 날의 차
	
			let res = "";
			if(dateDiff > showDateRange){	// dateDiff(오늘과 달의 마지막 날의 차이)가 10보다 클 때
				// 년도 출력
				res += "<div class='col-12'>" + 
							"<div class='row'>" + 
								"<div class='col-12 playYear'>" + year + "년</div>" + 
							"</div>";
					// 월 출력
					res += "<div class='month'>" + 
								"<span class='playMonth'><h4>" + thisMonth + "</h4></span><span style='display:table-cell;'>월</span>" + 
							"</div>" + 
							"<div class='day'><ul>";
							
				for(let i = date; i <= date + showDateRange; i++){
					today = new Date(year, month, i);	// 오늘 날짜 넣기
					dayLabel = today.getDay();			// 오늘 날짜의 요일 인덱스
					todayLabel = weekDay[dayLabel];
			
					// 요일 & 일 출력
					res += "<li><a href='#'>" + 
								"<span class='playTodayLabel'>" + todayLabel + "</span>" + // 요일
								"<span class='playDate'>" +  i + "</span><br>" + 	// 일
							"</a>";
					let selectedDate = new Date(year, month, i);
					res += "<input type='hidden' class='selectedDate' value='" + selectedDate + "'></li>";
				}
				res += "</ul></div></div>";
				
			}else {	// dateDiff(오늘과 달의 마지막 날의 차이)가 10보다 작을 때 -----------------------------------------------------------------
				if(month != 11){	// 12월이 아닐 때
				
					// 년도 출력
					res += "<div class='col-12'>" + 
								"<div class='row'>" + 
									"<div class='col-12 playYear'>" + year + "년</div>" + 
								"</div>";
						// 월 출력
						res += "<div class='month'>" + 
									"<span class='playMonth'><h4>" + thisMonth + "</h4></span><span>월</span>" + 
								"</div>" + 
								"<div class='day'><ul>";
								
					for(let i = date; i <= lastDate; i++){
						today = new Date(year, month, i);	// 오늘 날짜 넣기
						dayLabel = today.getDay();			// 오늘 날짜의 요일 인덱스
						todayLabel = weekDay[dayLabel];
				
						// 요일 & 일 출력
						res += "<li><a href='#'>" + 
									"<span class='playTodayLabel'>" + todayLabel + "</span>" + // 요일
									"<span class='playDate'>" +  i + "</span><br>" + 	// 일
								"</a>";
						selectedDate = new Date(year, month, i);
						res += "<input type='hidden' class='selectedDate' value='" + selectedDate + "'></li>";
					}
					res += "</ul></div></div>";
					
					// 년도 출력
					res += "<div class='col-12'>" + 
								"<div class='row'>" + 
									"<div class='col-12 playYear'>" + year + "년</div>" + 
								"</div>";
						// 월 출력
						res += "<div class='month'>" + 
									"<span class=playMonth'><h4>" + (thisMonth + 1) + "</h4></span><span>월</span>" + 
								"</div>" + 
								"<div class='day'><ul>";
								
					for(let i = 1; i <= showDateRange - dateDiff; i++){
						today = new Date(year, month + 1, i);	// 오늘 날짜 넣기
						dayLabel = today.getDay();			// 오늘 날짜의 요일 인덱스
						todayLabel = weekDay[dayLabel];
				
						// 요일 & 일 출력
						res += "<li><a href='#'>" + 
									"<span class='playTodayLabel'>" + todayLabel + "</span>&nbsp;&nbsp;" + // 요일
									"<span class='playDate'>" +  j + "</span><br>" + 	// 일
								"</a>";
						selectedDate = new Date(year, month + 1, i);
						res += "<input type='hidden' class='selectedDate' value='" + selectedDate + "'></li>";
					}
					res += "</ul></div></div>";
					
				}else{	// 12월일 때 ---------------------------------------------------------------------------------------------------------
				// 년도 출력
					res += "<div class='col-12'>" + 
								"<div class='row'>" + 
									"<div class='col-12 playYear'>" + year + "년</div>" + 
								"</div>";
						// 월 출력
						res += "<div class='month'>" + 
									"<span class='playMonth'><h4>" + thisMonth + "</h4></span><span>월</span>" + 
								"</div>" + 
								"<div class='day'><ul>";
								
					for(let i = date; i <= lastDate; i++){
						today = new Date(year, month, j);	// 오늘 날짜 넣기
						dayLabel = today.getDay();			// 오늘 날짜의 요일 인덱스
						todayLabel = weekDay[dayLabel];
				
						// 요일 & 일 출력
						res += "<li><a href='#'>" + 
									"<span class='playTodayLabel'>" + todayLabel + "</span>&nbsp;&nbsp;" + // 요일
									"<span class='playDate'>" +  i + "</span><br>" + 	// 일
								"</a>";
						selectedDate = new Date(year, month, i);
						res += "<input type='hidden' class='selectedDate' value='" + selectedDate + "'></li>";
					}
					res += "</ul></div></div>";
					
					// 년도 출력
					res += "<div class='col-12'>" + 
								"<div class='row'>" + 
									"<div class='col-12 playYear'>" + (year + 1) + "년</div>" + 
								"</div>";
						// 월 출력
						res += "<div class='month'>" + 
									"<span class='playMonth'><h4>" + (thisMonth - 11) + "</h4></span><span class='col-2 p-0'>월</span>" + 
								"</div>" + 
								"<div class='day'><ul>";
								
					for(let i = 1; i <= showDateRange - dateDiff; i++){
						today = new Date(year + 1, month - 11, i);	// 오늘 날짜 넣기
						dayLabel = today.getDay();			// 오늘 날짜의 요일 인덱스
						todayLabel = weekDay[dayLabel];
				
						// 요일 & 일 출력
						res += "<li><a href='#'>" + 
									"<span class='playTodayLabel'>" + todayLabel + "</span>&nbsp;&nbsp;" + // 요일
									"<span class='playDate'>" +  i + "</span><br>" + 	// 일
								"</a>";
						selectedDate = new Date(year + 1, month - 12, i);
						res += "<input type='hidden' class='selectedDate' value='" + selectedDate + "'></li>";
					}
					res += "</ul></div></div>";
													
				}
			}
			res += "<br>";
			$("#selectDate").html(res);	
						
		});
		
		
		// [날짜] 클릭 시 ==============================================================================================================
		$(document).on("click", "#selectDate li", function() {
			$("#selectDate li").removeClass("selected");
			$(this).addClass("selected");
			
			// [선택정보] 출력
			$("#dateInfo").css("display", "flex");
			let date = $("#selectDate .selected .selectedDate").val();
			let selectedDate = new Date(date);
			let playDate = selectedDate.getFullYear() + "-" + (selectedDate.getMonth() + 1) + "-" + selectedDate.getDate();	// String 형태로 ReservationController에 보내기 위해 형태지정
			$("#dateInfo span").eq(1).html("<b>" + playDate  + "</b>");	// 날짜 출력
			
			let movieNum = $("#selectMovie .selected span").attr("data-movie-num");
			let theaterNum = $("#selectTheater .selected span").attr("data-theater-num");
			
			$.ajax({
				type : "post", 
				url : "PlayList", 
				data : {"movie_num" : movieNum, "theater_num" : theaterNum, "play_date" : playDate}, 
				dataType : "json", 
			})
			.done(function(play) {
				
				$("#selectTime").css("display", "flex");
				
				let res ="";
				res += "<hr>";
				for(let i = 0; i < play.length; i++){
					// 상영 시작 시간 설정
					let playStartTime = new Date(play[i].play_start_time);
					let playStartHour = playStartTime.getHours();
					let playStartMin = playStartTime.getMinutes();
					
					// 상영 종료 시간 설정
					let playEndTime = new Date(play[i].play_end_time);
					let playEndHour = playEndTime.getHours();
					let playEndMin = playEndTime.getMinutes();
	
					// 예매할 당시의 시간이 상영 시작 시간보다 20분 전인 경우만 선택 가능하도록 설정
					let reservationTime = new Date();	// 예매 진행하고 있는 시간
// 						let reservationTime = new Date("2023-06-18T16:45:00");	// 예매 진행하고 있는 시간
					let gap = playStartTime.getTime() - reservationTime.getTime();	//  (영화 상영 시작 시간) - (예매 진행하고 있는 시간)
					let convertTime = Math.round(gap / 1000 / 60);
					if(convertTime < 20){
						res += "<li class='disabled'>" + 
						"<a data-play-num=" + play[i].play_num + " data-movie-num=" + play[i].movie_num + " data-theater-num=" + play[i].theater_num + " data-play-date=" + play[i].play_date + " data-room-num=" + play[i].room_num + ">" + 
							"<span class='playTimeType'>" + play[i].play_time_type + "</span>" +
							"<span class='time'>" + 
								"<strong title='상영시작'>" + play[i].play_start_time + " </strong>" + 
								"<em title='상영종료'> ~ " + play[i].play_end_time + "</em>" + 
// 								"<strong title='상영시작'>" + playStartHour + ":" + playStartMin + " </strong>" + 
// 								"<em title='상영종료'> ~ " + playEndHour + ":" + playEndMin + "</em>" + 
							"</span>" +
							"<span class='movie' title='영화'><strong title=" + play[i].movie_name_kr + ">" + play[i].movie_name_kr + "</strong></span>" +
							"<span class='theater'><p class='theater' title='극장'>" + play[i].theater_name + "</p><p class='room' title='상영관'>" + play[i].room_name + "</p></span>" + 
						"</a>" + 
					"</li><hr>"
					}else {
						res += "<li>" + 
						"<a data-play-num=" + play[i].play_num + " data-movie-num=" + play[i].movie_num + " data-theater-num=" + play[i].theater_num + " data-play-date=" + play[i].play_date + " data-room-num=" + play[i].room_num + ">" + 
							"<span class='playTimeType'>" + play[i].play_time_type + "</span>" +
							"<span class='time'>" + 
								"<strong title='상영시작'>" + play[i].play_start_time + " </strong>" + 
								"<em title='상영종료'> ~ " + play[i].play_end_time + "</em>" + 
							"</span>" +
							"<span class='movie' title='영화'><strong title=" + play[i].movie_name_kr + ">" + play[i].movie_name_kr + "</strong></span>" +
							"<span class='theater'><p class='theater' title='극장'>" + play[i].theater_name + "</p><p class='room' title='상영관'>" + play[i].room_name + "</p></span>" + 
						"</a>" + 
					"</li><hr>"
					}
					
				}
				$("#selectTime>ul").html(res);
						
			})
			.fail(function() { // 요청 실패 시
				$("#selectTime").html("요청 실패!");
			});
			
		});
		
		// [시간] 클릭 시 ===========================================================================================================================
		$(document).on("click", "#selectTime li", function() {
			$("#selectTime li").removeClass("selected");
			$(this).addClass("selected");
			
			// [선택정보] 출력
			let roomName = $(".selected a span p.room").text();
			let playStartTime = $(".selected a span.time strong").text();
			$("#roomInfo").css("display", "flex");
			$("#roomInfo span").eq(1).html("<b>" + roomName  + "</b>");	// 상영관명 출력
			$("#dateInfo span").eq(2).html("<b>( " + playStartTime  + ")</b>");	// 상영시작시간 출력
		});
			
	});
	
	// [next] 버튼 클릭 시 ===============================================================================================================================================
	// 로그인하지 않은 상태에서 [next] 버튼 클릭시
	// member_login_form 서블릿 요청을 통해 로그인 페이지(member/member_login_form.jsp)으로 이동
	function login(){
		location.href = "member_login_form";		
	}
	
	// 로그인 상태에서 [next] 버튼 클릭시
	// reservation_seat 서블릿 요청을 통해 좌석예매 페이지(reservation.reservation_seat.jsp)로 이동
	function reservationSeat() {
		let playNum = $("#selectTime .selected a").attr("data-play-num");		// 선택한 상영 번호	
		$("input[name=play_num]").attr("value",playNum);	// 선택한 상영정보 hidden 타입의 input 태그에 value 값으로 넣기
		
		location.href = "reservation_seat";
	}
	
	
	// [영화선택]시 수행되는 함수
	// 각 영역의 정보 지우기
	// 극장명 출력하기
	function selectMovieAction() {
			$("#selectTheater li").css("display", "none");	// 극장 목록 안 보이게 하기
			$("#selectDate").css("display", "none");		// 날짜 목록  안 보이게 하기
			$("#selectTime").css("display", "none");		// 시간 목록  안 보이게 하기
			$("#selectTime li").empty();					// 시간 목록에서 선택된 시간 선택 해제
			$("#theaterInfo span").eq(1).empty();			// [선택정보] 영역의 극장 정보 지우기
			$("#dateInfo span").eq(1).empty();				// [선택정보] 영역의 시간 정보1 지우기
			$("#dateInfo span").eq(2).empty();				// [선택정보] 영역의 시간 정보2 지우기
			$("#roomInfo span").eq(1).empty();				// [선택정보] 영역의 상영관 정보 지우기
			
			let movieNum = $(".selected span").attr("data-movie-num");		// 선택한 영화 번호
			let movieName = $(".selected span").attr("data-movie-name");	// 선택한 영화명
			let moviePoster = $(".selected span").attr("data-movie-poster");// 선택한 영화의 포스터
			
			// [선택정보] 출력
			$("#movieInfo").css("display", "flex");
			$(".movie_name_kr").html("<b>" + movieName + "</b>");	// 영화명 출력
			$(".movie_poster img").attr("src", moviePoster);	// 영역에 영화포스터 출력
		
		// 극장명 출력
		$("#selectTheater").css("display", "block");
		$.ajax({
			type : "post", 
			url : "TheaterList", 
			data : {"movie_num" : movieNum}, 
			dataType : "json", 
		})
		.done(function(theater) {
			let res = "";
			res += "<ul>";
			for(let i = 0; i < theater.length; i++) {
				res += "<li>" + 
							"<a href='#'>" + 
								"<span class='text' data-theater-num=" + theater[i].theater_num + " data-theater-name=" + theater[i].theater_name + ">" + theater[i].theater_name + "</span>" + 
							"</a>" + 
						"</li>"
			}
			res += "</ul>";
			
			$("#selectTheater").html(res);
		})
		.fail(function() { // 요청 실패 시
			$("#selectTheater").html("요청 실패!");
		});
	}
	</script>
	</head>
	<body>
	<%--네비게이션 바 영역 --%>
	<header id="pageHeader"><%@ include file="../inc/header.jsp"%></header>
	
	
	<input type="hidden" id="movieNum" value="${param.movie_num}">
	<article id="mainArticle">
	<%--본문내용 --%>
	<h2>영화 예매</h2>
		<div class="container-fluid" >
	        <div class="row row1">
	        	<%-- 영화목록 파트 --%>
	            <div class="col-4 p-0">
					<div class="title-area">영화</div>
					<div class="list-area p-2">
	                	<ul class="nav nav-tabs">
							<li class="nav-item">
								<a class="nav-link active" id="descBookingRate" href="#">예매율순</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" id="ascMovieName" href="#">가나다순</a>
							</li>
						</ul>
					 	
					 	<div class="mt-3" id="selectMovie">
					 		<ul>
					 			<c:forEach var="movie" items="${movieList }">
						 			<li>
	 						 			<a href="#">
						 					<%-- 해당영화의 등급에 해당하는 이미지 출력 --%>
											<c:if test="${movie.movie_grade eq '전체관람가'}">
												<img src="${pageContext.request.contextPath }/resources/img/grade_all.png" alt="전체" class="img-rounded" >
											</c:if>
											<c:if test="${movie.movie_grade eq '12세이상관람가'}">
												<img src="${pageContext.request.contextPath }/resources/img/grade_12.png" alt="12" class="img-rounded" >
											</c:if>
											<c:if test="${movie.movie_grade eq '15세이상관람가'}">
												<img src="${pageContext.request.contextPath }/resources/img/grade_15.png" alt="15" class="img-rounded" >
											</c:if>
											<c:if test="${movie.movie_grade eq '청소년관람불가'}">
												<img src="${pageContext.request.contextPath }/resources/img/grade_18.png" alt="18" class="img-rounded" >
											</c:if>
						 					<span class="text" data-movie-num="${movie.movie_num }" data-movie-name="${movie.movie_name_kr}" data-movie-poster="${movie.movie_poster }">${movie.movie_name_kr }</span>
						 				</a>
						 			</li>					 				
					 			</c:forEach>
					 		</ul>
				 		</div>
				 	</div>
	            </div>
	            
	            <%-- 극장목록 파트 --%>
	            <div class="col-2 p-0">
	                <div class="title-area">극장</div>
	                <div class="list-area p-2">
				 		<div class="mt-3" id="selectTheater" style="display: none;">
				 		
				 		</div>
				 	</div>
	            </div>
	            
				<%-- 날짜목록 파트 --%>
				<div class="col-2 p-0">
	           		<div class="title-area">날짜</div>
	           		<div class="list-area p-2">
						<div class="row mt-3" id="selectDate" style="display: none;">
						
						</div>
					</div>
				</div>
				
				<%-- 상영목록 파트 --%>
				<div class="col-4 p-0">
	            	<div class="title-area">시간</div>
	            	<div class="list-area p-2">
				  		<div id="playType">
				  			<img src="${pageContext.request.contextPath }/resources/img/sun.png" alt="해" width="15px"> 조조
				  			<img src="${pageContext.request.contextPath }/resources/img/moon.png" alt="달" width="15px"> 심야
				  		</div>
				  		<div class="mt-3" id="selectTime" style="display: none;">
				  			<ul></ul>
				  		</div>
				  	</div>
	           	</div>
	       	</div>
	            
			<%-- 선택사항 안내 구간, 다음으로 넘어가기 --%>
			<div class="row row2">
				<%-- 선택한 영화 포스터와 영화명 노출 --%>
				<div class="col-3">
					<h5>선택 정보</h5>
					<div class="row p-0" id="movieInfo" style="display: none;">
						<div class="col-4 movie_poster"><img src="" alt="선택영화포스터" height="90px"></div>
					  	<div class="col-8 movie_name_kr"></div><br>
					</div>
				</div>
				
				<%-- 선택한 상영스케줄 노출 --%>
				<div class="col-3">
					<div id="theaterInfo" style="display: table;">
						<span style="display: table-cell;">극장&nbsp;</span>
						<span style="display: table-cell;"></span>
					</div>
					<div id="dateInfo" style="display: table;">
						<span style="display: table-cell;">날짜&nbsp;</span>
						<span style="display: table-cell;"></span>
						<span style="display: table-cell;"></span>
					</div>
					<div id="roomInfo" style="display: table;">
						<span style="display: table-cell;">상영관&nbsp;</span>
						<span style="display: table-cell;"></span>
					</div>
				</div>
				<%-- 미선택 사항 노출 --%>
				<div class="col-3">
					<b>좌석 선택 &nbsp;&nbsp;> &nbsp;결제</b>
				</div>
				
				<%-- 다음 페이지 이동 버튼 --%>
				<div class="col-3">
					<form action="reservation_seat" method="post">
						<input type="hidden" name="play_num" value="" />						
						<%-- 
						로그인 여부 확인하여 
						로그인 시 reservation_seat() 함수를 실행하여 reservation_seat.jsp 페이지로 이동
						미로그인 시 lonin() 함수 실행하여 모달창으로 '로그인 필요' 출력 후 로그인 페이지(member_login_form.jsp)로 이동
						 --%>
						<c:choose>
							<c:when test="${empty member_id }">						
								<button type="button" class="btn btn-danger" id="emptyMemberId" data-toggle="modal" data-target="#needLogin">next ></button>
							</c:when>
							<c:otherwise>
								<button class="btn btn-danger" id="nextBtn" onclick="reservationSeat()"> next ></button>
							</c:otherwise>
						</c:choose>
					
						<%-- 미로그인시 보여줄 모달창 --%>
						<div class="modal fade" id="needLogin" tabindex="-1" role="dialog" aria-labelledby="needLoginTitle" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									 <div class="modal-header">
										<h5 class="modal-title" id="needLoginTitle">로그인 필요</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										로그인이 필요한 서비스입니다.<br>
										로그인 페이지로 이동하시겠습니까?
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-danger"  onclick="login()">확인</button>
										<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
									</div>
								</div>
							</div>
						</div><!-- 모달 영역 끝 -->
					</form>
				</div>	<!-- [다음 페이지 이동 버튼] 끝  -->
			</div> <!-- [선택사항 안내 구간, 다음으로 넘어가기 영역] 끝 -->
		</div>	<!-- container-fluid 영역 끝 -->
	</article>
  
  <nav id="mainNav">
  <%--왼쪽 사이드바 --%>
  </nav>
  
  <div id="siteAds"></div>
  <%--페이지 하단 --%>
  <footer id="pageFooter"><%@ include file="../inc/footer.jsp"%></footer>
</body>
