package com.itwillbs.dongbaekcinema.voNew;

import java.math.BigDecimal;

import lombok.Data;

@Data
public class MyReviewVO {
	private int review_num;
	private BigDecimal review_rating;
	private String review_content;
	private String  review_date;
	private int movie_num;
	private String member_id;
	
	// 영화제목
	private String movie_name_kr;
		
}
