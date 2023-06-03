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
#mainNav{
/* 		border: 1px solid #f00; */
		padding: 8rem 2rem;
		
	}
	
	#mainNav>ul{
		list-style: none;
	}
</style>

</head>
<body>
 <header id="pageHeader">
 <%--네비게이션 바 영역 --%>
  <%@ include file="/resources/inc/header.jsp"%>
 </header>
 
  <article id="mainArticle">
  <%--본문내용 --%>
  
   <div class="container-fluid w-900" >
  

    
 <nav aria-label="breadcrumb">
  <ol class="breadcrumb bg-white">
    <li class="breadcrumb-item"><a href="#">고객센터 홈</a></li>
    <li class="breadcrumb-item active" aria-current="page">1:1 문의</li>
  </ol>
</nav>

<h1>1:1문의</h1>
		<table class="table table-striped"  >


  <tr>
  <th>
    문의 유형* <select>
    						<option value="">선택</option>
							<option value="정보문의">정보문의</option>
							<option value="회원 문의">회원 문의</option>
							<option value="예매 결제 관련 문의">예매 결제 관련 문의</option>
							<option value="일반문의">일반문의</option>
							
						
	</select>
	</th>
  </tr>
  <tr>
    <td class="tg-fymr" >이름*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="text" name="name">이메일* <input type="text" name="jumin1" onkeyup="" style="width:150px"> @ 
						<input type="text" name="jumin2" onkeyup=""><select name="emailDomain" onchange="selectDomain(this.value)">
							<option value="">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="nate.com">nate.com</option>
						</select>	</td>
   
  </tr>
  <tr>
    <td class="tg-fymr">휴대전화*<input type="text" name="phone-number1" >-<input type="text" name="phone-number2" >-<input type="text" name="phone-number3" ></td>
    
  </tr>
  <tr>
    <td class="tg-fymr">제목*<textarea rows="1" cols="20" name="title"></textarea></td>
   
  </tr>
  <tr>
    <td class="tg-fymr">내용*<textarea rows="5" cols="50" name="content"  placeholder="-문의내용에 개인정보가 포함되지 않도록 유의하시기 바랍니다. - 
    -회원로그인 후 문의작성시 나의 문의내역을 통해 답변을 확인하실 수 있습니다."></textarea></td>
    
  </tr>
  <tr>
    <td class="tg-fymr">사진첨부 <input type="file" value="사진첨부"></td>
    
  </tr>
  <tr>
    <td class="tg-fymr">비밀번호* <input type="password" name="password" ></td>
   
  </tr>
</tbody>
</table>
		<button class="btn btn-primary" type="submit">등록</button>	
		<button class="btn btn-primary" type="button">돌아가기</button>	
		
			</div>

  </article>
  
  <nav id="mainNav">
  <%--왼쪽 사이드바 --%>
	<ul>
  		<li>고객센터홈</li>
  		<li>공지사항</li>
  		<li>자주묻는질문</li>
  		<li>1:1문의</li>
  		
  	</ul>
  </nav>
  
  <div id="siteAds"></div>
  <%--페이지 하단 --%>
  <footer id="pageFooter"><%@ include file="/resources/inc/footer.jsp"%></footer>
</body>