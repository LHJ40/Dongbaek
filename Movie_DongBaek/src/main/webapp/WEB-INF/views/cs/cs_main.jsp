<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/sidebar.css" rel="stylesheet" type="text/css">
<title>영화 예매 사이트</title>
<style>
#mainNav{
/* 		border: 1px solid #f00; */
	padding: 8rem 2rem;	
}
	
#mainNav>ul{
	list-style: none;
}

a>b{
	color: #000;
	text-decoration: none;
}

a:hover{
	color: #000;
	text-decoration: none;
}

#mainNav>ul{
	list-style: none;
}
	
</style>

</head>
<body>
 <header id="pageHeader">
 <%--네비게이션 바 영역 --%>
  <%@ include file="../inc/header.jsp"%>
 </header>
 
  <article id="mainArticle" class="d-flex justify-content-center">
  <%--본문내용 --%>
  <div class="container-fluid w-900">
  	<br><br><br>
	<h1>고객센터</h1><br>
	<div class="row">
		<div class="col-12">
			<div class="row d-flex justify-content-center">
				<div class="col-8">	<%-- 위의 d-flex~ 클래스와 함께 사용해서 전체 12개의 col중에 가운데 8개의 col 사용  --%>
					<div class="row">
					    <div class="col-6 d-flex justify-content-center">
					    	<a href="cs_qna_form" class="text-center">
						    	<img src="${pageContext.request.contextPath}/resources/img/online-meeting.png"  alt="..." width="100px" height="100px"style=" display:block;">
						    	<b>1:1 문의</b>
							</a>
					    </div>
					    <div class="col-6 d-flex justify-content-center">
					    	<a href="cs_faq" class="text-center">
						    	<img src="${pageContext.request.contextPath}/resources/img/faq.png"  alt="..." width="100px" height="100px"style=" display:block;">
						    	<b>FAQ</b>
					    	</a>
					    </div>				
					</div>
				</div>
			</div>
			<div class="row d-flex justify-content-center">
				<div class="col-8">
				    <br>
					<b>공지사항</b>&nbsp;&nbsp;&nbsp;<a href="cs_notice">더보기></a>
					<hr>
					<table>
				    	<tr>
				    		<th>
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-map-pin"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>
				   			</th>
						    <th>[서면]</th>
						    <td>대관행사...</td>
				    	</tr>
				    
						<tr>
				    		<th>
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path d="m16.114 1.553 6.333 6.333a1.75 1.75 0 0 1-.603 2.869l-1.63.633a5.67 5.67 0 0 0-3.395 3.725l-1.131 3.959a1.75 1.75 0 0 1-2.92.757L9 16.061l-5.595 5.594a.749.749 0 1 1-1.06-1.06L7.939 15l-3.768-3.768a1.75 1.75 0 0 1 .757-2.92l3.959-1.131a5.666 5.666 0 0 0 3.725-3.395l.633-1.63a1.75 1.75 0 0 1 2.869-.603ZM5.232 10.171l8.597 8.597a.25.25 0 0 0 .417-.108l1.131-3.959A7.17 7.17 0 0 1 19.67 9.99l1.63-.634a.25.25 0 0 0 .086-.409l-6.333-6.333a.25.25 0 0 0-.409.086l-.634 1.63a7.17 7.17 0 0 1-4.711 4.293L5.34 9.754a.25.25 0 0 0-.108.417Z"></path></svg>
				    		</th>
						    <th>[공지]</th>
						    <td>동백 씨네마 개인정보...</td>
						</tr>
				    </table>
				</div>
			</div>
 		</div>
 	</div>	
  </div>
  </article>
  
  <nav id="mainNav" class="d-none d-md-block sidebar">
  <%--왼쪽 사이드바 --%>
	<jsp:include page="/WEB-INF/views/sidebar/sideBar_cs.jsp"></jsp:include>
  </nav>
  
  <div id="siteAds"></div>
  <%--페이지 하단 --%>
  <footer id="pageFooter"><%@ include file="../inc/footer.jsp"%></footer>
</body>