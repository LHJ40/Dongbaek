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
	
	.row1>div{
		border: 1px solid #aaa;
	}
	/* 영화 목록에 앞의 모양 제거 */
	#selectMovie ul {
		list-style: none;
		padding-left: 0;
	}
	/* 극장 파트 좌우 배치 */
	#region{
	/* 	border: 1px solid #000; */
		width: 70px;
		display: inline-block;
	}
	#region td {
		padding: 5px;
	}
	#room{
		vertical-align: top;
	/* 	border: 1px solid #000; */
		width: 120px;
		display: inline-block;
	}
	#playType{
		text-align: right;
	}
	#playTable {
		overflow: auto;
	}
	#playTable button {
		margin: 3px;
	}
</style>
<script type="text/javascript">
	
	$(function() {
		$(".nav-link").on("click", function() {
			$(".nav-link").removeClass("active");
			$(this).addClass("active");
		})
	})
	
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
					 			<li><img src="" alt="15세"><a href="#">영화 1</a></li>
					 			<li><img src="" alt="12세"><a href="#">영화 2</a></li>
					 			<li><img src="" alt="15세"><a href="#">영화 3</a></li>
					 			<li><img src="" alt="ALL"><a href="#">영화 4</a></li>
					 		</ul>
				 		</div>
	                </div>
	                
	                <%-- 극장목록 파트 --%>
	                <div class="col-2">
		                <h5>극장</h5>
					 	<br>
					 	<table id="room">
<!-- 					 		<tr> -->
<!-- 					 			<th width="150px">영화관</th> -->
<!-- 					 		</tr> -->
					 		<tr><td><a href="#">극장명</a></td></tr>
					 		<tr><td><a href="#">극장명</a></td></tr>
					 		<tr><td><a href="#">극장명</a></td></tr>
					 		<%-- 구 선택되면 구 별로 영화관 노출(기본값 전체) --%>
					 	</table>
	                </div>
	                
	                <%-- 날짜목록 파트 --%>
	                <div class="col-1">
						<h5>날짜</h5>
						<br>
						<b> 6</b>월<br>
				 		<%--날짜 조회(limit 10일 조회가능) --%> 
				 		<%--년,월,일.. if 년이 ~ 월이~ --%>
				 		<a href="#">토 29</a><br>
				 		<a href="#">일 30</a><br>
				 		<a href="#">월 31</a><br>
				 		<br>
						<b> 7</b>월<br>
				 		<a href="#">화 1</a><br>
				 		<a href="#">수 2</a><br>
					</div>
					
					<%-- 상영목록 파트 --%>
	                <div class="col-4">
	                	<h5>시간</h5>
				  		<div id="playType">
				  			<img src="/resources/img/sun.png" alt="해" width="15px"> 조조
				  			<img src="/resources/img/moon.png" alt="달" width="15px"> 심야
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
					  						<img src="/resources/img/sun.png" alt="해" width="15px"> n석 &nbsp;&nbsp;
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
				  		<img src="" alt="선택영화포스터" height="200px">
				  		<span>영화명</span><br>
					</div>
					<%-- 선택한 상영스케줄 노출 --%>
	                <div class="col-3">
	                	<table> <%-- 선택요소들이 ()안에 들어가게 하기 (인원은 x) --%>
				  			<tr><td>극장 (극장명)</td></tr>
				  			<tr><td>일시 (yyyy.mm.dd(k) hh:jj)</td></tr>
				  			<tr><td>상영관 (n관 m층)</td></tr>
				  		</table>
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
  <footer id="pageFooter"><%@ include file="/resources/inc/footer.jsp"%></footer>
</body>
