package com.itwillbs.dongbaekcinema.controller;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.itwillbs.dongbaekcinema.service.*;
import com.itwillbs.dongbaekcinema.vo.*;

@Controller
public class MemberController {
	
	// Service와 연결하기
	@Autowired
	private MemberService service;
		
	// 메인화면에서 회원 로그인 화면으로 이동
	@GetMapping("member_login_form")
	public String member_login_form() {
		return "member/member_login_form";
	}
	
	// 로그인 폼에서 로그인 버튼, 네이버/카카오 로그인 버튼 클릭 시 처리
	@PostMapping("member_login_pro")
	public String member_login_pro(MemberVO member, HttpSession session, Model model) {
		
		// 1. 일반 로그인 시도
		// MemberService - getPasswd()
		// member 테이블에서 id가 일치하는 레코드의 패스워드(passwd) 조회
		// 파라미터 : MemberVO member	리턴타입 : String(passwd)
		String passwd = service.getPasswd(member);
//		System.out.println(passwd);
		
		// 로그인 성공/ 실패 여부 판별하여 포워딩
		// => 성공 : MemberVO 객체에 데이터가 저장되어 있고 입력받은 패스워드가 같음
		// => 실패 : MemberVO 객체가 null 이거나 입력받은 패스워드와 다름
		if(passwd == null || !passwd.equals(member.getMember_pass())) {
			// 아이디로 조회 시 없는 아이디이거나 나온 패스워드가 member.getPasswd와 다를 때(비밀번호가 틀림)
			model.addAttribute("msg", "아이디 또는 비밀번호를 잘못 입력했습니다. "
					+ "입력하신 내용을 다시 확인해주세요.");
			return "fail_back";
		} else {
			// 로그인 성공 시
			// 세션에 값 넣기
			return "redirect:/";	// 메인페이지(루트)로 리다이렉트 (href="./" 와 같음)
		}
			
		
		// 네이버/카카오 로그인 클릭 시 (네이버/카카오 로그인 성공)
		// 넘어온 이메일 정보가 DB에 있는지 확인
		
		
		// 이메일 정보가 있을 때 (회원임)
		
		// 이메일이 회원정보에 없을 때(회원 아님)
		// "아직 동백씨네마의 회원이 아닙니다. 회원가입 하시겠습니까?" => 회원가입 페이지로 넘어가기
//		return "member/member_join_step3";	// => 회원가입(3단계) 정보입력창으로 가기
		
	}
	
	// 메인화면에서 회원가입 화면 1페이지로 이동
	@GetMapping("member_join_step1")
	public String member_join_step1() {
		return "member/member_join_step1";
	}
	
	// 회원가입 화면 1에서 인증 성공 시 회원가입 화면 2페이지로 이동
	@GetMapping("member_join_step2")
	public String member_join_step2(Model model) {
		// 약관 동의 하는 페이지로 이동
		
		return "member/member_join_step2";
	}
	
	
	
	@GetMapping("member_join_step4")
	public String member_join_step4() {
		return "member_join_step4";
	}
	
	
	// 회원 로그인 화면에서 상단 탭(header)의 비회원 로그인 탭 클릭 시 비회원 로그인 페이지로 이동
	@GetMapping("no_member_login_form")
	public String no_member_login_form() {
		return "member/no_member_login_form";
	}

	// 회원 로그인 화면에서 상단 탭(header)의  비회훤 예매 확인 탭 클릭 시 비회원 예매 확인 페이지로 이동
	@GetMapping("no_member_reservation_check_form")
	public String no_member_reservation_check_form() {
		return "member/no_member_reservation_check_form";
	}
	
	// 임시 - 정보입력화면 
	@GetMapping("member_join_step3")
	public String member_join_step3() {
		return "member/member_join_step3";
	}
	

}


























