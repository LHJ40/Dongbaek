<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>영화 예매 사이트</title>
<style>
.table table-striped>tr>td>button{
	height:4em;
}
.nav-link{

}
</style>
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
	    <div class="col">
			<button type="button" style="width:100%" class="btn btn-outline-danger cols-4 my-3">기장점</button>
	    </div>
	    <div class="col">
			<button type="button" style="width:100%" class="btn btn-outline-danger cols-4 my-3">송정점</button>
	    </div>
	    <div class="col">
			<button type="button"  style="width:100%" class="btn btn-outline-danger cols-4 my-3">해운대점</button>
	    </div>
	    <div class="col">
			<button type="button"  style="width:100%" class="btn btn-outline-danger cols-4 my-3">센텀점</button>
	    </div>
	    <div class="col">
			<button type="button"  style="width:100%" class="btn btn-outline-danger cols-4 my-3">수영점</button>
	    </div>
  </div>
  
    <div class="row">
	    <div class="col">
			<button type="button" style="width:100%" class="btn btn-outline-danger cols-4 ">동래점</button>
	    </div>
	    <div class="col">
			<button type="button" style="width:100%" class="btn btn-outline-danger cols-4 ">경성대점</button>
	    </div>
	    <div class="col">
			<button type="button" style="width:100%" class="btn btn-outline-danger cols-4">광안리점</button>
	    </div>
	    <div class="col">
			<button type="button" style="width:100%" class="btn btn-outline-danger cols-4">초량점</button>
	    </div>
	   <div class="col">
			<button type="button"  style="width:100%" class="btn btn-outline-danger cols-4">개금점</button>
	    </div>
  	</div>
  	<div class="row">
	    <div class="col">
			<button type="button" style="width:100%" class="btn btn-outline-danger cols-4 my-3 ">서면점</button>
	    </div>
	    <div class="col">
			<button type="button" style="width:100%" class="btn btn-outline-danger cols-4  my-3">사상점</button>
	    </div>
	    <div class="col">
			<button type="button" style="width:100%" class="btn btn-outline-danger cols-4 my-3">남포동점</button>
	    </div>
	    <div class="col">
			<button type="button" style="width:100%" class="btn btn-outline-danger cols-4 my-3">다대포점</button>
	    </div>
	   	<div class="col">
			<button type="button" style="width:100%" class="btn btn-outline-danger cols-4 my-3">명지점</button>
	    </div>
  	</div>
</div>