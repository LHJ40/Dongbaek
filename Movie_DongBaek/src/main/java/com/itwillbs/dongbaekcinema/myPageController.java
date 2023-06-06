package com.itwillbs.dongbaekcinema;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class myPageController {
	
	@GetMapping("myPage")
	public String myPage() {
		return "myPage/myPage";
	}
	
	@GetMapping("myPage_reservation_buy_history")
	public String myPage_reservation_buy_history() {
		return "myPage/myPage_reservation_buy_history";
	}
	
	@GetMapping("myPage_myReview") 
	public String myPage_myReview() {
		return "myPage/myPage_myReview";
	}
	
	@GetMapping("myPage_moviefourcut")
	public String myPage_moviefourcut() {
		return "myPage/myPage_moviefourcut";
	}
	
	@GetMapping("myPage_inquiry") 
	public String myPage_inquiry() {
		return "myPage/myPage_inquiry";
	}
	
	@GetMapping("myPage_grade") 
	public String grade() {
		return "myPage/myPage_grade";
	}
	
	@GetMapping("myPage_modify_check")
	public String myPage_modify_check() {
		return "myPage/myPage_modify_check";
	}
	
	@GetMapping("myPage_modify_member")
	public String myPage_modify_member() {
		return "myPage/myPage_modify_member";
	}
	
	@GetMapping("myPage_modify_member_pro") // 변경후 등록 변경 클릭시 나의페이지 메인
	public String myPage_modify_member_pro() {
		return "redirect:/myPage";
	}
	
	
}

























