package com.itwillbs.dongbaekcinema.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.itwillbs.dongbaekcinema.service.*;
import com.itwillbs.dongbaekcinema.vo.*;
import com.itwillbs.dongbaekcinema.voNew.CsInfoVO;
import com.itwillbs.dongbaekcinema.voNew.PageInfoVO;

@Controller
public class CsController {
	
	// Service와 연결하기
	@Autowired
	private CsService service;
	
	@Autowired
	private AdminService admin_service;
	
	// cs 부분 main으로 가는 매핑
	@GetMapping("cs_main")
	public String cs_main(Model model) {
		
		// 공지사항 최근 3개(제목만 들고올거지만?)
//		CsVO board_csNotice = service.getCsNotice();
		
		// 모델에 저장해 이동하기
//		model.addAttribute("board_csNotice", board_csNotice);
		
		return "cs/cs_main";
	}
	
	// cs 부분 1:1질문(cs_qna_form.jsp)으로 가는 매핑
	@GetMapping("cs_qna_form")
	public String cs_qna_form() {
		return "cs/cs_qna_form";
	}
	
	// cs 부분 자주묻는질문(cs_faq.jsp)으로 가는 매핑
	@GetMapping("cs_faq")
	public String cs_faq() {
		return "cs/cs_faq";
	}
	
	// cs 부분 자주묻는질문 DB 조회하는 메서드
	@GetMapping("/faq_data")
	@ResponseBody	// CsVO -> json으로 리턴
	public List<CsVO> fag_data(@RequestParam("cs_type") String cs_type
//			, @RequestParam("pageNum") int pageNum
			) {
		
//		int startNum = pageNum * 5 - 4;
		// 받아온 값으로(cs_type) 레코드 조회
		// CsService - getFaq()
		// 파라미터 : String(cs_type), int (startNum, pageNum)		리턴타입 : CsVO(faq)
		List<CsVO> faq = service.getCsFaq(cs_type);
//		List<CsVO> faq = service.getCsFaq(cs_type, startNum, pageNum);
//		System.out.println(faq);
		
		return faq;
	}
	
	// cs 부분 공지사항(cs_cs_notice.jsp)으로 가는 매핑
	@GetMapping("cs_notice")
	public String adminCsNotice(HttpSession session, Model model
			, @RequestParam(defaultValue = "1") int pageNo
			, @RequestParam(defaultValue = "1") int csTypeNo) {
//		System.out.println("pageNO : " + pageNo);
		

		
		
		// --------------------------페이징 작업 ----------------------------------


		int listLimit = 5; // 한 페이지에서 표시할 목록 갯수 지정
		int startRow = (pageNo - 1) * listLimit; // 조회 시작 행(레코드) 번호
		
		
		int startPage = ((pageNo - 1) / listLimit) * listLimit + 1; // 시작할 페이지
//		System.out.println("startPage: " + startPage);
		int endPage = startPage + listLimit -1; // 끝페이지
		int listCount = admin_service.getCsTotalPageCount(listLimit, csTypeNo);
		
		// 3. 전체 페이지 목록 갯수 계산
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);
		System.out.println("전체 페이지 목록 갯수 : " + maxPage);
		
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

		return "cs/cs_notice";

		
	}
	
	@GetMapping("cs_notice_view")
	public String cs_notice_view(HttpSession session, Model model
								,@RequestParam int cstypeNo
								,@RequestParam int cs_type_list_num) {

		System.out.println("cs_notice_view");
		// admin_service - getCsInfo() 메서드 호출하여 글 상세정보 조회 요청
		// => 파라미터 : cs_type_list_num   리턴타입 : CsInfoVO 객체(csInfo)
		CsInfoVO csInfo = admin_service.getCsInfo(cstypeNo, cs_type_list_num);
		
		// 상세정보 조회 결과 저장
		model.addAttribute("csInfo", csInfo);
		
		return "cs/cs_notice_view";

	}
	
}