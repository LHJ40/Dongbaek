package com.itwillbs.dongbaekcinema.voNew;

import java.sql.*;
import java.util.*;

import lombok.*;

@Data
public class MyTicketVO {
	// 나의 예매내역에서 사용되는 VO
	// 회원 id, 영화 포스터, 영화명(한글), 상영일자, 상영상태(상영 전, 상영완료), 상영취소여부(취소가능, 취소불가)
	private String member_id;
	private String movie_poster;
	private String movie_name_kr;
	private String play_date;
	private String ticket_type;
	private String play_status;
	private String play_change;
	private long order_num;	// 파라미터 전달 시 사용하기 위해 order_num 추가
	private String payment_num;
//	private String payment_name;
//	private String payment_datetime;
//	private String payment_card_name;
//	private String payment_total_price;
//	private String payment_status;
	private Time play_start_time;
	private Time play_end_time;
	
}
