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
	
	
	
}
