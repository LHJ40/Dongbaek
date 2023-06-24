<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
  function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  }

  function displayAudienceNumber() {
    var audienceNumber = ${movie.movie_audience_num};
    var formattedNumber = numberWithCommas(audienceNumber);
    return formattedNumber;
  }
  
  
</script>

</head>
<body>

	<div class="row">
		<%-- 1. 왼쪽 섹션 --%>
		<div class="col-md-8 d-flex" style="padding-left: 80px">
			<div class="col float-left" >
				<div class="row" style="margin-top: 80px">
					<div class="col-md-8 justify-content-start h3 p-0">${movie.movie_name_kr }</div>
				</div>
				<div class="row">
					<div class="col-md-8 justify-content-start h6 p-0">${movie.movie_name_en }</div>
				</div> 
				 <div class="row" style="margin: 30px">
				 	<div class="col-ml-5">${movie.movie_content }</div>
				  </div>
				  
			  <%--찝버튼, 리뷰출력카드 --%>
			  <div class="row" style="margin-bottom: 50px">
				<div class="col mx-4 my-2" style="width:80px"><button class="btn btn-danger"> 찜하기♡ </button></div>
					<div class="col mx-4 my-2">
			    		<div class="card" style="width: 24rem">
						<div class="card-body">
							<h5 class="card-title">아이디 : ${review.member_id }</h5>
							<p class="card-text">${review.review_content }</p>
						 </div>
					</div>
				</div>
			  </div>
			  	<%-- 평점 --%>
			 	<div class="row">
			  		<div class="col mx-7 my-5">
						<h6>평점 : <fmt:formatNumber value="${movie.movie_review_rating}" maxFractionDigits="1" /> </h6>
			  		</div>
			  		<div class="col mx-5 my-5">
			  			<h6>실제 관람객 수 :  <fmt:formatNumber value="${movie.movie_audience_num }" type="number" pattern="###,###" /> 명</h6>
			 		</div>
				</div>
			</div>
		</div>
		<%--왼쪽섹션 끝 --%> 
		
		<%-- 1-1. 오른쪽 포스터 카드 섹션 --%>
		<div class ="col float-right col-md-3" style="margin-top: 80px">
			<div class="row">
				<div class="card border-0 shadow-sm" style="width: 18rem">
					<img src="${movie.movie_poster }" class="card-img-top" alt="..." onclick="reservation_main()">
					<div class="card-body" style="padding-left: 90px;">
						<button class="btn btn-danger" onclick="location.href='reservation_main?movie_num=${movie.movie_num }'"> 예매하기 </button>
					</div>
				</div>
			</div>
		 </div>	
		 <%--포스터카드섹션 끝 --%>
	</div>
	
</body>
</html>