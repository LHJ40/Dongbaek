<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<title>영화 예매 사이트</title>
<style>

</style>
</head>
<body>
 <%--네비게이션 바 영역 --%>
 <header id="pageHeader"><%@ include file="../inc/header.jsp"%></header>
 
  <article id="mainArticle">
  <%--본문내용 --%>
			<%-- 회원 정보 수정에 사용될 아이디 hidden 타입으로 전달
			이 방법 외에 입력박스 표시 후 readonly 로 처리해도 가능!
			--%>
			<form action="MemberModify" method="post" name="fr">
			<table border="1">
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="member_id" placeholder="비밀번호 변경 시 입력">
					
					</td>
				</tr>
				<tr>
					<th>변경할 비밀번호</th>
					<td>
						<!-- 키 누를때마다 checkNewPasswd() 함수에 입력받은 패스워드 전달하여 호출 -->
						<input type="text" name="member_pass" maxlength="4" placeholder="비밀번호 변경 시 입력">
						<span id="checkNewPasswdResult"></span>
					</td>
				</tr>
				<tr>
					<th>변경할 비밀번호 확인</th>
					<td>
						<!-- 키 누를때마다 checkConfirmNewPasswd() 함수에 입력받은 패스워드 전달하여 호출 -->
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="정보수정">
						<input type="button" value="돌아가기" onclick="history.back()">
					</td>
				</tr>
			</table>
		</form>
  
  </article>
  
  <nav id="mainNav">
  <%--왼쪽 사이드바 --%>
  </nav>
  
  <div id="sieAds"></div>t
  <%--페이지 하단 --%>
  <footer id="pageFooter"><%@ include file="../inc/footer.jsp"%></footer>
</body>