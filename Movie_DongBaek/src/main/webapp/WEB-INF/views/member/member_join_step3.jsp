<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<title>회원가입 3. 정보입력</title>
<style>
.w-900{
	width: 900px;
}
.w-600{
	width: 600px;
}
.h-500{
	height: 500px;
}

div {
	background-color: transparent;
}

th{
	width: 200px;
}
</style>
</head>
<body>
	<%-- Header 영역 --%>
	<header id="pageHeader"><%@ include file="/resources/inc/header.jsp"%></header>

	<%--본문 영역 --%>
	<!--  가운데 정렬 코드 : class="container d-flex justify-content-center"  -->
	<article id="mainArticle">
 	 		<%-- 4단계 탭 --%>
 	 			<%-- 네이게이션 중앙 정렬 : justify-content-center --%>
		 		<nav class=	"nav nav-pills justify-content-center">
		  			<a class="nav-link" aria-current="page" href="#">본인인증</a>
		 			<a class="nav-link" href="#">약관동의</a>
					<a class="nav-link active btn-danger" href="#">정보입력</a>
					<a class="nav-link" href="#">가입완료</a>
				</nav>
				<hr>
				
		<div class="container-fluid w-600">
<!-- 		<section id="content"> -->
		<div class="row d-flex justify-content-center mt-3">
			<div class="col-10">	<%-- 전체 12개의 col중에 가운데 10개의 col 사용 --%>
				<form>
				<%-- 회원 가입 폼 시작 --%>
				<!--  아이디 -->
				<div class="row mb-3">
			    	<label for="inputEmail3" class="col-sm-5 ">아이디</label> <!-- col-sm-2 에서 col-sm-5 로 수정 , 아래 상동 -->
				    	<div class="col-sm-12">
				    		<input type="email" class="form-control" id="inputId" name="id" required="required">
				    	</div>
			  	</div>
			  	
				<!-- 비밀번호 -->
			  	<div class="row mb-3">
			    	<label for="inputPassword3" class="col-sm-5 ">비밀번호</label>
			    	<div class="col-sm-12">
			     	 	<input type="password" class="form-control" id="inputPasswd" name="passwd" required="required">
			   		</div>
			  	</div>
			  	
				<!-- 비밀번호 확인 -->
			  	<div class="row mb-3">
			    	<label for="inputPassword3" class="col-sm-5">비밀번호 확인</label>
			    	<div class="col-sm-12">
			     	 	<input type="password" class="form-control" id="inputPasswd2" name="passwd2" required="required">
			   		</div>
			  	</div>
			    
			  	<div class="row mb-3">
			  		<label for="inputEmail3" class="col-sm-5 col-form-label">이름</label>
			  		<div class="col-sm-12">
			  			<input type="text" class="form-control" id="inputName" name="name">
			 		</div>
			  	</div>
			
			    <div class="row mb-3">
			    	<div class="col-sm-12">
				    	<label for="birth">생년월일</label>		    	
			    	</div>
			    	<!--  가로로 나열을 어떻게 하는거지 -->
			    	<div class="col-sm-12">
			    	<div class="row">
			    		<div class="col-3">
			    			<input type="text" class="form-control" id="birthYear">
			    		</div>
			    		<div class="col-1 mr-3">
			    			<select id="birthMonth" class="form-select">
				    			<option selected>1월</option>
				    			<option>2월</option>
				    			<option>3월</option>
				    			<option>4월</option>
				    			<option>5월</option>
				    			<option>6월</option>
				    			<option>7월</option>
				    			<option>8월</option>
				    			<option>9월</option>
				    			<option>10월</option>
				    			<option>11월</option>
				    			<option>12월</option>
				    		</select>
			    		</div>
			    		<div class="col-3 ml-2">
			    			<input type="text" class="form-control" id="birthYear">
			    		</div>
			    	</div>
			    	</div>
<!-- 			    	<div class="col-md-3">
			    		<input type="text" class="form-control" id="birthDay"> </div>
			    	<div class="col-md-3">
			    		<select id="birthMonth" class="form-select">
			    			<option selected>1월</option>
			    			<option>2월</option>
			    			<option>3월</option>
			    			<option>4월</option>
			    			<option>5월</option>
			    			<option>6월</option>
			    			<option>7월</option>
			    			<option>8월</option>
			    			<option>9월</option>
			    			<option>10월</option>
			    			<option>11월</option>
			    			<option>12월</option>
			    		</select>
			    	</div>
			    	<div class="col-md-3">
			    		<input type="text" class="form-control" id="birthDay"> </div>
			    </div>
-->			    </div>
			    <%-- 전화번호 --%>
			    <div class="row mb-3">
			    	<label for="inputCity" class="col-sm-12">휴대전화</label>
			    	<div class="col-sm-12"> <!-- 여기의 숫자 : input 입력 박스의 길이 조절 -->
<!-- 
			    		<input type="text" class="col-sm-5 mr-3" id="inputPhone" name="phone">
			    		<input type="button" class="col-sm-4 ml-3" id="inputPhoneCheck" name="phoneCheck" value="인증번호">
			    		</div>
-->
				    	<div class="input-group">
							<input type="text" class="form-control" id="inputPhone" name="phone" placeholder="- 없이">
							<input class="btn btn-outline-danger" type="button" value="인증요청" id="inputPhoneCheck">
						</div>
			 		</div>
			 	</div>
			 	<%-- 인증번호 입력 --%>
<!-- 
			    	<div class="row mb-3 col-sm-12">
			    		<input type="text" class="col-sm-10" id="inputPhoneCheck2" name="phoneCheck2">
			    	</div>
-->
			    <div class="row mb-3">
	              <label for="inputCity" class="col-sm-12">인증번호</label>
	              <div class="col-sm-12">
		              <div class="input-group">
					  	<input type="text" class="form-control" id="inputPhoneCheck2" name="phoneCheck2">
					  	<input class="btn btn-outline-danger" type="button" value="    확인    " >
					  </div>
	              </div>
	            </div>
			 	
			 	<!-- 이메일 ( 선택)  -->
				<div class="row mb-3">
			    	<label for="inputCity" class="col-sm-12">이메일 <font size="2px">(선택)</font></label>
			    	<div class="col-md-3"> <!-- 여기의 숫자 : input 입력 박스의 길이 조절 -->
			    		<input type="text" class="form-control" id="email1"> </div>
			    	<div class="col-md-3"> 
			    		<input type="text" class="form-control" id="email2" placeholder="@naver.com"> </div>
			    	<div class="col-md-3"> 
			    		<select id="inputState" class="form-select">
			    			<option selected>@naver.com</option>
			    			<option>@google.com</option>
			    			<option>@kakao.com</option>
			    			<option>직접 입력</option>
			    		</select>
			    	</div>
			 	</div> 
			 	
				<div class="row mb-3">
			    	<label for="inputCity" class="col-sm-12">좋아하는 장르<font size="2px">(선택)</font></label>
			 	</div> 
	
				<!-- Example split danger button -->
				<div class="btn-group">
					<button type="button" class="btn btn-danger dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
				    	<span class="visually-hidden">선택안함</span>
					</button>
						<ul class="dropdown-menu">
				    		<li><a class="dropdown-item">스릴러</a></li>
						    <li><a class="dropdown-item">로맨스코미디</a></li>
						    <li><a class="dropdown-item">공포</a></li>
						    <li><a class="dropdown-item">SF</a></li>
						    <li><a class="dropdown-item">범죄</a></li>
						    <li><a class="dropdown-item">액션</a></li>
						    <li><a class="dropdown-item">코미디</a></li>
						    <li><a class="dropdown-item">판타지</a></li>
						    <li><a class="dropdown-item">음악</a></li>
						    <li><a class="dropdown-item">멜로</a></li>
						    <li><a class="dropdown-item">뮤지컬</a></li>
						    <li><a class="dropdown-item">스포츠</a></li>
						    <li><a class="dropdown-item">애니메이션</a></li>
						    <li><a class="dropdown-item">다큐멘터리</a></li>
						    <li><a class="dropdown-item">기타</a></li>
				   			<li><hr class="dropdown-divider"></li>
				   			<li><a class="dropdown-item">Separated link</a></li>
				  		</ul>
				</div>
			
				<div class="col-12 d-flex justify-content-center">
			 		<button type="submit" class="btn btn-secondary mr-3 btn-lg" >&nbsp;&nbsp;&nbsp;이전&nbsp;&nbsp;&nbsp;</button>
			  		<button type="submit" class="btn btn-danger ml-3 btn-lg" >회원가입</button>
			  	</div>
				</form>
			</div>
		</div>

	<!-- </section> -->
	</div>
	</article>

  <nav id="mainNav" class="d-none d-md-block sidebar">
  	<%-- 사이드바(최대 width:200px, 최소 width:150px, 전체 화면 사이즈 middle 이하되면 사라짐) --%>
  </nav>
  
  <div id="siteAds"></div>
  <%--페이지 하단 --%>
  <footer id="pageFooter"><%@ include file="/resources/inc/footer.jsp"%></footer>
</body>