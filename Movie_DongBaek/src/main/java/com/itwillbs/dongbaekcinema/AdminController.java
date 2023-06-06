package com.itwillbs.dongbaekcinema;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class AdminController {
	
	// 관리자페이지 메인
	@GetMapping("admin_main")
	public String adminMain() {
		return "admin/admin_main";
	}
	
	// 관리자페이지 회원관리
//	@GetMapping("admin_")
//	public String adminMemeberList() {
//		return "admin/admin_";
//	}
	
	// 관리자페이지 상영스케줄 관리
	@GetMapping("admin_schedule_list")
	public String adminScheduleList() {
		return "admin/admin_schedule_list";
	}
	
	// 관리자페이지 결제관리
//	@GetMapping("")
//	public String adminPayment() {
//		return "admin/admin_";
//	}	

	// 관리자페이지 공지사항관리
	@GetMapping("admin_cs_notice")
	public String adminCsNotice() {
		return "admin/admin_cs_notice_list";
	}	
	
	// 관리자페이지 1:1 질문관리
	@GetMapping("admin_cs_qna")
	public String adminCsQna() {
		return "admin/admin_cs_qna_list";
	}	
	
	// 관리자페이지 자주묻는 질문 관리
	@GetMapping("admin_cs_faq")
	public String adminCsFaq() {
		return "admin/admin_cs_faq_list";
	}
	
	// 관리자페이지 회원관리 메인(리스트)
	@GetMapping("admin_member_list")
	public String adminMemberList() {
		return "admin/admin_member_list";
	}
	
	// 관리자페이지 영화관리 메인
	@GetMapping("admin_movie_management")
	public String adminMovieManagement() {
		return "admin/admin_movie_management";
	}
	
	// 관리자페이지 결제관리 메인
	@GetMapping("admin_payment_list")
	public String adminPaymentList() {
		return "admin/admin_payment_list";
	}
	
	// 관리자페이지 회원관리 메인(리스트) 현재는 현재상태 밑 회원상태버튼(현재상태 옆에 수정버튼 추가? 이름클릭?) -> 클릭시 상세페이지 이동
	@GetMapping("admin_member_oneperson")
	public String adminMemberOneperson() {
		return "admin/admin_member_oneperson";
	}
	
	
}



















