<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<title>동백시네마 회원가입 2. 약관동의</title>
<script src="../js/jquery-3.7.0.js"></script>
<script type="text/javascript">
	// 전체선택 체크박스 체크 시 하위 체크박스 모두 checked로 변경
	$(function() {
		$("#checkAll").on("change", function() {
			if($("#checkAll").is(":checked")) { // 체크 시
				$(":checkbox").prop("checked", true);
			} else { // 체크해제 시				
				$(":checkbox").prop("checked", false);
			}
		});
	});
</script>
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
<%--네비게이션 바 영역 --%>
<header id="pageHeader"><%@ include file="../inc/header.jsp"%></header>
		<article id="mainArticle">
	<!-- 	<div class="container-fluid w-900" style="border: 1px solid gray"> -->
		<%--본문내용 --%>
	 	 	<!-- 4단계 탭 -->
	 	 		<%-- 네이게이션 중앙 정렬 : justify-content-center --%>
	 		<nav class=	"nav nav-pills justify-content-center">
	  			<a class="nav-link" aria-current="page">본인인증</a>
	 			<a class="nav-link active btn-danger">약관동의</a>
				<a class="nav-link">정보입력</a>
				<a class="nav-link">가입완료</a>
			</nav>
	  		<hr>
	  		
	  	<%-- 마게팅 약관의 동의를 파라미터로  다음 페이지인 정보 입력 페이지로 넘긴 후에 DB로 INSERT --%>
		<form action="member_join_step3" method="post">
			<div class="container-fluid w-600">
		  		<!-- 약관 전체 동의 체크박스 - jQuery 기능 구현 -->
		  		<div class="terms_p">
		  			<p class="terms_check_all">
		            	<span class="input_check">
		                	<input type="checkbox" id="checkAll" name="checkAll">
			                <label for="checkAll">
			                	<span class="checkAll_txt ">
			                		 동백시네마 이용약관, 개인정보 수집 및 이용, 위치기반서비스 이용약관(선택), <br>
			                 		 프로모션 정보 수신(선택)에 모두 동의합니다.
			                	</span>
			                </label>
		                </span>
					</p>
		  		</div>
		         <%-- 약관 1 : 필수 항목 : required  --%>
		  		<div class="terms_p">
		  			<p class="terms_check">
		            	<span class="input_check">
		                	<input type="checkbox" id="check1" name="check1" required="required">
		                <label for="check1">
		                	<span class="check1_txt">
		                		동백극장 이용약관 동의(필수)
		                		<%-- 수정 필요 : textarea 웹 화면에서 크기 조절이 가능한 상태
		                		크기 조절이 불가능하게 바꾸어야 함 --%>
		                		<div class="form-floating overflow-auto">
		 							<textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea" readonly="readonly">
		 							동백시네마 이용약관, 개인정보 수집 및 이용, 위치기반서비스 이용약관(선택),
			                 		 프로모션 정보 수신(선택)에 모두 동의합니다.
		 							</textarea>
		 							<label for="floatingTextarea"></label>
								</div>
		                	</span>
		                </label>
		                </span>
					</p>
		  		</div>
		  		
		        <%-- 약관 2 : 필수 항목 : required  --%>
		  		<div class="terms_p">
		  			<p class="terms_check">
		            	<span class="input_check"> 
		            		<!-- 필수 항목 : required 속성-->
		                	<input type="checkbox" id="check2" name="check2" required="required">
		                <label for="check2">
		                	<span class="check2_txt">
		                		개인정보 수집 및 이용 동의(필수)
								<div class="form-floating overflow-auto">
		 							<textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea" readonly="readonly"></textarea>
								</div>
		                	</span>
		                </label>
		                </span>
					</p>
		  		</div>
		  		
		  		<%-- 약관 3 : 선택 항목 --%>
		  		<%-- 파라미터로 다음 페이지로 가지고 가야하는 항목 --%>
		  		<div class="terms_p">
		  			<p class="terms_check">
		            	<span class="input_check">
		            		<!-- 필수 항목 : required 속성 -->
		            		<%-- 선택 사항 중 마케팅 활용은 컬럼이 있어 id로 컬럼명 넣음 --%>
		                	<input type="checkbox" id="check3" name="member_agree_marketing" name="check3">
		                <label for="check3">
		                	<span class="check3_txt">
		                		마케팅 활용을 위한 개인 정보 수집 이용 안내(선택)
								<div class="form-floating overflow-auto">
		 							<textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea" readonly="readonly"></textarea>
								</div>
		                	</span>
		                </label>
		                </span>
					</p>
		  		</div>
		  		
		  		<%-- 네이버 callback 구현--%>
		  		<script type="text/javascript">
					  var naver_id_login = new naver_id_login("YOUR_CLIENT_ID", "YOUR_CALLBACK_URL");
					  // 접근 토큰 값 출력
// 					  alert(naver_id_login.oauthParams.access_token);
					  // 네이버 사용자 프로필 조회
					  naver_id_login.get_naver_userprofile("naverSignInCallback()");
					  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
					  function naverSignInCallback() {
						 // 수정 필요 - 휴대전화 와 이름 가져오기 
// 					    alert(naver_id_login.getProfileData('email'));
// 					    alert(naver_id_login.getProfileData('nickname'));
// 					    alert(naver_id_login.getProfileData('age'));
					  }
				</script>
		  		
		<!-- 		<div class="d-grid gap-2"> -->
				<div class="col-12 d-flex justify-content-center">
					<!-- 취소 버튼 클릭 시 메인페이지로 돌아가기 -->
					<!-- 확인 버튼 클릭 시 다음 단계인 정보입력 페이지로 넘어아기 -->
		  			<button class="btn btn-secondary mr-3 btn-lg" type="button" onclick="location.href='./'">&nbsp;&nbsp;취소&nbsp;&nbsp;</button>
		  			<button class="btn btn-danger ml-3 btn-lg" type="submit">&nbsp;&nbsp;확인&nbsp;&nbsp;</button>
				</div>
			</div>
		</form>
  </article>
  <nav id="mainNav" class="d-none d-md-block sidebar">
  	<%-- 사이드바(최대 width:200px, 최소 width:150px, 전체 화면 사이즈 middle 이하되면 사라짐) --%>
  </nav>
  
  <div id="siteAds"></div>
  <%--페이지 하단 --%>
  <footer id="pageFooter"><%@ include file="../inc/footer.jsp"%></footer>
</body>