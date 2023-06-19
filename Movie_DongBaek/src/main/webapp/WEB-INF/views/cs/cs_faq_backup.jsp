<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
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
	.seachArea{
		margin: 1.2em 0;
	}
	/* 검색창안에 검색아이콘 넣기 위한 설정 */
	.board-search {
 		margin: 0.8em 0;
 		width: 300px; 
 		height: 2em;
 		border-radius: 3px; 
 		border: 1px solid #ccc; 
/* 		display: flex; */
/* 		justify-content: center; */
/* 		align-items: center; */
		vertical-align: center;
 		z-index: 1;
 		opacity: 1;
	}
	.board-search>#searchTxt {
		width: 200px;
		height: 1.5em;
		border: none;
/* 		-webkit-appearance: none; */
		text-align: left;
		margin-left: 10px;
		overflow: auto;	/* 검색어가 길어졌을 때 오른쪽으로 검색되도록 하기 위해*/
		z-index: -1;
		font-size: 15px;
	}
	.board-search>#searchTxt:focus {
		outline: none;
/* 		width: 300px; */
/* 		text-align: left; */
	}
	.clear {
		clear: both;
	}
	.qPart {
		background-color: #
	}
	.qPart:hover {
		background-color: #eee;
	}
 	.checkbox {display:none;} 
	.target {
/*  		display: none; */
	}
	
	
</style>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
<script type="text/javascript">
	
	$(function() {
		// 화면 처음 로딩 시 전체 질문, 답변 들고오기
		let cs_type = '전체';
		$.ajax({
				type: 'GET',
				url: '<c:url value="/faq_data"/>',
				data: {'cs_type': cs_type},
				dataType: 'JSON',	// 응답데이터 json형식으로 전달받음
				success: function(result) {	// 요청 성공 시
					// 1. CsVO 객체 추출(result)
					// 2. 추출된 CsVO 목록(배열)을 반복문을 통해 반복하면서
					// cs_type, cs_subject, cs_content 추출 및 출력
					let i = 0;
					console.log("받아오기 성공!");
					$("#faqContents").empty();
					for(let faq of result) {
						i++;
						$("#faqContents").append(
								"<div class='btn-group' role='group' aria-label='Button group with nested dropdown'>"
								+ "<div class='btn-group-vertical' role='group'>"
								+ "<div id='btnGroupDrop1' class='btn btn-secondary dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false' >"
								+ (i < 6 ? i + ". " : "")
								+ "[" + faq.cs_type + "] <br>" + " Q. " + faq.cs_subject + "</div>"
								);
						$("#faqContents").append(
								"<div class='dropdown-menu' aria-labelledby='btnGroupDrop1'>"
								+ "<a class='dropdown-item'> A. " + faq.cs_content + "</a> </div>" + "<br>"
								);
					}
					$("#totalCnt").text(i);	// 총 몇 건인지 안내
// 					isDataAppended = true; // 데이터 추가 완료
				},
				error: function() {
					alert('에러');
				}
				
			});
		
		// 카테고리별 질문 & 답변 들고오기
		let isDataAppended = false;	// 추가 여부를 나타내는 변수
		$(".btn-group>button").click(function() {
			// 클릭된 버튼의 value값(카테고리명)을 받아 DB에서 받아오기
			let cs_type = $(this).val();
			
			if(!isDataAppended) {	// 추가되지 않았을 경우에만 실행
// 				console.log(cs_type);
				
				$.ajax({
					type: 'GET',
					url: '<c:url value="/faq_data"/>',
					data: {'cs_type': cs_type},
					dataType: 'JSON',	// 응답데이터 json형식으로 전달받음
					success: function(result) {	// 요청 성공 시
						// 1. CsVO 객체 추출(result)
						// 2. 추출된 CsVO 목록(배열)을 반복문을 통해 반복하면서
						// cs_type, cs_subject, cs_content 추출 및 출력
						let i = 0;
// 						console.log("받아오기 성공!");
						$("#faqContents").empty();
						for(let faq of result) {
							i++;
							$("#faqContents").append(
									"<div class='qPart'><input type='checkbox' class='checkbox' id='checkbox" + i + "' data-target='target" + i + "'>" 
									+ "<label id='checkbox" + i + "'>"
									+ (i < 6 ? i + ". " : "")
									+ "[" + faq.cs_type + "] <br>" + " Q. " + faq.cs_subject + "</label></div>"
									);
							$("#faqContents").append(
									"<div class='target' id='target" + i + "' > A. " + faq.cs_content + "</div>"
									);
						}
						$("#totalCnt").text(i);	// 총 몇 건인지 안내
// 						isDataAppended = true; // 데이터 추가 완료
					},
					error: function() {
						alert('에러');
					}
					
				});
			
			
			}
		});
		
	});
	
// 	$(document).ready(function() {
// 		$(".checkbox").on("click", function() {
// 			console.log("클릭됨");
// 			let targetId = $(this).data('target');
// 			let target = $("#" + targetId);
			
// 			if($(this).prop("checked")) {
// 				target.removeClass(".target");
// 			} else {
// 				target.addClass(".target");
// 			}
// 		});
		
// 	});
	
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
  
	 <nav aria-label="breadcrumb">
	  <ol class="breadcrumb bg-white">
	    <li class="breadcrumb-item"><a href="cs_main">고객센터 홈</a></li>
	    <li class="breadcrumb-item active" aria-current="page">자주묻는 질문</li>
	  </ol>
	</nav>

		<h1>자주묻는 질문</h1>
		
		<%-- 검색기능 --%>
		<div class="seachArea">
			<b>빠른 검색</b> &nbsp;&nbsp;
			<span class="board-search w460px">
				<input type="search" id="searchTxt" title="검색어를 입력해 주세요." placeholder="검색어를 입력해 주세요." class="input-text" value="" maxlength="15">
				<span class="material-symbols-outlined">search</span>
			</span>
		</div>
		<br>
		<div class="btn-group" role="group" aria-label="Basic example">
		  <button type="button" id="faqAll" value="전체" class="btn btn-outline-secondary">전체</button>
		  <button type="button" id="faqReserv" value="예매" class="btn btn-outline-secondary">예매</button>
		  <button type="button" id="faqMemship" value="멤버십" class="btn btn-outline-secondary">멤버십</button>
		  <button type="button" id="faqPayment" value="결제수단" class="btn btn-outline-secondary">결제수단</button>
		  <button type="button" id="faqTheater" value="극장" class="btn btn-outline-secondary">극장</button>
		  <button type="button" id="faqDiscount" value="할인혜택" class="btn btn-outline-secondary">할인혜택</button>
		  <hr>
		</div>
		<hr>
		  
			<div class="faq-list-box">
				<p class="reset mb10">
					<strong>
						<span id="totalTitle">전체</span>
						<span class="font-green" id="totalCnt"></span>건
					</strong>
				</p>
				
				<div class="faq-list">
					<ul>
					</ul>
				</div>
			</div>
   		<div id="faqContents">
   		</div>

       
		

  </div>
  </article>
  
  <nav id="mainNav" class="d-none d-md-block sidebar">
  <%--왼쪽 사이드바 --%>
	<jsp:include page="/WEB-INF/views/sidebar/sideBar_cs.jsp"></jsp:include>
  </nav>
  
  <div id="siteAds"></div>
  <%--페이지 하단 --%>
  <footer id="pageFooter"><%@ include file="../inc/footer.jsp"%></footer>
</body>