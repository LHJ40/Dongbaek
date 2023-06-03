<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
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
	/* 각 파트 구별을 위한 색상 조절, 여백 */
	.row1>div{
		height: 300px;
		margin: 0.5rem;
		padding: 10px;
		background-color: white;
	}
	/* 페이지 이름 잘보이게 설정 */
	#mainArticle>h2{
		font-weight: bold;
		padding-left: 1rem;
	}
	
	/* 선택사항 안내 구간 */
	/* 위 파트와 구별을 위한 색상 부여 */
	.row2{
		padding-top: 0.5rem;
		height: 150px;
		background-color: #aaa;
	}
	
	#seat-part{
		text-align: center;
	}
	#seat-part>hr{
		border: 0;	/* 두께를 지정하려면 기본 border을 0으로 설정해야함 */
		height: 3px;
		background-color: #ccc;
		width: 400px;
	}
	.seat{	/* 좌석 버튼 조절 */
		width: 0.8rem;
		height: 0.8rem;
		color: gray;
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
	let seatArr = new Array(6);	// 행을 6으로 지정
	
	for(let i = 0; i < seatArr.length; i++) {
		seatArr[i] = new Array(10);
	}
	
// 	alert(seatArr[0].toString()); // => ,,,,,,,,,
	
	$(function() {
		$(".seatRow > button").on("click", function() {
// 			$(this).removeClass(".seat");
// 			$(this).addClass(".check");
			$(this).css("background-color", "blue");
		});
	});
	
</script>
</head>
<body>
 <%--네비게이션 바 영역 --%>
 <header id="pageHeader"><%@ include file="/resources/inc/header.jsp"%></header>
 
  <article id="mainArticle">
  <%--본문내용 --%>
 		<h2>영화 예매</h2>
		<div class="container-fluid reservation_con" >
            <div class="row row1">
            	<%-- 좌석 선택 파트 --%>
                <div class="col-9 border" id="seat-part">
                	<hr>
                	<b>SCREEN 화면</b> <span class="door align-right">출구</span>
                	<br>
                	<div class="seatArea">
<%-- 						<c:forEach var="i" begin="1" end="6"> --%>
<%-- 							<c:forEach var="j" begin="1" end="10"> --%>
<!-- 								<button></button> -->
<%-- 							</c:forEach> --%>
<!-- 							<br> -->
<%-- 						</c:forEach> --%>
						<c:forEach var="i" begin="1" end="3">
							<div class="seatRow">
								<button class="seat"></button>
								<button class="seat"></button>
								<button class="seat"></button>
								<button class="seat"></button>
								<button class="seat"></button>
								<span class="space">&nbsp;</span>
								<button class="seat"></button>
								<button class="seat"></button>
								<button class="unable"></button>
								<button class="seat"></button>
								<button class="seat"></button>
							</div>
						</c:forEach>
						<span class="door align-left">입구</span><br>
							<div class="seatRow">
									<button class="handi"></button>
									<button class="handi"></button>
									<button class="seat"></button>
									<button class="seat"></button>
									<button class="seat"></button>
									<span class="space">&nbsp;</span>
									<button class="seat"></button>
									<button class="seat"></button>
									<button class="unable"></button>
									<button class="seat"></button>
									<button class="seat"></button>
								</div>
						<c:forEach var="i" begin="1" end="2">
							<div class="seatRow">
								<button class="seat"></button>
								<button class="seat"></button>
								<button class="seat"></button>
								<button class="seat"></button>
								<button class="seat"></button>
								<span class="space">&nbsp;</span>
								<button class="seat"></button>
								<button class="seat"></button>
								<button class="unable"></button>
								<button class="seat"></button>
								<button class="seat"></button>
							</div>
						</c:forEach>
						
						
                	</div>
					<div id="beforeBtnArea">	<%-- 영역왼쪽하단에 위치시키고 싶음 --%>
						<button class="btn btn-secondary" onclick="history.back()"> &lt; 이전</button>
					</div>
                </div>
                
                <%-- 관람 인원 선택 파트 --%>
                <div class="col-2.5 border selectPart">
	                <h5>관람 인원 선택</h5>
	                <hr>
	                <div id="personType">
	                	성인 &nbsp;&nbsp;&nbsp;&nbsp;<input type="number"> <br>
	                	청소년 &nbsp;&nbsp;<input type="number"> <br> <%-- 만 7세 초과 ~ 만 18세 미만 --%>
	                	경로/어린이 <input type="number"> <br> <%-- 만 65세 이상 --%>
	                </div>
	                <div id="seatType">
	                	<button class="seat"></button> 예매가능 <br>
	                	<button class="check"></button> 선택좌석 <br>
	                	<button class="unable"></button> 예매완료 <br>
	                	<button class="handi"></button> 장애인석
	                </div>
	                <hr>
	                <button class="btn btn-secondary"><img src="/resources/img/reset.png" width="20px"> 다시 선택하기</button>
                </div>
            </div>
            
            <%-- 선택사항 안내 구간, 다음으로 넘어가기 --%>
            <div class="row row2">
            	<%-- 선택한 영화 포스터와 영화명 노출 --%>
                <div class="col-3">
					<h5>선택 정보</h5>
			  		<img src="" alt="선택영화포스터" height="200px">
			  		<span>영화명</span><br>
				</div>
				<%-- 선택한 상영스케줄 노출 --%>
                <div class="col-3">
                <br>
                	<table> <%-- 선택요소들이 ()안에 들어가게 하기 --%>
			  			<tr><td>극장 극장명</td></tr>
			  			<tr><td>일시 yyyy.mm.dd(k) hh:jj</td></tr>
			  			<tr><td>상영관 n관 m층</td></tr>
			  		</table>
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
		  			<button class="btn btn-danger vertical-center" onclick=""> next > </button>
                </div>
            </div>
        </div>
  
  </article>
  
  <nav id="mainNav">
  <%--왼쪽 사이드바 --%>
  </nav>
  
  <div id="siteAds"></div>
  <%--페이지 하단 --%>
  <footer id="pageFooter"><%@ include file="/resources/inc/footer.jsp"%></footer>
</body>