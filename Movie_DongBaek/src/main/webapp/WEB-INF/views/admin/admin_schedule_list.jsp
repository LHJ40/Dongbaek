<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<head>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<link
	href="${pageContext.request.contextPath }/resources/css/default.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath }/resources/css/sidebar.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath }/resources/css/button.css"
	rel="stylesheet" type="text/css">
<title>영화 예매 사이트</title>


<%-- jquery DBN --%>
<%-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> --%> 
<%-- <script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script> <!-- 추가 --%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript">
<%-- ajax를 이용한 목록 선택 --%>
$(function(){
    $("#createScheduel").on("click", function(){
        let theater_num = $("#theater_num").val();
        let play_date = $("#play_date").val();
        let html = ""; // 초기화된 빈 문자열로 시작합니다.
        
        $.ajax({
            url: "showSchedual",
            type: "GET",
            data: {
                "theater_num": theater_num,
                "play_date": play_date,
            },
            success: function(data){
                console.log(data); // 응답 데이터 출력

                $(data).each(function(index, item) {
                	
                	roomInfo = item.room_num + ' : ' +item.room_name;
                    // item 값을 html 변수에 추가합니다.
//                     html += '<div>' + index + '회차</div>';
                    html += '<div id="' + item.play_num + index + '_0"> 상영번호 : ' + item.play_num + '</div>\
                        <div id="' + item.movie_release_date + index + '_1"> 개봉일자 : ' + item.movie_release_date + '</div>\
                        <div id="' + item.movie_close_date + index + '_2"> 종영일자 : ' + item.movie_close_date + '</div>\
                        <div id="' + item.play_start_time + index + '_3"> 상영시작시간 : ' + item.play_start_time + '</div>\
                        <div id="' + item.play_end_time + index + '_4"> 상영종료시간 : ' + item.play_end_time + '</div>\
                        <div id="' + item.movie_name_kr + index + '_5"> 영화명 : ' + item.movie_name_kr + '</div>?';
					
                    // movieInfo 배열에 movie_num과 movie_name_kr을 객체 형태로 저장합니다.
//                     movieInfo += item.movie_num + ': ' item.movie_name_kr + '?';
                	
                });

                console.log(html);
                let htmlArray = html.split('?'); // ?를 기준으로 배열로 분할합니다.
                $("#turn1").html(htmlArray[0]);
                $("#turn2").html(htmlArray[1]);
                $("#turn3").html(htmlArray[2]);
                $("#turn4").html(htmlArray[3]);
                $("#turn5").html(htmlArray[4]);
                $("#room_name").html(roomInfo);
                
                // movieInfo 배열을 출력합니다.
//                 console.log(movieInfo);
//                 let movieInfoArray = html.split('?');
                
                

            },
            error: function() {
                alert("request error!");
            }
        });

    
    
    
    // 셀렉트박스 영화목록 출력

        let movieList = ""; // 초기화된 빈 문자열로 시작합니다.
        
        $.ajax({
            url: "findMovieList",
            type: "GET",
            data: {
                "play_date": play_date,
            },
            success: function(data){
                console.log(data); // 응답 데이터 출력

                $(data).each(function(index, item) {
                	
                	let movieList = $("<option>")
                    .val(item.movie_num)
                    .text(item.movie_name_kr);
                  $("#movieSelect").append(option);
                	
                	
                });

//                 console.log('findMovieList' + movieList);

                
                // movieInfo 배열을 출력합니다.
//                 console.log(movieList);
//                 let movieInfoArray = html.split('?');
                
                

            },
            error: function() {
                alert("request error!");
            }
        });
    });
    
    
    
    
    
});
// function converDate(milliSecond){
// const play_date = new Date(milliSecond);
// const year = play_date.getFullYear();
// const month=play_date.getMonth() + 1;
// const date=play_date.getDate();
// return  `${year}-${month}-${date}`;
// }

</script>



<style>
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
 <header id="pageHeader"><%@ include file="../inc/header.jsp"%></header>
 
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
	    	
			    <form class="form-inline" action="showSchedual">
			      <select class="form-control mr-sm-2" name="theater_num" id="theater_num">
			      	<option value="" checked="checked">영화관</option>
			      	<c:forEach var="theater" items="${theaterInfo }">
			      		<option value="${theater.theater_num }">${theater.theater_name }</option>
			      	</c:forEach>
			      </select>
			      <div class="input-group">
					  <div class="input-group-prepend">
					    <span class="input-group-text">상영날짜</span>
					  </div>
					  <input type="date" class="form-control" placeholder="상영일(yy-mm-dd)" aria-label="Username" aria-describedby="basic-addon1" name="play_date" id="play_date">
				  </div>
			      <button class="btn btn-outline-danger my-2 my-sm-2 ml-2" type="button" id="createScheduel">확인</button>
			    </form>
			    
		    </div>
		  </div>

		</nav>
  	</div>

	<div class="row"><p id="play_list"></p></div>
  	<%-- 본문 테이블 --%>
  	<div class="row">
  	
<!--   	<table class="table table-striped text-center align-middle"> -->
  	<table class="table" boarder="1">
	  <%-- 테이블 헤드 --%>
	  <thead>
	    <tr>
<!-- 	      <th scope="col">상영관명</th> -->
<!-- 	      <th scope="col">1회차</th> -->
<!-- 	      <th scope="col">2회차</th> -->
<!-- 	      <th scope="col">3회차</th> -->
<!-- 	      <th scope="col">4회차</th> -->
<!-- 	      <th scope="col">5회차</th> -->
<!-- 	      <th scope="col"></th> -->
	      <th>상영관명</th>
	      <th>1회차</th>
	      <th>2회차</th>
	      <th>3회차</th>
	      <th>4회차</th>
	      <th>5회차</th>
	      <th></th>
	    </tr>
	  </thead>
	  <%-- 테이블 바디--%>
	  <tbody id="play_table">
	  
		<tr>
			<th><div class="row" id="room_name">${roomInfo.room_name}</div>
				<div class="row">
					<%-- 영화목록이 출력될 셀렉트박스 --%>
					<select id="movieSelect">
<%-- 						<c:forEach var="movie" items="${movieList }"> --%>
<%-- 			      		<option value="${movie.movie_num }">${movie.movie_name }</option> --%>
<%-- 			      		</c:forEach> --%>
					</select>
				</div>
			</th>
		<div id="play1">
		<%-- 상영목록이 출력될 공간  --%>
			<td><div id="turn1">상영정보 없음</div><input type="checkbox" id="scheduelCheck1_1"></td>
			<td><div id="turn2">상영정보 없음</div><input type="checkbox" id="scheduelCheck1_2"></td>
			<td><div id="turn3">상영정보 없음</div><input type="checkbox" id="scheduelCheck1_3"></td>
			<td><div id="turn4">상영정보 없음</div><input type="checkbox" id="scheduelCheck1_4"></td>
			<td><div id="turn5">상영정보 없음</div><input type="checkbox" id="scheduelCheck1_5"></td>
			<td>
			<div class="row mb-2"><button type="button" class="btn btn-outline-danger" onclick="createSchedule">생성</button></div>
			<div class="row"><button type="button" class="btn btn-danger" onclick="rewriteSchedule">수정</button></div>
			<td>
		</div></tr>

		

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
  

  <%--왼쪽 사이드바 --%>
	<nav id="mainNav" class="d-none d-md-block sidebar">
		<%@ include file="/WEB-INF/views/sidebar/sideBar.jsp"%>
  </nav>
  
  <div id="siteAds"></div>
  <%--페이지 하단 --%>
  <footer id="pageFooter"><%@ include file="../inc/footer.jsp"%></footer>
 
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
