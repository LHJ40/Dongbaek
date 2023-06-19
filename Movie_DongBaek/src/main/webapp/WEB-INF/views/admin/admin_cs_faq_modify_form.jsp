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

<%-- jquery 태그 --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	let type = "${csFaq.cs_type}";
// 	alert('출력 :' + type ); // 출력 :일반 문의
	$("#cs_type").val(type); // 셀렉트박스 cs_type 값 중 cs_type이 같은 값이 있으면 선택됨
	
});


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
  

	<form action="admin_cs_faq_modify_pro" method="post" enctype="multipart/form-data">
		<h1>자주묻는질문 관리자</h1>

		<table class="table table-striped text-center align-middle">
			<input type="hidden" name="pageNo" value="${param.pageNo }">
			<tbody>
				<tr>
			      <td scope="col" class="align-middle" width="100">번호</th>
			      <td scope="col" class="align-middle" width="400"><input type="text" class="form-control" aria-label="cs_type_list_num" name="cs_type_list_num" value="${csFaq.cs_type_list_num }" readonly></td>
			    </tr>
				<tr>
			      <td scope="col" class="align-middle" width="100">유형</th>
			      <td scope="col" class="align-middle" width="400">
				       <select class="form-control" name="cs_type" id="cs_type">
							<option value="">전체</option>
							<option value="예매">예매</option>
							<option value="멤버십">멤버십</option>
							<option value="결제수단">결제수단</option>
							<option value="극장">극장</option>
							<option value="할인혜택">할인혜택</option>
						</select>	      	
			      </td>
			    </tr>
				<tr>
			      <td scope="col" class="align-middle" width="100">제목</th>
			      <td scope="col" class="align-middle"><input type="text" class="form-control" aria-label="cs_subject" id="cs_subject" name="cs_subject" value="${csFaq.cs_subject }"></td>
			    </tr>
				<tr>
			      <td scope="col" class="align-middle" width="100">작성자</th>
			      <td scope="col" class="align-middle"><input type="text" class="form-control" aria-label="cs_name" id="member_id" name="member_id" value="${csFaq.member_id }" readonly></td>
			    </tr>
				<tr>
			      <td scope="col" class="align-middle" width="100">내용</th>
			      <td scope="col" class="align-middle"><textarea class="form-control" rows="10" cols="200" id="cs_content" name="cs_content">${csFaq.cs_content }</textarea></td>
			    </tr>
                <tr>
                	<td scope="col" class="align-middle" width="100">사진첨부(이전)</td>
                    <td scope="col" class="align-middle">
                    	
                    	<%-- 첨부파일 다운로드 구현 아직 --%>
                    	
                    	<c:choose>
                    		<c:when test="${csFaq.cs_file } != ''">
                     		<a href="/WEB-INF/views/upload/${csFaq.cs_file_real }" download="${csFaq.cs_file }" class="form-control" aria-label="cs_file"></a>
                    		</c:when>
                    		<c:otherwise>
                     		<span id="cs_file_old_span">첨부파일이 없습니다</span>
                    		</c:otherwise>
                    	</c:choose>
                    </td>	
				</tr>
				<tr>
                    <td scope="col" class="align-middle" width="100">사진첨부(변경)</td>
                    <td scope="col" class="align-middle"><input type="file" class="form-control" aria-label="cs_file" name="cs_multi_file"></td>
                </tr>
				<tr>
					<td scope="col" class="align-middle"></td>
					<td scope="col" class="align-middle">
						<button class="btn btn-danger" type="submit">&nbsp;&nbsp;&nbsp;수정&nbsp;&nbsp;&nbsp;</button>
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