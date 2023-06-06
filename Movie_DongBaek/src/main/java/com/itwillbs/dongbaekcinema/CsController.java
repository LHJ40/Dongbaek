package com.itwillbs.dongbaekcinema;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class CsController {
	
	// cs 부분 main으로 가는 매핑
	@GetMapping("cs_main")
	public String cs_main() {
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
	
	// cs 부분 공지사항(cs_cs_notice.jsp)으로 가는 매핑
	@GetMapping("cs_notice")
	public String cs_notice() {
		return "cs/cs_notice";
	}
	
	
	
	
	
}
