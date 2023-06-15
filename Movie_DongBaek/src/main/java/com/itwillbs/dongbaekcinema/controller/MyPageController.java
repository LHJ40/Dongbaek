package com.itwillbs.dongbaekcinema.controller;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.GetMapping;

import com.itwillbs.dongbaekcinema.service.*;
import com.itwillbs.dongbaekcinema.vo.*;

@Controller
public class MyPageController {
	
	@Autowired
	private MypageService service;
	
	@Autowired
	private PaymentService paymentService;
	
	//  마이페이지 메인화면
	@GetMapping("myPage")
	public String myPage() {
		return "myPage/myPage";
	}
	
	// 마이페이지 -  예매/구매내역 페이지로 이동
//	@GetMapping("myPage_reservation_buy_history")
//	public String myPage_reservation_buy_history(HttpSession session, Model model) {
//		// 세션아이디로 나의 예매/구매 내역 보여주기
//		String member_id = (String) session.getAttribute("member_id");
//		
//		// 나의 예매내역 조회
//		// MypageService - getMyTicket()
//		// 파라미터 : member_id		리턴타입 : List<MyTicketVO>(myTicketList)
//		List<MyTicketVO> myTicketList = service.getMyTicket(member_id);
////		System.out.println(myTicketList);
//		
//		// 받아온 예매내역 전달
//		model.addAttribute("myTicketList", myTicketList);
//		
//		// 나의 구매내역 조회
//		// MypageService - getMyPayment()
//		// 파라미터 : member_id		리턴타입 : List<PaymentVO>(myPaymentList)
//		List<PaymentVO> myPaymentList = paymentService.getMyPaymentList(member_id);
//		System.out.println(myPaymentList);
//		
//		//받아온 구매내역 전달
//		model.addAttribute("myPaymentList", myPaymentList);
//		
//		return "myPage/myPage_reservation_buy_history";
//	}
	
	// 마이페이지 -  예매내역 페이지로 이동
	@GetMapping("myPage_reservation_history")
	public String myPage_reservation_history(HttpSession session, Model model) {
		// 세션아이디로 나의 예매/구매 내역 보여주기
		String member_id = (String) session.getAttribute("member_id");
		
		// 나의 예매내역 조회
		// MypageService - getMyTicket()
		// 파라미터 : member_id		리턴타입 : List<MyTicketVO>(myTicketList)
		List<MyTicketVO> myTicketList = service.getMyTicket(member_id);
//		System.out.println(myTicketList);
		
		// 받아온 예매내역 전달
		model.addAttribute("myTicketList", myTicketList);
		
		return "myPage/myPage_reservation_history";
	}
	
	// 마이페이지 -  구매내역 페이지로 이동
	@GetMapping("myPage_buy_history")
	public String myPage_buy_history(HttpSession session, Model model) {
		// 세션아이디로 나의 예매/구매 내역 보여주기
		String member_id = (String) session.getAttribute("member_id");
		
		// 나의 구매내역 조회
		// MypageService - getMyPayment()
		// 파라미터 : member_id		리턴타입 : List<PaymentVO>(myPaymentList)
		List<PaymentVO> myPaymentList = paymentService.getMyPaymentList(member_id);
//		System.out.println(myPaymentList);
		
		//받아온 구매내역 전달
		model.addAttribute("myPaymentList", myPaymentList);
		
		return "myPage/myPage_buy_history";
	}
	
	// 마이페이지 - 구매내역 - 상세내역 조회
	@GetMapping("myPayment_detail")
	public String myPayment_detail(int order_num, Model model) {
		
		// 상세내역 클릭 시 payment_num 을 받아와 조회해 보여주기
		// 파라미터 : int(payment_num)		리턴타입 : PaymentVO(payment)
		System.out.println(order_num);
		PaymentVO payment = paymentService.getPayment(order_num);
		System.out.println(payment);
		
		//받아온 구매 상세내역 전달
		model.addAttribute("payment", payment);
//	public String myPayment_detail(PaymentVO payment, Model model) {
//		
//		// 상세내역 클릭 시 payment_num 을 받아와 조회해 보여주기
//		// 파라미터 : int(payment_num)		리턴타입 : PaymentVO(payment)
////		PaymentVO payment = paymentService.getPayment(payment_num);
//		System.out.println(payment);
//		
//		//받아온 구매 상세내역 전달
//		model.addAttribute("payment", payment);
		
		return "myPage/myPage_buy_history_detail";
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


























