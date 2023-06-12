<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

.select {
/* 	appearance:none;  /* 화살표 없애기 공통*/
/* 	-webkit-appearance:none;  */ /* Safari and Chrome */
/* 	-moz-appearance:none;  */ /* Firefox */
	width: 475px; 
	height: 40px;
	padding: 5px 30px 5px 10px;
	border-radius: 4px;
	outline: 0 none;
}

.select::-ms-expand {  /* IE10, IE11*/
   display:none;   /*숨겨진 화살표의 영역유지 X */
   display:hidden;  /*숨겨진 화살표의 영역유지 O */

}

</style>
<script src="../js/jquery-3.7.0.js"></script>
<script type="text/javascript">

	// 아이디 중복 확인
	function checkDupId() {
		// 입력받은 ID 값을 가져와서 변수에 저장
		let id = document.fr.member_id.value;
		
		// ID 값에 대한 길이 판정 ( 5 ~ 10 글자 사이)
		if(id.length >= 5 && id.length <= 10) { // 유효한 길이
	 		var url ="";
			window.open(url, "checkId", "width=400, height=250");
			document.querySelector("#checkIdResult").innerHTML = "중복확인완료";
		} else { // 유효하지 않은 길이
			alert("아이디는 5 ~ 10 글자 가 필수입니다!");
			document.querySelector("#checkIdResult").innerHTML = "";
			document.fr.member_id.select();
		}
	}
	
	// 생년월일 가져오기
	$("#birthYear").blur(function() {
		birth();
	});
	$("#birthMonth").change(function() {
		birth();
	});
	$("#birthDay").change(function() {
		birth();
	});
	
	// 하나로 합치기
	function birth() {
		var year = $("#birthYear").val();
		var month = $("#birthMonth").val();
		var day = $("#birthDay").val();
		if(year != "" && month != "" && day != "") {
			$("member_birth").val(year + month + day);
		}
	};
	
	// email 주소 선택하면 앞 칸에 value 전달 함수
	function email(address) {
		document.fr.email2.value = address;
	}
	
	// 이메일 가져오기
	$("#email1").blur(function() {
		email();
	});
	$("#email2").change(function() {
		email();
	});
	
	// 하나로 합치기
	function email() {
		var email1 = $("#email1").val();
		var email2 = $("#email2").val();
		if(year != "" && month != "" && day != "") {
			$("member_email").val(email1 + "@" + email2);
		}
	};
	
	// 생년월일에 숫자만 입력하기
	function inputNum(id) {
		var element = document.getElementById('member_birth');
		element.value = element.value.replace(/[^0-9]/gi, "");
	}
	
	// 전화번호에 숫자만 입력하기
	function inputNum_phone(id) {
		var element = document.getElementById('member_phone');
		element.value = element.value.replace(/[^0-9]/gi, "");
	}
	
	
	
</script>
</head>
<body>
	<%-- Header 영역 --%>
	<header id="pageHeader"><%@ include file="../inc/header.jsp"%></header>
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
		
		<%-- 회원정보 입력 폼 시작 --%>		
		<div class="container-fluid w-600">
			<div class="row d-flex justify-content-center mt-3">
				<div class="col-10">	<%-- 전체 12개의 col중에 가운데 10개의 col 사용 --%>
					<form action="member_join_pro" method="post" name="fr">
					<%-- 회원 가입 폼 시작 --%>
					<!--  아이디 (필수)  -->
					<div class="row mb-3">
				    	<label for="inputEmail3" class="col-sm-5 ">아이디</label> <!-- col-sm-2 에서 col-sm-5 로 수정 , 아래 상동 -->
					    	<div class="col-sm-12">
						    		<c:choose>
						    			<c:when test="${empty sessionStorage.email }"> <%-- session에 email가 없으면 -> 그냥 회원가입 --%>
								    		<input type="text" class="form-control" id="member_id" name="member_id" required="required" maxlength="20" placeholder="5 ~ 10글자 이상 필수 입력"
								    			minlength="5" maxlength="10">
						    			</c:when>
						    			<c:otherwise>	<%-- session에 email이 있을 경우(카카오, 네이버 로그인 시 --%>
								    		<input type="text" class="form-control" id="member_id" name="member_id" readonly="readonly">
						    			</c:otherwise>
						    		</c:choose>
					    	</div>
					</div>
					    	
					<!-- 아이디 중복 확인 -->
					<div class="row mb-3">
				    	<label for="inputPassword3" class="col-sm-5 "></label>
					    	<div class="col-sm-12">
					     	 	<input type="button" class="form-control" id="member_pass" name="member_pass" required="required" value="아이디 중복 확인" onclick="checkDupId()">
					   		</div>
					</div>	
					
					<div class="row mb-3">
				    	<label for="inputPassword3" class="col-sm-5 "></label>
					    	<div class="col-sm-12">
								<span id="checkIdResult"></span>
					   		</div>
					</div>	
			    
				  	
					<!-- 비밀번호 (필수)  -->
				  	<div class="row mb-3">
				    	<label for="inputPassword3" class="col-sm-5 ">비밀번호</label>
				    	<div class="col-sm-12">
				     	 	<input type="password" class="form-control" id="member_pass" name="member_pass" required="required">
				   		</div>
				  	</div>
				  	
					<!-- 비밀번호 확인 (필수)  -->
				  	<div class="row mb-3">
				    	<label for="inputPassword3" class="col-sm-5">비밀번호 확인</label>
				    	<div class="col-sm-12">
				     	 	<input type="password" class="form-control" id="member_pass2" name="member_pass2" required="required">
				   		</div>
				  	</div>
				    
				    <!-- 이름 (필수)  -->
				  	<div class="row mb-3">
				  		<label for="inputEmail3" class="col-sm-5 col-form-label">이름</label>
				  		<div class="col-sm-12">
				  			<input type="text" class="form-control" id="member_name" name="member_name">
				 		</div>
				  	</div>
				
					<!-- 생년월일 (필수)  -->
				    <div class="row mb-3">
				  		<label for="inputEmail3" class="col-sm-5 col-form-label">생년월일</label>
				  		<div class="col-sm-12">
				  			<input type="text" class="form-control" id="member_birth" name="member_birth" placeholder="생년월일 8자리를 입력하세요." maxlength="8"
				  				   oninput="inputNum(this.id)">
				 		</div>
				  	</div>
				  	
					<!-- 전화번호 (필수) -->
					<div class="row mb-3">
					    <label for="inputCity" class="col-sm-12">전화번호</label>
					    <div class="col-sm-12"> <!-- 여기의 숫자 : input 입력 박스의 길이 조절 -->
						    <div class="input-group">
								<input type="text" class="form-control" id="member_phone" name="member_phone" placeholder="- 없이 전화번호를 입력하세요." maxlength="11"
									   oninput="inputNum_phone(this.id)">
							</div>
					 	</div>
					 </div>
				 	
					<!-- 이메일 (선택)  -->
					<div class="row mb-3">
					    <label for="inputCity" class="col-sm-12">이메일 <font size="2px">(선택)</font></label>
						  	<div class="col-sm-12">
						  		<input type="text" class="form-control" id="member_name" name="member_name" placeholder="이메일 주소를 입력하세요.">
						 	</div>
					</div>

					<!-- 좋아하는 장르(선택) -->				 	
					<div class="row mb-3">
				    	<label for="inputCity" class="col-sm-12">좋아하는 장르<font size="2px">(선택)</font></label>
						<!-- 좋아하는 장르(선택) : 셀렉트 박스 -->
						<div class="col-sm-12">
							<div class="selectBox_movie">
								<select name="member_like_genre" class="select">
									<option value="로맨스코미디">로맨스코미디</option>
									<option value="스릴러">스릴러</option>
									<option value="공포">공포</option>
									<option value="SF">SF</option>
									<option value="범죄">범죄</option>
									<option value="액션">액션</option>
									<option value="코미디">코미디</option>
									<option value="판타지">판타지</option>
									<option value="음악">음악</option>
									<option value="멜로">멜로</option>
									<option value="뮤지컬">뮤지컬</option>
									<option value="스포츠">스포츠</option>
									<option value="애니메이션">애니메이션</option>
									<option value="다큐멘터리">다큐멘터리</option>
									<option value="기타">기타</option>
								</select>
							</div>
						</div>
				 	</div> 
				 	
				 	<!-- 돌아가기 버튼 과 회원가입 버튼  -->
					<div class="col-12 d-flex justify-content-center">
				 		<input type="button" class="btn btn-secondary mr-3 btn-lg" onclick="location.href='./'" value="돌아가기">
				  		<input type="submit" class="btn btn-danger ml-3 btn-lg" value="회원가입">
				  	</div>
				  	
			</div>
		</div>
	</form>

	<!-- </section> -->
	</div>
	</article>
  <nav id="mainNav" class="d-none d-md-block sidebar">
  	<%-- 사이드바(최대 width:200px, 최소 width:150px, 전체 화면 사이즈 middle 이하되면 사라짐) --%>
  </nav>
  
  <div id="siteAds"></div>
  <%--페이지 하단 --%>
  <footer id="pageFooter"><%@ include file="../inc/footer.jsp"%></footer>
</body>