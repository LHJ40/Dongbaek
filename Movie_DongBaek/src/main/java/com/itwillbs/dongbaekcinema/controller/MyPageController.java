package com.itwillbs.dongbaekcinema.controller;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.dongbaekcinema.service.*;
import com.itwillbs.dongbaekcinema.vo.*;
import com.itwillbs.dongbaekcinema.voNew.*;

@Controller
public class MyPageController {
	
	@Autowired
	private MypageService service;
	
	@Autowired
	private PaymentService paymentService;
	
	//  마이페이지 메인화면
	@GetMapping("myPage")
	public String myPage(HttpSession session, Model model) {
		
		// 세션 아이디가 없을 경우 " 로그인이 필요합니다!" 출력 후 이전페이지로 돌아가기
		String member_id = (String) session.getAttribute("member_id");
		if(member_id == null) {
			model.addAttribute("msg", " 로그인이 필요합니다!");
			model.addAttribute("url", "member_login_form");
			
			return "fail_location";
		}
		
		return "myPage/myPage";
	}
	
	// 마이페이지 -  예매내역 페이지로 이동
	@GetMapping("myPage_reservation_history")
	public String myPage_reservation_history(HttpSession session, Model model) {
		// 세션아이디로 나의 예매/구매 내역 보여주기
		// 세션 아이디가 없을 경우 " 로그인이 필요합니다!" 출력 후 이전페이지로 돌아가기
		String member_id = (String) session.getAttribute("member_id");
		if(member_id == null) {
			model.addAttribute("msg", " 로그인이 필요합니다!");
			model.addAttribute("url", "member_login_form");
			
			return "fail_location";
		}
		
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
		// 세션 아이디가 없을 경우 " 로그인이 필요합니다!" 출력 후 이전페이지로 돌아가기
		String member_id = (String) session.getAttribute("member_id");
		if(member_id == null) {
			model.addAttribute("msg", " 로그인이 필요합니다!");
			model.addAttribute("url", "member_login_form");
			
			return "fail_location";
		}
		
		// 세션아이디로 나의 예매/구매 내역 보여주기
		// 구매내역 페이징 생각하기
		int pageNum = 3;
		
		// 나의 구매내역 조회
		// MypageService - getMyPayment()
		// 파라미터 : member_id		리턴타입 : List<PaymentVO>(myPaymentList)
		List<BuyDetailVO> myPaymentList = paymentService.getMyPaymentList(member_id, pageNum);
//		System.out.println(myPaymentList);
		
		//받아온 구매내역 전달
		model.addAttribute("myPaymentList", myPaymentList);
		
		return "myPage/myPage_buy_history";
	}
	
	// 마이페이지 - 구매내역 - 상세내역 조회
	@GetMapping("myPayment_detail")
	public String myPayment_detail(HttpSession session, int payment_num, Model model) {
		// 세션 아이디가 없을 경우 " 로그인이 필요합니다!" 출력 후 이전페이지로 돌아가기
		String member_id = (String) session.getAttribute("member_id");
		if(member_id == null) {
			model.addAttribute("msg", " 로그인이 필요합니다!");
			model.addAttribute("url", "member_login_form");
			
			return "fail_location";
		}
		
		// 상세내역 클릭 시 payment_num 을 받아와 조회해 보여주기
		// 파라미터 : int(payment_num)		리턴타입 : List<BuyDetailVO>(myPaymentDetailList)
//		System.out.println(payment_num);
		List<BuyDetailVO> myPaymentDetailList = paymentService.getMyPaymentDetail(payment_num);
//		System.out.println(myPaymentDetail);
		
		// 상세내역 클릭 시 payment_num으로 스낵, 영화 정보(갯수) 가져오기
		// 파라미터 : int(payment_num)		리턴타입 : BuyDetailVO(tickets)
		// 파라미터 : int(payment_num)		리턴타입 : BuyDetailVO(snacks)
		List<BuyDetailVO> myTicket = paymentService.getMyTickets(payment_num);
		List<BuyDetailVO> mySnack = paymentService.getMySnacks(payment_num);
		
		
		//받아온 구매 상세내역 전달
		model.addAttribute("myPaymentDetailList", myPaymentDetailList);
		model.addAttribute("myTicket", myTicket);
		model.addAttribute("mySnack", mySnack);
		
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
	
	// 마이페이지 - 나의 등급 페이지로 이동
	@GetMapping("myPage_grade")
	public String myPage_grade(HttpSession session, Model model) {
		// 세션 아이디가 없을 경우 " 로그인이 필요합니다!" 출력 후 이전페이지로 돌아가기
		String member_id = (String) session.getAttribute("member_id");
		if(member_id == null) {
			model.addAttribute("msg", " 로그인이 필요합니다!");
			model.addAttribute("url", "member_login_form");
			
			return "fail_location";
		}
		
		// 세션 아이디로 현재등급과 다음 등급 조회(현등급,다음등급 정보)
		// myPageService - getGrade()
		// 파라미터 : String(member_id)		리턴타입 : GradeNextVO(myGrade)
		GradeNextVO myGrade = service.getMyGrade(member_id);
//		System.out.println(myGrade);
		
		// 다음 등급까지 얼마 남았는지 비교하기 위한 결제금액 조회
		// paymentService - getYearPayment()
		// 파라미터 : String(member_id)		리턴타입 : int(payment_total_price)
		int payment_total_price = paymentService.getYearPayment(member_id);
//		System.out.println(payment_total_price);
		
		model.addAttribute("myGrade", myGrade);
		model.addAttribute("payment_total_price", payment_total_price);
		
		return "myPage/myPage_grade";
	}
	
	// 마이페이지 - 개인정보 수정 비밀번호 확인 페이지로 이동
	// 로그인 한 상태와 로그인하지 않은 상태를 구분해서 페이지이동
	// => 로그인 한 상태 : modify_check.jsp 화면으로 이동
	// => 비로그인 상태 : 로그인해야한다는 메세지를 띄우고, 로그인 화면으로 이동
	@GetMapping("myPage_modify_check")
	public String myPage_modify_check(@RequestParam(required = false) String member_id, HttpSession session, Model model) {
		// 세션 아이디가 없을 경우 " 로그인이 필요합니다!" 출력 후 이전페이지로 돌아가기
		String sId = (String)session.getAttribute("member_id");
		if(sId == null) {
			return "member/member_login_form";
		}
		
		return "myPage/myPage_modify_check";
	}
	
	// 마이페이지 - 개인정보 수정 폼페이지로 이동
	@GetMapping("myPage_modify_member")
	public String myPage_modify_member(MemberVO member, Model model, HttpSession session) {
		// 세션아이디로 개인정보 내역 보여주기
		String member_id = (String) session.getAttribute("member_id");
		
		// 나의 개인정보 조회
		// MypageService - getMyInfo()
		// 파라미터 : member_id		리턴타입 : List<MemberVO>(myInfoList)
		List<MemberVO> myInfoList = service.getMyInfo(member_id);
		System.out.println(myInfoList);

		//받아온 개인정보 전달
		model.addAttribute("myInfoList", myInfoList);
		
		return "myPage/myPage_modify_member";
	}
}


























