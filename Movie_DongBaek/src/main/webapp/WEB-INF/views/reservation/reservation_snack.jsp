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

	.row1>div{
		height: 450px;
		margin: 0.5rem;
		padding: 10px;
/* 		background-color: white; */
		border: 2px solid #aaa;
	}
	.card-text>input{
		width: 80px;
		height: 30px;
	}
	.right_side{
		text-align: right;
	}
	.bottom{
		text-align: center;
		bottom: 1rem;
		position: absolute;
	}
</style>
</head>
<body>
 <%--네비게이션 바 영역 --%>
 <header id="pageHeader"><%@ include file="/resources/inc/header.jsp"%></header>
 
  <article id="mainArticle">
  <%--본문내용 --%>
	 <h2>영화 예매</h2>
		<div class="container-fluid reservation_con" >
	           <div class="row row1">
	           	<%-- 스낵 권유 파트 --%>
	               <div class="col-8" id="seat-part">
	               	<h5>스낵이 필요하지는 않으신가요?</h5>
	               		<div class="row row-cols-1 row-cols-md-3" style="width: 45rem;">
						<div class="col mb-4">
						    <div class="card h-100">
						      <img src="/resources/img/popcorn.png" width="80" height="130" class="card-img-top" alt="...">
						      <div class="card-body">
						        <h5 class="card-title">상품명</h5>
						        	10,000원
						        <p class="card-text">
						        	<input type="number">
						        	<button type="button" class="btn btn-outline-danger">담기</button><br>
						        	한 줄 설명(고소팝콘 M1 + 콜라2)<br>
						        </p>
						      </div>
						    </div>
						  </div>
	               			
	               			<div class="col mb-4">
						    <div class="card h-100">
						      <img src="/resources/img/popcorn.png" width="80" height="130" class="card-img-top" alt="...">
						      <div class="card-body">
						        <h5 class="card-title">상품명</h5>
						        	10,000원
						        <p class="card-text">
						        	<input type="number">
						        	<button type="button" class="btn btn-outline-danger">담기</button><br>
						        	한 줄 설명(고소팝콘 M1 + 콜라2)<br>
						        </p>
						      </div>
						    </div>
						  </div>
	               			
	               		</div>
	               		
	               		
					<div id="beforeBtnArea">	<%-- 영역왼쪽하단에 위치시키고 싶음 --%>
						<button onclick="history.back()" class="btn btn-secondary"> &lt; 이전</button>
					</div>
	               </div>
	               
	               <%-- 주문 정보 확인 파트 --%>
	               <div class="col-md-3">
	                <h5>주문 정보</h5>
	                <hr>
	                <%-- (상품 담기 시 입력되는 창) --%>
	                <table border="1">
	                	<tr>
	                		<td>1</td>
	                		<td width="150px">상품명 x n </td>
	                	</tr>
	                	<tr>
	                		<td colspan="2" class="right_side">
	                			10,000 <button class="btn btn-secondary">x</button>
	                		</td>
	                	</tr>
	                </table>
	                
	                <div class="bottom">
	                	<hr>
		                총 금액 : (10,000)원
		                <button class="btn btn-secondary"><img src="/resources/img/reset.png" width="20px"> 다시 선택하기</button>
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
	               <br>
	               	<table> <%-- 선택요소들이 ()안에 들어가게 하기 (인원은 x) --%>
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
			  			<tr><td>스낵 (10,000 x 1)</td></tr>
			  			<tr><td>총 금액 (30,000)</td></tr>
			  		</table>
	               </div>
	               <%-- 다음 페이지 이동 버튼 --%>
	               <div class="col-2">
		  			<button class="btn btn-danger" id="nextBtn" onclick=""> next ></button>
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