<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>

<title>영화 예매 사이트</title>
<style>
.table table-striped>tr>td>button{
	height:4em;
}
.nav-link{

}
</style>
<script type="text/javascript">
$(function() {
	$(document).on("click", "#theater_button", function(){

		
	    let val = $(this).val();
	    let theater_num=val
	    
	    $.ajax({
	        type: "get",
	        url: "getTheater",
	        data: {
	        	"theater_num" : val
	        },
	        dataType : "json",
	    })
 		.done(function(theater) {
			
 			$("#theater_name").html(theater.theater_name);
 			$("#theater_address").html(theater.theater_address);
 			$("#theater_map").html(theater.theater_map);
 			$("#theater_num").val(theater.theater_num);
 			$("#hidden").html(theater.theater_num);
 					
 		})
 		.fail(function() { // 요청 실패 시
 			alert("요청실패");
 		});
	    
	});
	
	
});
function timetable(){
	let theater_num = $("#theater_num").val();
	let play_date=$("#play_date").val();
	

    $.ajax({
        type: "post",
        url: "getSchedule",
        data: {
        	"theater_num" : theater_num,
    		"play_date" : play_date
        },
        dataType : "text",
    })
 		.done(function(res) {
		$("#schedule-table").html(res);
			
 			
					
 		})
 		.fail(function() { // 요청 실패 시
 			alert("요청실패");
 		});
		
}

</script>
</head>
<body>

<%-- breadcrumb --%>
<div class="container">
<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="#">Home</a></li>
    <li class="breadcrumb-item active" aria-current="page">theaters</li>
  
  </ol>
</nav>
</div>

<%-- MY영화관표시 --%>
<div class="container" align="right">
	<span>My영화관 &nbsp;</span><a href="#">로그인하세요</a><br>
	<span>My영화관 &nbsp;&nbsp;&nbsp;</span><a href="#">XXX지점</a>
</div>


<%-- 극장 선택 버튼 --%>
<div class="container text-center">
	  <div class="row">
	  <c:forEach var="theater" items="${theaterList}">
	    <div class="col">
			<button type="button" id="theater_button" style="width:100%" name="theater_num"  value="${theater.theater_num}" class="btn btn-outline-danger cols-4 my-3">${theater.theater_name}</button>
	    </div>
	    </c:forEach>
<!-- 	    <div class="col"> -->
<!-- 			<button type="button" style="width:100%" class="btn btn-outline-danger cols-4 my-3">송정점</button> -->
<!-- 	    </div> -->
<!-- 	    <div class="col"> -->
<!-- 			<button type="button"  style="width:100%" class="btn btn-outline-danger cols-4 my-3">해운대점</button> -->
<!-- 	    </div> -->
<!-- 	    <div class="col"> -->
<!-- 			<button type="button"  style="width:100%" class="btn btn-outline-danger cols-4 my-3">센텀점</button> -->
<!-- 	    </div> -->
<!-- 	    <div class="col"> -->
<!-- 			<button type="button"  style="width:100%" class="btn btn-outline-danger cols-4 my-3">수영점</button> -->
<!-- 	    </div> -->
<!--   </div> -->
  
<!--     <div class="row"> -->
<!-- 	    <div class="col"> -->
<!-- 			<button type="button" style="width:100%" class="btn btn-outline-danger cols-4 ">동래점</button> -->
<!-- 	    </div> -->
<!-- 	    <div class="col"> -->
<!-- 			<button type="button" style="width:100%" class="btn btn-outline-danger cols-4 ">경성대점</button> -->
<!-- 	    </div> -->
<!-- 	    <div class="col"> -->
<!-- 			<button type="button" style="width:100%" class="btn btn-outline-danger cols-4">광안리점</button> -->
<!-- 	    </div> -->
<!-- 	    <div class="col"> -->
<!-- 			<button type="button" style="width:100%" class="btn btn-outline-danger cols-4">초량점</button> -->
<!-- 	    </div> -->
<!-- 	   <div class="col"> -->
<!-- 			<button type="button"  style="width:100%" class="btn btn-outline-danger cols-4">개금점</button> -->
<!-- 	    </div> -->
<!--   	</div> -->
<!--   	<div class="row"> -->
<!-- 	    <div class="col"> -->
<!-- 			<button type="button" style="width:100%" class="btn btn-outline-danger cols-4 my-3 ">서면점</button> -->
<!-- 	    </div> -->
<!-- 	    <div class="col"> -->
<!-- 			<button type="button" style="width:100%" class="btn btn-outline-danger cols-4  my-3">사상점</button> -->
<!-- 	    </div> -->
<!-- 	    <div class="col"> -->
<!-- 			<button type="button" style="width:100%" class="btn btn-outline-danger cols-4 my-3">남포동점</button> -->
<!-- 	    </div> -->
<!-- 	    <div class="col"> -->
<!-- 			<button type="button" style="width:100%" class="btn btn-outline-danger cols-4 my-3">다대포점</button> -->
<!-- 	    </div> -->
<!-- 	   	<div class="col"> -->
<!-- 			<button type="button" style="width:100%" class="btn btn-outline-danger cols-4 my-3">명지점</button> -->
<!-- 	    </div> -->
  	</div>
</div>