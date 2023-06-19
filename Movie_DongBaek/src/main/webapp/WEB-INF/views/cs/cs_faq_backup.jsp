<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<title>영화 예매 사이트</title>
<style>
#mainNav{
/* 		border: 1px solid #f00; */
		padding: 8rem 2rem;
		
	}
	
	#mainNav>ul{
		list-style: none;
	}
	.seachArea{
		margin: 1.2em 0;
	}
	/* 검색창안에 검색아이콘 넣기 위한 설정 */
	.board-search {
 		margin: 0.8em 0;
 		width: 300px; 
 		height: 2em;
 		border-radius: 3px; 
 		border: 1px solid #ccc; 
/* 		display: flex; */
/* 		justify-content: center; */
/* 		align-items: center; */
		vertical-align: center;
 		z-index: 1;
 		opacity: 1;
	}
	.board-search>#searchTxt {
		width: 200px;
		height: 1.5em;
		border: none;
/* 		-webkit-appearance: none; */
		text-align: left;
		margin-left: 10px;
		overflow: auto;	/* 검색어가 길어졌을 때 오른쪽으로 검색되도록 하기 위해*/
		z-index: -1;
		font-size: 15px;
	}
	.board-search>#searchTxt:focus {
		outline: none;
/* 		width: 300px; */
/* 		text-align: left; */
	}
	.clear {
		clear: both;
	}
	
</style>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
<script type="text/javascript">
	
	$(function() {
		// 카테고리별 질문 & 답변 들고오기
		// 화면 처음 로딩 시 전체 질문, 답변 들고오기
		
		
	});
	
</script>
</head>
<body>
 <header id="pageHeader">
 <%--네비게이션 바 영역 --%>
  <%@ include file="../inc/header.jsp"%>
 </header>
 
  <article id="mainArticle">
  <%--본문내용 --%>
  
   <div class="container-fluid w-900" >
  
	 <nav aria-label="breadcrumb">
	  <ol class="breadcrumb bg-white">
	    <li class="breadcrumb-item"><a href="cs_main">고객센터 홈</a></li>
	    <li class="breadcrumb-item active" aria-current="page">자주묻는 질문</li>
	  </ol>
	</nav>

		<h1>자주묻는 질문</h1>
		
		<%-- 검색기능 --%>
		<div class="seachArea">
			<b>빠른 검색</b> &nbsp;&nbsp;
			<span class="board-search w460px">
				<input type="search" id="searchTxt" title="검색어를 입력해 주세요." placeholder="검색어를 입력해 주세요." class="input-text" value="" maxlength="15">
				<span class="material-symbols-outlined">search</span>
			</span>
		</div>
		<br>
		<div class="btn-group " role="group" aria-label="Basic example">
		  <button type="button" class="btn btn-outline-secondary">전체</button>
		  <button type="button" class="btn btn-outline-secondary">예매</button>
		  <button type="button" class="btn btn-outline-secondary">멤버십</button>
		  <button type="button" class="btn btn-outline-secondary">결제수단</button>
		  <button type="button" class="btn btn-outline-secondary">극장</button>
		  <button type="button" class="btn btn-outline-secondary">스토어</button>
		  <button type="button" class="btn btn-outline-secondary">할인혜택</button>
		  <hr>
		</div>
		<hr>
		  
			<div class="faq-list-box">
				<p class="reset mb10">
					<strong>
						<span id="totalTitle">전체</span>
						<span class="font-green" id="totalCnt">0</span>건
					</strong>
				</p>
				
				<div class="faq-list">
					<ul>
					</ul>
				</div>
			</div>
	<table  class="table">
	  <thead>
	    <tr>
	      <th scope="col">번호</th>
	      <th scope="col">유형</th>
	      <th scope="col">제목</th>
	      <th scope="col">등록</th>
	    </tr>
	  </thead>
	  <tbody>
  
  <%--   	<c:forEach var="i" items="DB에서 게시글 불러오기"> --%>
	<!--   		<tr> -->
	<!--   			<td><a>극장</a></td> -->
	<!--   			<td><a>제목</a></td> -->
	<!--   			<td><a>등록일</a></td> -->
	<!--   		</tr> -->
	<%--   	</c:forEach> --%>
  
  
    <tr>
      <th scope="row">1</th>
      <td>유형유형</td>
      <td>제목제목제목제목제목</td>
      <td>등록일등록일</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>Larry</td>
      <td>the Bird</td>
      <td>@twitter</td>
    </tr>
  </tbody>
</table>


       
		

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