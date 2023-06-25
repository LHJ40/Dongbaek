<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<style>
#mainNav{
/* 		border: 1px solid #f00; */
	padding: 8rem 2rem;	
}
	
#mainNav>ul{
	list-style: none;
}
<%-- a링크 활성화 색상 변경 --%>
a:hover, a:active{
 color:  #ff5050 !important;
	
}
div {
	background-color: transparent;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript">
<%-- ajax를 이용한 목록 선택 --%>
$(function() { // 페이지가 시작될 때 실행될 함수
		// 변수 선언
		let theater_num = "";
		
		// 상영스케줄 확인 버튼 클릭시 실행될 함수
		$("#createScheduel").on("click", function() {

			
			theater_num = $("#theater_num").val();
		    let play_date = $("#play_date").val();
		    let schedule = '';
		    let room = '';
// 		    let scheduleList = ''; // 상영스케줄 저장 배열 변수
		    
		    let roomList = ''; // 상영관 이름 저장 배열 변수
			
		    let tr = ''; // 상영관+회차 공통변수
		    
		    
		    $("#hide_div").css("display", "block");
		    
		    $.ajax({
		    	  url: 'showSchedual',
		    	  type: 'GET',
	 		      data: {
	 		        "theater_num": theater_num,
	 		        "play_date": play_date,
	 		      },
		    	  dataType: 'json',
		    	  success: function(data) {
		    	    // 받은 JSON 데이터를 처리하는 로직을 작성합니다.
		    	    console.log(data); // JSON 데이터 출력 예시
// 					console.log(data[4].play_turn); // VO객체 하나일 경우 출력 예시
		    	    
		    	    // 예시: PlayVO 객체의 title 값들을 출력하는 예시
// 		    	    $.each(data, function(index, item) {
// 		    	      console.log(item.play_turn + ',' + item.movie_name_kr + item.movie_release_date);
// 		    	    });
		    	    
		    	    let sch = data[0].scheduleList;  // 스케줄 리스트를 넣을 배열 변수
		    	    let roo = data[0].roomList; // 상영관 리스트를 넣을 배열 변수
		    	    
// 		    	    alert(sch[0].movie_num + ', ' + sch[0].room_num);
		    	    

		    	    let schedule = ''; // schedule 변수를 문자열로 초기화

		    	    for (let i = 0; i < 15; i++) {
		    	      let found = false;
		    	      for (let j = 0; j < sch.length; j++) {
		    	        if (sch[j].room_num === (Math.floor(i / 5) + 1) && sch[j].play_turn === (i % 5 + 1)) {
		    	          found = true;
// 		    	          alert(i + '번째 상영관: ' + sch[j].room_num + ', 회차: ' + sch[j].play_turn);

		    	          schedule += '<div class="font-weight-bold"> 상영번호 :<br></div><div> ' + sch[j].play_num + '</div>\
		    	                       <div class="font-weight-bold"> 상영기간 :<br></div><div>' + sch[j].movie_release_date + '</div>\
		    	                       <div> ~ <br> ' + sch[j].movie_close_date + '</div>\
		    	                       <div class="font-weight-bold"> 상영시간 :<br></div><div> ' + sch[j].play_start_time + '<br> ~ <br>' + sch[j].play_end_time + '</div>\
		    	                       <div class="font-weight-bold"> 러닝타임 :<br></div><div> ' + sch[j].movie_running_time + '분' + '</div>\
		    	                       <div class="font-weight-bold"> 영화명 :<br></div><div> ' + sch[j].movie_name_kr + '</div>?';

		    	          break;
		    	        }
		    	      }
		    	      if (!found) {
// 		    	        alert(i + '번째 상영정보가 없습니다.');

		    	        schedule += '<div>상영정보 없음</div>?';
		    	      }
		    	    }

		    	    let scheduleList = schedule.split('?');
		    	    console.log(scheduleList);  	    
		    	    
	    	    	
					// 첫번째 행에 상영정보 출력
			        $("#play_turn11").html(scheduleList[0]);
			        $("#play_turn21").html(scheduleList[1]);
			        $("#play_turn31").html(scheduleList[2]);
			        $("#play_turn41").html(scheduleList[3]);
			        $("#play_turn51").html(scheduleList[4]);
	
					// 두번째 행에 상영정보 출력
			        $("#play_turn12").html(scheduleList[5]);
			        $("#play_turn22").html(scheduleList[6]);
			        $("#play_turn32").html(scheduleList[7]);
			        $("#play_turn42").html(scheduleList[8]);
			        $("#play_turn52").html(scheduleList[9]);
	
					// 세번쨰 행에 상영정보 출력
			        $("#play_turn13").html(scheduleList[10]);
			        $("#play_turn23").html(scheduleList[11]);
			        $("#play_turn33").html(scheduleList[12]);
			        $("#play_turn43").html(scheduleList[13]);
			        $("#play_turn53").html(scheduleList[14]);

		    	  },
		          error: function() {
			            alert("해당 상영정보가 없습니다!");
			      }
		    	  
		    }); // ajax showSchedule 끝
		    
	        $.ajax({ // 영화 목록 셀렉트박스 가져오기
		          url: "findMovieList",
		          type: "GET",
		          data: {
		            "play_date": play_date
		          },
		          success: function(data) {
		            $(".movieSelect").empty();

		            $(data).each(function(index, item) {
		              let option = $("<option>")
		                .val(item.movie_num)
		                .text(item.movie_name_kr);
		              $(".movieSelect").append(option);
		            }); // data 반복 함수 끝

		            
		            <%-- 여기 작업중 --%>
		            $(".movieSelect").on("change", function() { // 영화 셀렉트박스 값이 변경될 경우
// 		              alert($(this).val()); // 선택된 영화 번호가 출력됨
		              let movie_no = $(this).val();
					  let room_no = $(this).attr("name");
// 					  alert('영화번호:' + movie_no + ', 상영관번호:' + room_no);


		              
		            }); // movieSelect 온체인지 메서드 끝

		            
       
		            
		            
		          }, // movieSelect 석세스 메서드 끝
		            

		          error: function() {
		            alert("요청 오류!");
		          }
		          
		    }); //ajax findMovieList  끝
		    
// 		    console.log('히든 값 가져오기' + $("input[name=room_num]").eq(1).val());
		    
		    

		    
		}); // "#createScheduel" 온클릭 함수 끝

}); // onload 함수 끝


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

a:hover, a:active{
 color:  #ff5050 !important;
	
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
		    	<div class="navbar-brand" >상영스케줄 관리</div>
		    </div>
	    	<div class="col col-md-10">
	    	
			    <form action="showSchedual" class="form-inline">
			      <select class="form-control mr-sm-2" name="theater_num" id="theater_num" >
			      	<option value="">영화관</option>
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

  	<%-- 본문 테이블 --%>
  	<div class="row">
<!--   	<div id="hide_div" class="row" style="display: none;"> -->
  	
  	<table class="table table-striped text-center align-middle">
	  <%-- 테이블 헤드 --%>
	  <thead>
	    <tr>
	      <th style="width:80px;">상영관명</th>
	      <th style="width:200px;">1회차</th>
	      <th style="width:200px;">2회차</th>
	      <th style="width:200px;">3회차</th>
	      <th style="width:200px;">4회차</th>
	      <th style="width:200px;">5회차</th>
	      <th width="60px"></th>
	    </tr>
	  </thead>
	  <%-- 테이블 바디--%>
	  <tbody id="play_table">
	  
	  
	  <%-- 1번쨰 줄 --%>
<!-- 	<form action="createUpdateSchedule" method="post" id="myForm1">  -->
    <tr>
      <td class="align-middle text-center">
          <div id="play_turn01">동백관</div>
          <div class="row">
            <select class="movieSelect" id="movieBox1" style="width:150px;" name="room_no1">
              <option value=""></option>
            </select>
        </div>
      </td>
      <td class="align-middle text-center"><div id="play_turn11">상영정보 없음</div></td>
      <td class="align-middle text-center"><div id="play_turn21">상영정보 없음</div></td>
      <td class="align-middle text-center"><div id="play_turn31">상영정보 없음</div></td>
      <td class="align-middle text-center"><div id="play_turn41">상영정보 없음</div></td>
      <td class="align-middle text-center"><div id="play_turn51">상영정보 없음</div></td>
      <td class="align-middle text-center">
        <div class="row mb-2"><button type="button" class="btn btn-outline-danger" style="height:120px;" id="newSchedule1">생성수정</button></div>
<!--         <div class="row"><button type="button" class="btn btn-danger" style="height:60px;" style="height:60px;" id="updateSchedule1">수정</button></div> -->
      </td>
    </tr>
<!-- 	</form> -->
	
	
	
	<%-- 2번쨰 줄 --%>
<!-- 	<form action="createUpdateSchedule" method="post" id="myForm2">  -->
    <tr>
      <td class="text-center">
          <div id="play_turn02">1관</div>
          <div class="row">
            <select class="movieSelect" id="movieBox2" style="width:150px;" name="room_no2">
              <option value=""></option>
            </select>
          </div>
      </td>
      <td class="align-middle text-center"><div id="play_turn12">상영정보 없음</div></td>
      <td class="align-middle text-center"><div id="play_turn22">상영정보 없음</div></td>
      <td class="align-middle text-center"><div id="play_turn32">상영정보 없음</div></td>
      <td class="align-middle text-center"><div id="play_turn42">상영정보 없음</div></td>
      <td class="align-middle text-center"><div id="play_turn52">상영정보 없음</div></td>
      <td class="align-middle text-center">
        <div class="row mb-2 "><button type="submit" class="btn btn-outline-danger" style="height:150px;" id="newSchedule2">생성수정</button></div>
<!--         <div class="row"><button type="button" class="btn btn-danger" style="height:60px;" style="height:60px;" id="updateSchedule2">수정</button></div> -->
      </td>
    </tr>
<!--     </form> -->
		
	  <%-- 3번째 줄 --%>
<!-- 	<form action="createUpdateSchedule" method="post" id="myForm2">  -->
    <tr>
      <td class="text-center">
          <div id="play_turn03">2관</div>
          <div class="row">
            <select class="movieSelect" id="movieBox3" style="width:150px;" name="room_no3">
              <option value=""></option>
            </select>
          </div>
      </td>
      <td class="align-middle text-center"><div id="play_turn13">상영정보 없음</div></td>
      <td class="align-middle text-center"><div id="play_turn23">상영정보 없음</div></td>
      <td class="align-middle text-center"><div id="play_turn33">상영정보 없음</div></td>
      <td class="align-middle text-center"><div id="play_turn43">상영정보 없음</div></td>
      <td class="align-middle text-center"><div id="play_turn53">상영정보 없음</div></td>
      <td class="align-middle text-center">
        <div class="row mb-2"><button type="submit" class="btn btn-outline-danger"  style="height:150px;" id="newSchedule3">생성수정</button></div>
<!--         <div class="row"><button type="button" class="btn btn-danger" style="height:60px;" style="height:60px;" id="updateSchedule3">수정</button></div> -->
      </td>
    </tr>
<!-- 	</form> -->

	    <%-- 밑줄 용 빈칸 --%>
	    <tr>
		     <th></th>
		     <th></th>
		     <th></th>
		     <th></th>
		     <th></th>
		     <th></th>
	    </tr>
	
	  </tbody>
	</table>
  	</div> <%-- div id="hide_div" 끝 --%> 
  				    
	
	<%-- 테스트 영역 --%>
	<div id="tagtest"></div>
			    




  	
  </article>
  

  <%--왼쪽 사이드바 --%>
	<nav id="mainNav" class="d-none d-md-block sidebar">
		<%@ include file="/WEB-INF/views/sidebar/sideBar.jsp"%>
  </nav>
  
  <div id="siteAds"></div>
  <%--페이지 하단 --%>
  <footer id="pageFooter"><%@ include file="../inc/footer.jsp"%></footer>



<script type="text/javascript">

$(function() {

	// 첫번째 행 상영 스케줄 생성버튼 클릭 시 동작 메서드
	$("#newSchedule1").on("click", function scheduleMake() {
	    let play_date = $("#play_date").val();
	    let theater_num = $("#theater_num").val();
	    let row_num = 1;
	    let movie_num = $("#movieBox1").val();
	    
	    console.log(play_date);
	    console.log(theater_num);
	    console.log(row_num);
	    console.log(movie_num);

	    $.ajax({
	      url: "createUpdateSchedule",
	      method: "POST",
	      data: {
	        play_date: play_date,
	        theater_num: theater_num,
	        row_num: row_num,
	        movie_num: movie_num
	      },
	      dataType: 'json',
	      success: function(result) {
		         console.log(result);
		         let text = result.result;
		    	  alert(text);
		      },
		      error: function(xhr, status, error) {
		         let text = xhr;
		         console.log(xhr);
		    	 alert(text);
		      }
		  });
	    
	}); // $("#newSchedule1").on("click", function() { 메서드 끝
		  
		  
		  
	// 두번째 행 상영 스케줄 생성버튼 클릭 시 동작 메서드
	$("#newSchedule2").on("click", function() {
	    let play_date = $("#play_date").val();
	    let theater_num = $("#theater_num").val();
	    let row_num = 2;
	    let movie_num = $("#movieBox2").val();
	    
	    console.log(play_date);
	    console.log(theater_num);
	    console.log(row_num);
	    console.log(movie_num);

	    $.ajax({
	      url: "createUpdateSchedule",
	      method: "POST",
	      data: {
	        play_date: play_date,
	        theater_num: theater_num,
	        row_num: row_num,
	        movie_num: movie_num
	      },
	      dataType: 'json',
	      success: function(result) {
		         console.log(result);
		         let text = result.result;
		    	  alert(text);
		      },
		      error: function(xhr, status, error) {
		         let text = xhr;
		         console.log(text);
		    	 alert(text);
		      }
		  });
		    
	}); // $("#newSchedule1").on("click", function() { 메서드 끝
			  
			  
	// 세번째 행 상영 스케줄 생성버튼 클릭 시 동작 메서드
	$("#newSchedule3").on("click", function() {
	    let play_date = $("#play_date").val();
	    let theater_num = $("#theater_num").val();
	    let row_num = 3;
	    let movie_num = $("#movieBox3").val();
	    
	    console.log(play_date);
	    console.log(theater_num);
	    console.log(row_num);
	    console.log(movie_num);

	    $.ajax({
	      url: "createUpdateSchedule",
	      method: "POST",
	      data: {
	        play_date: play_date,
	        theater_num: theater_num,
	        row_num: row_num,
	        movie_num: movie_num
	      },
	      dataType: 'json',
	      success: function(result) {
	         console.log(result);
	         let text = result.result;
	    	  alert(text);
	      },
	      error: function(xhr, status, error) {
	         let text = xhr;
	         console.log(text);
	    	 alert(text);
	      }
	    });
		
	}); // $("#newSchedule1").on("click", function() { 메서드 끝
	  
}); // $(function() { 메서드 끝


</script>

</body>
