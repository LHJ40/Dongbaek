package com.itwillbs.dongbaekcinema.vo;

import java.util.Date;

import lombok.Data;

@Data
public class PaymentVO {
	private int payment_num;
	private String payment_name;
	private Date payment_datetime;	// java.util.Date 로 임포트함 시분초 필요하니까
	private String payment_card_name;
	private int payment_card_num;
	private int payment_total_price;
	private int order_num;
	private String payment_status;	// 추가함
	private String member_id; // 삭제시 관리자페이지-전체결제내역 저장데이터없어서 오류 0615-정의효
//	데이터넣고 주석풀고 확인하기 0608 - 정의효
}
