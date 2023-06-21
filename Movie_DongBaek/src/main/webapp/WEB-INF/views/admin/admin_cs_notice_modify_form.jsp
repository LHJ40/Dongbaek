<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!doctype html>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <link href="${pageContext.request.contextPath}/resources/css/default.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/sidebar.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/button.css" rel="stylesheet" type="text/css">
    <title>영화 예매 사이트</title>
    <style>
        #mainNav {
            /* border: 1px solid #f00; */
        }
        
        #mainNav > ul {
            list-style: none;
        }
        
        div {
            background-color: transparent;
        }
        
        a {
            text-decoration: none;
        }
    </style>
    <script type="text/javascript">
    </script>
</head>
<body>
    <header id="pageHeader">
        <%--네비게이션 바 영역 --%>
        <%@ include file="../inc/header.jsp"%>
    </header>
 
    <article id="mainArticle">
        <%--본문내용 --%>
        <div class="container-fluid w-900">
            <form action="admin_cs_notice_pro" method="post" enctype="multipart/form-data">
                <h1>공지사항 관리자</h1>
                <table class="table table-striped text-center align-middle">
                    <input type="hidden" name="pageNo" value="${param.pageNo }"> <%-- 페이지번호 전송용 --%>
                    <input type="hidden" name="cs_type" value="공지" ><%-- 공지사항 유형 정보 전송용 --%>
                    <tbody>
                        <tr>
                            <td scope="col" class="align-middle" width="100">번호</td>
                            <td scope="col" class="align-middle" width="400"><input type="text" class="form-control" aria-label="notice.cs_type_list_num" name="cs_type_list_num" value="${notice.cs_type_list_num }" readonly></td>
                        </tr>
                        <tr>
                            <td scope="col" class="align-middle" width="100">제목</td>
                            <td scope="col" class="align-middle"><input type="text" class="form-control" aria-label="cs_subject" name="cs_subject" value="${notice.cs_subject }"></td>
                        </tr>
                        <tr>
                            <td scope="col" class="align-middle" width="100">작성자</td>
                            <td scope="col" class="align-middle"><input type="text" class="form-control" aria-label="cs_name" name="member_id" value="${sessionScope.member_id }" readonly></td>
                        </tr>
                        <tr>
                            <td scope="col" class="align-middle" width="100">내용</td>
                            <td scope="col" class="align-middle"><textarea class="form-control" rows="10" cols="200" name="cs_content">${notice.cs_content }</textarea></td>
                        </tr>
                        <tr>
                        	<td scope="col" class="align-middle" width="100">사진첨부(이전)</td>
                            <td scope="col" class="align-middle">
                            	
                            	<%-- 첨부파일 다운로드 구현 아직 --%>
                            	
                            	<c:choose>
                            		<c:when test="${notice.cs_file } != ''">
	                            		<a href="/WEB-INF/views/upload/${notice.cs_file_real }" download="${notice.cs_file }" class="form-control" aria-label="cs_file"></a>
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
                                <button class="btn btn-outline-secondary" type="button" onclick="location.href='delete_cs?csType=1&cs_type_list_num=${notice.cs_type_list_num }'">&nbsp;&nbsp;&nbsp;삭제&nbsp;&nbsp;&nbsp;</button>
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
</body>
