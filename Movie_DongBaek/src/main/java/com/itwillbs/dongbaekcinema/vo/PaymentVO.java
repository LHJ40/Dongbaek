package com.itwillbs.dongbaekcinema.vo;

import java.util.Date;

import lombok.Data;

@Data
public class PaymentVO {
	private int payment_num;
	private String payment_name;
	private Date payment_datetime;	// java.util.Date 로 임포트함 시분초 필요하니까
	private String payment_card_name;
	private String payment_card_num;
	private int payment_total_price;
	private int order_num;
	private String payment_status;	// 추가함
	private String member_id; // 관리자페이지-전체결제내역에서 아이디를 출력하기위해 DB에서 가져와서 저장하기위한 member_id 0615-정의효
	private String member_name;
	private String movie_name_kr;
	private String theater_name;
	private String headcount;
	private int seat_num; 
//	admin_playment_list 조인써서 하는중 0616 정의효
}

