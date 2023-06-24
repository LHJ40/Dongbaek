<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
	
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
<title>관리자 - 회원관리</title>
<style>
.w-900 {
	width: 900px;
}

.h-500 {
	height: 500px;
}

div {
	background-color: transparent;
}

<%-- a링크 활성화 색상 변경 --%>
a:hover, a:active{
 color:  #ff5050 !important;
	
}

/* 확인용 */
.container-fluid {
	border: 1px solid gray;
}

#mainNav {
	border: 1px solid blue;
}


</style>
</head>
<body>
	<%--네비게이션 바 영역 --%>
	<header id="pageHeader"><%@ include
			file="../inc/header.jsp"%></header>

	<article id="mainArticle">
		<%--본문내용 --%>
		<div class="container-fluid w-900">
			<div class="row">
				<div class="col-md-12 mt-3">
					<h3>회원관리</h3>
				</div>
			</div>

			<%-- 'search' 영역 --%>
			<div class="row">
	<div class="col-md-12 mt-3">
		<nav class="navbar navbar-light bg-light justify-content-end">
			<form class="form-inline" action="admin_member_list" method="GET">
				<select class="form-control mr-sm-2" name="memberSearchType" id="memberSearchType">
					<option value="member_name" <c:if test="${param.memberSearchType eq 'member_name' }">selected</c:if>>이름</option>
					<option value="member_id" <c:if test="${param.memberSearchType eq 'member_id' }">selected</c:if>>아이디</option>
					<option value="grade_name" <c:if test="${param.memberSearchType eq 'grade_name' }">selected</c:if>>멤버십</option>
				</select>
				<input class="form-control mr-sm-2" type="text" value="${empty param.memberSearchKeyword ? '' : param.memberSearchKeyword}" placeholder="Search" aria-label="Search" id="memberSearchKeyword" name="memberSearchKeyword">
				<button class="btn btn-outline-secondary my-2 my-sm-0" type="submit">Search</button>
			</form>
		</nav>
	</div>
</div>
<%-- 회원관리 테이블 시작 --%>
<div class="row">
	<div class="col-md-12">
		<table class="table table-striped text-center">
			<thead>
				<tr>
					<th scope="col">이름</th>
					<th scope="col">아이디</th>
					<th scope="col">멤버십</th>
					<th scope="col">현재상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="member" items="${memberList}">
					<tr>
						<td>${member.member_name}</td>
						<td>${member.member_id}</td>
						<td>${member.grade_name}</td>
						<td>
							<button type="button" class="btn btn-secondary" onclick="location.href='admin_member_oneperson?member_id=${member.member_id}'">${member.member_type}</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

		
		<%--수정님 페이징 --%>
<nav aria-label="...">
    <ul class="pagination pagination-md justify-content-center">
        <%-- 이전 페이지로 이동 --%>
        <c:choose>
            <c:when test="${pageInfo.startPage > 1}">
                <li class="page-item">
                    <a class="page-link" href="admin_member_list?pageNo=${pageInfo.startPage - 1}&memberSearchType=${param.memberSearchType}&memberSearchKeyword=${param.memberSearchKeyword}" tabindex="-1" aria-disabled="false">&laquo;</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item disabled">
                    <a class="page-link" href="#" tabindex="-1" aria-disabled="true">&laquo;</a>
                </li>
            </c:otherwise>
        </c:choose>

        <%-- 각 페이지 번호마다 하이퍼링크 설정(현재 페이지는 하이퍼링크 제거) --%>
        <c:forEach var="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
            <c:choose>
                <%-- 현재 페이지 --%>
                <c:when test="${pageNo eq i}">
                    <li class="page-item active" aria-current="page">
                        <a class="page-link" href="#">${i} <span class="sr-only">(current)</span></a>
                    </li>
                </c:when>
                <c:otherwise>
                    <%-- 다른 페이지 --%>
                    <li class="page-item">
                        <a class="page-link" href="admin_member_list?pageNo=${i}&memberSearchType=${param.memberSearchType}&memberSearchKeyword=${param.memberSearchKeyword}">${i}</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <%-- 다음 페이지로 이동 --%>
        <c:choose>
            <c:when test="${pageInfo.endPage < pageInfo.maxPage}">
                <li class="page-item">
                    <a class="page-link" href="admin_member_list?pageNo=${pageInfo.endPage + 1}&memberSearchType=${param.memberSearchType}&memberSearchKeyword=${param.memberSearchKeyword}">&raquo;</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item disabled">
                    <a class="page-link" href="#" tabindex="-1" aria-disabled="true">&raquo;</a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
</nav>


<%-- 			<%-- 0616 정의효 - 페이징 처리 --%> 
<!-- 			<div class="row"> -->
<!-- 				<div class="col-md-12"> -->
<!-- 				    <div> -->
<%-- 				        <c:if test="${currentPage > 1}"> --%>
<%-- 				            <a href="admin_member_list?pageNo=${currentPage - 1}">이전</a> --%>
<%-- 				        </c:if> --%>
<%-- 				        <c:forEach begin="1" end="${totalPageCount}" var="page"> --%>
<%-- 				            <a href="admin_member_list?pageNo=${page}">${page}</a> --%>
<%-- 				        </c:forEach> --%>
<%-- 				        <c:if test="${currentPage < totalPageCount}"> --%>
<%-- 				            <a href="admin_member_list?pageNo=${currentPage + 1}">다음</a> --%>
<%-- 				        </c:if> --%>
<!-- 	    			</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
			<%-- 0616 정의효 - 페이징 처리 끝--%>
			
			<%-- 원본 페이징 처리 --%>
<!-- 			<div class="row"> -->
<!-- 				<div class="col-md-12"> -->
<!-- 					<nav aria-label="Page navigation example"> -->
<!-- 						<ul class="pagination justify-content-center"> -->
<!-- 							<li class="page-item disabled"><a class="page-link">&laquo;</a> -->
<!-- 							</li> -->
<!-- 							<li class="page-item"><a class="page-link" href="#">1</a></li> -->
<!-- 							<li class="page-item"><a class="page-link" href="#">2</a></li> -->
<!-- 							<li class="page-item"><a class="page-link" href="#">3</a></li> -->
<!-- 							<li class="page-item"><a class="page-link" href="#">4</a></li> -->
<!-- 							<li class="page-item"><a class="page-link" href="#">5</a></li> -->
<!-- 							<li class="page-item"><a class="page-link" href="#">&raquo;</a> -->
<!-- 							</li> -->
<!-- 						</ul> -->
<!-- 					</nav> -->
<!-- 				</div> -->
<!-- 			</div> -->
			<%-- 페이징 처리 끝--%>
			
			
		</div>


	</article>

		<%--왼쪽 사이드바 --%>
	<nav id="mainNav" class="d-none d-md-block sidebar">
		<%@ include file="/WEB-INF/views/sidebar/sideBar.jsp"%>
	</nav>

	<div id="siteAds"></div>
	<%--페이지 하단 --%>
	<footer id="pageFooter"><%@ include
			file="../inc/footer.jsp"%></footer>
</body>