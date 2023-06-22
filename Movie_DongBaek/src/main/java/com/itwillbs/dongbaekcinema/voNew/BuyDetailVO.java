package com.itwillbs.dongbaekcinema.voNew;

import java.util.Date;

import lombok.*;

@Data
public class BuyDetailVO {
	// 마이페이지 - 나의 구매내역 중 
//	private int order_num;
	private String member_id;
	private String payment_num;
	private String payment_name;
	private String payment_card_name;
	private String payment_card_num;
	private Date payment_datetime;
	private int payment_total_price;
	private String payment_status;
	private String movie_name_kr;
	private String ticket_type;
	private String snack_name;
	private int ticket_quantity;	// 구매내역 중 영화, 티켓타입별 갯수
	private int snack_quantity;		// 구매내역 중 스낵별 갯수
	private String reason;
}
