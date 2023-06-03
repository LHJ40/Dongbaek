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
<link href="${pageContext.request.contextPath }/resources/css/button.css" rel="stylesheet" type="text/css">

<title>영화 예매 사이트</title>
<style>
.jumbotron{
	padding: 1rem 1rem;
}

.jumbotron div, .jumbotron p{
	background-color: inherit;
}
.w-900{
	width: 900px;
}
.h-500{
	height: 500px;
}

div {
	background-color: transparent;
}

/* 회원로그인/비회원로그인/비회원예매 확인 탭 */
.nav-pills .nav-link.active {
	color: #fff;
	background-color: #ef4f4f;
}

.nav-link:hover {
	color: #ef4f4f;
}

/* 확인용 */
.container-fluid{
	border: 1px solid gray;
}

#mainNav{
	border: 1px solid blue;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#button-addon1").on("click", function() {
			$("#button-addon1").attr("value", "재전송");			
		});
	});
	
	$(function() {
		$("#button-addon2").on("click", function() {
			$("#button-addon2").attr("value", "확인완료");			
		});
	});
	
</script>

</head>
<body>
  <%--네비게이션 바 영역 --%>
  <header id="pageHeader"><%@ include file="/resources/inc/header.jsp"%></header>
 
  <article id="mainArticle">
  <%--본문내용 --%>
  <div class="container-fluid w-900">
 	<%-- 회원로그인/비회원로그인/비회원예매 확인 탭 --%>
	<header class="d-flex justify-content-center py-3">
      <ul class="nav nav-pills">
        <li class="nav-item"><a href="mem_login_form.jsp" class="nav-link">회원로그인</a></li>
        <li class="nav-item"><a href="#" class="nav-link active" aria-current="page">비회원로그인</a></li>
        <li class="nav-item"><a href="no_mem_reservation_check_form.jsp" class="nav-link">비회원예매 확인</a></li>
      </ul>
    </header>
	
	<%-- 비회원 로그인 폼 --%>
	<div class="row mt-3" style="border: 1px solid red;">
		<div class="col-6 mt-3">
			<form class="needs-validation mt-3 py-3" novalidate="">
			
				<%-- 이름 --%>
	            <div class="row mb-3">
	              <label for="name" class="col-3 text-nowrap">이름</label>
	              <div class="col-9">
		              <input type="text" class="form-control" id="name" name="name" placeholder="이름" required="required">
		              <div class="invalid-feedback">
		                이름을 입력하세요
		              </div>
	              </div>
	            </div>
	            
	            <%-- 생년월일 --%>		
	            <div class="row mb-3">
	              <label for="birth" class="col-3 text-nowrap">생년월일</label>
	              <div class="col-9">
		              <input type="text" class="form-control" id="birth" name="birth" placeholder="생년월일(6자리)" required="required">
		              <div class="invalid-feedback">
		                생년월일을 입력하세요
		              </div>
	              </div>
	            </div>
	            
	            <%-- 휴대폰번호 --%>
	            <div class="row mb-3">
	              <label for="phoneNum" class="col-3 text-nowrap">휴대폰번호</label>
	              <div class="col-9">
		              <div class="input-group">
					  	<input type="text" class="form-control" id="phoneNum" name="phoneNum" placeholder="- 없이" required="required" aria-describedby="button-addon1">
					  	<input class="btn btn-outline-red" type="button" value="인증요청" id="button-addon1" data-toggle="modal" data-target="#sendCheckNum">
					  </div>
		              <div class="invalid-feedback">
		                휴대폰번호를 입력하세요
	              	</div>
	              </div>
	            </div>
	            
	            <%-- 인증번호 --%>
	            <div class="row mb-3">
	              <label for="checkNum" class="col-3 text-nowrap">인증번호</label>
	              <div class="col-9">
		              <div class="input-group">
					  	<input type="text" class="form-control" id="checkNum" name="checkNum" placeholder="- 없이" required="required" aria-describedby="button-addon2">
					  	<input class="btn btn-outline-red" type="button" value="    확인    " id="button-addon2" data-toggle="modal" data-target="#checkFinish">
					  </div>
		              <div class="invalid-feedback">
		                인증번호를 입력하세요
		              </div>
	              </div>
	            </div>
	            
	            <%-- 비밀번호 --%>
	            <div class="row mb-3">
	              <label for="passwd" class="col-3 text-nowrap">비밀번호</label>
	              <div class="col-9">
		              <input type="password" class="form-control" id="passwd" name="passwd" placeholder="비밀번호(4자리)" required="required">
		              <div class="invalid-feedback">
		                비밀번호를 입력하세요
		              </div>
		          </div>
	            </div>
	            
	            <%-- 비밀번호 확인 --%>
	            <div class="row">
	              <label for="passwdCheck" class="col-3 text-nowrap">비밀번호확인</label>
	              <div class="col-9">
		              <input type="password" class="form-control" id="passwdCheck" name="passwdCheck" placeholder="비밀번호(4자리)확인" required="required">
		              <div class="invalid-feedback">
		                비밀번호를 입력하세요
		              </div>
	              </div>
	            </div>            	
			</form>
		</div>
				
		<%-- 비회원예매 개인정보 처리방침 --%>
		<div class="col-6 mt-3">
			<div class="jumbotron">
				<h4>비회원예매 개인정보 처리방침</h4>
				<hr>
				
				<%-- 수집목적 --%>
				<div class="row mb-3">
					<div class="col-3">
						<b class="text-nowrap">수집목적</b>
					</div>
					<div class="col-9 text-break">
						비회원예매 서비스 제공/ 이용자식별 / 구매 및 결제
					</div>
				</div>
				
				<%-- 수집항목 --%>
				<div class="row mb-3">
					<div class="col-3">
						<b class="text-nowrap">수집항목</b>
					</div>
					<div class="col-9 text-break">
						이름, 생년월일, 휴대폰번호, 비밀번호 
					</div>
				</div>
				
				<%-- 보유기간 --%>
				<div class="row mb-3">
					<div class="col-3">
						<b class="text-nowrap">보유기간</b>
					</div>
					<div class="col-9 text-break">
						관람 또는 취소 후 7일 이내
					</div>
				</div>
				
				<%-- 동의/비동의 버튼 --%>
				<div class="row mb-3 px-3">
					<div class="col-lg-12 p-2 bg-light bg-opacity-25 rounded d-flex justify-content-center">
						<div class="form-check form-check-inline pr-3">
						  <input class="form-check-input" type="radio" name="agree_disagree" id="agree">
						  <label class="form-check-label" for="agree">동의</label>
						</div>
						<div class="form-check form-check-inline pl-3">
						  <input class="form-check-input" type="radio" name="agree_disagree" id="disagree">
						  <label class="form-check-label" for="disagree">비동의</label>
						</div>
					</div>
				</div>
				
				<%-- 주의사항 --%>
				<p class="mb-3">
					정보수집에 동의를 거부할 수 있으며, 동의하지 않을 경우 비회원 예매서비스를 이용하실 수 없습니다
				</p>
				
				<%-- '확인'버튼 --%>
				<div class="col-12 pt-3 d-flex justify-content-center">
            		<a href="#"><button class="btn btn-outline-red" type="button" data-toggle="modal" data-target="#agreeFinish">확인</button></a>
          	    </div>
			</div>
		</div>		
	</div>
  </div>
  
  
	<%-- '인증요청' 모달 영역 --%>
	<div class="modal fade" id="sendCheckNum" tabindex="-1" role="dialog" aria-labelledby="sendCheckNumTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="sendCheckNumTitle">인증번호전송</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body text-center">
	        인증번호를 전송했습니다.<br>인증번호가 도착하지 않았을 경우 재전송을 눌러주세요.
	      </div>
	      <div class="modal-footer justify-content-center">
	        <button type="button" class="btn btn-red" data-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<%-- '    확인    ' 모달 영역 --%>
	<div class="modal fade" id="checkFinish" tabindex="-1" role="dialog" aria-labelledby="checkFinishTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="checkFinishTitle">인증완료</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body text-center">
	        휴대폰 인증을 완료했습니다.<br>확인 버튼을 눌러주세요.
	      </div>
	      <div class="modal-footer justify-content-center">
	        <button type="button" class="btn btn-red" data-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<%-- '확인' 모달 영역 --%>
	<div class="modal fade" id="agreeFinish" tabindex="-1" role="dialog" aria-labelledby="agreeFinishTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="agreeFinishTitle">입력정보 확인</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body text-center">
	        티켓발권을 위한 입력정보를 확인해 주세요.
	        <table class="table table-bordered">
			  <tbody>
			    <tr>
			      <th scope="row">이름</th>
			      <td>홍길동</td>
			    </tr>
			    <tr>
			      <th scope="row">생년월일</th>
			      <td>123456-1234567</td>
			    </tr>
			    <tr>
			      <th scope="row">휴대폰번호</th>
			      <td>010-1234-1234</td>
			    </tr>
			  </tbody>
			</table>
	      </div>
	      <div class="modal-footer justify-content-center">
	        <button type="button" class="btn btn-red data-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div>

  </article>
  
  <nav id="mainNav" class="d-none d-md-block sidebar">
  	<%-- 사이드바(최대 width:200px, 최소 width:150px, 전체 화면 사이즈 middle 이하되면 사라짐) --%>
  </nav>
  
  <div id="siteAds"></div>
  <%--페이지 하단 --%>
  <footer id="pageFooter"><%@ include file="/resources/inc/footer.jsp"%></footer>
</body>