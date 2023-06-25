package com.itwillbs.dongbaekcinema.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.dongbaekcinema.mapper.ReviewLikeMapper;
import com.itwillbs.dongbaekcinema.vo.ReviewLikeVO;

@Service
public class ReviewLikeService {
	
	@Autowired
	private ReviewLikeMapper mapper;

	public int findReviewLike(int review_num, String member_id) {
//	public ReviewLikeVO getReviewLikeInfo(String member_id) {
		System.out.println("ReviewLikeService - getReviewLikeInfo()");

		return mapper.selectFindReviewLike(review_num, member_id);
	}

	public int registReviewLike(int review_num, String member_id) {
		System.out.println("ReviewLikeService - registReviewLike()");
		return mapper.insertReviewLike(review_num, member_id);
	}

	public int getReviewLikeCount(int review_num) {
		System.out.println("ReviewLikeService - getReviewLikeCount()");
		
		return mapper.selectReviewLikeCount(review_num);
	}

	public int removeReviewLike(int review_num, String member_id) {
		System.out.println("ReviewLikeService - removeReviewLike()");

		return mapper.deleteReviewLike(review_num, member_id);
	}



}
