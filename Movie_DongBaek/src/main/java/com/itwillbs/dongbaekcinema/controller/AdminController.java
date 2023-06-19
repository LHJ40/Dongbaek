package com.itwillbs.dongbaekcinema.controller;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.dongbaekcinema.service.AdminService;
import com.itwillbs.dongbaekcinema.service.MemberService;
import com.itwillbs.dongbaekcinema.service.MovieService;
import com.itwillbs.dongbaekcinema.service.PaymentService;
import com.itwillbs.dongbaekcinema.vo.MemberVO;
import com.itwillbs.dongbaekcinema.vo.MovieVO;
import com.itwillbs.dongbaekcinema.vo.PaymentVO;
import com.itwillbs.dongbaekcinema.voNew.CsInfoVO;
import com.itwillbs.dongbaekcinema.voNew.PageVO;
import com.itwillbs.dongbaekcinema.voNew.PlayScheduleVO;




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
	public List<PlayScheduleVO> findSchedule(HttpSession session, @RequestParam String theater_num, @RequestParam String play_date, @RequestParam(defaultValue = "1") int pageNo, Model model) throws Exception {
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

		List<PlayScheduleVO> playList = admin_service.showSchedual(theater_num, play_date, pageNo);

		System.out.println(playList);
		
		model.addAttribute("playList", playList);
		
		return playList;
	}
	
	
	
	// 관리자페이지 상영스케줄 상단 확인 버튼 클릭시 현재 상영중인 영화 목록 조회- json 
	@ResponseBody
	@RequestMapping(value = "findMovieList", method = {RequestMethod.POST, RequestMethod.GET}, produces = "application/json;charset=utf-8")
	public List<MovieVO> findMovieList(HttpSession session, @RequestParam String play_date, @RequestParam(defaultValue = "1") int pageNo, Model model) throws Exception {
//		System.out.println("findMovieList : " + play_date);
		
		// 테이블 셀렉트박스에서 상영날짜별 선택가능한 영화 목록 조회
		List<MovieVO> movieList = admin_service.findMovieList(play_date);
		
		
		System.out.println(movieList);
		
		model.addAttribute("movieList",movieList);
		
		return movieList;
	}
	
	
	// 관리자페이지 상영스케줄 영화목록 셀렉트 박스 클릭 시 새로운 회차 정보 생성- json 
	// 파라미터 값 (theater_num, movie_num, pageNo)
	@ResponseBody
	@RequestMapping(value = "createTurn", method = {RequestMethod.POST, RequestMethod.GET}, produces = "application/json;charset=utf-8")
	public List<PlayScheduleVO> findMovieList(HttpSession session, @RequestParam int theater_num, @RequestParam int movie_num, @RequestParam(defaultValue = "1") int pageNo, Model model) throws Exception {
		System.out.println("findMovieList : theater_num : " + theater_num + ", movie_num : " + movie_num + ", pageNo : " + pageNo);
		
		// 테이블 셀렉트박스에서 상영날짜별 선택가능한 영화 목록 조회
		List<PlayScheduleVO> playScheduleList = admin_service.createTurn(theater_num, movie_num, pageNo);
		
		
		System.out.println(playScheduleList);
		
		model.addAttribute("playScheduleList",playScheduleList);
		
//		return playScheduleList;
		return null;
	}
	
	
	
	// 생성 버튼 시 정보 넘어오는지 확인
	// json 
	@ResponseBody
	@RequestMapping(value = "createSchedule", method = {RequestMethod.POST, RequestMethod.GET}, produces = "application/json;charset=utf-8")
	public String createSchedule(HttpSession session, @RequestParam String roomName, Model model) throws Exception {
//		System.out.println("findMovieList : " + play_date);
		
		// 테이블 셀렉트박스에서 상영날짜별 선택가능한 영화 목록 조회
//		List<MovieVO> movieList = admin_service.findMovieList(play_date);
		
		
		System.out.println(roomName);
		
		roomName += "가공했습니다!";
		
//		model.addAttribute("roomName",roomName);
		
		return roomName;
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

	// 관리자페이지 공지사항관리 목록 출력
	@GetMapping("admin_cs_notice")
	public String adminCsNotice(HttpSession session, Model model, @RequestParam(defaultValue = "1") int pageNo) {
//		System.out.println("pageNO : " + pageNo);
		
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		System.out.println(member_type);
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//            model.addAttribute("msg", "잘못된 접근입니다!");
//            return "fail_back";
//        }
		
		
		// --------------------------페이징 작업 ----------------------------------
		// 공지사항 게시판 변수명 설정(1=공지사항, 2=1:1게시판, 3=자주묻는질문)
		int csType = 1;

		int pageSize = 3;// 한 페이지에 보여줄 목록 수
		
		// 조회 시작 행(레코드) 번호 계산
		int startRow = (pageNo - 1) * pageSize;
		
		int startPage = ((pageNo - 1) / pageSize) * pageSize + 1; // 시작할 페이지
//		System.out.println("startPage: " + startPage);
		int endPage = startPage + pageSize -1; // 끝페이지
		int maxPage = admin_service.getCsTotalPageCount(pageSize, csType);
		
		// 끝페이지 번호가 전체 페이지 번호보다 클 경우 끝 페이지 번호를 최대 페이지로 교체)
		if(endPage > maxPage) { 
			endPage = maxPage;
		}
//		System.out.println("어드민 컨트롤러 공지사항 스타트페이지" + startPage +", 엔드 페이지:"+ endPage);
		// --------------------------------------------------------------------------
		
		// 공지사항 목록 조회
		List<CsInfoVO> CsNoticeList = admin_service.getCsList(pageNo, pageSize, startRow, csType);
		
		// 페이징 정보 저장
		PageVO pageInfo = new PageVO(pageSize, maxPage, startPage, endPage);
		
//		System.out.println("CsNoticeList : " + CsNoticeList);
//		System.out.println("pageInfo : " + pageInfo);
			model.addAttribute("CsNoticeList", CsNoticeList);
			model.addAttribute("pageNo", pageNo);
			model.addAttribute("pageInfo", pageInfo);
			
	
		return "admin/admin_cs_notice_list";
	}
	
	// 관리자페이지 공지사항 글쓰기 폼 이동
	@GetMapping("admin_cs_notice_form")
	public String adminCsNoticeForm(HttpSession session, Model model, @RequestParam(defaultValue = "1") int pageNo) {
		
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		System.out.println(member_type);
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//            model.addAttribute("msg", "잘못된 접근입니다!");
//            return "fail_back";
//      }
		
		model.addAttribute("pageNo", pageNo);
		
		return "admin/admin_cs_notice_form";
	}
	
	// 관리자페이지 공지사항 글쓰기 등록 후 게시판 이동
	// fileUploadPost
	@PostMapping("admin_cs_notice_pro")
	public String adminCsNoticePro(HttpSession session, Model model, @RequestParam( defaultValue = "1", name = "pageNo") int pageNo, @ModelAttribute("noticeInfo") CsInfoVO noticeInfo,  @RequestParam(required = false, value = "cs_multi_file" ) MultipartFile files) {
		System.out.println("notice_form pageNo: " + pageNo + ", noticeInfo: " + noticeInfo + ", files: " + files);
		
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		System.out.println(member_type);
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//            model.addAttribute("msg", "잘못된 접근입니다!");
//            return "fail_back";
//        }

		// 공지사항 게시판 변수명 설정(1=공지사항, 2=1:1게시판, 3=자주묻는질문)
		int csType = 1;
		
		
		
	
		// 공지사항 글쓰기 등록을 위한 함수 호출
		int insertCount = admin_service.registCs(csType, noticeInfo, files);

		if(insertCount > 0) { //글쓰기 성공
			
			return "redirect:/admin_cs_notice"; // 공지사항으로 리다이렉트
		} else { // 글쓰기 실패
			model.addAttribute("msg", "등록이 실패했습니다!");
			
			return "fail_back"; // 실패 창 띄우기
		}

		

	}
	
	
	
	// 관리자페이지 공지사항 글수정 폼
	// 이전 등록된 정보 가져오기
	@GetMapping("admin_cs_notice_modify_form")
	public String adminCsNoticeModifyForm(HttpSession session, Model model, @RequestParam(defaultValue = "1") int pageNo, @RequestParam int cs_type_list_num) {

		
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		System.out.println(member_type);
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//            model.addAttribute("msg", "잘못된 접근입니다!");
//            return "fail_back";
//        }
		
		// 공지사항 게시판 변수명 설정(1=공지사항, 2=1:1게시판, 3=자주묻는질문)
		int csType = 1;
		
		
		// 1:1 질문 정보 가져오기
		// 파라미터값 : cs_type_list_num
		CsInfoVO notice = admin_service.getCsInfo(csType, cs_type_list_num);
//		System.out.println("어드민컨트롤러 csQna" + csQna );
		
		// 페이지번호와 
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("notice", notice);
		
		
		
		return "admin/admin_cs_notice_modify_form";
	}
	
	// 관리자페이지 글쓰기 수정 작업 후 게시판 이동
	@PostMapping("admin_cs_notice_modify_pro")
	public String adminCsNoticeModifyPro(HttpSession session, Model model, @RequestParam(defaultValue = "1")int pageNo, @ModelAttribute("noticeInfo") CsInfoVO noticeInfo,  @RequestParam(required = false, value = "cs_multi_file" ) MultipartFile files) {
		
		
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		System.out.println(member_type);
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//            model.addAttribute("msg", "잘못된 접근입니다!");
//            return "fail_back";
//        }
		
		// 공지사항 게시판 변수명 설정(1=공지사항, 2=1:1게시판, 3=자주묻는질문)
		int csType = 1;
		
		// 공지사항 글정보 변경
		int updateCount = admin_service.updateCs(csType, noticeInfo, files);
		
		
		if(updateCount > 0 ) { // 답변 등록 성공 시
			// 페이지 정보 저장
			model.addAttribute("pageNo", pageNo);
			// 공지사항 게시판으로 이동
			return "redirect:/admin_cs_notice_list";
		} else {
			System.out.println("notice - update 실패!");
			model.addAttribute("msg", "답변 등록이 실패하였습니다!");
			return "fail_back"; // 실패 시 이동할 페이지
		}
		
		
	}
	
	// 관리자페이지 1:1 질문관리
	@GetMapping("admin_cs_qna")
	public String adminCsQna(HttpSession session, Model model, @RequestParam(defaultValue = "1", name = "pageNo") int pageNo) {

		
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		System.out.println(member_type);
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//            model.addAttribute("msg", "잘못된 접근입니다!");
//            return "fail_back";
//        }		
		
		
		// --------------------------페이징 작업 ----------------------------------
		// 공지사항 게시판 변수명 설정(1=공지사항, 2=1:1게시판, 3=자주묻는질문)
		int csType = 2;

		int pageSize = 3;// 한 페이지에 보여줄 목록 수
		
		// 조회 시작 행(레코드) 번호 계산
		int startRow = (pageNo - 1) * pageSize;
		
		int startPage = ((pageNo - 1) / pageSize) * pageSize + 1; // 시작할 페이지
//		System.out.println("startPage: " + startPage);
		int endPage = startPage + pageSize -1; // 끝페이지
		int maxPage = admin_service.getCsTotalPageCount(pageSize, csType);
		
		// 끝페이지 번호가 전체 페이지 번호보다 클 경우 끝 페이지 번호를 최대 페이지로 교체)
		if(endPage > maxPage) { 
			endPage = maxPage;
		}
//		System.out.println("어드민 컨트롤러 공지사항 스타트페이지" + startPage +", 엔드 페이지:"+ endPage);
		// --------------------------------------------------------------------------
		
		// 1:1 게시판 목록 조회
		List<CsInfoVO> CsQnaList = admin_service.getCsList(pageNo, pageSize, startRow, csType);
		
		// 페이징 정보 저장
		PageVO pageInfo = new PageVO(pageSize, maxPage, startPage, endPage);
		
//		System.out.println("CsQnaList : " + CsQnaList);
//		System.out.println("pageInfo : " + pageInfo);
		
		// 글목록, 페이징 정보 저장
		model.addAttribute("CsQnaList", CsQnaList);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("pageInfo", pageInfo);
		
		
		
		return "admin/admin_cs_qna_list";
	}
	
	// 관리자페이지 1:1 질문 답글 폼 이동
	@GetMapping("admin_cs_qna_reply")
	public String adminCsQnaReply(HttpSession session, Model model, @RequestParam(defaultValue = "1") int pageNo ,@RequestParam int cs_type_list_num) {
//		System.out.println("adminCsQnaReply pageNo:" + pageNo + ",cs_type_list_num:" + cs_type_list_num );
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		System.out.println(member_type);
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//            model.addAttribute("msg", "잘못된 접근입니다!");
//            return "fail_back";
//        }	
		
		// 공지사항 게시판 변수명 설정(1=공지사항, 2=1:1게시판, 3=자주묻는질문)
		int csType = 2;
		
		
		// 1:1 질문 정보 가져오기
		// 파라미터값 : cs_type_list_num
		CsInfoVO csQna = admin_service.getCsInfo(csType, cs_type_list_num);
//		System.out.println("어드민컨트롤러 csQna" + csQna );
		
		// 페이지번호와 
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("csQna", csQna);
		
		
		return "admin/admin_cs_qna_form";
	}	
	
	// 관리자페이지 1:1 질문 답글 등록 후 게시판 이동
	@RequestMapping(value="admin_cs_qna_pro" , method = {RequestMethod.GET, RequestMethod.POST})
	public String adminCsQnaPro(HttpSession session, Model model, @RequestParam(defaultValue = "1", name = "pageNo") int pageNo, @ModelAttribute("qnaInfo") CsInfoVO qnaInfo) {
		System.out.println("pageNo : " + pageNo + ", qnaInfo : " + qnaInfo);
		
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		System.out.println(member_type);
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//            model.addAttribute("msg", "잘못된 접근입니다!");
//            return "fail_back";
//        }		
		// 공지사항 게시판 변수명 설정(1=공지사항, 2=1:1게시판, 3=자주묻는질문)
		int csType = 2;
		
		// 답변 등록을 위한 update 서비스
		int updateCount = admin_service.quaReply(csType, qnaInfo);
		
		if(updateCount > 0 ) { // 답변 등록 성공 시
			model.addAttribute("pageNo", pageNo);
			// 1:1 질문 관리 게시판으로 이동
			return "redirect:/admin_cs_qna";
		} else {
			System.out.println("quaReply - update 실패!");
			model.addAttribute("msg", "답변 등록이 실패하였습니다!");
			return "fail_back";
		}
		
		

	}	
	
	// 관리자페이지 자주묻는 질문 관리 게시판 목록
	@GetMapping("admin_cs_faq")
	public String adminCsFaq(HttpSession session, Model model, @RequestParam(defaultValue = "1") int pageNo) {

		
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		System.out.println(member_type);
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//            model.addAttribute("msg", "잘못된 접근입니다!");
//            return "fail_back";
//        }
		
		// --------------------------페이징 작업 ----------------------------------
		// 공지사항 게시판 변수명 설정(1=공지사항, 2=1:1게시판, 3=자주묻는질문)
		int csType = 3;

		int pageSize = 3;// 한 페이지에 보여줄 목록 수
		
		// 조회 시작 행(레코드) 번호 계산
		int startRow = (pageNo - 1) * pageSize;
		
		int startPage = ((pageNo - 1) / pageSize) * pageSize + 1; // 시작할 페이지
//		System.out.println("startPage: " + startPage);
		int endPage = startPage + pageSize -1; // 끝페이지
		int maxPage = admin_service.getCsTotalPageCount(pageSize, csType);
		
		// 끝페이지 번호가 전체 페이지 번호보다 클 경우 끝 페이지 번호를 최대 페이지로 교체)
		if(endPage > maxPage) { 
			endPage = maxPage;
		}
//		System.out.println("어드민 컨트롤러 공지사항 스타트페이지" + startPage +", 엔드 페이지:"+ endPage);
		// --------------------------------------------------------------------------
		
		// 공지사항 목록 조회
		List<CsInfoVO> CsFaqList = admin_service.getCsList(pageNo, pageSize, startRow, csType);
		
		// 페이징 정보 저장
		PageVO pageInfo = new PageVO(pageSize, maxPage, startPage, endPage);
		
//		System.out.println("CsFaqList : " + CsFaqList);
//		System.out.println("pageInfo : " + pageInfo);
		
		// 글목록, 페이징 정보 저장
		model.addAttribute("CsFaqList", CsFaqList);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("pageInfo", pageInfo);
		
		
		
		
		return "admin/admin_cs_faq_list";
	}
	
	// 관리자페이지 자주묻는 질문 글쓰기 폼 이동
	@GetMapping("admin_cs_faq_form")
	public String adminCsFaqForm(HttpSession session, Model model, @RequestParam(name="pageNo", defaultValue = "1") int pageNo) {

		
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		System.out.println(member_type);
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//            model.addAttribute("msg", "잘못된 접근입니다!");
//            return "fail_back";
//        }
		
		// 페이지 정보 저장
		model.addAttribute("pageNo", pageNo);
		
		return "admin/admin_cs_faq_form";
	}
	
	// 관리자페이지 자주묻는 질문 글쓰기 등록 후 게시판 이동
	@PostMapping("admin_cs_faq_pro")
	public String adminCsFaqPro(HttpSession session, Model model, @RequestParam( defaultValue = "1", name = "pageNo") int pageNo, @ModelAttribute("faqInfo") CsInfoVO faqInfo,  @RequestParam(required = false, value = "cs_multi_file" ) MultipartFile files) {

		
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		System.out.println(member_type);
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//            model.addAttribute("msg", "잘못된 접근입니다!");
//            return "fail_back";
//        }		
		
		// 자주 묻는 질문 게시판 변수명 설정(1=공지사항, 2=1:1게시판, 3=자주묻는질문)
		int csType = 3;
		
		
		
	
		// 자주묻는 질문 글쓰기 등록을 위한 함수 호출
		int insertCount = admin_service.registCs(csType, faqInfo, files);

		if(insertCount > 0) { //글쓰기 성공
			
			return "redirect:/admin_cs_faq"; // 자주 묻는 질문으로 리다이렉트
		} else { // 글쓰기 실패
			model.addAttribute("msg", "등록이 실패했습니다!");
			
			return "fail_back"; // 실패 창 띄우기
		}
		

	}

	
	
	// 관리자페이지 자주묻는 질문 글수정 폼 이동
	// 이전 등록된 정보 가져오기
	@GetMapping("admin_cs_faq_modify_form")
	public String adminCsFaqModifyForm(HttpSession session, Model model, @RequestParam(defaultValue = "1") int pageNo, @RequestParam int cs_type_list_num) {

		
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		System.out.println(member_type);
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//            model.addAttribute("msg", "잘못된 접근입니다!");
//            return "fail_back";
//        }
		
		// 공지사항 게시판 변수명 설정(1=공지사항, 2=1:1게시판, 3=자주묻는질문)
		int csType = 3;
		
		// 1:1 질문 정보 가져오기
		// 파라미터값 : cs_type_list_num
		CsInfoVO csFaq = admin_service.getCsInfo(csType, cs_type_list_num);
//		System.out.println("어드민컨트롤러 csQna" + csQna );
		
		// 페이지번호와 
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("csFaq", csFaq);
		
		return "admin/admin_cs_faq_modify_form";
	}
	
	// 관리자페이지 자주묻는 질문 글수정 등록 후 게시판 이동
	@PostMapping("admin_cs_faq_modify_pro")
	public String adminCsFaqModifyPro(HttpSession session, Model model, @RequestParam( defaultValue = "1", name = "pageNo") int pageNo, @ModelAttribute("noticeInfo") CsInfoVO faqInfo, @RequestParam(required = false, value = "cs_multi_file" ) MultipartFile files) {

		
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		System.out.println(member_type);
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//            model.addAttribute("msg", "잘못된 접근입니다!");
//            return "fail_back";
//        }		
		
		// 공지사항 게시판 변수명 설정(1=공지사항, 2=1:1게시판, 3=자주묻는질문)
		int csType = 3;

		System.out.println("faq_modify_pro csType :" + csType + ", faqInfo" + faqInfo + ", files" + files);
		// 공지사항 글정보 변경
		int updateCount = admin_service.updateCs(csType, faqInfo, files);
		
		
		if(updateCount > 0 ) { // 답변 등록 성공 시
			// 페이지 정보 저장
			model.addAttribute("pageNo", pageNo);
			// 자주묻는 질문 게시판으로 이동
			return "redirect:/admin_cs_faq";
		} else {
			System.out.println("Faq - update 실패!");
			model.addAttribute("msg", "답변 등록이 실패하였습니다!");
			return "fail_back"; // 실패 시 이동할 페이지
		}
		

	}	
	
	
	
	
	// 관리자페이지 회원관리 메인(리스트) 회원목록 다 가져와서 뿌리기
	// 데이터넣고 주석풀고 확인하기 0608 - 정의효

//	---------------------원본 -------------------------------------------------
//	@GetMapping("admin_member_list")
//	public String adminMemberList(HttpSession session, Model model) {
//		
//		// --------------------원본---------------
//		List<MemberVO> memberList = member_service.getMemberList();
//		model.addAttribute("memberList", memberList);
//		System.out.println(memberList);
//		// --------------------원본---------------
//		
//		
//		return "admin/admin_member_list";
//	}
//	---------------------원본 -------------------------------------------------
	
//	admin_member_list 페이징처리 테스트 - 0616 정의효
	@GetMapping("admin_member_list")
	public String adminMemberList(HttpSession session, @RequestParam(defaultValue = "1") int pageNo, Model model) {
		
		int pageSize = 5; // 한 페이지에 보여줄 게시물 수
		
		List<MemberVO> memberList = member_service.getMembertList(pageNo, pageSize);
		int totalPageCount = member_service.getTotalPageCount(pageSize);
//		int startIndex = payment_service.getStartIndex(pageNo, pageSize);  찾아서 1~10뜨고 11~20뜨고 해보기
//		int endIndex = payment_service.getEndIndex(pageNo, pageSize);	찾아서 1~10뜨고 11~20뜨고 해보기
		
		model.addAttribute("memberList", memberList);
		model.addAttribute("currentPage", pageNo);
		model.addAttribute("totalPageCount", totalPageCount);
		
		System.out.println(memberList);
		
		
		return "admin/admin_member_list";
	}
	
	
	
	// 관리자페이지 영화관리 메인
	// 영화 가져와서 뿌리기
	// admin_movie_management 원본---------------------------------------
//	@GetMapping("admin_movie_management")
//	public String adminMovieManagement(HttpSession session, Model model) {
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
//		List<MovieVO> movieList = movie_service.getMovieList();
//		model.addAttribute("movieList", movieList);
//		return "admin/admin_movie_management";
//	}
	// admin_movie_management 원본---------------------------------------
	
//	 admin_movie_management 페이징 처리 테스트 0616 정의효-----------------------------
	@GetMapping("admin_movie_management")
	public String adminMovieManagement(HttpSession session, @RequestParam(defaultValue = "1") int pageNo, Model model) {

		
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		System.out.println(member_type);
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//            model.addAttribute("msg", "잘못된 접근입니다!");
//            return "fail_back";
//        }		
		int pageSize = 5; // 한 페이지에 보여줄 게시물 수
		
		List<MovieVO> movieList = movie_service.getMovieList(pageNo, pageSize);
		int totalPageCount = movie_service.getTotalPageCount(pageSize);
//		int startIndex = payment_service.getStartIndex(pageNo, pageSize);  찾아서 1~10뜨고 11~20뜨고 해보기
//		int endIndex = payment_service.getEndIndex(pageNo, pageSize);	찾아서 1~10뜨고 11~20뜨고 해보기
		
		model.addAttribute("movieList", movieList);
		model.addAttribute("currentPage", pageNo);
		model.addAttribute("totalPageCount", totalPageCount);
		
		return "admin/admin_movie_management";
	}
	
//	---------------------------------------------------------------------------
	
	
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
	// -- 페이징처리 테스트 - 일단 초안완 0616 정의효
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
		
		int pageSize = 5; // 한 페이지에 보여줄 게시물 수
		
		List<PaymentVO> paymentList = payment_service.getPaymentList(pageNo, pageSize);
		int totalPageCount = payment_service.getTotalPageCount(pageSize);
//		int startIndex = payment_service.getStartIndex(pageNo, pageSize);  찾아서 1~10뜨고 11~20뜨고 해보기
//		int endIndex = payment_service.getEndIndex(pageNo, pageSize);	찾아서 1~10뜨고 11~20뜨고 해보기
		
		model.addAttribute("paymentList", paymentList);
		model.addAttribute("currentPage", pageNo);
		model.addAttribute("totalPageCount", totalPageCount);
//		model.addAttribute("startIndex", startIndex);	찾아서 1~10뜨고 11~20뜨고 해보기
//		model.addAttribute("endIndex", endIndex);	찾아서 1~10뜨고 11~20뜨고 해보기
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
//	--원본-----------------------------
//	@GetMapping("admin_payment_list_detail")
//	public String adminPaymentListDetail(@RequestParam int order_num, Model model) {
//		
//		PaymentVO payment = payment_service.getPayment(order_num); 
//		model.addAttribute("payment", payment);
//		System.out.println(payment);
//		return "admin/admin_payment_list_detail";
//	}
//	--원본-----------------------------
	//List로 수정중 0616정의효
	@GetMapping("admin_payment_list_detail")
	public String adminPaymentListDetail(@RequestParam int order_num, Model model) {
		
//		List<PaymentVO> payment = payment_service.getPayment(order_num);
//		model.addAttribute("payment", payment);
		//0618 정의효 밑에꺼 되있었음 확인
//		PaymentVO payment = payment_service.getPayment(order_num); 
//		model.addAttribute("payment", payment);
//		System.out.println(payment);
		
		return "admin/admin_payment_list_detail";
	}
	
	
	
	
	
    
}





