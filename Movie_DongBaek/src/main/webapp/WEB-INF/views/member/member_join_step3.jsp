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
</style>
<script src="../js/jquery-3.7.0.js"></script>
<script type="text/javascript">
	
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
	
</script>
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
							    		<input type="text" class="form-control" id="member_id" name="member_id" required="required" maxlength="20">
					    			</c:when>
					    			<c:otherwise>	<%-- session에 email이 있을 경우(카카오, 네이버 로그인 시 --%>
							    		<input type="text" class="form-control" id="member_id" name="member_id" readonly="readonly">
					    			</c:otherwise>
					    		</c:choose>
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
				    	<div class="col-sm-12">
					    	<label for="birth">생년월일</label>		    	
				    	</div>

				    	<%--  가로로 나열을 어떻게 하는거지 --%>
				    	<div class="col-sm-12">
					    	<div class="row">
					    		<div class="col-3">
					    			<input type="text" class="form-control" id="birthYear" min="1900" max="2023" maxlength="4" placeholder="연도(4자리)">
					    		</div>
					    		<%-- 셀렉트 박스 : "월" 선택 --%>
					    		<div class="col-1 mr-3">
					    			<select id="birthMonth" class="form-select">
						    			<option selected>01</option>
						    			<option>02</option>
						    			<option>03</option>
						    			<option>04</option>
						    			<option>05</option>
						    			<option>06</option>
						    			<option>07</option>
						    			<option>08</option>
						    			<option>09</option>
						    			<option>10</option>
						    			<option>11</option>
						    			<option>12</option>
						    		</select> 월
					    		</div>
					    		<div class="col-3 ml-2">
					    			<select id="birthDay" class="form-select">
						    			<option selected>01</option><option>02</option><option>03</option><option>04</option><option>05</option><option>06</option><option>07</option><option>08</option><option>09</option><option>10</option>
						    			<option>11</option><option>12</option><option>13</option><option>14</option><option>15</option><option>16</option><option>17</option><option>18</option><option>19</option><option>20</option>
						    			<option>21</option><option>22</option><option>23</option><option>24</option><option>25</option><option>26</option><option>27</option><option>28</option>
<%-- 						    			<c:choose> --%>
<%-- 						    				<c:when test="${birthMonth.value eq '2월' }"> --%>
<!-- 						    					<option>29</option><option>30</option> -->
<%-- 						    				</c:when> --%>
						    				
<%-- 						    				<c:otherwise> --%>
<%-- 						    				</c:otherwise> --%>
<%-- 						    			</c:choose> --%>
						    		</select>
					    		</div>
					    	</div>
				    	</div>
			    </div>
			    
			    <!-- 생년월일 합친 데이터 -->
			    <input type="hidden" id="member_birth" name="member_birth" value="">
			    
				<!-- 전화번호 (필수) -->
				<div class="row mb-3">
				    <label for="inputCity" class="col-sm-12">전화번호</label>
				    <div class="col-sm-12"> <!-- 여기의 숫자 : input 입력 박스의 길이 조절 -->
					    <div class="input-group">
							<input type="text" class="form-control" id="inputPhone" name="phone" placeholder="- 없이" maxlength="11">
							<input class="btn btn-outline-danger" type="button" value="인증요청" id="inputPhoneCheck">
						</div>
				 	</div>
				 </div>

				 <!-- 인증번호 입력 -->
				 <div class="row mb-3">
		         	<label for="inputCity" class="col-sm-12">인증번호</label>
		            <div class="col-sm-12">
			            <div class="input-group">
						  	<input type="text" class="form-control" id="inputPhoneCheck2" name="phoneCheck2">
						  	<input class="btn btn-outline-danger" type="button" value="    확인    " >
						</div>
		            </div>
		         </div>
				 	
				 <!-- 이메일 (선택)  -->
				<div class="row mb-3">
				    <label for="inputCity" class="col-sm-12">이메일 <font size="2px">(선택)</font></label>
					  	<div class="col-sm-12">
					  		<input type="text" class="form-control" id="member_name" name="member_name">
					 	</div>
				</div>

					<!-- 좋아하는 장르(선택) -->				 	
					<div class="row mb-3">
				    	<label for="inputCity" class="col-sm-12">좋아하는 장르<font size="2px">(선택)</font></label>
					
						<!-- 좋아하는 장르(선택) : 셀렉트 박스 -->
						<%-- 셀렉트박스 작동 오류 : 추후 수정 예정 --%>
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
				 	</div> 
				 	
				 	<!-- 버튼  -->
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
  <footer id="pageFooter"><%@ include file="/resources/inc/footer.jsp"%></footer>
</body>