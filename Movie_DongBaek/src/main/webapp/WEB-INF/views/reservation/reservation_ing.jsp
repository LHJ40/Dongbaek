location.href='reservation_check'<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<head>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<title>영화 예매 사이트</title>
<style>

article {
	justify-content: center;
		align-items: center;
		margin: 2em auto;
}
	.container-top{
		margin: 3rem;
	}
	aside{
		margin: 10px;
		background-color: #d5b59c;
	}
	
	/* 예매 선택 구간 */
	/* 크기 조절 */
	.container-fluid{
		width: 900px;
		padding-left: 2rem;
		border: 2px solid #aaa;
	/* 	background-color: #d5b59c; */
		align-self: center;
	}
	div{
		background-color: transparent;
	}
	.container-fluid h5{
		text-align: center;
		font-weight: bold;
	}
	/* 각 파트 구별을 위한 색상 조절, 여백 */
	.row1>div{
		height: 300px;
		margin: 0.5rem;
		padding: 10px;
		background-color: white;
	}
	/* 페이지 이름 잘보이게 설정 */
	#mainArticle>h2{
		font-weight: bold;
		padding-left: 1rem;
	}
	
	/* 선택사항 안내 구간 */
	/* 위 파트와 구별을 위한 색상 부여 */
	.row2{
		padding-top: 0.5rem;
		height: 150px;
		background-color: #aaa;
	}
	
	.row1>div{
		border: 1px solid #aaa;
	}
	/* 영화 목록에 앞의 모양 제거 */
	#selectMovie ul {
		list-style: none;
		padding-left: 0;
	}
	/* 극장 파트 좌우 배치 */
	#region{
	/* 	border: 1px solid #000; */
		width: 120px;
		display: inline-block;
		vertical-align: top;
		padding-top: 1.5rem;
	}
	#room{
		vertical-align: top;
	/* 	border: 1px solid #000; */
		width: 120px;
		display: inline-block;
		padding-top: 1.5rem;
		
	}
	#playType{
		text-align: right;
	}
	.col-3 {
		padding-top: 1.5rem;
	}
	.col-5 {
		padding-top: 3rem;
		padding-left: 8rem;
				
	}
</style>
<script type="text/javascript">
	
 	$(function() {
 		
 		$("#check_module").click(function () {
 	        var IMP = window.IMP; // 생략가능
 	        IMP.init('imp85027310'); 
 	        // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
 	        // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
 	        IMP.request_pay({
 	            pg: 'html5_inicis', // version 1.1.0부터 지원.
 	            /* 
 	                'kakao':카카오페이, 
 	                html5_inicis':이니시스(웹표준결제)
 	                    'nice':나이스페이
 	                    'jtnet':제이티넷
 	                    'uplus':LG유플러스
 	                    'danal':다날
 	                    'payco':페이코
 	                    'syrup':시럽페이
 	                    'paypal':페이팔
 	                */
 	            pay_method: 'card',
 	            /* 
 	                'samsung':삼성페이, 
 	                'card':신용카드, 
 	                'trans':실시간계좌이체,
 	                'vbank':가상계좌,
 	                'phone':휴대폰소액결제 
 	            */
 	            merchant_uid: 'merchant_' + new Date().getTime(),
 	          
 	            
 	            
 	            name: '주문명:동백시네마',
 	            //결제창에서 보여질 이름
 	            amount: 1000, 
 	            //가격 
 	            buyer_email: 'willbeok5.1@gmail.com',
 	            buyer_name: '${sessionScope.member_id}',
 	            buyer_tel: '010-1234-5678',
 	            buyer_addr: '부산광역시 부산진구 동천로 ',
 	            buyer_postcode: '123-456',
 	            m_redirect_url: 'reservation_check'
 	            /*  
 	                모바일 결제시,
 	                결제가 끝나고 랜딩되는 URL을 지정 
 	                (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐) 
 	                */
 	        }, function (rsp) {
 	            console.log(rsp);
 	            if (rsp.success) {
 	                var msg = '결제가 완료되었습니다.';
 	              	 location.href='reservation_check'
//  	                msg += '고유ID : ' + rsp.imp_uid;
//  	                msg += '상점 거래ID : ' + rsp.merchant_uid;
//  	                msg += '결제 금액 : ' + rsp.paid_amount;
//  	                msg += '카드 승인번호 : ' + rsp.apply_num;
 	            } else {
 	                var msg = '결제에 실패하였습니다.';
 	                msg += '에러내용 : ' + rsp.error_msg;
 	            }
 	            alert(msg);
 	        });
 	    });
		
 	});
	
</script>

	
	
</head>
<body>
 <%--네비게이션 바 영역 --%>
 <header id="pageHeader"><%@ include file="../inc/header.jsp"%></header>
 
  <article id="mainArticle">
  <%--본문내용 --%>
		<div class="container-fluid reservation_con" >
		<h2>영화 예매</h2>
			<div class="col col1">
	            <div class="row row1">
	            	<%-- 예매 진행 중인 영화 포스터 파트  --%>
	                <div class="col-3" align="center">
	                	<img src="/resources/img/poster09.jpg" width="200" height="285">
	                </div>
	                
	                <%-- 예매 진행 중인 예매 정보 출력 파트 --%>
	                <div class="col-4">
		                <%-- 테두리가 없는 테이블 --%>
		                <%-- 예매 진행 중인 구체적인 내용 출력 --%>
					 	<table id="region" class="table table-borderless">
					 		<thead>
					 		<tr>
					 			<th scope="col" colspan="2">예매 정보</th>
					 		</tr>
					 		</thead>
					 		<tbody>
					 		<tr><td>영화 제목</td></tr>
					 		<tr><td>극장과 상영관</td></tr>
					 		<tr><td>날짜와 시간</td></tr>
					 		<tr><td>좌석 정보</td></tr>
					 		</tbody>
					 	</table>
					 	<%-- 아래의 테이블은 데이터를 전달받아 출력 --%>
					 	<table id="room" class="table table-borderless">
					 		<thead>
					 		<tr>
					 			<th scope="col" width="180px">&nbsp;</th>
					 		</tr>
					 		</thead>
					 		<tbody>
					 		<tr><td>문라이트</td></tr>
					 		<tr><td>서면점 1 관</td></tr>
					 		<tr><td>23년 6월 1일</td></tr>
					 		<tr><td>G10, G11</td></tr>
					 		</tbody>
					 	</table>
	                </div>
	                
					<%-- 결제할 금액을 명시하는 파트 --%>
	                <div class="col-4">
				  		<table class="table table-striped">
				  			<%-- 상단의 멤버십 사진 대신 할인금액에서 멤버십 이라는 단어를 사용해 할인이 된다 정도만 명시하면 좋을듯
				  			회원인 경우 멤버십을 마이페이지에서 확인할 수 있고
				  			비회원인 경우 멤버십이 필요가 없음 --%>
				  			<thead>
				  			<tr>
				  				<th colspan="3">결제하실 금액</th>
				  			</tr>
				  			</thead>
				  			<tbody>
				  				<tr>
				  					<th>성인</th>
				  					<td> 2 명 </td>
				  					<td> 30,000 원</td>
				  				</tr>
				  				<tr>
				  					<th>청소년</th>
				  					<td> 0 명 </td>
				  					<td> 0 원 </td>
				  				</tr>
				  				<tr>
				  					<th>경로/우대</th>
				  					<td> 0 명 </td>
				  					<td> 0 원 </td>
				  				</tr>
				  				<tr>
				  					<th>할인금액</th>
				  					<td>멤버십</td>
				  					<td> 5,000 원 </td>
				  				</tr>
				  				<tr>
				  					<th>결제금액</th>
				  					<td> &nbsp; </td>
				  					<td> 25,000 원 </td>
				  				</tr>
				  			</tbody>
				  		</table>
	                	</div>
	            	</div>
	            
	            <%-- 스낵 구매 정보 확인 & 돌아가기 ,결제하기 버튼 --%>
	            <div class="row row2">
	            	<%-- 선택한 스낵의 사진 --%>
	                <div class="col-3" align="center">
				  		<img src="/resources/img/popcorncombo.png" height="100px" width="100px">
					</div>
					<%-- 선택한 스낵의 정보 --%>
	                <div class="col-3">
	                	<table id="snackregion" class="table table-borderless">
					 		<thead>
					 		<tr>
					 			<th scope="col" colspan="2">스낵 정보</th>
					 		</tr>
					 		</thead>
					 		<tbody>
					 		<tr><td>카라멜팝콘 콤보</td></tr>
					 		</tbody>
					 	</table>
	                </div>
	                <%-- 돌아가기, 결제하기 버틈 --%>
	                <div class="col-5">
			  			<button class="btn btn-secondary btn-lg" id="nextBtn" onclick=""> 돌아가기 </button>
			  			<button class="btn btn-danger btn-lg" id="check_module" onclick=""> 결제하기 </button>
	                </div>
	            </div>
	        </div>
	    </div>
  
  </article>
	<script>
    
</script>
  
  <nav id="mainNav">
  <%--왼쪽 사이드바 --%>
  </nav>
  
  <div id="siteAds"></div>
  <%--페이지 하단 --%>
  <footer id="pageFooter"><%@ include file="../inc/footer.jsp"%></footer>
</body>