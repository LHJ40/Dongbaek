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
<header id=pageHeader>
<%@ include file="/resources/inc/header.jsp"%>      
</header>

<section id=mainArticle>
<div id=content-margin>

</div>
<!-- 본문 내용 입력-->
<%-- 극장선택탭 include --%>
<%@ include file="theater_tap.jsp"%>

<br>
<br>
<%-- 북마크 버튼 --%>
<div class="container" align="right" >
<a href="#">
	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bookmark" viewBox="0 0 16 16">
	  <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
	</svg>
	My 영화관
</a>
<br>
</div>


<%-- 탭 collapse --%>
<div class="container" align="center" >
	<%-- 탭제목 --%>
	<div class="row-col-my-5">
		<nav>
		  <div class="nav nav-tabs" id="nav-tab" role="tablist">
		   <button class="nav-link" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true" onclick="location.href='theater_main'">
		    	극장정보
		    </button>
		    <button class="nav-link active" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false" onclick="location.href='theater-runningtime_tap'">
		    	상영시간표
		    </button>
		    <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false" onclick="location.href='theater-price_tap'">
		    	요금안내
		    </button>
		  </div>
		</nav>
	</div>	
	<%-- 탭 내용 - collpse --%>
	<div class="row-col-my-5" >
		<div class="tab-content" id="nav-tabContent">
		  <div class="tab-pane fade show active my-3 mx-6" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab" tabindex="0">
			  	<div class="row container" align="right">
					<input type="date" id="start" value="2023-05-23" min="2018-01-01" max="2023-12-31">
				</div>
				<div class="row container" align="center">
				
					<table class="table table-hover" style="width:50%" >
						<tr>
							<td colspan=3><a href="#">인어공주</a></td>
						</tr>
						<tr>
							<td>1관</td>
							<td>
								<button style="height:4em">10:00</button>
								<button style="height:4em">15:00</button>
								<button style="height:4em">19:00</button>
							</td>
						</tr>
						<tr>
							<td>3관</td>
							<td>
								<button style="height:4em">13:00</button>
								<button style="height:4em">15:00</button>
							</td>
						</tr>
						<tr>
							<td colspan=3><a href="#">분노의질주</a></td>
						</tr>
						<tr>
							<td>5관</td>
							<td>
								<button style="height:4em">11:00</button>
								<button style="height:4em">17:00</button>
							</td>
						</tr>
						<tr>
							<td colspan=3><a href="#">가디언즈 오브 갤럭시</a></td>
						</tr>
						<tr>
							<td>2관</td>
							<td>
								<button style="height:4em">15:00</button>
								<button style="height:4em">17:00</button>
							</td>
						</tr>
					</table>	
				

				</div>
		  </div>
		  
		  
		  <%-- 두번째탭 내용--%>
		  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab" tabindex="0">
		  	<h6>상영시간표</h6>
		  </div>
		  
		  <%-- 세번째탭 내용--%>
		  <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab" tabindex="0">
		  	<h6>관람료</h6>
		  </div>
		</div>
		</div>
	</div>
	<div>
</div>
	
<%--컨텐츠 섹션 끝 ------------------------------------------------------------------------------------- --%>
</section>
 <nav id="mainNav">
  <%--왼쪽 사이드바 --%>
  <div id=left-margin></div>
  </nav>
 <div id="siteAds"></div>
<footer id=pageFooter>
<%@ include file="/resources/inc/footer.jsp"%>
</footer>
</body>
</html>