package com.itwillbs.dongbaekcinema.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.dongbaekcinema.service.ReviewLikeService;

@Controller
public class ReviewLikeController {
	
	@Autowired
	private ReviewLikeService service;
	
	@ResponseBody
	@PostMapping("IsReviewLikeExist")
	public boolean isReviewLikeExist(@RequestParam int review_num, @RequestParam String member_id, Model model) {
		System.out.println("MovieController - isReviewLikeExist()");
		boolean isReviewLikeExist = false;
		
		int reviewLikeCount = service.findReviewLike(review_num, member_id);
		System.out.println(reviewLikeCount);
		
		if(reviewLikeCount > 0) {
			isReviewLikeExist = true;
		}
		
		System.out.println(isReviewLikeExist);
		
		return isReviewLikeExist;
	}
	
	@ResponseBody
	@PostMapping("ReviewLikeCount")
	public int reviewLikeCount(@RequestParam int review_num) {
		System.out.println("MovieController - reviewLikeCount()");
		int reviewLikeCount = service.getReviewLikeCount(review_num);
		
		return reviewLikeCount;
	}
	
	@ResponseBody
	@PostMapping("ReviewLike")
	public int reviewLike(@RequestParam int review_num, @RequestParam String member_id) {
		System.out.println("ReviewLikeController - reviewLike()");
		
		int insertCount = service.registReviewLike(review_num, member_id);
		int reviewLikeCount = 0;
		
		if(insertCount > 0) {
			reviewLikeCount = service.getReviewLikeCount(review_num);
		}
		
		return reviewLikeCount;
	}
	
	@ResponseBody
	@PostMapping("RemoveReviewLike")
	public int removeReviewLike(@RequestParam int review_num, @RequestParam String member_id) {
		System.out.println("ReviewLikeController - removeReviewLike()");
		
		int insertCount = service.removeReviewLike(review_num, member_id);
		
		int reviewLikeCount = 0;
		
		if(insertCount > 0) {
			reviewLikeCount = service.getReviewLikeCount(review_num);
		}
		
		return reviewLikeCount;
	}

}
