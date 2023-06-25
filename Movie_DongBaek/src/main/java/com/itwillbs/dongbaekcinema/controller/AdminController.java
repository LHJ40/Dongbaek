package com.itwillbs.dongbaekcinema.controller;


import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
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
import com.itwillbs.dongbaekcinema.service.MypageService;
import com.itwillbs.dongbaekcinema.service.PayService;
import com.itwillbs.dongbaekcinema.service.PaymentService;
import com.itwillbs.dongbaekcinema.vo.MemberVO;
import com.itwillbs.dongbaekcinema.vo.MovieVO;
import com.itwillbs.dongbaekcinema.vo.PaymentVO;
import com.itwillbs.dongbaekcinema.voNew.BuyDetailVO;
import com.itwillbs.dongbaekcinema.voNew.CsInfoVO;
import com.itwillbs.dongbaekcinema.voNew.PageInfoVO;
import com.itwillbs.dongbaekcinema.voNew.PlayScheduleVO;




@Controller
public class AdminController {
	
	// 0608 정의효 - 데이터랑 없는상태에서는 오류떠서 주석처리 다해놓음
	@Autowired
	private MemberService member_service;
	
	@Autowired
	private AdminService admin_service;

	// 0609 정의효
	@Autowired
	private PaymentService payment_service;
	
	@Autowired
	private MovieService movie_service;
	
	// 결제취소 같은 매퍼 xml 사용하기 위한 서비스 - 0625 정의효
	@Autowired
	private MypageService mypage_service;
	
	@Autowired
	private PayService pay_service;
	
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
	public String adminScheduleList(HttpSession session, Model model
			, @RequestParam(defaultValue = "1") int pageNo) {
		
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
	
//    // 관리자페이지 상영스케줄 상단 확인 버튼 클릭시 상영스케줄 목록 조회- json
//	@ResponseBody
//	@RequestMapping(value = "showSchedual", method = {RequestMethod.POST, RequestMethod.GET}, produces = "application/json;charset=utf-8")
//	public List<PlayScheduleVO> findSchedule(HttpSession session, @RequestParam String theater_num, @RequestParam String play_date, @RequestParam(defaultValue = "1") int pageNo, Model model) throws Exception {
////		System.out.println(theater_num + ", " + play_date + ", " + pageNo);
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
//		
//		// 상단 셀렉트박스에서 영화관, 상영날짜 선택 후 버튼 클릭시 스케줄 목록 조회
//
//		List<PlayScheduleVO> playList = admin_service.showSchedual(theater_num, play_date, pageNo);
//
////		System.out.println(playList);
//		
//		model.addAttribute("playList", playList);
//		
//		return playList;
//	}

	
	// 상단 생성 버튼 클릭 시 해당 영화관의 스케줄 목록 가져옴
	@ResponseBody
    @GetMapping(value = "showSchedual", produces = MediaType.APPLICATION_JSON_VALUE)
    public String getSchedule(HttpSession session, Model model
    		, @RequestParam String theater_num, @RequestParam String play_date
    		, @RequestParam(defaultValue = "1") int pageNo) throws Exception {
		
        // 상영 스케줄 정보 가져오기
        List<PlayScheduleVO> scheduleList = admin_service.showSchedual(theater_num, play_date, pageNo);
        
        // 영화관 번호로 해당 상영관 번호와 이름 가져오기
        List<PlayScheduleVO> roomList = admin_service.getRoomInfo(theater_num);
        
        System.out.println("1차 스케줄 생성 : " + scheduleList);

        JSONArray jsonArray = null;
        
        try {
			jsonArray = new JSONArray(); // JSONArray 객체 생성
				
			JSONObject jsonObject = new JSONObject(); // JSONObject 객체 생성
			jsonObject.put("scheduleList", scheduleList);
			jsonObject.put("roomList", roomList);
			
			jsonArray.put(jsonObject);
		} catch (JSONException e) {

			e.printStackTrace();
		}
        
        
        return jsonArray.toString();
    }
	

	
	
	
	// 관리자페이지 상영스케줄 상단 확인 버튼 클릭시 현재 상영중인 영화 목록 조회- json 
	@ResponseBody
	@RequestMapping(value = "findMovieList", method = {RequestMethod.POST, RequestMethod.GET}, produces = "application/json;charset=utf-8")
	public List<MovieVO> findMovieList(HttpSession session, Model model
			, @RequestParam String play_date
			, @RequestParam(defaultValue = "1") int pageNo) throws Exception {
		
//		System.out.println("findMovieList : " + play_date);
		
		// 테이블 셀렉트박스에서 상영날짜별 선택가능한 영화 목록 조회
		List<MovieVO> movieList = admin_service.findMovieList(play_date);
		
		
//		System.out.println(movieList);
		
		model.addAttribute("movieList",movieList);
		
		return movieList;
	}
	
	
	
	// 상영스케줄 우측 생성 버튼 클릭시 상영스케줄 등록 창 이동
	@ResponseBody
	@RequestMapping(value = "createUpdateSchedule", method = {RequestMethod.POST, RequestMethod.GET})
	public String createSchedule1(HttpSession session, Model model
			, @RequestParam String play_date, @RequestParam int theater_num
			, @RequestParam int row_num, @RequestParam int movie_num) {
		
//		System.out.println("createUpdateSchedule 전송정보 확인 play_date:" + play_date);
//		System.out.println("theater_num:" + theater_num + ", row_num:" + row_num +", movie_num:" + movie_num);
		JSONArray jsonArray = null; // JSON 배열변수 선언
		
		// 특정 상영날짜 영화관의 상영관에 상영스케줄 정보가 등록되어있는지 확인
		int turnCount = admin_service.checkSchedule(play_date, theater_num, row_num);
//		System.out.println("상영정보 존재(건):" + turnCount);

	        
		JSONObject jsonObject = new JSONObject(); // JSONObject 객체 생성
        try {
//			jsonArray = new JSONArray(); // JSONArray 객체 생성
			
			
			if(turnCount > 0 ) { // 상영스케줄이 이미 생성되어 있는 경우(기존 정보 삭제 후 재생성)
//				System.out.println("상영스케줄 이미 존재하므로 기존 스케줄 삭제 후 재생성");
			
//				// 상영스케줄 정보 삭제 수행
				int deleteTurnCount = admin_service.deleteSchedule(play_date, theater_num, row_num);
//				
//				
				if(deleteTurnCount == 0) { // 상영스케줄이 다른 테이블에서 참조하는경우 삭제 실패(ex.예매가 진행되고있는 경우)
//					jsonObject.put("result", "상영 정보가 이미 예매되었으므로 삭제가 불가능합니다");
					
				} else { // 상영 스케줄 등록
					
					int insertTurnCount  = admin_service.insertSchedule(play_date,theater_num,row_num, movie_num);
										
					if(insertTurnCount == 0) { // 상영 등록 실패
//						System.out.println("상영 스케줄 등록을 시도했으나 실패");
						jsonObject.put("result", "등록을 시도했으나 실패하였습니다");
					} else { // 상영 등록 성공
//						System.out.println("상영등록 성공");
						jsonObject.put("result", "상영정보가 변경 되었습니다 확인 버튼을 다시 눌러주세요");
					}
				}
//				
			} else { // 상영 스케줄이 없는 경우(insert 실행)
//				System.out.println("상영스케줄 없음");
				
//				// 상영 스케줄 등록 날짜가 오늘보다 미래여야함!
				int insertTurnCount  = admin_service.insertSchedule(play_date,theater_num,row_num, movie_num);
			
				if(insertTurnCount == 0) { // 상영 등록 실패
//					System.out.println("상영등록 날짜가 오늘과 같거나 과거이므로 등록실패");
					jsonObject.put("result", "상영등록 날짜가 오늘과 같거나 과거입니다");
				} else { // 상영 등록 성공
//					System.out.println("상영등록 성공");
					jsonObject.put("result", "상영정보가 등록되었습니다 확인 버튼을 다시 눌러주세요");
				}
			}

//			jsonArray.put(jsonObject);
		} catch (JSONException e) {

			e.printStackTrace();
			jsonObject.put("result", "컨트롤러 등록 시 오류 발생");
			
		}
		

        return jsonObject.toString();

		
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

	// 관리자페이지 목록 출력
	// csTypeNo = 1 공지, 2 1:1게시판, 3 자주묻는 질문 
	@GetMapping("admin_cs_notice")
	public String adminCsNotice(HttpSession session, Model model
			, @RequestParam(defaultValue = "1") int pageNo
			, @RequestParam(defaultValue = "1") int csTypeNo) {
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


		int listLimit = 5; // 한 페이지에서 표시할 목록 갯수 지정
		int startRow = (pageNo - 1) * listLimit; // 조회 시작 행(레코드) 번호
		
		
		int startPage = ((pageNo - 1) / listLimit) * listLimit + 1; // 시작할 페이지
//		System.out.println("startPage: " + startPage);
		int endPage = startPage + listLimit -1; // 끝페이지
		int listCount = admin_service.getCsTotalPageCount(listLimit, csTypeNo);
		
		// 3. 전체 페이지 목록 갯수 계산
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);
//		System.out.println("전체 페이지 목록 갯수 : " + maxPage);
		
		// 끝페이지 번호가 전체 페이지 번호보다 클 경우 끝 페이지 번호를 최대 페이지로 교체)
		if(endPage > maxPage) { 
			endPage = maxPage;
		}
//		System.out.println("어드민 컨트롤러 공지사항 스타트페이지" + startPage +", 엔드 페이지:"+ endPage);
		// --------------------------------------------------------------------------
		
		// 공지사항 목록 조회
		List<CsInfoVO> csInfoList = admin_service.getCsList(pageNo, listLimit, startRow, csTypeNo);
		
		// 페이징 정보 저장
		PageInfoVO pageInfo = new PageInfoVO(listCount, listLimit, maxPage, startPage, endPage);
		
//		System.out.println("CsNoticeList : " + CsNoticeList);
//		System.out.println("pageInfo : " + pageInfo);
		model.addAttribute("csInfoList", csInfoList);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("pageInfo", pageInfo);

		return "admin/admin_cs_notice_list";

		
	}
	
	// 관리자페이지 공지사항 글쓰기 폼 이동
	@GetMapping("admin_cs_notice_form")
	public String adminCsNoticeForm(HttpSession session, Model model
			, @RequestParam(defaultValue = "1") int pageNo) {
		
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
	public String adminCsNoticePro(HttpSession session, Model model
			, @RequestParam( defaultValue = "1", name = "pageNo") int pageNo
			, @ModelAttribute("noticeInfo") CsInfoVO csInfo
			, @RequestParam int csTypeNo) {
		
//		System.out.println("notice_form pageNo: " + pageNo + ", csInfo: " + csInfo);
		
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		System.out.println(member_type);
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//            model.addAttribute("msg", "잘못된 접근입니다!");
//            return "fail_back";
//        }

		
		// 이클립스 프로젝트 상에 업로드 폴더(upload) 생성 필요 
		// => 주의! 외부에서 접근하도록 하려면 resources 폴더 내에 upload 폴더 생성
		// 이클립스가 관리하는 프로젝스 상의 가상 업로드 경로에 대한 실제 업로드 경로 알아내기
		// => request.getRealPath() 대신 request.getServletContext.getRealPath() 메서드 또는
		//    세션 객체를 활용한 session.getServletContext().getRealPath() 메서드 사용
//		System.out.println(request.getRealPath("/resources/upload")); // Deprecated 처리된 메서드
		String uploadDir = "/resources/upload"; 
//		String saveDir = request.getServletContext().getRealPath(uploadDir); // 사용 가능
		String saveDir = session.getServletContext().getRealPath(uploadDir);
		System.out.println("실제 업로드 경로 : "+ saveDir);
		// 실제 업로드 경로 : D:\Shared\Spring\workspace_spring5\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Spring_MVC_Board\resources\ upload
		
		String subDir = ""; // 서브디렉토리(날짜 구분)
		
		try {
			// ------------------------------------------------------------------------------
			// 업로드 디렉토리를 날짜별 디렉토리로 자동 분류하기
			// => 하나의 디렉토리에 너무 많은 파일이 존재하면 로딩 시간 길어지며 관리도 불편
			// => 따라서, 날짜별 디렉토리 구별 위해 java.util.Date 클래스 활용
			// 1. Date 객체 생성(기본 생성자 호출하여 시스템 날짜 정보 활용)
			Date date = new Date(); // Mon Jun 19 11:26:52 KST 2023
//		System.out.println(date);
			// 2. SimpleDateFormat 클래스를 활용하여 날짜 형식을 "yyyy/MM/dd" 로 지정
			// => 디렉토리 구조로 바로 활용하기 위해 날짜 구분 기호를 슬래시(/)로 지정
			// => 디렉토리 구분자를 가장 정확히 표현하려면 File.pathSeperator 또는 File.seperator 상수 활용
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			// 3. 기존 업로드 경로에 날짜 경로 결합하여 저장
			subDir = sdf.format(date);
			saveDir += "/" + subDir;
			// --------------------------------------------------------------
			// java.nio.file.Paths 클래스의 get() 메서드를 호출하여
			// 실제 경로를 관리하는 java.nio.file.Path 타입 객체 리턴받기
			// => 파라미터 : 실제 업로드 경로
			Path path = Paths.get(saveDir);
			
			// Files 클래스의 createDirectories() 메서드를 호출하여
			// Path 객체가 관리하는 경로 생성(존재하지 않으면 거쳐가는 경로들 중 없는 경로 모두 생성)
			Files.createDirectories(path);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// BoardVO 객체에 전달된 MultipartFile 객체 꺼내기
		MultipartFile mFile1 = csInfo.getFile1();
//		System.out.println("원본파일명1 : " + mFile1.getOriginalFilename());
		
		// 파일명 중복 방지를 위한 대첵
		// 현재 시스템(서버)에서 랜덤ID 값을 추출하여 파일명 앞에 붙여서
		// "랜덤ID값_파일명.확장자" 형식으로 중복 파일명 처리
		// => 랜덤ID 생성은 java.util.UUID 클래스 활용(UUID = 범용 고유 식별자)
		String uuid = UUID.randomUUID().toString();
//		System.out.println("uuid : " + uuid);
		
		// 생성된 UUID 값을 원본 파일명 앞에 결합(파일명과 구분을 위해 _ 기호 추가)
		// => 나중에 사용자 다운로드 시 원본 파일명 표시를 위해 분리할 때 구분자로 사용
		//    (가장 먼저 만나는 _ 기호를 기준으로 문자열 분리하여 처리)
		// 생성된 UUID 값(8자리 추출)과 업로드 파일명을 결합하여 CsInfoVO 객체에 저장(구분자로 _ 기호 추가)
		// => 단, 파일명이 존재하는 경우에만 파일명 생성(없을 경우를 대비하여 기본 파일명 널스트링으로 처리)
		csInfo.setCs_file("");
		
		// 파일명을 저장할 변수 선언
		String fileName1 = uuid.substring(0, 8) + "_" + mFile1.getOriginalFilename();
		
		if(!mFile1.getOriginalFilename().equals("")) {
			csInfo.setCs_file(subDir + "/" + fileName1);
		}
		

		
//		System.out.println("실제 업로드 파일명1 : " + csInfo.getCs_file());
		
		// -----------------------------------------------------------------------------------
		// BoardService - registBoard() 메서드를 호출하여 게시물 등록 작업 요청
		// => 파라미터 : BoardVO 객체    리턴타입 : int(insertCount)
		int insertCount = admin_service.registCs(csTypeNo, csInfo);
		
		
		// 게시물 등록 작업 요청 결과 판별
		// => 성공 시 업로드 파일을 실제 디렉토리에 이동시킨 후 BoardList 서블릿 리다이렉트
		// => 실패 시 "글 쓰기 실패!" 메세지 출력 후 이전페이지 돌아가기 처리
		if(insertCount > 0) { // 성공
			try {
				// 업로드 된 파일은 MultipartFile 객체에 의해 임시 디렉토리에 저장되어 있으며
				// 글쓰기 작업 성공 시 임시 디렉토리 -> 실제 디렉토리로 이동 작업 필요
				// MultipartFile 객체의 transferTo() 메서드를 호출하여 실제 위치로 이동(업로드)
				// => 비어있는 파일은 이동할 수 없으므로(= 예외 발생) 제외
				// => File 객체 생성 시 지정한 디렉토리에 지정한 이름으로 파일이 이동(생성)됨
				//    따라서, 이동할 위치의 파일명도 UUID 가 결합된 파일명을 지정해야한다!
				if(!mFile1.getOriginalFilename().equals("")) {
					mFile1.transferTo(new File(saveDir, fileName1));
				}

			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			// 글쓰기 작업 성공 시 글목록(BoardList)으로 리다이렉트
			return "redirect:/admin_cs_notice";
		} else { // 실패
			model.addAttribute("msg", "글 쓰기 실패!");
			return "fail_back";
		}


	}
	
	
	
	// 관리자페이지 공지사항 글수정 폼
	// csTypeNo = 1 공지, 2 1:1게시판, 3 자주묻는 질문 
	// 이전 등록된 정보 가져오기
	@GetMapping("admin_cs_notice_modify_form")
	public String adminCsNoticeModifyForm(HttpSession session, Model model
			, @RequestParam(defaultValue = "1") int pageNo
			, @RequestParam int cs_type_list_num
			, @RequestParam(defaultValue = "1") int csTypeNo) {

		
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		System.out.println(member_type);
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//            model.addAttribute("msg", "잘못된 접근입니다!");
//            return "fail_back";
//        }
		
		
		// 질문 정보 가져오기
		// 파라미터값 : cs_type_list_num
		CsInfoVO csInfo = admin_service.getCsInfo(csTypeNo, cs_type_list_num);
//		System.out.println("어드민컨트롤러 csQna" + csQna );
		
		// 페이지번호와 
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("csInfo", csInfo);
		
		
		
		return "admin/admin_cs_notice_modify_form";
	}
	
	// 관리자페이지 글쓰기 수정 작업 후 게시판 이동
	@PostMapping("admin_cs_notice_modify_pro")
	public String adminCsNoticeModifyPro(HttpSession session, Model model
			, @RequestParam(defaultValue = "1")int pageNo
			, @ModelAttribute("csInfo") CsInfoVO csInfo
			, @RequestParam int csTypeNo) {
		
		
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		System.out.println(member_type);
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//            model.addAttribute("msg", "잘못된 접근입니다!");
//            return "fail_back";
//        }
		
		// 공지사항 게시판 변수명 설정(1=공지사항, 2=1:1게시판, 3=자주묻는질문)
//		int csTypeNo = 1;
//		
//		// 공지사항 글정보 변경
//		int updateCount = admin_service.updateCs(csTypeNo, noticeInfo, files);
//		
//		
//		if(updateCount > 0 ) { // 답변 등록 성공 시
//			// 페이지 정보 저장
//			model.addAttribute("pageNo", pageNo);
//			// 공지사항 게시판으로 이동
//			return "redirect:/admin_cs_notice_list";
//		} else {
//			System.out.println("notice - update 실패!");
//			model.addAttribute("msg", "답변 등록이 실패하였습니다!");
//			return "fail_back"; // 실패 시 이동할 페이지
//		}
		
		// 이클립스 프로젝트 상에 업로드 폴더(upload) 생성 필요 
		// => 주의! 외부에서 접근하도록 하려면 resources 폴더 내에 upload 폴더 생성
		// 이클립스가 관리하는 프로젝스 상의 가상 업로드 경로에 대한 실제 업로드 경로 알아내기
		// => request.getRealPath() 대신 request.getServletContext.getRealPath() 메서드 또는
		//    세션 객체를 활용한 session.getServletContext().getRealPath() 메서드 사용
//		System.out.println(request.getRealPath("/resources/upload")); // Deprecated 처리된 메서드
		String uploadDir = "/resources/upload"; 
//		String saveDir = request.getServletContext().getRealPath(uploadDir); // 사용 가능
		String saveDir = session.getServletContext().getRealPath(uploadDir);
//		System.out.println("실제 업로드 경로 : "+ saveDir);
		// 실제 업로드 경로 : D:\Shared\Spring\workspace_spring5\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Spring_MVC_Board\resources\ upload
		
		String subDir = ""; // 서브디렉토리(날짜 구분)
		
		try {
			// ------------------------------------------------------------------------------
			// 업로드 디렉토리를 날짜별 디렉토리로 자동 분류하기
			// => 하나의 디렉토리에 너무 많은 파일이 존재하면 로딩 시간 길어지며 관리도 불편
			// => 따라서, 날짜별 디렉토리 구별 위해 java.util.Date 클래스 활용
			// 1. Date 객체 생성(기본 생성자 호출하여 시스템 날짜 정보 활용)
			Date date = new Date(); // Mon Jun 19 11:26:52 KST 2023
//		System.out.println(date);
			// 2. SimpleDateFormat 클래스를 활용하여 날짜 형식을 "yyyy/MM/dd" 로 지정
			// => 디렉토리 구조로 바로 활용하기 위해 날짜 구분 기호를 슬래시(/)로 지정
			// => 디렉토리 구분자를 가장 정확히 표현하려면 File.pathSeperator 또는 File.seperator 상수 활용
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			// 3. 기존 업로드 경로에 날짜 경로 결합하여 저장
			subDir = sdf.format(date);
			saveDir += "/" + subDir;
			// --------------------------------------------------------------
			// java.nio.file.Paths 클래스의 get() 메서드를 호출하여
			// 실제 경로를 관리하는 java.nio.file.Path 타입 객체 리턴받기
			// => 파라미터 : 실제 업로드 경로
			Path path = Paths.get(saveDir);
			
			// Files 클래스의 createDirectories() 메서드를 호출하여
			// Path 객체가 관리하는 경로 생성(존재하지 않으면 거쳐가는 경로들 중 없는 경로 모두 생성)
			Files.createDirectories(path);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// BoardVO 객체에 전달된 MultipartFile 객체 꺼내기
		MultipartFile mFile1 = csInfo.getFile1();
//		System.out.println("원본파일명1 : " + mFile1.getOriginalFilename());
		
		// 파일명 중복 방지를 위한 대첵
		// 현재 시스템(서버)에서 랜덤ID 값을 추출하여 파일명 앞에 붙여서
		// "랜덤ID값_파일명.확장자" 형식으로 중복 파일명 처리
		// => 랜덤ID 생성은 java.util.UUID 클래스 활용(UUID = 범용 고유 식별자)
		String uuid = UUID.randomUUID().toString();
//		System.out.println("uuid : " + uuid);
		
		// 생성된 UUID 값을 원본 파일명 앞에 결합(파일명과 구분을 위해 _ 기호 추가)
		// => 나중에 사용자 다운로드 시 원본 파일명 표시를 위해 분리할 때 구분자로 사용
		//    (가장 먼저 만나는 _ 기호를 기준으로 문자열 분리하여 처리)
		// 생성된 UUID 값(8자리 추출)과 업로드 파일명을 결합하여 CsInfoVO 객체에 저장(구분자로 _ 기호 추가)
		// => 단, 파일명이 존재하는 경우에만 파일명 생성(없을 경우를 대비하여 기본 파일명 널스트링으로 처리)
		csInfo.setCs_file("");
		
		// 파일명을 저장할 변수 선언
		String fileName1 = uuid.substring(0, 8) + "_" + mFile1.getOriginalFilename();
		
		if(!mFile1.getOriginalFilename().equals("")) {
			csInfo.setCs_file(subDir + "/" + fileName1);
		}
		

		
//		System.out.println("실제 업로드 파일명1 : " + csInfo.getCs_file());
		
		// -----------------------------------------------------------------------------------
		// BoardService - registBoard() 메서드를 호출하여 게시물 등록 작업 요청
		// => 파라미터 : BoardVO 객체    리턴타입 : int(insertCount)
		int insertCount = admin_service.registCs(csTypeNo, csInfo);
		
		
		// 게시물 등록 작업 요청 결과 판별
		// => 성공 시 업로드 파일을 실제 디렉토리에 이동시킨 후 BoardList 서블릿 리다이렉트
		// => 실패 시 "글 쓰기 실패!" 메세지 출력 후 이전페이지 돌아가기 처리
		if(insertCount > 0) { // 성공
			try {
				// 업로드 된 파일은 MultipartFile 객체에 의해 임시 디렉토리에 저장되어 있으며
				// 글쓰기 작업 성공 시 임시 디렉토리 -> 실제 디렉토리로 이동 작업 필요
				// MultipartFile 객체의 transferTo() 메서드를 호출하여 실제 위치로 이동(업로드)
				// => 비어있는 파일은 이동할 수 없으므로(= 예외 발생) 제외
				// => File 객체 생성 시 지정한 디렉토리에 지정한 이름으로 파일이 이동(생성)됨
				//    따라서, 이동할 위치의 파일명도 UUID 가 결합된 파일명을 지정해야한다!
				if(!mFile1.getOriginalFilename().equals("")) {
					mFile1.transferTo(new File(saveDir, fileName1));
				}

			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			// 글쓰기 작업 성공 시 자주묻는 질문 게시판(admin_cs_faq)으로 리다이렉트
			return "redirect:/admin_cs_faq";
		} else { // 실패
			model.addAttribute("msg", "글 쓰기 실패!");
			return "fail_back";
		}
		
		
	}
	
	
	// 관리자 페이지 글 삭제(파라미터 csType=1일때 공지사항 삭제, csType=3일때 1:1질문 삭제)
	@GetMapping("delete_cs")
	public String deleteCs(HttpSession session, Model model
			, @RequestParam(defaultValue = "1")int pageNo
			, @RequestParam("csTypeNo") int csTypeNo
			, @RequestParam("cs_type_list_num")int cs_type_list_num) {
		
//		System.out.println("delete_cs, csTypeNo:" + csTypeNo + ", cs_type_list_num:" + cs_type_list_num);
		
		int deleteCount = admin_service.deleteCs(csTypeNo, cs_type_list_num);
		
		// 글삭제 작업 후 리턴할 페이지
		if(deleteCount != 0 && csTypeNo == 1) { // 삭제 성공 시 공지사항 목록으로 리턴
			
			return "redirect:/admin_cs_notice";
		} else if(deleteCount != 0 && csTypeNo == 3) { // 삭제 성공 시 자주묻는 질문 목록으로 리턴
			
			return "redirect:/admin_cs_faq";
		} else {
			
			model.addAttribute("msg", "글 삭제 실패!");
			return "fail_back";
		}
		
	}
	
	// 관리자페이지 1:1 질문관리 게시판 목록
	@GetMapping("admin_cs_qna")
	public String adminCsQna(HttpSession session, Model model
			, @RequestParam(defaultValue = "1", name = "pageNo") int pageNo
			, @RequestParam(defaultValue = "2") int csTypeNo) {

		
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//            model.addAttribute("msg", "잘못된 접근입니다!");
//            return "fail_back";
//        }		
		
		
		// --------------------------페이징 작업 ----------------------------------


		int listLimit = 5;// 한 페이지에 보여줄 목록 수
		
		// 조회 시작 행(레코드) 번호 계산
		int startRow = (pageNo - 1) * listLimit;
		
		int startPage = ((pageNo - 1) / listLimit) * listLimit + 1; // 시작할 페이지
//		System.out.println("startPage: " + startPage);
		int endPage = startPage + listLimit -1; // 끝페이지
		int listCount = admin_service.getCsTotalPageCount(listLimit, csTypeNo);
		
		// 3. 전체 페이지 목록 갯수 계산
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);
		
		// 끝페이지 번호가 전체 페이지 번호보다 클 경우 끝 페이지 번호를 최대 페이지로 교체)
		if(endPage > maxPage) { 
			endPage = maxPage;
		}
//		System.out.println("어드민 컨트롤러 공지사항 스타트페이지" + startPage +", 엔드 페이지:"+ endPage);
		// --------------------------------------------------------------------------
		
		// 1:1 게시판 목록 조회
		List<CsInfoVO> csInfoList = admin_service.getCsList(pageNo, listLimit, startRow, csTypeNo);
		
		// 페이징 정보 저장
		PageInfoVO pageInfo = new PageInfoVO(listLimit, listLimit, maxPage, startPage, endPage);
		
//		System.out.println("CsQnaList : " + CsQnaList);
//		System.out.println("pageInfo : " + pageInfo);
		
		// 글목록, 페이징 정보 저장
		model.addAttribute("csInfoList", csInfoList);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("pageInfo", pageInfo);
		
		
		
		return "admin/admin_cs_qna_list";
	}
	
	// 관리자페이지 1:1 질문 답글 폼 이동
	@GetMapping("admin_cs_qna_reply")
	public String adminCsQnaReply(HttpSession session, Model model
			, @RequestParam(defaultValue = "1") int pageNo
			, @RequestParam int cs_type_list_num
			, @RequestParam(defaultValue = "2") int csTypeNo ) {
		
//		System.out.println("adminCsQnaReply pageNo:" + pageNo + ",cs_type_list_num:" + cs_type_list_num );
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		System.out.println(member_type);
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//            model.addAttribute("msg", "잘못된 접근입니다!");
//            return "fail_back";
//        }	
		
		
		
		// 1:1 질문 정보 가져오기
		// 파라미터값 : cs_type_list_num
		CsInfoVO csInfo = admin_service.getCsInfo(csTypeNo, cs_type_list_num);
//		System.out.println("어드민컨트롤러 csQna" + csQna );
		
		// 페이지번호와 
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("csInfo", csInfo);
		
		
		return "admin/admin_cs_qna_form";
	}	
	
	// 관리자페이지 1:1 질문 답글 등록 후 게시판 이동
	@RequestMapping(value="admin_cs_qna_pro" , method = {RequestMethod.GET, RequestMethod.POST})
	public String adminCsQnaPro(HttpSession session, Model model
			, @RequestParam(defaultValue = "1", name = "pageNo") int pageNo
			, @RequestParam(defaultValue = "2") int csTypeNo
			, @ModelAttribute("qnaInfo") CsInfoVO qnaInfo) {
		
//		System.out.println("pageNo : " + pageNo + ", qnaInfo : " + qnaInfo);
		
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		System.out.println(member_type);
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//            model.addAttribute("msg", "잘못된 접근입니다!");
//            return "fail_back";
//        }		

		
		// 답변 등록을 위한 update 서비스
		int updateCount = admin_service.quaReply(csTypeNo, qnaInfo);
		
		if(updateCount > 0 ) { // 답변 등록 성공 시
			model.addAttribute("pageNo", pageNo);
			// 1:1 질문 관리 게시판으로 이동
			return "redirect:/admin_cs_qna";
		} else {
//			System.out.println("quaReply - update 실패!");
			model.addAttribute("msg", "답변 등록이 실패하였습니다!");
			return "fail_back";
		}
		
		

	}	
	
	// 관리자페이지 자주묻는 질문 관리 게시판 목록
	@GetMapping("admin_cs_faq")
	public String adminCsFaq(HttpSession session, Model model
			, @RequestParam(defaultValue = "3") int csTypeNo
			, @RequestParam(defaultValue = "전체") String cs_type_keyword
			, @RequestParam(defaultValue = "1") int pageNo) {

		System.out.println(cs_type_keyword);
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		System.out.println(member_type);
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//            model.addAttribute("msg", "잘못된 접근입니다!");
//            return "fail_back";
//        }
		
		// --------------------------페이징 작업 ----------------------------------



		int listLimit = 5;// 한 페이지에 보여줄 목록 수
		
		// 조회 시작 행(레코드) 번호 계산
		int startRow = (pageNo - 1) * listLimit;
		
		int startPage = ((pageNo - 1) / listLimit) * listLimit + 1; // 시작할 페이지
//		System.out.println("startPage: " + startPage);
		int endPage = startPage + listLimit -1; // 끝페이지
		int listCount = admin_service.getCsTotalPageCountKeyword(listLimit, csTypeNo, cs_type_keyword);
		
		// 3. 전체 페이지 목록 갯수 계산
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);
		
		// 끝페이지 번호가 전체 페이지 번호보다 클 경우 끝 페이지 번호를 최대 페이지로 교체)
		if(endPage > maxPage) { 
			endPage = maxPage;
		}
//		System.out.println("어드민 컨트롤러 공지사항 스타트페이지" + startPage +", 엔드 페이지:"+ endPage);
		// --------------------------------------------------------------------------
		
		// 공지사항 목록 조회
		List<CsInfoVO> csInfoList = admin_service.getCsListKeyword(pageNo, listLimit, startRow, csTypeNo, cs_type_keyword);
		
		// 페이징 정보 저장
		PageInfoVO pageInfo = new PageInfoVO(listCount, listLimit, maxPage, startPage, endPage);
		
//		System.out.println("CsFaqList : " + CsFaqList);
//		System.out.println("pageInfo : " + pageInfo);
		
		// 글목록, 페이징 정보 저장
		model.addAttribute("csInfoList", csInfoList);
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
	public String adminCsFaqPro(HttpSession session, Model model
			, @RequestParam( defaultValue = "1", name = "pageNo") int pageNo
			, @ModelAttribute("faqInfo") CsInfoVO faqInfo
			, @RequestParam int csTypeNo) {
		
//		System.out.println("faqInfo: " + faqInfo);
		
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		System.out.println(member_type);
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//            model.addAttribute("msg", "잘못된 접근입니다!");
//            return "fail_back";
//        }		
		
		// 자주 묻는 질문 게시판 변수명 설정(1=공지사항, 2=1:1게시판, 3=자주묻는질문)
//		int csTypeNo = 3;
//		
//
//		// 자주묻는 질문 글쓰기 등록을 위한 함수 호출
//		int insertCount = admin_service.registCs(csTypeNo, faqInfo, files);
//
//		if(insertCount > 0) { //글쓰기 성공
//			
//			return "redirect:/admin_cs_faq"; // 자주 묻는 질문으로 리다이렉트
//		} else { // 글쓰기 실패
//			model.addAttribute("msg", "등록이 실패했습니다!");
//			
//			return "fail_back"; // 실패 창 띄우기
//		}
		
		
		
		// 이클립스 프로젝트 상에 업로드 폴더(upload) 생성 필요 
		// => 주의! 외부에서 접근하도록 하려면 resources 폴더 내에 upload 폴더 생성
		// 이클립스가 관리하는 프로젝스 상의 가상 업로드 경로에 대한 실제 업로드 경로 알아내기
		// => request.getRealPath() 대신 request.getServletContext.getRealPath() 메서드 또는
		//    세션 객체를 활용한 session.getServletContext().getRealPath() 메서드 사용
//		System.out.println(request.getRealPath("/resources/upload")); // Deprecated 처리된 메서드
		String uploadDir = "/resources/upload"; 
//		String saveDir = request.getServletContext().getRealPath(uploadDir); // 사용 가능
		String saveDir = session.getServletContext().getRealPath(uploadDir);
//		System.out.println("실제 업로드 경로 : "+ saveDir);
		// 실제 업로드 경로 : D:\Shared\Spring\workspace_spring5\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Spring_MVC_Board\resources\ upload
		
		String subDir = ""; // 서브디렉토리(날짜 구분)
		
		try {
			// ------------------------------------------------------------------------------
			// 업로드 디렉토리를 날짜별 디렉토리로 자동 분류하기
			// => 하나의 디렉토리에 너무 많은 파일이 존재하면 로딩 시간 길어지며 관리도 불편
			// => 따라서, 날짜별 디렉토리 구별 위해 java.util.Date 클래스 활용
			// 1. Date 객체 생성(기본 생성자 호출하여 시스템 날짜 정보 활용)
			Date date = new Date(); // Mon Jun 19 11:26:52 KST 2023
//		System.out.println(date);
			// 2. SimpleDateFormat 클래스를 활용하여 날짜 형식을 "yyyy/MM/dd" 로 지정
			// => 디렉토리 구조로 바로 활용하기 위해 날짜 구분 기호를 슬래시(/)로 지정
			// => 디렉토리 구분자를 가장 정확히 표현하려면 File.pathSeperator 또는 File.seperator 상수 활용
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			// 3. 기존 업로드 경로에 날짜 경로 결합하여 저장
			subDir = sdf.format(date);
			saveDir += "/" + subDir;
			// --------------------------------------------------------------
			// java.nio.file.Paths 클래스의 get() 메서드를 호출하여
			// 실제 경로를 관리하는 java.nio.file.Path 타입 객체 리턴받기
			// => 파라미터 : 실제 업로드 경로
			Path path = Paths.get(saveDir);
			
			// Files 클래스의 createDirectories() 메서드를 호출하여
			// Path 객체가 관리하는 경로 생성(존재하지 않으면 거쳐가는 경로들 중 없는 경로 모두 생성)
			Files.createDirectories(path);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// BoardVO 객체에 전달된 MultipartFile 객체 꺼내기
		MultipartFile mFile1 = faqInfo.getFile1();
//		System.out.println("원본파일명1 : " + mFile1.getOriginalFilename());
		
		// 파일명 중복 방지를 위한 대첵
		// 현재 시스템(서버)에서 랜덤ID 값을 추출하여 파일명 앞에 붙여서
		// "랜덤ID값_파일명.확장자" 형식으로 중복 파일명 처리
		// => 랜덤ID 생성은 java.util.UUID 클래스 활용(UUID = 범용 고유 식별자)
		String uuid = UUID.randomUUID().toString();
//		System.out.println("uuid : " + uuid);
		
		// 생성된 UUID 값을 원본 파일명 앞에 결합(파일명과 구분을 위해 _ 기호 추가)
		// => 나중에 사용자 다운로드 시 원본 파일명 표시를 위해 분리할 때 구분자로 사용
		//    (가장 먼저 만나는 _ 기호를 기준으로 문자열 분리하여 처리)
		// 생성된 UUID 값(8자리 추출)과 업로드 파일명을 결합하여 CsInfoVO 객체에 저장(구분자로 _ 기호 추가)
		// => 단, 파일명이 존재하는 경우에만 파일명 생성(없을 경우를 대비하여 기본 파일명 널스트링으로 처리)
		faqInfo.setCs_file("");
		
		// 파일명을 저장할 변수 선언
		String fileName1 = uuid.substring(0, 8) + "_" + mFile1.getOriginalFilename();
		
		if(!mFile1.getOriginalFilename().equals("")) {
			faqInfo.setCs_file(subDir + "/" + fileName1);
		}
		

		
		System.out.println("실제 업로드 파일명1 : " + faqInfo.getCs_file());
		
		// -----------------------------------------------------------------------------------
		// BoardService - registBoard() 메서드를 호출하여 게시물 등록 작업 요청
		// => 파라미터 : BoardVO 객체    리턴타입 : int(insertCount)
		int insertCount = admin_service.registCs(csTypeNo, faqInfo);
		
		
		// 게시물 등록 작업 요청 결과 판별
		// => 성공 시 업로드 파일을 실제 디렉토리에 이동시킨 후 BoardList 서블릿 리다이렉트
		// => 실패 시 "글 쓰기 실패!" 메세지 출력 후 이전페이지 돌아가기 처리
		if(insertCount > 0) { // 성공
			try {
				// 업로드 된 파일은 MultipartFile 객체에 의해 임시 디렉토리에 저장되어 있으며
				// 글쓰기 작업 성공 시 임시 디렉토리 -> 실제 디렉토리로 이동 작업 필요
				// MultipartFile 객체의 transferTo() 메서드를 호출하여 실제 위치로 이동(업로드)
				// => 비어있는 파일은 이동할 수 없으므로(= 예외 발생) 제외
				// => File 객체 생성 시 지정한 디렉토리에 지정한 이름으로 파일이 이동(생성)됨
				//    따라서, 이동할 위치의 파일명도 UUID 가 결합된 파일명을 지정해야한다!
				if(!mFile1.getOriginalFilename().equals("")) {
					mFile1.transferTo(new File(saveDir, fileName1));
				}

			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			// 글쓰기 작업 성공 시 자주묻는 질문 게시판(admin_cs_faq)으로 리다이렉트
			return "redirect:/admin_cs_faq";
		} else { // 실패
			model.addAttribute("msg", "글 쓰기 실패!");
			return "fail_back";
		}

	}

	
	
	// 관리자페이지 자주묻는 질문 글수정 폼 이동
	// csTypeNo = 1 공지, 2 1:1게시판, 3 자주묻는 질문 
	// 이전 등록된 정보 가져오기
	@GetMapping("admin_cs_faq_modify_form")
	public String adminCsFaqModifyForm(HttpSession session, Model model
			, @RequestParam(defaultValue = "1") int pageNo
			, @RequestParam int cs_type_list_num
			, @RequestParam(defaultValue = "3") int csTypeNo) {

		
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		System.out.println(member_type);
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//            model.addAttribute("msg", "잘못된 접근입니다!");
//            return "fail_back";
//        }
		
	
		// 1:1 질문 정보 가져오기
		// 파라미터값 : cs_type_list_num
		CsInfoVO csInfo = admin_service.getCsInfo(csTypeNo, cs_type_list_num);
//		System.out.println("어드민컨트롤러 csQna" + csQna );
		
		// 페이지번호와 
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("csInfo", csInfo);
		
		return "admin/admin_cs_faq_modify_form";
	}
	
	// 관리자페이지 자주묻는 질문 글수정 등록 후 게시판 이동
	// csTypeNo = 1 공지, 2 1:1게시판, 3 자주묻는 질문 
	@PostMapping("admin_cs_faq_modify_pro")
	public String adminCsFaqModifyPro(HttpSession session, Model model
			, @RequestParam( defaultValue = "1", name = "pageNo") int pageNo
			, @ModelAttribute("noticeInfo") CsInfoVO faqInfo
			, @RequestParam int csTypeNo) {

		
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		System.out.println(member_type);
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//            model.addAttribute("msg", "잘못된 접근입니다!");
//            return "fail_back";
//        }		
		

//
//		System.out.println("faq_modify_pro csTypeNo :" + csTypeNo + ", faqInfo" + faqInfo + ", files" + files);
//		// 공지사항 글정보 변경
//		int updateCount = admin_service.updateCs(csTypeNo, faqInfo, files);
//		
//		
//		if(updateCount > 0 ) { // 답변 등록 성공 시
//			// 페이지 정보 저장
//			model.addAttribute("pageNo", pageNo);
//			// 자주묻는 질문 게시판으로 이동
//			return "redirect:/admin_cs_faq";
//		} else {
//			System.out.println("Faq - update 실패!");
//			model.addAttribute("msg", "답변 등록이 실패하였습니다!");
//			return "fail_back"; // 실패 시 이동할 페이지
//		}
		
		
		// 이클립스 프로젝트 상에 업로드 폴더(upload) 생성 필요 
		// => 주의! 외부에서 접근하도록 하려면 resources 폴더 내에 upload 폴더 생성
		// 이클립스가 관리하는 프로젝스 상의 가상 업로드 경로에 대한 실제 업로드 경로 알아내기
		// => request.getRealPath() 대신 request.getServletContext.getRealPath() 메서드 또는
		//    세션 객체를 활용한 session.getServletContext().getRealPath() 메서드 사용
//		System.out.println(request.getRealPath("/resources/upload")); // Deprecated 처리된 메서드
		String uploadDir = "/resources/upload"; 
//		String saveDir = request.getServletContext().getRealPath(uploadDir); // 사용 가능
		String saveDir = session.getServletContext().getRealPath(uploadDir);
//		System.out.println("실제 업로드 경로 : "+ saveDir);
		// 실제 업로드 경로 : D:\Shared\Spring\workspace_spring5\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Spring_MVC_Board\resources\ upload
		
		String subDir = ""; // 서브디렉토리(날짜 구분)
		
		try {
			// ------------------------------------------------------------------------------
			// 업로드 디렉토리를 날짜별 디렉토리로 자동 분류하기
			// => 하나의 디렉토리에 너무 많은 파일이 존재하면 로딩 시간 길어지며 관리도 불편
			// => 따라서, 날짜별 디렉토리 구별 위해 java.util.Date 클래스 활용
			// 1. Date 객체 생성(기본 생성자 호출하여 시스템 날짜 정보 활용)
			Date date = new Date(); // Mon Jun 19 11:26:52 KST 2023
//		System.out.println(date);
			// 2. SimpleDateFormat 클래스를 활용하여 날짜 형식을 "yyyy/MM/dd" 로 지정
			// => 디렉토리 구조로 바로 활용하기 위해 날짜 구분 기호를 슬래시(/)로 지정
			// => 디렉토리 구분자를 가장 정확히 표현하려면 File.pathSeperator 또는 File.seperator 상수 활용
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			// 3. 기존 업로드 경로에 날짜 경로 결합하여 저장
			subDir = sdf.format(date);
			saveDir += "/" + subDir;
			// --------------------------------------------------------------
			// java.nio.file.Paths 클래스의 get() 메서드를 호출하여
			// 실제 경로를 관리하는 java.nio.file.Path 타입 객체 리턴받기
			// => 파라미터 : 실제 업로드 경로
			Path path = Paths.get(saveDir);
			
			// Files 클래스의 createDirectories() 메서드를 호출하여
			// Path 객체가 관리하는 경로 생성(존재하지 않으면 거쳐가는 경로들 중 없는 경로 모두 생성)
			Files.createDirectories(path);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// BoardVO 객체에 전달된 MultipartFile 객체 꺼내기
		MultipartFile mFile1 = faqInfo.getFile1();
//		System.out.println("원본파일명1 : " + mFile1.getOriginalFilename());
		
		// 파일명 중복 방지를 위한 대첵
		// 현재 시스템(서버)에서 랜덤ID 값을 추출하여 파일명 앞에 붙여서
		// "랜덤ID값_파일명.확장자" 형식으로 중복 파일명 처리
		// => 랜덤ID 생성은 java.util.UUID 클래스 활용(UUID = 범용 고유 식별자)
		String uuid = UUID.randomUUID().toString();
//		System.out.println("uuid : " + uuid);
		
		// 생성된 UUID 값을 원본 파일명 앞에 결합(파일명과 구분을 위해 _ 기호 추가)
		// => 나중에 사용자 다운로드 시 원본 파일명 표시를 위해 분리할 때 구분자로 사용
		//    (가장 먼저 만나는 _ 기호를 기준으로 문자열 분리하여 처리)
		// 생성된 UUID 값(8자리 추출)과 업로드 파일명을 결합하여 CsInfoVO 객체에 저장(구분자로 _ 기호 추가)
		// => 단, 파일명이 존재하는 경우에만 파일명 생성(없을 경우를 대비하여 기본 파일명 널스트링으로 처리)
		faqInfo.setCs_file("");
		
		// 파일명을 저장할 변수 선언
		String fileName1 = uuid.substring(0, 8) + "_" + mFile1.getOriginalFilename();
		
		if(!mFile1.getOriginalFilename().equals("")) {
			faqInfo.setCs_file(subDir + "/" + fileName1);
		}
		

		
//		System.out.println("실제 업로드 파일명1 : " + faqInfo.getCs_file());
		
		// -----------------------------------------------------------------------------------
		// BoardService - registBoard() 메서드를 호출하여 게시물 등록 작업 요청
		// => 파라미터 : BoardVO 객체    리턴타입 : int(insertCount)
		int insertCount = admin_service.registCs(csTypeNo, faqInfo);
		
		
		// 게시물 등록 작업 요청 결과 판별
		// => 성공 시 업로드 파일을 실제 디렉토리에 이동시킨 후 BoardList 서블릿 리다이렉트
		// => 실패 시 "글 쓰기 실패!" 메세지 출력 후 이전페이지 돌아가기 처리
		if(insertCount > 0) { // 성공
			try {
				// 업로드 된 파일은 MultipartFile 객체에 의해 임시 디렉토리에 저장되어 있으며
				// 글쓰기 작업 성공 시 임시 디렉토리 -> 실제 디렉토리로 이동 작업 필요
				// MultipartFile 객체의 transferTo() 메서드를 호출하여 실제 위치로 이동(업로드)
				// => 비어있는 파일은 이동할 수 없으므로(= 예외 발생) 제외
				// => File 객체 생성 시 지정한 디렉토리에 지정한 이름으로 파일이 이동(생성)됨
				//    따라서, 이동할 위치의 파일명도 UUID 가 결합된 파일명을 지정해야한다!
				if(!mFile1.getOriginalFilename().equals("")) {
					mFile1.transferTo(new File(saveDir, fileName1));
				}

			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			// 글쓰기 작업 성공 시 자주묻는 질문 게시판(admin_cs_faq)으로 리다이렉트
			return "redirect:/admin_cs_faq";
		} else { // 실패
			model.addAttribute("msg", "글 쓰기 실패!");
			return "fail_back";
		}
		
		
		
		

	}	
	
	
	
	
//	관리자 - 회원관리 - 정의효 
	@GetMapping("admin_member_list")
	public String adminMemberList(
			HttpSession session,
			@RequestParam(defaultValue = "") String memberSearchType,
			@RequestParam(defaultValue = "") String memberSearchKeyword,
			@RequestParam(defaultValue = "1") int pageNo, 
			Model model) {
		
		int listLimit = 5; // 한 페이지에 보여줄 게시물 수
		
		// 조회 시작 행(레코드) 번호 계산
		int startRow = (pageNo - 1) * listLimit;
		
		// 회원 목록 조회
		List<MemberVO> memberList = member_service.getMemberList(memberSearchType, memberSearchKeyword, startRow, listLimit);
		
		int listCount = member_service.getMemberListCount(memberSearchType, memberSearchKeyword);
		
		// 2. 한 페이지에서 표시할 목록 갯수 설정(페이지 번호의 갯수)
		int pageListLimit = 2;
		
		// 3. 전체 페이지 목록 갯수 계산
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);
		
		// 4. 시작 페이지 번호 계산
		int startPage = (pageNo - 1) / pageListLimit * pageListLimit + 1;
		
		// 5. 끝 페이지 번호 계산
		int endPage = startPage + listLimit -1; // 끝페이지
		
		// 끝페이지 번호가 전체 페이지 번호보다 클 경우 끝 페이지 번호를 최대 페이지로 교체)
				if(endPage > maxPage) { 
					endPage = maxPage;
				}
		
		// oneperson 뒤로가기 - 기존페이지 및 검색정보 저장을 위한 값들 세션에 저장		
		// pageNo 값을 세션에 저장
	    session.setAttribute("pageNo", pageNo);
		// memberSearchType 값을 세션에 저장		
	    session.setAttribute("memberSearchType", memberSearchType);
	    // memberSearchKeyword 값을 세션에 저장		
	    session.setAttribute("memberSearchKeyword", memberSearchKeyword);
	    
	    
	    
		// 페이징 정보 저장
		PageInfoVO pageInfo = new PageInfoVO(listCount, pageListLimit, maxPage, startPage, endPage);
		
		model.addAttribute("memberList", memberList);
		model.addAttribute("pageInfo", pageInfo);
		System.out.println(memberList);
		
		return "admin/admin_member_list";
	}
	
	// 관리자 - 회원상세 - 정의효
		@GetMapping("admin_member_oneperson")
		public String adminMemberOneperson(
		        HttpSession session,
		        @RequestParam String member_id,
		        Model model,
		        HttpServletRequest request) {

			
//			// 직원 세션이 아닐 경우 잘못된 접근 처리
//			String member_type = (String)session.getAttribute("member_type");
//			System.out.println(member_type);
//			if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
	//
//	            model.addAttribute("msg", "잘못된 접근입니다!");
//	            return "fail_back";
//	        }		
			
			
			MemberVO member = member_service.getMember(member_id);
			model.addAttribute("member", member);
			
			return "admin/admin_member_oneperson";
		}
	
	
//	관리자 - 영화관리 - 정의효
	@GetMapping("admin_movie_management")
	public String adminMovieManagement(
						HttpSession session,
						@RequestParam(defaultValue = "") String movieSearchKeyword,
						@RequestParam(defaultValue = "1") int pageNo, 
						Model model) {
		
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		System.out.println(member_type);
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//            model.addAttribute("msg", "잘못된 접근입니다!");
//            return "fail_back";
//        }		
		
		
		int listLimit = 5; // 한 페이지에 보여줄 게시물 수
		
		// 조회 시작 행(레코드) 번호 계산
		int startRow = (pageNo - 1) * listLimit;
		
		// 회원 목록 조회
		List<MovieVO> movieList = movie_service.getmovieList(movieSearchKeyword, startRow, listLimit);
		
		int listCount = movie_service.getMovieListCount(movieSearchKeyword);
		
		// 2. 한 페이지에서 표시할 목록 갯수 설정(페이지 번호의 갯수)
		int pageListLimit = 2;
		
		// 3. 전체 페이지 목록 갯수 계산
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);
		
		// 4. 시작 페이지 번호 계산
		int startPage = (pageNo - 1) / pageListLimit * pageListLimit + 1;
		
		// 5. 끝 페이지 번호 계산
		int endPage = startPage + listLimit -1; // 끝페이지
		
		// 끝페이지 번호가 전체 페이지 번호보다 클 경우 끝 페이지 번호를 최대 페이지로 교체)
				if(endPage > maxPage) { 
					endPage = maxPage;
				}
		
		// 페이징 정보 저장
		PageInfoVO pageInfo = new PageInfoVO(listCount, pageListLimit, maxPage, startPage, endPage);
		
		model.addAttribute("movieList", movieList);
		model.addAttribute("pageInfo", pageInfo);
		System.out.println(movieList);
		
		
		return "admin/admin_movie_management";
	}
	
//	관리자 - 영화상세 - 정의효
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
	
	// 관리자 - 영화관리 - 등록페이지 - 정의효
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
	
	// 관리자 영화관리 - 등록페이지 - 등록하기 - 정의효
	@PostMapping("admin_movie_regist_Pro")
	public String adminMovieRegistPro(HttpSession session, @DateTimeFormat(pattern = "yyyy-MM-dd") MovieVO movie, Model model) {
		System.out.println(movie);
		
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
	
	// 관리자 - 결제관리 - 정의효
	@GetMapping("admin_payment_list")
	public String adminPaymentList(
						HttpSession session,
						@RequestParam(defaultValue = "") String paymentSearchKeyword,
						@RequestParam(defaultValue = "1") int pageNo, 
						Model model) {
		
		
//		// 직원 세션이 아닐 경우 잘못된 접근 처리
//		String member_type = (String)session.getAttribute("member_type");
//		System.out.println(member_type);
//		if(member_type == null || !member_type.equals("직원")) { // 미로그인 또는 "직원"이 아닐 경우
//
//            model.addAttribute("msg", "잘못된 접근입니다!");
//            return "fail_back";
//        }		
		
		int listLimit = 5; // 한 페이지에 보여줄 게시물 수
		
		// 조회 시작 행(레코드) 번호 계산
		int startRow = (pageNo - 1) * listLimit;
		
		// 회원 목록 조회
		List<PaymentVO> paymentList = payment_service.getPaymentList(paymentSearchKeyword, startRow, listLimit);
		
		int listCount = payment_service.getPaymentListCount(paymentSearchKeyword);
		
		// 2. 한 페이지에서 표시할 목록 갯수 설정(페이지 번호의 갯수)
		int pageListLimit = 2;
		
		// 3. 전체 페이지 목록 갯수 계산
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);
		
		// 4. 시작 페이지 번호 계산
		int startPage = (pageNo - 1) / pageListLimit * pageListLimit + 1;
		
		// 5. 끝 페이지 번호 계산
		int endPage = startPage + listLimit -1; // 끝페이지
		
		// 끝페이지 번호가 전체 페이지 번호보다 클 경우 끝 페이지 번호를 최대 페이지로 교체)
				if(endPage > maxPage) { 
					endPage = maxPage;
				}
		
		// 페이징 정보 저장
		PageInfoVO pageInfo = new PageInfoVO(listCount, pageListLimit, maxPage, startPage, endPage);
		
		model.addAttribute("paymentList", paymentList);
		model.addAttribute("pageInfo", pageInfo);
		System.out.println(paymentList);
		return "admin/admin_payment_list";
	}
	

	
	
	// 관리자 - 결제상세 - 정의효
	@PostMapping("admin_payment_list_detail")
	public String adminPaymentListDetail(
				HttpSession session,
				@RequestParam String order_num,
				@RequestParam String payment_num,
				Model model) {
		
		
		
		List<PaymentVO> paymentDetail = payment_service.getPaymentDetail(order_num);
		model.addAttribute("paymentDetail", paymentDetail);
		
		
		return "admin/admin_payment_list_detail";
	}
	
	// 관리자 - 회원등급변경 - 정의효
	@PostMapping("admin_changeMemberGrade")
	public String adminChangeMemberGrade(HttpSession session, @RequestParam String grade_name, @RequestParam String member_id, Model model) {
		System.out.println(grade_name);
	    member_service.changeMemberGrade(grade_name, member_id);
	    model.addAttribute("member_id", member_id); // 변경후 리다이렉트를 위해 전달하는 member_id model객체에 저장
	    return "redirect:/admin_member_oneperson";
	}

	// 관리자 - 회원상태변경 - 정의효
	@PostMapping("admin_changeMemberStatus")
	public String adminChangeMemberStatus(HttpSession session, @RequestParam String member_status, @RequestParam String member_id, Model model) {
		System.out.println(member_status);
		member_service.changeMemberStatus(member_status, member_id);
		model.addAttribute("member_id", member_id);
		return "redirect:/admin_member_oneperson";
	}
    
	// 관리자 - 회원삭제 - 정의효
	@PostMapping("admin_memberDelete")
	public String adminMemberDelete(HttpSession session, @RequestParam String member_id) {
		member_service.memberDelete(member_id);
		return "redirect:/admin_member_list";
	}
		
	// 관리자 - 영화삭제 - 정의효
		@PostMapping("admin_movieDelete")
		public String adminMovierDelete(HttpSession session, @RequestParam String movie_num) {
			movie_service.movieDelete(movie_num);
			return "redirect:/admin_movie_management";
		}
		
	// 관리자 - 영화수정 - 정의효
	@PostMapping("admin_movie_modify")
	public String adminMovieModify(HttpSession session, @ModelAttribute MovieVO movie) {
		movie_service.movieModify(movie);
		
		System.out.println(movie);
		return "redirect:/admin_movie_management";
	}
	
	
    
}

























