<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<link
	href="${pageContext.request.contextPath }/resources/css/default.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath }/resources/css/sidebar.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath }/resources/css/button.css"
	rel="stylesheet" type="text/css">
<title>영화 예매 사이트</title>
<style>
#mainNav{
/* 		border: 1px solid #f00; */
}
	
#mainNav>ul{
	list-style: none;
}
div {
background-color: transparent;
}

</style>

<%-- jquery 태그 --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	let type = "${csQna.cs_type}";
// 	alert('출력 :' + type ); // 출력 :일반 문의
	$("#cs_type").val(type); // 셀렉트박스 cs_type 값 중 cs_type이 같은 값이 있으면 선택됨
	
});

<%-- 이메일 자동 넣기 --%>
function selectDomain(domain) {
	// 직접입력의 경우 널스트링("") 값이 할당되어 있으므로
	// 모든 값을 email2 영역에 표시하면 직접입력 선택 시 널스트링이 표시됨
	document.fr.email2.value = domain;
}
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
  

	<form action="admin_cs_qna_pro" method="post" name="fr">
		<h1>1:1게시판 관리자 답글쓰기</h1>

		<table class="table table-striped text-center">
			<input type="hidden" name="pageNo" value="${param.pageNo }">				
			<tbody>
				<tr>
			      <td scope="col" class="align-middle" width="100">번호</th>
			      <td scope="col" class="align-middle" width="400"><input type="text" class="form-control" aria-label="cs_type_list_num" name="cs_type_list_num" value="${csQna.cs_type_list_num }" readonly></td>
			    </tr>
				<tr>
			      <td scope="col" class="align-middle" width="100">유형</th>
			      <td scope="col" class="align-middle" width="400">
				       <select class="form-control" id="cs_type" name="cs_type">
							<option value="">문의 유형</option>
							<option value="영화정보문의">영화정보문의</option>
							<option value="회원 문의">회원 문의</option>
							<option value="예매 결제 관련 문의">예매 결제 관련 문의</option>
							<option value="일반 문의">일반 문의</option>
						</select>
			      </td>
			    </tr>
				<tr>
			      <td scope="col" class="align-middle" width="100">이름</th>
			      <td scope="col" class="align-middle"><input type="text" class="form-control" aria-label="cs_subject" name="member_name" value="${csQna.member_name }" readonly></td>
			    </tr>
				<tr>
			      <td scope="col" class="align-middle" width="100">이메일</th>
			      <td scope="col" class="align-middle d-flex justify-content-start">
   					<input type="text" name="email1" value="${fn:split(csQna.member_email,'@')[0]}" readonly>
					@ <input type="text" name="email2" value="${fn:split(csQna.member_email,'@')[1]} " readonly>
<!-- 						<select name="emailDomain" onchange="selectDomain(this.value)"> -->
<!-- 							<option value="">직접입력</option> -->
<!-- 							<option value="naver.com">naver.com</option> -->
<!-- 							<option value="gmail.com">gmail.com</option> -->
<!-- 							<option value="nate.com">nate.com</option> -->
<!-- 						</select> -->
			      </td>
			    </tr>
				<tr>
			      <td scope="col" class="align-middle" width="100">휴대전화</th>
<!-- 			      <td scope="col" class="align-middle"><input type="phone" class="form-control" aria-label="cs_name" pattern="(010)-\d{3,4}-\d{4}"  -->
			      <td scope="col" class="align-middle"><input type="phone" class="form-control" aria-label="cs_name" 
                placeholder="형식 010-0000-0000" required="required" name="cs_phone"
                value="${csQna.cs_phone}" readonly>
                  </td>
			    </tr>
				<tr>
			      <td scope="col" class="align-middle" width="100">내용</th>
			      <td scope="col" class="align-middle"><textarea class="form-control" rows="10" cols="200" id="cs_content" name="cs_content" readonly>${csQna.cs_content}</textarea></td>
			    </tr>
			    <!-- cs_reply 값이 널이 아닐경수 활성화될 텍스트박스 위치 -->
				<tr>
			      <td scope="col" class="align-middle" width="100">답변</th>
			      <td scope="col" class="align-middle"><textarea class="form-control" rows="10" cols="200" id="cs_content" name="cs_reply">${csQna.cs_reply}</textarea></td>
			    </tr>
			    
			    
				<tr>
			      <td scope="col" class="align-middle" width="100">사진첨부</th>
			      <td scope="col" class="align-middle">
			      	<%-- 
					첨부파일 다운로드를 위해 하이퍼링크 생성
					=> download 속성 지정 시 다운로드 가능
					   (단, 다운로드 시 파일명 변경하여 다운하려면 download="변경할 파일명" 형식으로 지정 
					--%>
				  <td scope="col" calss="align-middle" width="100"aria-label="cs_file_name" >
						<a href="upload/${csQna.cs_file_real }" download="${csQna.cs_file }">
							${csQna.cs_file }
						</a>
			      </td>
			    </tr>
				<tr>
					<td scope="col" class="align-middle"></td>
					<td scope="col" class="align-middle">
						<button class="btn btn-danger" type="submit">등록</button>
						<button class="btn btn-outline-danger" type="button" onclick="history.back()">돌아가기</button>
					</td>
			    </tr>
			</tbody>
		</table>
	</form>					
					
			</div>

  </article>
  

  <%--왼쪽 사이드바 --%>
	<nav id="mainNav" class="d-none d-md-block sidebar">
		<%@ include file="/WEB-INF/views/sidebar/sideBar.jsp"%>
	</nav>
  
  <div id="siteAds"></div>
  <%--페이지 하단 --%>
  <footer id="pageFooter"><%@ include file="../inc/footer.jsp"%></footer>
</body>