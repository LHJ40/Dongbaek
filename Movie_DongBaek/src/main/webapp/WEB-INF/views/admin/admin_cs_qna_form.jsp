<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<script type="text/javascript">
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
			
			<tbody>
				<tr>
			      <td scope="col" class="align-middle" width="100">번호</th>
			      <td scope="col" class="align-middle" width="400"><input type="text" class="form-control" aria-label="cs_type_list_num" value=""></td>
			    </tr>
				<tr>
			      <td scope="col" class="align-middle" width="100">유형</th>
			      <td scope="col" class="align-middle" width="400">
				       <select class="form-control" name="keyword">
							<option value="">전체</option>
							<option value="서면">영화정보문의</option>
							<option value="사상">회원 문의</option>
							<option value="사상">예매 결제 관련 문의</option>
							<option value="사상">일반 문의</option>
						</select>	      	
			      </td>
			    </tr>
				<tr>
			      <td scope="col" class="align-middle" width="100">이름</th>
			      <td scope="col" class="align-middle"><input type="text" class="form-control" aria-label="cs_subject" value=""></td>
			    </tr>
				<tr>
			      <td scope="col" class="align-middle" width="100">이메일</th>
			      <td scope="col" class="align-middle d-flex justify-content-start">
   					<input type="text" name="email1">
					@ <input type="text" name="email2" >
						<select name="emailDomain" onchange="selectDomain(this.value)">
							<option value="">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="nate.com">nate.com</option>
						</select>
			      </td>
			    </tr>
				<tr>
			      <td scope="col" class="align-middle" width="100">휴대전화</th>
			      <td scope="col" class="align-middle"><input type="phone" class="form-control" aria-label="cs_name" pattern="(010)-\d{3,4}-\d{4}" 
                placeholder="형식 010-0000-0000" required="required" ></td>
			    </tr>
				<tr>
			      <td scope="col" class="align-middle" width="100">내용</th>
			      <td scope="col" class="align-middle"><textarea class="form-control" rows="10" cols="200" id="cs_content"></textarea></td>
			    </tr>
			    <!-- cs_reply 값이 널이 아닐경수 활성화될 텍스트박스 위치 -->
				<tr>
			      <td scope="col" class="align-middle" width="100">답변</th>
			      <td scope="col" class="align-middle"><textarea class="form-control" rows="10" cols="200" id="cs_content"></textarea></td>
			    </tr>
			    
			    
				<tr>
			      <td scope="col" class="align-middle" width="100">사진첨부</th>
			      <td scope="col" class="align-middle"><input type="file" class="form-control" aria-label="cs_file_name" value=""></td>
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