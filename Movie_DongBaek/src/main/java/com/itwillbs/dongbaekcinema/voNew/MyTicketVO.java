package com.itwillbs.dongbaekcinema.voNew;

import lombok.*;

@Data
public class MyTicketVO {
	// 나의 예매내역에서 사용되는 VO
	// 회원 id, 영화 포스터, 영화명(한글), 상영일자, 상영상태(상영 전, 상영완료), 상영취소여부(취소가능, 취소불가)
	private String member_id;
	private String movie_poster;
	private String movie_name_kr;
	private String play_date;
	private String play_status;
	private String play_change;
}
