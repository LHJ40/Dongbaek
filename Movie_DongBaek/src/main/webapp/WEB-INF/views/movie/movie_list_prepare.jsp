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
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>

<script  type="text/javascript">
 $(function() {
	$(".custom-select").on("change", function(){
	
		//셀렉트박스 옵션 선택텍스트(예매순/가나다순) 저장
		let value = $(".custom-select option:selected").val();
		let url = '';
	
		
		if(value == 2){ //가나다순 선택시
			url = "movie_list_prepareNameDESC?pageNum=${param.pageNum }";
		} else { //예매순으로 다시 선택시
			url = "movie_list_prepareReturn?pageNum=${param.pageNum }";
		}
				
			$.ajax({
				type : "get",
				url : url,
				dataType : "json", 
			})
			.done(function(movie) {
// 				alert("요청성공");
					let res = "";
					
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
						
						res += "<div class='col-lg-3 col-mid-4'>" +
						"<div class='card border-0 shadow-sm' style='width: 18rem;'>" +
						  "<a href='movie_detail_info?movie_num=" + movie[i].movie_num + "'>" +
						  	"<img src='" + movie[i].movie_poster + "' class='card-img-top' alt='...'>" +
						  "</a>" +
							"<div class='card-body'>" +
								"<h6 class='card-title' style='white-space: nowrap; overflow:hidden; text-overflow: elipsis;'>" +
									"<img src='${pageContext.request.contextPath }/resources/img/grade_" + movieGrade +".png' alt='" + movieGrade +"' class='img-rounded'>" +
								movie[i].movie_name_kr +"</h6>" +
								"<p class='card-text'>예매율: " + movie[i].movie_booking_rate + " 개봉일: " + movie[i].movie_release_date + "</p>" +
								"<p class='d-flex justify-content-center'>" +
							    	"<button type='button' class='btn btn-outline-danger mr-2'>♡찜하기</button>" +
							    	"<a href='reservation_main?movie_num=" +  movie[i].movie_num + "' class='btn btn-danger'>&nbsp;&nbsp;예매&nbsp;&nbsp;</a>" +
						    	"</p>" +
							"</div>" +
						"</div>" +
					"</div>"
					}
					
					$("#moviearea").html(res);
			})
			.fail(function() { // 요청 실패 시
				alert("요청 실패!");
			});
 	});

 });
</script>
<title>영화 예매 사이트</title>
<%--페이징css --%>
<style>
	#pageList{
	  align-content: center;
	  font-size: large; 
	  margin: auto;
	  margin-bottom:50px;
/* 	  width: 1024px; */
	  text-align: center;
	}
	#nowPage{
		color:#dc3545;
		size: 20px;
		margin: auto;
/* 		width: 1024px; */
		text-align: right;
	}
	#anotherPage{
		color:graytext;
		margin: auto;
/* 		width: 1024px; */
		text-align: right;
	}
</style>
</head>
<body>
 <%--네비게이션 바 영역 --%>
 <header id="pageHeader"><%@ include file="../inc/header.jsp"%></header>
 
 <article id="mainArticle">
 <%--본문내용 --%>
	<div class="container">
<%-- 상영작 구분 --%>
	<ul class="nav nav-tabs" style="margin-top: 20px; margin-bottom: 20px">
	  <li class="nav-item">
	    <a class="nav-link" href="movie_list_present">현재상영작</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link active" aria-current="page" href="movie_list_prepare">상영예정작</a>
	  </li>
	</ul>
<%-- 정렬 기준 --%>
	<div class="row"  align="left" style="margin-bottom: 20px">
		<div class="col col-md-10"></div>
		<div class="col col-md-2 d-flex justify-content-end">
		  <select class="custom-select" name="movie_array" >
		    <option value="1" selected="selected">예매순</option>
		    <option value="2">가나다순</option>
		  </select>
		</div>
	</div>
	
	<%-- 영화정보 --%>
	<%-- 한 열당 영화4개출력 => 한 페이지 당 2열 => 총 8개영화출력--%>
	<div class="m-3">
	
		 <%-- 1열 --%>
		<%-- <input type="hidden" value="movie_num=${movieList.movie_num }"> --%>
		<div class="row" id="moviearea" align="left">
		<c:forEach var="movie" items="${movieList}" >
			<div class="col-lg-3 col-mid-4">
				<div class="card border-0 shadow-sm" style="width: 18rem;">
					<%-- 해당영화의 포스터출력 -> 클릭시 상세페이지로 이동 --%>
					<a href="movie_detail_info?movie_num=${movie.movie_num}">
						<img src="${movie.movie_poster}" class="card-img-top" alt="...">
					</a>
					<%-- 해당영화의 등급에 해당하는 이미지 출력, 영화제목 출력--%>
					<div class="card-body">
						<h6 class="card-title">
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
							${movie.movie_name_kr}
						</h6>
						<p class="card-text">예매율:${movie.movie_booking_rate} 개봉일: ${movie.movie_release_date}</p>
						
						<%--찜하기버튼, 예매버튼 --%>
						<p class="d-flex justify-content-center">
							<button type="button" class="btn btn-outline-danger mr-2">♡찜하기</button>
							<a href="reservation_main?movie_num=${movie.movie_num}" class="btn btn-danger">&nbsp;&nbsp;예매&nbsp;&nbsp;</a>
						</p>
					</div>
				</div>
			</div>
		</c:forEach>
		</div>
		<br>
	</div> <%--container 끝 --%>
	
	
	<%-- 하단 페이지 바 --%>
	
	<%-- pageNum 파라미터 가져와서 저장(없을 경우 기본값 1로 설정) --%>
	<c:set var="pageNum" value="1" />
	<c:if test="${not empty param.pageNum }">
		<c:set var="pageNum" value="${param.pageNum }" />
	</c:if>
	
	<%-- 페이징처리 ========================================== --%>
	<section id="pageList">
		<%-- 1. 현재페이지>1 =>[이전]버튼 동작 => 버튼클릭시 : BoardList서블릿요청(파라미터:현재pg-1) --%>
		<c:choose>
			<c:when test="${pageNum > 1 }">
				<input type="button" class="btn-sm btn-outline-danger mr-2" value="이전" onclick="location.href='movie_list_prepare?pageNum=${pageNum - 1}'">
			</c:when>
			<c:otherwise>
				<input type="button" class="btn-sm btn-outline-danger mr-2" value="이전" disabled="disabled">
			</c:otherwise>
		</c:choose>
		<%--간소화 할시 --%>
		<%-- 	<input type="button" value="이전" <c:if test="${pageNum > 1 }"> onclick="location.href='BoardList.bo?pageNum=${pageNum - 1}'"</c:if>> --%>
	
	
		<%-- 2. 페이지번호 목록은 시작페이지(startPage) 부터 끝페이지(endPage) 까지 표시 --%>
		<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
			<%-- 각 페이지마다 하이퍼링크 설정(단, 현재 페이지는 하이퍼링크 제거) --%>
			<c:choose>
				<c:when test="${pageNum eq i }">
					<b id="nowPage">${i }</b> <%--페이지번호=현재페이지번호 -> 글자만표시  --%>
				</c:when>
				<c:otherwise>
					<a href="movie_list_prepare?pageNum=${i }" id="anotherPage">${i }</a><%--하이퍼링크활성화 --%>
				</c:otherwise>
			</c:choose>
		</c:forEach>	
	
		<%-- 3. 현재페이지<maxPage =>[다음]버튼 동작 => 버튼클릭시 : BoardList서블릿요청(파라미터:현재pg+1) --%>
		<c:choose>
			<c:when test="${pageNum < pageInfo.maxPage }">
				<input type="button" value="다음" class="btn-sm btn-outline-danger mr-2" onclick="location.href='movie_list_prepare?pageNum=${pageNum + 1}'">
			</c:when>
			<c:otherwise>
				<input type="button" value="다음" class="btn-sm btn-outline-danger mr-2" disabled="disabled">
			</c:otherwise>
		</c:choose>
	</section>
	<%--페이징처리 끝 ==========================================--%>
	
	
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	</div>
  
  </article>
  
  <nav id="mainNav">
  <%--왼쪽 사이드바 --%>
  </nav>
  <div id="siteAds"></div>
  <%--페이지 하단 --%>
  <footer id="pageFooter"><%@ include file="../inc/footer.jsp"%></footer>
</body>