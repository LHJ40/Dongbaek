package com.itwillbs.dongbaekcinema.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {

	// 메인화면에서 회원 로그인 화면으로 이동
	@GetMapping("member_login_form")
	public String member_login_form() {
		return "member/member_login_form";
	}
	
	// 메인화면에서 회원가입 화면 1페이지로 이동
	@GetMapping("member_join_step1")
	public String member_join_step1() {
		return "member/member_join_step1";
	}
	
	// 회원 로그인 화면에서 상단 탭(header)의 비회원 로그인 탭 클릭 시 비회원 로그인 페이지로 이동
	@GetMapping("no_member_login_form")
	public String no_member_login_form() {
		return "member/no_member_login_form";
	}

	// 회원 로그인 화면에서 상단 탭(header)의  비회훤 예매 확인 탭 클릭 시 비회원 예매 확인 페이지로 이동
	@GetMapping("no_member_reservation_check_form")
	public String no_member_reservation_check_form() {
		return "member/no_member_reservation_check_form";
	}
	
	// 임시 - 정보입력화면 
	@GetMapping("member_join_step3")
	public String member_join_step3() {
		return "member/member_join_step3";
	}
	

}


























