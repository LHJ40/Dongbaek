<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmf" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<%-- 아임포트 --%>
<script type="text/javascript" src ="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/myPage.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/button.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/css/sidebar_myPage.css" rel="stylesheet" type="text/css">
<title>영화 예매 사이트</title>
<style>
	
	/* 표 중간배치 */
	.w-900 {
		margin: 0 auto;
	}
	
	.table {
		width: 800px;
	}
	
</style>
<script type="text/javascript">
	
	$(function() {
		
		$("#cancleCk").click(function(){
// 			let pay = $("#payment_total_price").val();
			let pay = 10;
			console.log(pay);
		   	  
			let IMP = window.IMP;
			IMP.init('imp85027310'); 
 	        // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
 	        // 'import 관리자 페이지 -> 내정보 -> 가맹점식별코드
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
 	            amount: pay, 
 	            //가격 
 	            buyer_email: 'willbeok5.1@gmail.com',
 	            buyer_name: '${myPaymentDetailList[0].payment_name}',
//  	            buyer_name: '${sessionScope.member_id}',
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
		                msg += '고유ID : ' + rsp.imp_uid;
		                msg += '상점 거래ID : ' + rsp.merchant_uid;
		                msg += '결제 금액 : ' + rsp.paid_amount;
		                msg += '카드 승인번호 : ' + rsp.apply_num;
		            } else {
		                var msg = '결제에 실패하였습니다.';
		                msg += '에러내용 : ' + rsp.error_msg;
		            }
		            alert(msg);
		        });
		});
 	        
// 			$.ajax({
// 					url: "/samsam/coupon_cancel.do",
// 					type:"post",
// 					//datatype:"json",
// 					contentType : 'application/x-www-form-urlencoded; charset = utf-8',
// 					data : {
<%-- 						"biz_email" : '<%=email%>' // 주문번호 --%>
// 						//"cancle_request_amount" : 2000, //환불금액
// 						//"reason": "테스트 결제 환불", //환불사유
// 						//"refund_holder": "홍길동", //[가상계좌 환불시 필수입력] 환불 가상계좌 예금주
// 						//"refund_bank":"88", //[가상계좌 환불시 필수입력] 환불 가상계좌 은행코드(ex Kg이니시스의 경우 신한은행 88)
// 						//"refund_account": "56211105948400" // [가상계좌 환불시 필수입력] 환불 가상계좌 번호
// 					}
// 				}).done(function(result){ //환불 성공
					
// 					 $('#pay_coupon').html(pay);	
// 					console.log("환불 성공 : "+ result);
// 				}).fail(function(error){
// 					console.log("환불 실패 : "+ error);
// 				});//ajax
// 			} else{
// 				console.log("환불 실패 : 이유");
// 			}
// 		}); //cancleCk 클릭
// 	}); //doc.ready
		
		
		
	});	// function() 끝
	
	
</script>
</head>
<body>
 <%--네비게이션 바 영역 --%>
 <header id="pageHeader"><%@ include file="../inc/header.jsp"%></header>
 
  <article id="mainArticle">
  <%--본문내용 --%>
  	<div class="container w-900">
  		<div class="mainTop">
			<h2>나의 구매 내역</h2>
			<br>
				<hr>
				<%-- 상세보기 테이블 --%>
		  	<div class="row">
				<table class="table table-bordered text-center">
				    <tr>
				      <th>주문자명</th>
				      <td>${myPaymentDetailList[0].payment_name}</td> 
				    </tr>
				    <tr>
				    	<th>예매 내역</th>
				    	<td>
						    <c:forEach var="ticket" items="${myTicket }">
								&lt; ${ticket.movie_name_kr} &gt; :
								${ticket.ticket_type}
								${ticket.ticket_quantity } 개
								<br>
						    </c:forEach>
			      		</td> 
				    </tr>
		    		<c:if test="${not empty mySnack}">
					    <c:forEach var="snack" items="${mySnack }">
							    <tr>
							    	<th>주문 내역</th>
							    		<td>
											${snack.snack_name}
											${snack.snack_quantity} 개
						      			</td> 
							    </tr>
					    </c:forEach>
		    		</c:if>
				    <tr>
				      <th>결제일</th>
				      <td>
				      	<fmf:formatDate value="${myPaymentDetailList[0].payment_datetime}" pattern="yyyy년 MM월 dd일 HH:mm"/>
				      </td>
				    </tr>
					<tr>
				      <th>결제수단</th> <%-- 우리는 카드 --%>
				      <td>
				      ${myPaymentDetailList[0].payment_card_name } / ${myPaymentDetailList[0].payment_card_num }
				      </td> <%-- 카드회사명 --%>
					</tr>
				     <tr>
				     	<th>총결제 금액</th>
				     	<td>
				     		<fmf:formatNumber value="${myPaymentDetailList[0].payment_total_price}" pattern="#,###,###" />
				     		<input type="hidden" id="payment_total_price" value="${myPaymentDetailList[0].payment_total_price}">
				     	</td> <%-- 결제기능 구현시 최종금액 DB로 저장되니 가져오기만하면될듯? --%>
				     </tr>
				     <tr>
				     	<th>결제 상태</th>
				     	<td>${myPaymentDetailList[0].payment_status }</td>
				     </tr>
				</table>
			</div>
			
			<%-- 버튼 --%>
			<div class="row d-flex justify-content-center">
					<button class="btn btn-outline-red" type="button" id="cancleCk">
<!-- 					type="submit" data-toggle="modal" data-target="#paymentCancel"> -->
					 결제취소</button>
					<button class="btn btn-outline-red" type="button" onclick="history.back()">뒤로가기</button>
			</div>
  		</div>
	</div>
  </article>
  
  <%-- '결제취소' 모달 --%>
<!-- 	<div class="modal fade" id="paymentCancel" tabindex="-1" role="dialog" aria-labelledby="paymentCancelTitle" aria-hidden="true"> -->
<!-- 	  <div class="modal-dialog modal-dialog-centered" role="document"> -->
<!-- 	    <div class="modal-content"> -->
<!-- 	      <div class="modal-header"> -->
<!-- 	        <h5 class="modal-title" id="paymentCancelTitle">결제취소 확인</h5> -->
<!-- 	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!-- 	          <span aria-hidden="true">&times;</span> -->
<!-- 	        </button> -->
<!-- 	      </div> -->
<!-- 	      <div class="modal-body"> -->
<!-- 	        결제를 취소하시겠습니까? -->
<!-- 	      </div> -->
<!-- 	      <div class="modal-footer justify-content-center"> -->
<!-- 	        <button type="button" class="btn btn-secondary" data-dismiss="modal">아니오</button> -->
<!-- 	        <button type="button" id="cancleCk" class="btn btn-red">&nbsp;&nbsp;&nbsp;&nbsp;예&nbsp;&nbsp;&nbsp;&nbsp;</button> -->
<!-- 	      </div> -->
<!-- 	    </div> -->
<!-- 	  </div> -->
<!-- 	</div> -->
  
  
  	<nav id="mainNav">
		<%--왼쪽 사이드바 --%>
  		<%@ include file="/WEB-INF/views/sidebar/sideBar_myPage.jsp"%>
  	</nav>
  
  
  <div id="siteAds"></div>
  <%--페이지 하단 --%>
  <footer id="pageFooter"><%@ include file="../inc/footer.jsp"%></footer>
</body>