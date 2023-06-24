<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<title>동백시네마 회원가입 1.본인인증</title>
<style>
.w-900{
	width: 900px;
}
.h-500{
	height: 500px;
}

.container {
	margin: 20px auto;
}

.box {
	box-sizing: border-box;
	margin: auto;
}

.container-fluid {
	padding: 10px;
}

.center * {
	text-align: center;
}

div {
	background-color: transparent;
}

td {
	padding: 10px;
}

#DoneBtn {
	margin: 1px auto ;
}

</style>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
</head>
<body>
	<%--네비게이션 바 영역 --%>
	<header id="pageHeader"><%@ include file="../inc/header_join.jsp"%></header>
 
	<%--본문내용 --%>
	<article id="mainArticle">
	<%-- 본문 내용을 div로 감싸 전체 폭 조절 --%>
	<%-- 폭 조절 div 끝 --%>
		<!-- 4단계 탭 -->
 	 	<%-- 네이게이션 중앙 정렬 : justify-content-center --%>
 		<nav class=	"nav nav-pills justify-content-center">
 			<%-- 해당 탭에서는 클릭 시 다음 단계로 이동 불가 --%>
  			<a class="nav-link active btn-danger" aria-current="page" href="#">본인인증</a>
 			<a class="nav-link" >약관동의</a>
			<a class="nav-link"  href="member_join_step3">정보입력</a>
			<a class="nav-link" >가입완료</a>
		</nav>
		
		<hr>
	<div class="container-fluid w-900">
		<div>
			<%-- 상단 문구 구역 --%>
			<div class="center">
				<h3>회원 가입을 위한 본인 인증 단계 입니다.</h3>
				<h5>원하시는 인증방법을 선택해주세요.</h5>
			</div>
			<hr>
			
			<%-- 인증 형식 선택 --%>
			<%-- 사진을 클릭 시 해당 인증 방식으로 이동 --%>
			<div class="container w-900">
  				<%-- 사진 간격을 위한 div 태그 삽입( 내용 없음 ) --%>
   				<%-- 핸드폰 인증 방식 --%>
   				<div class="row box">
	   				<div class="col-3 box">
						<img src="${pageContext.request.contextPath }/resources/img/member_join_step1_phone.jpg" class="rounded" alt="..." width="230px">
					</div>
					<div class="col-8 box">
	   				<%-- 핸드폰 인증 방식 --%>
	   					<br>
						<form action="member_join_step2" method="post">
							<table>
								<tr>
									<td>휴대폰 번호 </td>
									<td>
				      					<input type="text" id="member_phone" name="member_phone" title="전화번호 입력" required maxlength="11" placeholder="핸드폰번호 (-)없이 입력">
		<!-- 		      					<span id="phoneChk" class="doubleChk">인증번호 보내기</span> -->
				      					<input type="button" id="phoneChk" class="doubleChk" value="인증번호 보내기">
				      					<br>
									</td>
								</tr>
								<tr>
									<td>인증번호</td>
									<td>
				      					<input type="text" id="phone2" title="인증번호 입력" maxlength="4" placeholder="인증번호">
		<!-- 		      					<span id="phoneChk2" class="doubleChk">본인인증</span> -->
				      					<input type="button" id="phoneChk2" disabled class="doubleChk" value="인증확인">
										<br>
										<span class="point successPhoneChk">휴대폰 번호 입력 후 인증번호 보내기를 해주세요.</span>
										<input type="hidden" id="phoneDoubleChk">
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<input type="submit" id="DoneBtn" class="btn btn-danger d-flex justify-content-center" value="인증완료" disabled="disabled">
									</td>
								</tr>
							</table>
						</form>
					</div>
	   			</div> <%-- row 끝 --%>
   			
	  		</div>
	  		<hr>
	  		<%-- 하단 안내 문구 --%>
	  		<div>
				<h6>14세 미만 어린이는 보호자 인증을 추가로 완료한 후 가입이 가능합니다.</h6>
				<h6>본인인증 시 제공되는 정보는 해당 인증기관에서 직접 수집하며,
					인증 이외의 용도로 이용 또는 저장되지 않습니다.</h6>
			</div>
  		</div>
  		
		</div> <%-- 폭 조절 div 끝 --%>
  	</article>
  	
  	<%-- CoolSMS 문자인증 시작 --%>
				<script type="text/javascript">
					//휴대폰 번호 인증
					$("#phoneChk").click(function(){
						var code2 = "";
						alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
						let member_phone = $("#member_phone").val();
						console.log("1");
						
						$.ajax({
					        type:"POST",
					        url: '<c:url value="/phoneCheck"/>',
					        data: "member_phone=" + member_phone,
					        dataType: "json",
					        success : function(data){
					        	
					         	console.log("2");
					         	let checkNum = data;
					         	alert(member_phone + ', checkNum: ' + checkNum);
					         	
					        	if(data == "error"){
					        		console.log("3");
					        		alert("휴대폰 번호가 올바르지 않습니다.")
									$(".successPhoneChk").text("유효한 번호를 입력해주세요.");
									$(".successPhoneChk").css("color","red");
									$("#member_phone").attr("autofocus",true);
					        	}else{	        		
					        		console.log("4");
					        		$("#phone2").attr("disabled",false);
					        		$("#phoneChk2").css("display","inline-block");
					        		$(".successPhoneChk").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
					        		$(".successPhoneChk").css("color","green");
					        		$("#member_phone").attr("readonly",true);
					        		$("#phoneChk2").attr("disabled",false);
					        		code2 = data;
					        	}

								//휴대폰 인증번호 대조
								$("#phoneChk2").click(function(){
									if($("#phone2").val() == code2){
										$(".successPhoneChk").text("인증번호가 일치합니다.");
										$(".successPhoneChk").css("color","green");
										$("#phoneDoubleChk").val("true");
										$("#DoneBtn").attr("disabled",false);
										// 회원가입 진행시 자동으로 값을 입력해주기 위해서
										// 로컬의 세션 스토리지에 이메일 저장
										sessionStorage.setItem('member_phone', member_phone);
									}else{
										$(".successPhoneChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
										$(".successPhoneChk").css("color","red");
										$("#phoneDoubleChk").val("false");
										$(this).attr("autofocus",true);
									}
								});
					        },
					        error: function() {
					        	alert("에러")
					        }
					    });
					});
					
				</script>
				<%-- CoolSMS 문자인증 끝 --%>
  	
  	
  	
  	
  	
  <nav id="mainNav" class="d-none d-md-block sidebar">
  	<%-- 사이드바(최대 width:200px, 최소 width:150px, 전체 화면 사이즈 middle 이하되면 사라짐) --%>
  </nav>
  
  <div id="siteAds"></div>
  <%--페이지 하단 --%>
  <footer id="pageFooter"><%@ include file="../inc/footer.jsp"%></footer>
</body>
