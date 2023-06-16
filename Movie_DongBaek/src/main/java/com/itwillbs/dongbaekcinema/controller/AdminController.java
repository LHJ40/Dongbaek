package com.itwillbs.dongbaekcinema.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.dongbaekcinema.service.AdminService;
import com.itwillbs.dongbaekcinema.service.MemberService;
import com.itwillbs.dongbaekcinema.service.MovieService;
import com.itwillbs.dongbaekcinema.service.PaymentService;
import com.itwillbs.dongbaekcinema.vo.MemberVO;
import com.itwillbs.dongbaekcinema.vo.MovieVO;
import com.itwillbs.dongbaekcinema.vo.PaymentVO;
import com.itwillbs.dongbaekcinema.vo.PlayVO;
import com.itwillbs.dongbaekcinema.vo.TheaterVO;




@Controller
public class AdminController {
	
	// 0608 정의효 - 데이터랑 없는상태에서는 오류떠서 주석처리 다해놓음
	// 멤버 관련 회원가입, 조회를 위한 MemberService @Autowired 
	@Autowired
	private MemberService member_service;
	
	@Autowired
	private AdminService admin_service;
	

	
	
	// 0609 정의효
	// 결제 관련 조회를 위한 PaymentService @Autowired
	@Autowired
	private PaymentService payment_service;
	
	@Autowired
	private MovieService movie_service;
	
	// 관리자페이지 메인
	@GetMapping("admin_main")
	public String adminMain(HttpSession session, Model model) {
		
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		System.out.println(member_type);
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//            model.addAttribute("msg", "잘못된 접근입니다!");
//            return "fail_back";
//        }
		
		
		return "admin/admin_main";
	}
	
	// 관리자페이지 회원관리
//	@GetMapping("admin_")
//	public String adminMemeberListHttpSession session, Model model() {
	
//	// 직원 세션이 아닐 경우 잘못된 접근 처리
//	String member_type = (String)session.getAttribute("member_type");
//	System.out.println(member_type);
//	if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//        model.addAttribute("msg", "잘못된 접근입니다!");
//        return "fail_back";
//    }
	
	
//		return "admin/admin_";
//	}
	
	// 관리자페이지 상영스케줄 관리
	@GetMapping("admin_schedule_list")
	public String adminScheduleList(HttpSession session, @RequestParam(defaultValue = "1") int pageNo, Model model) {
		
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		System.out.println(member_type);
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//	
//	        model.addAttribute("msg", "잘못된 접근입니다!");
//	        return "fail_back";
//	    }
		
		
		// 상영스케줄 관리 사이드 버튼 클릭시 영화관 목록 조회 후 셀렉트박스 생성 
		List<HashMap<String, String>> theaterInfo = admin_service.getTheater();
//		System.out.println(theaterInfo);		
				
		model.addAttribute("theaterInfo",theaterInfo);
		
		
		return "admin/admin_schedule_list";
	}
	
    // 관리자페이지 상영스케줄 상단 확인 버튼 클릭시 상영스케줄 목록 조회- json
	@ResponseBody
	@RequestMapping(value = "showSchedual", method = {RequestMethod.POST, RequestMethod.GET}, produces = "application/json;charset=utf-8")
	public List<PlayVO> findSchedule(HttpSession session, @RequestParam String theater_num, @RequestParam String play_date, @RequestParam(defaultValue = "1") int pageNo, Model model) throws Exception {
//		System.out.println(theater_num + ", " + play_date + ", " + pageNo);

		
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		System.out.println(member_type);
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//            model.addAttribute("msg", "잘못된 접근입니다!");
//            return "fail_back";
//        }
		

		
		// 상단 셀렉트박스에서 영화관, 상영날짜 선택 후 버튼 클릭시 스케줄 목록 조회

		List<PlayVO> playList = admin_service.showSchedual(theater_num, play_date, pageNo);

		System.out.println(playList);
		
		model.addAttribute("playList", playList);
		
		return playList;
	}
	
	
	
	// 관리자페이지 상영스케줄 상단 확인 버튼 클릭시 현재 상영중인 영화 목록 조회- json 
	@ResponseBody
	@RequestMapping(value = "findMovieList", method = {RequestMethod.POST, RequestMethod.GET}, produces = "application/json;charset=utf-8")
	public List<MovieVO> findMovieList(HttpSession session, @RequestParam String play_date, @RequestParam(defaultValue = "1") int pageNo, Model model) throws Exception {
		System.out.println("findMovieList : " + play_date);
		
		// 테이블 셀렉트박스에서 상영날짜별 선택가능한 영화 목록 조회
		List<MovieVO> movieList = admin_service.findMovieList(play_date);
		
		
		System.out.println(movieList);
		
		model.addAttribute("movieList",movieList);
		
		return movieList;
	}
	
	// 관리자페이지 결제관리
//	@GetMapping("")
//	public String adminPayment(HttpSession session, Model model) {

	
//	// 직원 세션이 아닐 경우 잘못된 접근 처리
//	String member_type = (String)session.getAttribute("member_type");
//	System.out.println(member_type);
//	if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//        model.addAttribute("msg", "잘못된 접근입니다!");
//        return "fail_back";
//    }	
	
	//		return "admin/admin_";
//	}	

	// 관리자페이지 공지사항관리
	@GetMapping("admin_cs_notice")
	public String adminCsNotice(HttpSession session, Model model) {
		
		
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		System.out.println(member_type);
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//            model.addAttribute("msg", "잘못된 접근입니다!");
//            return "fail_back";
//        }		
		
		
		return "admin/admin_cs_notice_list";
	}
	
	// 관리자페이지 공지사항 글쓰기 폼
	@GetMapping("admin_cs_notice_form")
	public String adminCsNoticeForm(HttpSession session, Model model) {

		
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		System.out.println(member_type);
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//            model.addAttribute("msg", "잘못된 접근입니다!");
//            return "fail_back";
//        }
		
		return "admin/admin_cs_notice_form";
	}
	
	// 관리자페이지 글쓰기 등록 후 게시판 이동
	@PostMapping("admin_cs_notice_pro")
	public String adminCsNoticePro(HttpSession session, Model model) {
		
		
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		System.out.println(member_type);
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//            model.addAttribute("msg", "잘못된 접근입니다!");
//            return "fail_back";
//        }
		
		
		return "admin/admin_cs_notice_list";
	}
	
	// 관리자페이지 1:1 질문관리
	@GetMapping("admin_cs_qna")
	public String adminCsQna(HttpSession session, Model model) {

		
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		System.out.println(member_type);
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//            model.addAttribute("msg", "잘못된 접근입니다!");
//            return "fail_back";
//        }		
		
		return "admin/admin_cs_qna_list";
	}
	
	// 관리자페이지 1:1 질문 답글 폼 이동
	@GetMapping("admin_cs_qna_reply")
	public String adminCsQnaReply(HttpSession session, Model model) {

		
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		System.out.println(member_type);
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//            model.addAttribute("msg", "잘못된 접근입니다!");
//            return "fail_back";
//        }		
		
		
		return "admin/admin_cs_qna_form";
	}	
	
	// 관리자페이지 1:1 질문 답글 등록 후 게시판 이동
	@PostMapping("admin_cs_qna_pro")
	public String adminCsQnaPro(HttpSession session, Model model) {

		
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		System.out.println(member_type);
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//            model.addAttribute("msg", "잘못된 접근입니다!");
//            return "fail_back";
//        }		
		
		
		
		return "admin/admin_cs_qna_list";
	}	
	
	// 관리자페이지 자주묻는 질문 관리
	@GetMapping("admin_cs_faq")
	public String adminCsFaq(HttpSession session, Model model) {

		
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		System.out.println(member_type);
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//            model.addAttribute("msg", "잘못된 접근입니다!");
//            return "fail_back";
//        }
		
		return "admin/admin_cs_faq_list";
	}
	
	// 관리자페이지 자주묻는 질문 글쓰기 폼 이동
	@GetMapping("admin_cs_faq_form")
	public String adminCsFaqForm(HttpSession session, Model model) {

		
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		System.out.println(member_type);
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//            model.addAttribute("msg", "잘못된 접근입니다!");
//            return "fail_back";
//        }
		
		return "admin/admin_cs_faq_form";
	}
	
	// 관리자페이지 자주묻는 질문 글쓰기 등록 후 게시판 이동
	@PostMapping("admin_cs_faq_pro")
	public String adminCsFaqPro(HttpSession session, Model model) {

		
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		System.out.println(member_type);
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//            model.addAttribute("msg", "잘못된 접근입니다!");
//            return "fail_back";
//        }		
		
		return "admin/admin_cs_faq_list";
	}
	
	// 관리자페이지 회원관리 메인(리스트) 회원목록 다 가져와서 뿌리기
	// 데이터넣고 주석풀고 확인하기 0608 - 정의효

	@GetMapping("admin_member_list")
	public String adminMemberList(HttpSession session, Model model) {
		
		// --------------------원본---------------
		List<MemberVO> memberList = member_service.getMemberList();
		model.addAttribute("memberList", memberList);
		System.out.println(memberList);
		// --------------------원본---------------
		
		
		return "admin/admin_member_list";
	}
	
	// 관리자페이지 영화관리 메인
	// 영화 가져와서 뿌리기
	@GetMapping("admin_movie_management")
	public String adminMovieManagement(HttpSession session, Model model) {

		
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		System.out.println(member_type);
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//            model.addAttribute("msg", "잘못된 접근입니다!");
//            return "fail_back";
//        }		
		
		
		List<MovieVO> movieList = movie_service.getMovieList();
		model.addAttribute("movieList", movieList);
		return "admin/admin_movie_management";
	}
	
	// 영화 상세정보 조회
	//  ?=movie_num
	// 포워딩 페이지 : admin/admin_movie_detail
	// 데이터넣고 주석풀고 확인하기 0608 - 정의효
	@GetMapping("admin_movie_detail")
	public String adminMemberOneperson(HttpSession session, @RequestParam int movie_num, Model model) {

		
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		System.out.println(member_type);
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//            model.addAttribute("msg", "잘못된 접근입니다!");
//            return "fail_back";
//        }		
		
		
		MovieVO movie = movie_service.getMovie(movie_num);
		model.addAttribute("movie", movie);
		
		return "admin/admin_movie_detail";
	}
	
	// 관리자페이지 영화관리 등록페이지로 이동 - 0609 정의효
	@GetMapping("admin_movie_regist")
	public String adminMovieRegist(HttpSession session, Model model) {

		
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		System.out.println(member_type);
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//            model.addAttribute("msg", "잘못된 접근입니다!");
//            return "fail_back";
//        }		
		
		
		return "admin/admin_movie_regist";
	}
	
	// 영화등록페이지 에서 등록하기 클릭시(insert 구문) - 영화관리 메인으로 이동 - 0610 정의효
	// POST => 폼 파라미터 데이터를 전송받아 저장할 MovieVO 타입 파라미터 설정
	@PostMapping("admin_movie_regist_Pro")
	public String adminMovieRegistPro(HttpSession session, MovieVO movie, Model model) {

		
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		System.out.println(member_type);
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//            model.addAttribute("msg", "잘못된 접근입니다!");
//            return "fail_back";
//        }		
		
		
		int insertCount = movie_service.registMovie(movie);
		
		return "redirect:/admin_movie_management";
	}
	
	// 관리자페이지 결제관리 메인(리스트) 결제목록 다 가져와서 뿌리기
	// 데이터넣고 주석풀고 확인하기 0608 - 정의효
	// 0609 완
	// 페이징관리 시작 0615-13:41-정의효
	// 처음 페이지 요청 = 1페이지
	
	//--------------------------------------------------원본
//	@GetMapping("admin_payment_list")
//	public String adminPaymentList(HttpSession session, Model model) {
//		
//		
////		// 직원 세션이 아닐 경우 잘못된 접근 처리
////		String member_type = (String)session.getAttribute("member_type");
////		System.out.println(member_type);
////		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
////
////            model.addAttribute("msg", "잘못된 접근입니다!");
////            return "fail_back";
////        }		
//		
//		
//		List<PaymentVO> paymentList = payment_service.getPaymentList();
//		
//		model.addAttribute("paymentList", paymentList);
//		
//		return "admin/admin_payment_list";
//	}
	//--------------------------------------------------원본
	// -- 페이징처리 테스트
	@GetMapping("admin_payment_list")
	public String adminPaymentList(HttpSession session, @RequestParam(defaultValue = "1") int pageNo, Model model) {
		
		
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		System.out.println(member_type);
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//            model.addAttribute("msg", "잘못된 접근입니다!");
//            return "fail_back";
//        }		
		
		int pageSize = 1;
		
		List<PaymentVO> paymentList = payment_service.getPaymentList(pageNo, pageSize);
		int totalPageCount = payment_service.getTotalPageCount(pageSize);
		int startIndex = payment_service.getStartIndex(pageNo, pageSize);
		int endIndex = payment_service.getEndIndex(pageNo, pageSize);
		
		model.addAttribute("paymentList", paymentList);
		model.addAttribute("currentPage", pageNo);
		model.addAttribute("totalPageCount", totalPageCount);
		model.addAttribute("startIndex", startIndex);
		model.addAttribute("endIndex", endIndex);
		System.out.println(paymentList);
		return "admin/admin_payment_list";
	}
	

	// 관리자페이지 회원(1명) 정보 조회
	//  ?=member_id(이름은 중복될수있으니까 X)
	// 포워딩 페이지 : admin/admin_member_oneperson
	// 데이터넣고 주석풀고 확인하기 0608 - 정의효
	@GetMapping("admin_member_oneperson")
	public String adminMemberOneperson(HttpSession session, @RequestParam String member_id, Model model) {

		
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		System.out.println(member_type);
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//            model.addAttribute("msg", "잘못된 접근입니다!");
//            return "fail_back";
//        }		
		
		MemberVO member = member_service.getMember(member_id);
		model.addAttribute("member", member);
		
		return "admin/admin_member_oneperson";
	}
	
	// 관리자페이지 결제관리메인 -> 상세보기 클릭시 주문내역상세
	// 파라미터 id
	// 포워딩페이지 : admin/admin_payment_list_detai
	// 데이터넣고 주석풀고 확인하기 **완료X 0608 - 정의효
	// 0609 완
	@GetMapping("admin_payment_list_detail")
	public String adminPaymentListDetail(@RequestParam int order_num, Model model) {
		PaymentVO payment = payment_service.getPayment(order_num); 
//		
		model.addAttribute("payment", payment);
		
		return "admin/admin_payment_list_detail";
	}
	
	
}





