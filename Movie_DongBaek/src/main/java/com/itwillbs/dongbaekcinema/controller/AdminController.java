package com.itwillbs.dongbaekcinema.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.itwillbs.dongbaekcinema.service.MemberService;
import com.itwillbs.dongbaekcinema.vo.MemberVO;
import com.itwillbs.dongbaekcinema.vo.PaymentVO;

@Controller
public class AdminController {
	
	//0608 정의효 - 데이터랑 없는상태에서는 오류떠서 주석처리 다해놓음
	//멤버 관련 회원가입, 조회를 위한 MemberService @Autowired 
	@Autowired
	private MemberService service;
	
	
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
	
	// 관리자페이지 회원관리 메인(리스트) 회원목록 다 가져와서 뿌리기
	// 데이터넣고 주석풀고 확인하기 0608 - 정의효
	@GetMapping("admin_member_list")
	public String adminMemberList(/* Model model */) {
//		List<MemberVO> memberList = service.getMemberList();
//		model.addAttribute("memberList", memberList);
		return "admin/admin_member_list";
	}
	
	// 관리자페이지 영화관리 메인
	@GetMapping("admin_movie_management")
	public String adminMovieManagement() {
		return "admin/admin_movie_management";
	}
	
	// 관리자페이지 결제관리 메인(리스트) 결제목록 다 가져와서 뿌리기
	// 데이터넣고 주석풀고 확인하기 0608 - 정의효
	@GetMapping("admin_payment_list")
	public String adminPaymentList() {
		
		return "admin/admin_payment_list";
	}
	
	// 관리자페이지 회원(1명) 정보 조회
	// 파라미터 id(이름은 중복될수있으니까 X)
	// 포워딩 페이지 : admin/admin_member_oneperson
	// 데이터넣고 주석풀고 확인하기 0608 - 정의효
	@GetMapping("admin_member_oneperson")
	public String adminMemberOneperson(/* @RequestParam String id, Model model */) {
//		MemberVO member = service.getMember(id);
//		
//		model.addAttribute("member", member);
		
		return "admin/admin_member_oneperson";
	}
	
	// 관리자페이지 결제관리메인 -> 상세보기 클릭시 주문내역상세
	// 파라미터 id
	// 포워딩페이지 : admin/admin_payment_list_detai
	// 데이터넣고 주석풀고 확인하기 **완료X 0608 - 정의효
	@GetMapping("admin_payment_list_detail")
	public String adminPaymentListDetail(/* @RequestParam String id, Model model */) {
//		PaymentVO payment = service.getPayment(id); 
		return "admin/admin_payment_list_detail";
	}
	
	
}



















