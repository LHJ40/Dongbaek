<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		width: 1200px;
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
		height: 200px;
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
		width: 130px;
		display: inline-block;
		vertical-align: top;
		padding-top: 1.5rem;
	}
	#room{
		vertical-align: top;
	/* 	border: 1px solid #000; */
		width: 300px;
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
 	        IMP.init('imp68416584'); 
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
 	            merchant_uid: createOrderNum(),
 	          
 	            
 	            
 	            name: '주문명:동백시네마',
 	            //결제창에서 보여질 이름
 	            amount:${totalprice},
 	            //가격 
 	            buyer_email: '${member.member_email}',
 	            buyer_name: '${member.member_name}',
 	            buyer_tel: '${member.member_phone}',
 	            
 	            
 	        }, function (rsp) {
 	        	
 	            if (rsp.success) {
 	                var msg = '결제가 완료되었습니다.';
//  	              	 location.href='reservation_check'
 	                msg += '고유ID : ' + typeof(rsp.imp_uid);
 	                msg += '상점 거래ID : ' + rsp.merchant_uid;
 	                msg += '결제 금액 : ' + rsp.paid_amount;
 	                msg += '카드 승인번호 : ' + rsp.apply_num;
 	                
 	               jQuery.ajax({
                       url: "complete", 
                       type: "POST",
                        data:{
                       "order_num" :  rsp.merchant_uid,//주문번호
                       "order_total_price": ${beforeTotalprice}, //할인전 총금액 	
                       "member_id" : '${member.member_id}', // 회원아이디
                       "payment_num" : rsp.imp_uid,//고유ID
                       "payment_name": '${member.member_name}',//주문자명
                       "payment_datetime" : timestamp(),//결제시간
                       "payment_total_price" : rsp.paid_amount,//총결제금액
                       "play_num":${param.play_num},
                       "seat_name":"${param.seat_name}",
                       "ticket_type_num_param":"${param.ticket_type_num}",
                       "snack_num_param":"${param.snack_num}",
                       "snack_quantity_param":"${param.snack_quantity}",
                       "payment_card_num":rsp.apply_num, //임시
                       "payment_card_name":"NH"//임시
                       },
                       dataType: "json", 
                   })
                   .done(function(res) {
                       if (res > 0) {
                           alert('주문정보 저장 성공');
//                            createPayInfo(uid);
                           location.replace('reservation_check?order_num='+rsp.merchant_uid+'&play_num=${param.play_num}&seat_name=${param.seat_name}&payment_total_price='+rsp.paid_amount
                        		   +'&snack_num=${param.snack_num}&snack_quantity=${param.snack_quantity}&payment_num='+rsp.imp_uid);
                       } 
                       else {
                    	   alert('주문정보 저장 실패');
                       }
                   })
           }
 	                
 	             else {
 	                var msg = '결제에 실패하였습니다.';
 	                msg += '에러내용 : ' + rsp.error_msg;
 	            }
 	            alert(msg);
 	        });
 	    });
		
 	});
 	
 	function createOrderNum(){
 		const date = new Date();
 		const year = date.getFullYear();
 		const month = String(date.getMonth() + 1).padStart(2, "0");
 		const day = String(date.getDate()).padStart(2, "0");
 		
 		let orderNum = year + month + day;
 		for(let i=0;i<10;i++) {
 			orderNum += Math.floor(Math.random() * 8);	
 		}
 		return orderNum;
 	}
 	function timestamp(){
 	    var today = new Date();
 	    today.setHours(today.getHours() + 9);
 	    return today.toISOString().replace('T', ' ').substring(0, 19);
 	}
 	
 	function createPayInfo(uid) {
 	    // 결제정보 생성 및 테이블 저장 후 결제완료 페이지로 이동 
 	    $.ajax({
 	        type: 'get',
 	        url: '/order/pay_info',
 	        data: {
 	            'imp_uid': uid,
 	        },
 	        success: function(data) {
 	            
 	            swal('결제 성공 !',"결제완료 페이지로 이동합니다.","success").then(function(){
 	                
 	                // 결제완료 페이지로 이동
 	                location.replace('/order/complete?payNum='+data);

 	            })
 	        },
 	        error: function() {
 	            swal('결제정보 저장 통신 실패');
 	        }
 	    });
 	}
	
</script>

	
	
</head>
<body>
 <%--네비게이션 바 영역 --%>
 <header id="pageHeader"><%@ include file="../inc/header.jsp"%></header>
 
  <article id="mainArticle">
<c:set var="morning" value='<img src="${pageContext.request.contextPath }/resources/img/sun.png" alt="해" width="15px"> 조조' />
<c:set var="night" value='<img src="${pageContext.request.contextPath }/resources/img/moon.png" alt="달" width="15px"> 심야' />
<c:set var="general" value='일반' />
  <%--본문내용 --%>
		<h2>영화 예매</h2>
		<div class="container-fluid reservation_con" >
			<div class="col col1">
	            <div class="row row1">
	            	<%-- 예매 진행 중인 영화 포스터 파트  --%>
	                <div class="col-3" align="center">
	                	<img src="${reservation.movie_poster }" width="200" height="285">
	                </div>
	                
	                <%-- 예매 진행 중인 예매 정보 출력 파트 --%>
	                <div class="col-4.5">
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
					 			<td scope="col" ><c:if test="${reservation.play_time_type eq '조조'}">${morning}</c:if>
															  <c:if test="${reservation.play_time_type eq '심야'}">${night}</c:if>
															  <c:if test="${reservation.play_time_type eq '일반'}">${general}</c:if></td>
					 		</tr>
					 		</thead>
					 		<tbody >
					 		<tr><td>${reservation.movie_name_kr }</td></tr>
					 		<tr><td>${reservation.theater_name } ${reservation. room_name }</td></tr>
					 		<tr><td>${reservation.play_date} ${reservation.play_start_time }</td></tr>
					 		<tr><td>${param.seat_name }</td></tr>
					 		</tbody>
					 	</table>
	                </div>
	                
					<%-- 결제할 금액을 명시하는 파트 --%>
	                <div class="col-3.5">
				  		<table class="table table-striped">
				  			<%-- 상단의 멤버십 사진 대신 할인금액에서 멤버십 이라는 단어를 사용해 할인이 된다 정도만 명시하면 좋을듯
				  			회원인 경우 멤버십을 마이페이지에서 확인할 수 있고
				  			비회원인 경우 멤버십이 필요가 없음 --%>
				  	<tr>
				  	<td colspan="3">
				  			<c:set var = "total" value = "0" />
	               	<c:set var = "count" value = "1" />
					  <c:forEach var="ticket" items="${ticketPriceList}" varStatus="status" >
					  	<c:choose>
							<c:when test="${status.index eq 0 }" >
							  ${ticket.ticket_user_type}
							  ${ticket.ticket_type_price}
							  <c:if test="${status.last eq true }">
								X${count}
								</c:if>
					  		</c:when>
							<c:when test="${status.index ne 0 }" >
								<c:if test="${ticketPriceList[status.index-1].ticket_user_type eq ticket.ticket_user_type }">
								
							    <c:set var = "count" value = "${count + 1}"/>
								</c:if>
								<c:if test="${ticketPriceList[status.index-1].ticket_user_type ne ticket.ticket_user_type }">
								X${count}<br>
								<c:set var = "count" value = "1"/>
								 ${ticket.ticket_user_type}
							  	${ticket.ticket_type_price}
								</c:if>
								<c:if test="${status.last eq true }">
								X${count}
								</c:if>
							</c:when>
						</c:choose>
					  <c:set var= "total" value="${total + ticket.ticket_type_price}"/>
					  </c:forEach>
				  			</td>
				  			</tr>
				  			
				  		
				  			<tr>
				  				<td ><b>영화 총 금액</b> </td>
				  				<td>${total}원</td>
				  				<td></td>
				  			</tr>

							<tr>
				  					<th>할인금액</th>
				  					<fmt:parseNumber var= "grade_discount" integerOnly= "true" value= "${total*member_grade.grade_discount}" />
				  					 <c:if test="${member_grade.grade_name eq 'NONE'}">
				  					<c:set var= "grade_discount" value="0"/>
				  					</c:if>
				  					<td>${grade_discount }원 </td>
				  					<td>${member_grade.grade_name } </td>
				  				</tr>
				  				<tr>
				  					<th>최종 영화금액 </th>
				  					<td> <span <c:if test="${member_grade.grade_name ne 'NONE'}"> style="text-decoration: line-through;"</c:if>>${total}원</span></td>
				  					<td> ${total-grade_discount} 원 </td>
				  				</tr>
				  			
				  		</table>
	                	</div>
	            	</div>
	            
	            <%-- 스낵 구매 정보 확인 & 돌아가기 ,결제하기 버튼 --%>
	            <div class="row row2">
	            	<%-- 선택한 스낵의 사진 --%>
	         <c:if test="${snackNumlist ne null}">
	                <div class="col-3" align="center">
				  		<img src="${pageContext.request.contextPath }/resources/img/${snackNumlist[0].snack_img }" height="100px" width="100px">
					</div>
					<%-- 선택한 스낵의 정보 --%>
		                <div class="col-3">
		                	<table id="snackregion" class="table table-borderless">
						 		<tr>
						 			<th scope="col" colspan="2"><b>스낵 정보</b></th>
						 		</tr>
						 		<tr>
						 		<td>
						 		<c:forEach var="snack" items="${snackNumlist}" varStatus="status" >
						 		 	${snack.snack_name}
									 ${snack.snack_price}x${snackquantitylist[status.index]}<br>
									 <c:set var= "sancktotal" value="${sancktotal + snack.snack_price*snackquantitylist[status.index]}"/>
						 		 </c:forEach>
						 		 <b>스낵 총 금액</b> ${sancktotal}원
						 		</td>
						 		</tr>
						 		
						 	</table>
		                </div>
	                </c:if>
	               
	                <div class="col-3">
	                <h2>최종 결제 금액</h2>
	                <c:if test="${snackNumlist ne null}">영화(${total-grade_discount})+스낵(${sancktotal})</c:if>
	                <h3>=<fmt:formatNumber value="${total-grade_discount+sancktotal }" pattern="#,###" />원</h3>
	                </div>
	                <%-- 돌아가기, 결제하기 버틈 --%>
	                <div class="col-3">
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