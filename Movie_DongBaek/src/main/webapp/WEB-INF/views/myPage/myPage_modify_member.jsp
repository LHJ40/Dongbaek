<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmf" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/myPage.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/sidebar_myPage.css" rel="stylesheet" type="text/css">
<title>개인정보 수정</title>
<style>
#mainNav{
/* 		border: 1px solid #f00; */
	padding: 8rem 2rem;	
}
	
#mainNav>ul{
	list-style: none;
}
<%-- a링크 활성화 색상 변경 --%>
a:hover, a:active{
 color:  #ff5050 !important;
	
}
</style>
<script type="text/javascript">

// 비밀번호 와 비밀번호 확인 일치
function checkconfirmPasswd(passwdCheck) {
	
	let member_pass = document.fr.member_pass.value;
	
	if(member_pass == passwdCheck) {
		document.querySelector("#pass_confirm").innerHTML = "비밀번호가 일치합니다!"
		document.querySelector("#pass_confirm").style.color = "green";
	} else {
		document.querySelector("#pass_confirm").innerHTML = "비밀번호가 일치하지 않습니다!"
		document.querySelector("#pass_confirm").style.color = "red";
		alert("비밀번호를 다시 입력해주세요!");
		$("#member_pass").val('');
		$("#member_pass2").val('');
	}
}

</script>
</head>
<body>
 <%--네비게이션 바 영역 --%>
 <header id="pageHeader"><%@ include file="../inc/header.jsp"%></header>
 
  <article id="mainArticle">
  <%--본문내용 --%>
  	<div class="container container-fluid w-900">
		<div class="mainTop">
			<c:choose>
				<c:when test ="${empty member_id}">
					<h1> 로그인이 필요합니다! </h1>
				</c:when>
				<c:otherwise>
				 	<c:forEach var="myInfo" items="${myInfoList }">
				 		<h2>
							* ${myInfo.member_name } 님의 정보입니다.
						</h2>
						
						<hr>
						
						<p> <em style="color:red;">*</em> 표시 항목은 변경을 원하실 때만 입력해주세요.
						
						<form action="myPage_modify_member_pro" method="POST" name="fr">
						<input type="hidden">
							<%-- 아이디 --%>
							<div class="row mb-3">
	             				<label for="id" class="col-2 text-nowrap">아이디</label>
	              					<div class="col-10">
		             					${myInfo.member_id }
	              					</div>
		        			</div>
							
							<%-- 이름 --%>
							<div class="row mb-3">
	             				<label for="id" class="col-2 text-nowrap">이름</label>
	              					<div class="col-10">
		             					${myInfo.member_name }
	              					</div>
		        			</div>
							
							<%-- 비밀번호 --%>
							<div class="row mb-3">
	             				<label for="id" class="col-2 text-nowrap">비밀번호 <em style="color:red;">*</em></label>
	              					<div class="col-6">
		             					<input type="password" name="member_pass" id="member_pass" onblur="checkPasswd(this.value)" placeholder="영어 대소문자, 숫자, @#$% 를 사용하여 8 ~ 16글자 사이 입력">
	              					</div>
		        			</div>
		        			
							<%-- 비밀번호 확인--%>
							<div class="row mb-3">
	             				<label for="id" class="col-2 text-nowrap">비밀번호 확인 <em style="color:red;">*</em></label>
	              					<div class="col-6">
	              						<input type="password" name="member_pass2" id="member_pass2" onblur="checkconfirmPasswd(this.value)(this.value)" placeholder="비밀번호 변경 시 입력">
	              					</div>
	              					<div class="col-6">
										<span id="pass_confirm"></span>
	              					</div>
		        			</div>
		        			
							<%-- 생년월일--%>
							<div class="row mb-3">
	             				<label for="id" class="col-2 text-nowrap">생일</label>
	              					<div class="col-5">
	              						${myInfo.member_birth }
	              					</div>
		        			</div>
		        			
							<%-- 전화번호--%>
							<div class="row mb-3">
	             				<label for="id" class="col-2 text-nowrap">전화번호</label>
	              					<div class="col-10">
	              						<%-- 전화번호 형태로 보여주기 --%>
	              						${myInfo.member_phone }
	              					</div>
		        			</div>
		        			
							<%-- 전화번호 변경 시 인증--%>
<!-- 							<div class="row mb-3"> -->
<!-- 	             				<label for="id" class="col-2 text-nowrap">변경할 전화번호 <em style="color:red;">*</em></label> -->
<!-- 	              					<div class="col-10"> -->
<!-- 										<input type="text" id="member_phone" name="member_phone" title="전화번호 입력" required maxlength="11" placeholder="핸드폰번호 (-)없이 입력"> -->
<!-- <!-- 		      					<span id="phoneChk" class="doubleChk">인증번호 보내기</span> -->
<!-- 		      							<input type="button" id="phoneChk" class="doubleChk" value="인증번호 보내기"> -->
<!-- 		      							<br> -->
<!-- 	              					</div> -->
<!-- 		        			</div> -->
		        			
<%-- 							전화번호 변경 시 인증번호 입력 --%>
<!-- 							<div class="row mb-3"> -->
<!-- 	             				<label for="id" class="col-2 text-nowrap">변경할 전화번호 <em style="color:red;">*</em></label> -->
<!-- 	              					<div class="col-10"> -->
<!-- 										<input type="text" id="phone2" title="인증번호 입력" placeholder="인증번호"> -->
<!-- <!-- 		      					<span id="phoneChk2" class="doubleChk">본인인증</span> -->
<!-- 				      					<input type="button" id="phoneChk2" class="doubleChk" value="인증확인"> -->
<!-- 				      					<br> -->
<!-- 										<span class="point successPhoneChk">휴대폰 번호 입력 후 인증번호 보내기를 해주십시오.</span> -->
<!-- 										<input type="hidden" id="phoneDoubleChk"> -->
<!-- 	              					</div> -->
<!-- 		        			</div> -->
		        			
<%-- 		        			인증 완료 버튼 --%>
<!-- 							<div class="row mb-3"> -->
<!-- 	             				<label for="id" class="col-2 text-nowrap">변경할 전화번호 <em style="color:red;">*</em></label> -->
<!-- 	              					<div class="col-10"> -->
<!-- 										<input type="button" id="DoneBtn" class="btn btn-danger d-flex justify-content-center" value="인증완료" disabled="disabled"> -->
<!-- 	              					</div> -->
<!-- 		        			</div> -->
		        			
<%-- 		        			CoolSMS 문자인증 시작 --%>
<!-- 								<script type="text/javascript"> -->
<!-- // 									//휴대폰 번호 인증 -->
<!-- // 									$("#phoneChk").click(function(){ -->
<!-- // 										var code2 = ""; -->
<!-- // 										alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오."); -->
<!-- // 										let member_phone = $("#member_phone").val(); -->
<!-- // 										console.log("1"); -->
										
<!-- // 										$.ajax({ -->
<!-- // 									        type:"POST", -->
<%-- // 									        url: '<c:url value="/phoneCheck"/>', --%>
<!-- // 									        data: "member_phone=" + member_phone, -->
<!-- // 									        dataType: "json", -->
<!-- // 									        success : function(data){ -->
									        	
<!-- // 									         	console.log("2"); -->
<!-- // 									         	let checkNum = data; -->
<!-- // 									         	alert(member_phone + ', checkNum: ' + checkNum); -->
									         	
<!-- // 									        	if(data == "error"){ -->
<!-- // 									        		console.log("3"); -->
<!-- // 									        		alert("휴대폰 번호가 올바르지 않습니다.") -->
<!-- // 													$(".successPhoneChk").text("유효한 번호를 입력해주세요."); -->
<!-- // 													$(".successPhoneChk").css("color","red"); -->
<!-- // 													$("#member_phone").attr("autofocus",true); -->
<!-- // 									        	}else{	        		 -->
<!-- // 									        		console.log("4"); -->
<!-- // 									        		$("#phone2").attr("disabled",false); -->
<!-- // 									        		$("#phoneChk2").css("display","inline-block"); -->
<!-- // 									        		$(".successPhoneChk").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오."); -->
<!-- // 									        		$(".successPhoneChk").css("color","green"); -->
<!-- // 									        		$("#member_phone").attr("readonly",true); -->
<!-- // 									        		code2 = data; -->
<!-- // 									        	} -->
				
<!-- // 												//휴대폰 인증번호 대조 -->
<!-- // 												$("#phoneChk2").click(function(){ -->
<!-- // 													if($("#phone2").val() == code2){ -->
<!-- // 														$(".successPhoneChk").text("인증번호가 일치합니다."); -->
<!-- // 														$(".successPhoneChk").css("color","green"); -->
<!-- // 														$("#phoneDoubleChk").val("true"); -->
<!-- // 														$("#DoneBtn").attr("disabled",false); -->
<!-- // 														// 회원가입 진행시 자동으로 값을 입력해주기 위해서 -->
<!-- // 														// 로컬의 세션 스토리지에 이메일 저장 -->
<!-- // 														sessionStorage.setItem('member_phone', member_phone); -->
<!-- // 													}else{ -->
<!-- // 														$(".successPhoneChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다."); -->
<!-- // 														$(".successPhoneChk").css("color","red"); -->
<!-- // 														$("#phoneDoubleChk").val("false"); -->
<!-- // 														$(this).attr("autofocus",true); -->
<!-- // 													} -->
<!-- // 												}); -->
<!-- // 									        }, -->
<!-- // 									        error: function() { -->
<!-- // 									        	alert("에러") -->
<!-- // 									        } -->
<!-- // 									    }); -->
<!-- // 									}); -->
									
<!-- 								</script> -->
								<%-- CoolSMS 문자인증 끝 --%>
		        			
							<%-- 이메일--%>
							<div class="row mb-3">
	             				<label for="id" class="col-2 text-nowrap">이메일</label>
	              					<div class="col-10">
	              						${myInfo.member_email }
	              					</div>
		        			</div>
		        			
							<%-- 이메일 변경--%>
							<div class="row mb-3">
	             				<label for="id" class="col-2 text-nowrap">이메일 변경 <em style="color:red;">*</em></label>
	              					<div class="col-10">
	              						<input type="email" name="member_email" placeholder="이메일 변경 시 적어주세요">
	              					</div>
		        			</div>
		        			
							<%-- 좋아하는 장르 --%>
							<div class="row mb-3">
	             				<label for="id" class="col-2 text-nowrap">좋아하는 장르</label>
	              					<div class="col-10">
	              						${myInfo.member_like_genre }
	              					</div>
		        			</div>
		        			
							<%-- 좋아하는 장르 변경--%>
							<div class="row mb-3">
	             				<label for="id" class="col-2 text-nowrap">좋아하는 장르 변경 <em style="color:red;">*</em></label>
	              					<div class="col-10">
	              						<select name="member_like_genre" class="select">
											<option value="선택 안함" <c:if test="${member_like_genre=='선택 안함'}">${'selected' }</c:if>>선택 안함</option>
											<option value="로맨스코미디" <c:if test="${member_like_genre=='로맨스 코미디'}">${'selected' }</c:if>>로맨스코미디</option>
											<option value="스릴러"<c:if test="${member_like_genre=='스릴러'}">${'selected' }</c:if>>스릴러</option>
											<option value="공포"<c:if test="${member_like_genre=='공포'}">${'selected' }</c:if>>공포</option>
											<option value="SF"<c:if test="${member_like_genre=='SF'}">${'selected' }</c:if>>SF</option>
											<option value="범죄"<c:if test="${member_like_genre=='범죄'}">${'selected' }</c:if>>범죄</option>
											<option value="액션"<c:if test="${member_like_genre=='액션'}">${'selected' }</c:if>>액션</option>
											<option value="코미디"<c:if test="${member_like_genre=='코미디'}">${'selected' }</c:if>>코미디</option>
											<option value="판타지"<c:if test="${member_like_genre=='판타지'}">${'selected' }</c:if>>판타지</option>
											<option value="음악"<c:if test="${member_like_genre=='음악'}">${'selected' }</c:if>>음악</option>
											<option value="멜로"<c:if test="${member_like_genre=='멜로'}">${'selected' }</c:if>>멜로</option>
											<option value="뮤지컬"<c:if test="${member_like_genre=='뮤지컬'}">${'selected' }</c:if>>뮤지컬</option>
											<option value="스포츠"<c:if test="${member_like_genre=='스포츠'}">${'selected' }</c:if>>스포츠</option>
											<option value="애니메이션"<c:if test="${member_like_genre=='애니메이션'}">${'selected' }</c:if>>애니메이션</option>
											<option value="다큐멘터리"<c:if test="${member_like_genre=='다큐멘터리'}">${'selected' }</c:if>>다큐멘터리</option>
											<option value="기타"<c:if test="${member_like_genre=='기타'}">${'selected' }</c:if>>기타</option>
										</select>
	              					</div>
		        			</div>
<!-- 								<input type="button" value="취소" onclick="history.back()"> -->
							<input type="submit" value="정보 수정">
							<input type="button" value="돌아가기" onclick="history.back()">
							<input type="button" value="탈퇴하기" onclick="location.href='MemberWithdrawalForm'">
						</form>
					</c:forEach>
				</c:otherwise>
			</c:choose>
  		</div>
	</div>
  </article>
  
  	<nav id="mainNav">
		<%--왼쪽 사이드바 --%>
  		<%@ include file="/WEB-INF/views/sidebar/sideBar_myPage.jsp"%>
  	</nav>
  
<!--   <nav id="mainNav"> -->
<%--   <%--왼쪽 사이드바 --%> --%>
<!-- <!-- 	왼쪽 탭 링크들 --> -->
<!--   	<h3>마이페이지</h3> -->
<!-- 		<ul class="left-tap"> -->
<!-- 			<li class="myPage-ticketing-buy"><a class="nav-link" href="myPage_reservation_buy_history">예매 -->
<!-- 					/ 구매내역</a></li> -->
<!-- 			<li class="myPage-review"><a class="nav-link" href="myPage_myReview">나의 리뷰</a></li> -->
<!-- 			<li class="myPage-moviefourcut"><a class="nav-link" href="myPage_moviefourcut">영화네컷</a></li> -->
<!-- 			<li class="myPage-quest"><a class="nav-link" href="myPage_inquiry">문의 내역</a></li> -->
<!-- 			<li class="myPage-grade"><a class="nav-link" href="myPage_grade">등급별 혜택</a></li> -->
<!-- 			<li class="myPage-privacy"><a class="nav-link" href="myPage_modify_check">개인정보수정</a></li> -->
<!-- 		</ul> -->
<!--   </nav> -->
  
  <div id="siteAds"></div>
  <%--페이지 하단 --%>
  <footer id="pageFooter"><%@ include file="../inc/footer.jsp"%></footer>
</body>