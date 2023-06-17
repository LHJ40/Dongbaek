package com.itwillbs.dongbaekcinema.vo;

import java.math.BigDecimal;

import lombok.Data;

@Data
public class ReviewVO {
	private int review_num;
//	private BigDecimal review_rating;
	//평균평점
	private BigDecimal movie_review_rating;
	private String review_content;
	private String  review_date;
	private int movie_num;
	private String member_id;
}
