<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/sidebar.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/button.css" rel="stylesheet" type="text/css">
<title>영화 등록페이지</title>
<style>
.w-900{
	width: 900px;
	margin: 0 auto;
}
.h-500{
	height: 500px;
}

div {
	background-color: transparent;
}
article {
	justify-content: center;
		align-items: center;
		margin: 2em auto;
}
</style>
</head>
<body>
 <%--네비게이션 바 영역 --%>
<header id="pageHeader"><%@ include file="../inc/header.jsp"%></header>
 
<%--본문내용 --%>
<article id="mainArticle">
  <div class="container-fluid w-900 justify-content-center" style="border: 1px solid gray">
    <div class="row">
      <div class="col-md-12 mt-3">
        <h3>
          영화 등록하기
        </h3>
      </div>
    </div>
  
    <%-- 상세보기 테이블 --%>
    <div class="row">
      <div class="col-md-12">
        <form action="admin_movie_regist_Pro" method="post">
          <table class="table table-bordered text-center">
            <tr>
              <th>영화제목</th> 
              <td><input type="text" placeholder="영화제목을 입력해주세요" id="movieName"></td> <!-- 제목등 비롯하여 빈칸이 나오는 경우는 api에 값이 없는 경우이므로 직접 작성해야함 -->
            </tr>
            <tr>
              <th>감독명</th>
              <td><input type="text" placeholder="감독명 입력해줘" id="movieDirector"></td> 
            </tr>
            <tr>
              <th>대표장르</th>
              <td><input type="text" placeholder="대표 장르" id="repGenre"></td>
            </tr>
            <tr>
              <th>러닝타임</th>
              <td><input type="text" placeholder="러닝 타임" id="showTm"></td>
            </tr>
            <tr>
              <th>심의등급</th>
              <td><input type="text" placeholder="심의등급" id="watchGradeNm"></td> <!-- audits.watchGradeNm 1개만가져오기 -->
<!--               <td> -->
<!--                 <select name="movie_grade"> -->
<!--                   <option value="none">선택해주세요</option> -->
<!--                   <option value="all">전체관람가</option> -->
<!--                   <option value="12">12세이상관람가</option> -->
<!--                   <option value="15">15세이상관람가</option> -->
<!--                   <option value="notTeenager">청소년관람불가</option> -->
<!--                   <option value="limit">제한상영가</option> -->
<!--                 </select> -->
<!--               </td>  -->
            </tr>
            <tr>
              <th>출연진</th>
              <td><input type="text" placeholder="출연진" id="peopleNm"></td> <!--  actors.peopleNm 반복으로 가져오기 --> 
            </tr>
            <tr>
              <th>개봉일</th>
              <td><input type="text" placeholder="개봉일" id="openDt"></td> 
            </tr>
            <tr>
              <th>종영일</th>
              <td><input type="date"></td>  <!-- 관리자가 직접 입력해야됨 api 없음 -->
            </tr>
            <tr>
              <th>포스터</th> 
              <td><input type="file"></td> <!-- 관리자가 직접 입력해야됨 api 없음 -->
            </tr>
            <tr>
              <th>줄거리</th>
              <td><textarea rows="5" cols="50" placeholder="줄거리를 입력해주세요"></textarea></td> <!-- 관리자가 직접 입력해야됨 api 없음 -->
            </tr>
            <tr>
              <th>검색할 영화 제목</th>
              <td>  
                <input type="text" id="searchMovieNm" placeholder="ex:분노의 질주">
              </td>
            </tr>
            <tr>
              <th>조회 연도</th>
              <td>  
                <input type="text" id="prdtStartYear" placeholder="ex:2022 조회시작 제작연도">
                <input type="text" id="prdtEndYear" placeholder="ex:2023 조회종료 제작연도">
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <input class="btn btn-danger" id="bottom-right" type="submit" value="등록하기"> 
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#takeMovieAPI" id="getMovieApi">가져오기</button>
              </td>
            </tr>
          </table>
        </form>
      </div>
    </div>
  </div>

  <!-- ------------------------- 안되면 지울것 -------------------------- -->
  <script>
	$(document).ready(function() {
	  $("#getMovieApi").click(function() {
	    var prdtStartYear = $("#prdtStartYear").val();
	    var prdtEndYear = $("#prdtEndYear").val();
	    var searchMovieNm = $("#searchMovieNm").val();
	
	    $.ajax({
	      method: "GET",
	      url: "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json",
	      data: {
	        key: "2821636f951fa3b797d2cf5b22946850",
	        prdtStartYear: prdtStartYear,
	        prdtEndYear: prdtEndYear,
	        movieNm: searchMovieNm,
	        itemPerPage: "20"
	      },
	      success: function(response) {
	    	 console.log(response)
	        var movieList = response.movieListResult.movieList;
	        var selectOptions = "";
	
	        for (var i = 0; i < movieList.length; i++) {
	          var movieNm = movieList[i].movieNm;
	          var directors = movieList[i].directors;
	          var repGenreNm = movieList[i].repGenreNm;
	          var movieCd = movieList[i].movieCd; // 추가된 부분: 영화 코드 가져오기
	          selectOptions += "<option value='" + movieCd + "' data-directors='" + JSON.stringify(directors) + "' data-genre='" + repGenreNm + "'>" + movieNm + "</option>";
	        }
	
	        $("#takeMovieAPI .modal-body select").html(selectOptions);
	        $("#takeMovieAPI").modal("show");
	      },
	      error: function(xhr, status, error) {
	        console.log("AJAX 요청 실패:", error);
	      }
	    });
	  });
	
	  $("#takeMovieAPI").on('hidden.bs.modal', function() {
	    $("#takeMovieAPI .modal-body select").val("");
	  });
	
	  $("#takeMovieAPI .modal-footer .btn-primary").click(function() {
	    var selectedMovieCd = $("#takeMovieAPI .modal-body select").val(); // 변경된 부분: 영화 코드 가져오기
	    var directors = JSON.parse($("#takeMovieAPI .modal-body select option:selected").attr('data-directors'));
	    var repGenreNm = $("#takeMovieAPI .modal-body select option:selected").attr('data-genre');
	
	    if (selectedMovieCd) {
	      var directorNames = directors.map(function(director) {
	        return director.peopleNm;
	      }).join(", ");
	
	      // 새로운 API 요청
	      $.ajax({
	        method: "GET",
	        url: "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json",
	        data: {
	          key: "2821636f951fa3b797d2cf5b22946850",
	          movieCd: selectedMovieCd
	        },
	        success: function(response) {
	        	var movieInfo = response.movieInfoResult.movieInfo;

	            var showTm = movieInfo.showTm;
	            var watchGradeNm = "";
	            var peopleNm = "";
	            var openDt = "";
	
	            if (movieInfo.audits && movieInfo.audits.length > 0) {
	                watchGradeNm = movieInfo.audits[0].watchGradeNm;
	              }
	              if (movieInfo.actors && movieInfo.actors.length > 0) {
	                peopleNm = movieInfo.actors.map(function(actor) {
	                  return actor.peopleNm;
	                }).join(", ");
	              }
	              if (movieInfo.openDt) {
	                openDt = movieInfo.openDt;
	              }

	              $("#showTm").val(showTm);
	              $("#watchGradeNm").val(watchGradeNm);
	              $("#peopleNm").val(peopleNm);
	              $("#openDt").val(openDt);

	              $("#movieName").val($("#takeMovieAPI .modal-body select option:selected").text().trim());
	              $("#movieDirector").val(directorNames);
	              $("#repGenre").val(repGenreNm);
	            },
	            error: function(xhr, status, error) {
	              console.log("AJAX 요청 실패:", error);
	            }
	          });
	        }

	        $("#takeMovieAPI").modal("hide");
	      });
	    });
</script>




  <!-- 영화 정보를 표시할 모달 -->
  <div class="modal fade" id="takeMovieAPI" tabindex="-1" role="dialog" aria-labelledby="takeMovieTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="takeMovieTitle">영화정보 가져오기(API)</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <!-- 영화 정보가 동적으로 추가될 영역 -->
          <select class="form-select">
          </select>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">아니오</button>
          <button type="button" class="btn btn-primary">&nbsp;&nbsp;&nbsp;&nbsp;예&nbsp;&nbsp;&nbsp;&nbsp;</button>
        </div>
      </div>
    </div>
  </div>
</article>

  
  	<%--왼쪽 사이드바 --%>
  	<nav id="mainNav" class="d-none d-md-block sidebar">
  		<%@ include file="../sidebar/sideBar.jsp" %>
  	</nav>

  
  <%--페이지 하단 --%>
  <div id="siteAds"></div>
  <footer id="pageFooter"><%@ include file="../inc/footer.jsp"%></footer>
</body>