<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
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
	.container-top{
		margin: 3rem;
	}
	aside{
		margin: 10px;
		background-color: #d5b59c;
	}
	
	/* 예매 선택 구간 */
	/* 크기 조절 */
	.container-fluid{
		width: 900px;
		margin: 1rem;
		padding-left: 2rem;
		border: 2px solid #aaa;
	/* 	background-color: #d5b59c; */
	}
	div{
		background-color: transparent;
	}
	.container-fluid h5{
		text-align: center;
		font-weight: bold;
	}
	
	/* 선택사항 안내 구간 */
	/* 위 파트와 구별을 위한 색상 부여 */
	
	#seat-part{
		text-align: center;
	}
	#seat-part>hr{
		border: 0;	/* 두께를 지정하려면 기본 border을 0으로 설정해야함 */
		height: 3px;
		background-color: #ccc;
		width: 400px;
	}
	.border {
		border: 3px solid #aaa;
	}
	
	#beforeBtnArea{
		position: absolute;
		bottom: 5px;
		text-align: left;
	}
	#personType>input{
		width: 50px;
		height: 25px;
	}
	#seatType{
		border: 1px solid #999;
		font-size: 0.8em;
	}
	.unable{
		width: 0.8rem;
		height: 0.8rem;
		background-color: black;
	}
	.check{
		width: 0.8rem;
		height: 0.8rem;
		background-color: blue;
	}
	.handi{
		width: 0.8rem;
		height: 0.8rem;
		background-color: green;
		
	}
	.align-left{
		border-bottom:2px solid black;
		border-left: 2px solid black;
		border-right: 2px solid black;
		color: gray;
		left: 10px;
		position: relative;
		margin-right: 24rem;
	}
	.align-right{
		border-top:2px solid black;
		border-left: 2px solid black;
		border-right: 2px solid black;
		color: gray;
		right: 10px;
		position: absolute;
		margin-right: 7rem;
	}
	.vertical-center {
		vertical-align: middle;
	}
	
</style>
<script type="text/javascript">
	
	$(function() {
		$(".seatRow > button").on("click", function() {
// 			$(this).removeClass(".seat");
// 			$(this).addClass(".check");
			$(this).css("background-color", "blue");
		});
	});
	
	$(function(){
		let res = "";
		let row = ["A", "B", "C", "D", "E", "F"];
		for(let i = 0; i < 6; i++){
			for(let j = 1; j <= 10; j++){
				res += "<button id="+ row[i] + j +" class='seat' data-seat-num=" + (i * 10 + j) + " data-seat-name=" + row[i] + j + " style='width:30px; font-size:13px;'>" + row[i] + j + "</button>";				
			}
			res += "<br>";
		}
		$("#seat-part").html(res);
	});
	
	$(function() {
		$("#selectPeople button").on("click", function() {
			$("#seat-part").removeClass("disabled");
			$("button").removeClass("selected");
			$(this).addClass("selected");	
			
			let playNum = $(".roomInfo2").attr("data-play-num");
			$.ajax({
				type : "post", 
				url : "SelectPeople", 
				data : {"play_num" : playNum}, 
				dataType : "json", 
			})
			.done(function(orderTicketList) {
				for(let i = 0; i <orderTicketList.length; i++) {
					
					for(let j = 0; j < 60; j++){							
						let seatNum = $("#seat-part button").eq(j).attr("data-seat-num");
						
						if(orderTicketList[i].seat_num == seatNum){
							$("#seat-part button").eq(j).addClass("disabled")
						}
					}
				}
				
			})
			.fail(function() { // 요청 실패 시
				alert("요청 실패!");
			});
		});
	});
		
// 		$.ajax({
// 			type : "get", 
// 			url : "SelectTicketType", 
// 			dataType : "json", 
// 		})
// 		.done(function(movie) {
// 			let res = "<ul>";
// 			for(let i = 0; i < movie.length; i++) {
// 				res += "<li><a href='#'><i><img src='${pageContext.request.contextPath }/resources/img/grade_15.png' alt='15세'></i>"
// 				res += "<span class='text' data-movie-num=" + movie[i].movie_num + " data-movie-name=" + movie[i].movie_name_kr + ">" + movie[i].movie_name_kr + "</span></a></li>"
// 			}
// 			res += "</ul>";
			
// 			$("#selectMovie").html(res);
// 		})
// 		.fail(function() { // 요청 실패 시
// 			alert("요청 실패!");
// 		});
	
</script>
</head>
<body>
 <%--네비게이션 바 영역 --%>
 <header id="pageHeader"><%@ include file="../inc/header.jsp"%></header>
 
  <article id="mainArticle">
  <%--본문내용 --%>
 		<h2>영화 예매</h2>
		<div class="container-fluid" >
            <div class="row row1">
            	<div class="col-12">
	            	<div class="row title-area">
	            		<div class="col-12">
	            			<div class="row">
				            	<div class="col-12">
				            		<h5>관람인원선택</h5>
				            	</div>	            			
	            			</div>
            			</div>
            		</div>
            		
	            	<%-- 좌석 선택 파트 --%>
					<div class="row">
		                <div class="col-12 border">
		            		<div class="row mt-3">
		            			<div class="col-12" id="selectPeople">
									<div class="row mt-1">
										<label for="adult" class="col-2 col-form-label">성인</label>
			            				<div class="col-8 btn-toolbar" id="adult" role="toolbar" aria-label="Toolbar with button groups">
										  <div class="btn-group me-2" role="group" aria-label="First group">
										    <button type="button" class="btn btn-secondary">0</button>
										    <button type="button" class="btn btn-secondary">1</button>
										    <button type="button" class="btn btn-secondary">2</button>
										    <button type="button" class="btn btn-secondary">3</button>
										    <button type="button" class="btn btn-secondary">4</button>
										    <button type="button" class="btn btn-secondary">5</button>
										    <button type="button" class="btn btn-secondary">6</button>
										    <button type="button" class="btn btn-secondary">7</button>
										    <button type="button" class="btn btn-secondary">8</button>
										  </div>
										</div>
									</div>
									<div class="row m-1">
										<label for="teenager" class="col-2 col-form-label">청소년</label>
			            				<div class="col-8 btn-toolbar" id="teenager" role="toolbar" aria-label="Toolbar with button groups">
										  <div class="btn-group me-2" role="group" aria-label="First group">
										    <button type="button" class="btn btn-secondary">0</button>
										    <button type="button" class="btn btn-secondary ">1</button>
										    <button type="button" class="btn btn-secondary">2</button>
										    <button type="button" class="btn btn-secondary">3</button>
										    <button type="button" class="btn btn-secondary">4</button>
										    <button type="button" class="btn btn-secondary">5</button>
										    <button type="button" class="btn btn-secondary">6</button>
										    <button type="button" class="btn btn-secondary">7</button>
										    <button type="button" class="btn btn-secondary">8</button>
										  </div>
										</div>
									</div>
									<div class="row m-1">
										<label for="child" class="col-2 col-form-label">우대</label>
			            				<div class="col-8 btn-toolbar" id="child" role="toolbar" aria-label="Toolbar with button groups">
										  <div class="btn-group me-2" role="group" aria-label="First group">
										    <button type="button" class="btn btn-secondary">0</button>
										    <button type="button" class="btn btn-secondary">1</button>
										    <button type="button" class="btn btn-secondary">2</button>
										    <button type="button" class="btn btn-secondary">3</button>
										    <button type="button" class="btn btn-secondary">4</button>
										    <button type="button" class="btn btn-secondary">5</button>
										    <button type="button" class="btn btn-secondary">6</button>
										    <button type="button" class="btn btn-secondary">7</button>
										    <button type="button" class="btn btn-secondary">8</button>
										  </div>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-12 disabled" id="seat-part">
				                	<hr>
				                	<b>SCREEN 화면</b> <span class="door align-right">출구</span>
				                	<br>
				                	<div class="seatArea">
										
				                	</div>
									<div id="beforeBtnArea">	<%-- 영역왼쪽하단에 위치시키고 싶음 --%>
										<button class="btn btn-secondary" onclick="history.back()"> &lt; 이전</button>
									</div>
								</div>
							</div>
						</div>
					</div>
                <%-- 관람 인원 선택 파트 --%>
<!--                 <div class="col-2.5 border selectPart"> -->
<!-- 	                <h5>관람 인원 선택</h5> -->
<!-- 	                <hr> -->
<!-- 	                <div id="personType"> -->
<!-- 	                	성인 &nbsp;&nbsp;&nbsp;&nbsp;<input type="number"> <br> -->
<%-- 	                	청소년 &nbsp;&nbsp;<input type="number"> <br> 만 7세 초과 ~ 만 18세 미만 --%>
<%-- 	                	경로/어린이 <input type="number"> <br> 만 65세 이상 --%>
<!-- 	                </div> -->
<!-- 	                <div id="seatType"> -->
<!-- 	                	<button class="seat"></button> 예매가능 <br> -->
<!-- 	                	<button class="check"></button> 선택좌석 <br> -->
<!-- 	                	<button class="unable"></button> 예매완료 <br> -->
<!-- 	                	<button class="handi"></button> 장애인석 -->
<!-- 	                </div> -->
<!-- 	                <hr> -->
<!-- 	                <button class="btn btn-secondary"><img src="/resources/img/reset.png" width="20px"> 다시 선택하기</button> -->
<!--                 </div> -->
				</div>
            </div>
            
            <%-- 선택사항 안내 구간, 다음으로 넘어가기 --%>
            <div class="row row2">
            	<%-- 선택한 영화 포스터와 영화명 노출 --%>
				<div class="col-3">
					<h5>선택 정보</h5>
					<div class="row p-0" id="movieInfo">
						<div class="col-4 movie_poster"><img src="${reservation.movie_poster }" alt="선택영화포스터" height="90px"></div>
					  	<div class="col-8 movie_name_kr"><b>${reservation.movie_name_kr }</b></div><br>
					</div>
				</div>
				
				<%-- 선택한 상영스케줄 노출 --%>
				<div class="col-3">
					<div id="theaterInfo" style="display: table;">
						<span style="display: table-cell;">극장&nbsp;</span>
						<span style="display: table-cell;"><b>${reservation.theater_name }</b></span>
					</div>
					<div id="dateInfo" style="display: table;">
						<span style="display: table-cell;">날짜&nbsp;</span>
						<span style="display: table-cell;"><b>${reservation.play_date }</b></span>
<%-- 						<span style="display: table-cell;"><b><fmt:parseDate  value="${reservation.play_start_time }" pattern="yyyy-MM-dd HH:mm"/> </b></span> --%>
						<span style="display: table-cell;"><b>( ${reservation.play_start_time } )</b></span>
					</div>
					<div id="roomInfo" style="display: table;">
						<span style="display: table-cell;">상영관&nbsp;</span>
						<span class="roomInfo2" data-play-num="${reservation.play_num }" style="display: table-cell;"><b>${reservation.room_name }</b></span>
					</div>
				</div>
                <%-- 미선택 사항 노출 --%>
                <div class="col-2">
                	<h5>좌석 선택</h5>
                	<table> <%-- 선택요소들이 ()안에 들어가게 하기 (인원은 x) --%>
			  			<tr><td>좌석명 (일반석)</td></tr>
			  			<tr><td>좌석번호<br> (H8, H10)</td></tr>
			  		</table>
                </div>
                <%-- 미선택 사항(결제) 노출 --%>
                <div class="col-2.5">
                	<h5>결제</h5>
                	<table> <%-- 선택요소들이 ()안에 들어가게 하기 (인원은 x) --%>
			  			<tr><td>일반 (10,000 x 2)</td></tr>
			  			<tr><td>총 금액 (20,000)</td></tr>
			  		</table>
                </div>
                <%-- 다음 페이지 이동 버튼 --%>
                <div class="col-2 ">
		  			<button class="btn btn-danger vertical-center" onclick="location.href='reservation_snack'"> next > </button>
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