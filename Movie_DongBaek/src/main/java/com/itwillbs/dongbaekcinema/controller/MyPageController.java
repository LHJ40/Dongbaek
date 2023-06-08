package com.itwillbs.dongbaekcinema.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyPageController {

	//  마이페이지 메인화면
	@GetMapping("myPage")
	public String myPage() {
		return "myPage/myPage";
	}
	
	// 마이페이지 -  예매/구매내역 페이지로 이동
	@GetMapping("myPage_reservation_buy_history")
	public String myPage_reservation_buy_history() {
		return "myPage/myPage_reservation_buy_history";
	}
	
	// 마이페이지 - 나의 리뷰 페이지로 이동
	@GetMapping("myPage_myReview")
	public String myPage_myReview() {
		return "myPage/myPage_myReview";
	}
	
	// 마이페이지 - 나의 리뷰 글쓰기 페이지로 이동
	@GetMapping("myPage_reviewWrite")
	public String myPage_reviewWrite() {
		return "myPage/myPage_reviewWrite";
	}

	// 마이페이지 - 영화 네컷 페이지로 이동
	@GetMapping("myPage_moviefourcut")
	public String myPage_moviefourcut() {
		return "myPage/myPage_moviefourcut";
	}
	
	// 마이페이지 - 문의 내역 페이지로 이동
	@GetMapping("myPage_inquiry")
	public String myPage_inquiry() {
		return "myPage/myPage_inquiry";
	}
	
	// 마이페이지 - 등급별 헤택 페이지로 이동
	@GetMapping("myPage_grade")
	public String myPage_grade() {
		return "myPage/myPage_grade";
	}
	
	// 마이페이지 - 개인정보 수정 비밀번호 확인 페이지로 이동
	@GetMapping("myPage_modify_check")
	public String myPage_modify_check() {
		return "myPage/myPage_modify_check";
	}
	
	// 마이페이지 - 개인정보 수정 폼페이지로 이동
	@GetMapping("myPage_modify_member")
	public String myPage_modify_member() {
		return "myPage/myPage_modify_member";
	}
}


























