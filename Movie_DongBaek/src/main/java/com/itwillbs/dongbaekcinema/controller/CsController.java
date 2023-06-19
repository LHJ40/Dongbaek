package com.itwillbs.dongbaekcinema.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.itwillbs.dongbaekcinema.service.*;
import com.itwillbs.dongbaekcinema.vo.*;

@Controller
public class CsController {
	
	// Service와 연결하기
	@Autowired
	private CsService service;
	
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
	public String cs_notice() {
		return "cs/cs_notice";
	}
	
	
	
	
	
}
