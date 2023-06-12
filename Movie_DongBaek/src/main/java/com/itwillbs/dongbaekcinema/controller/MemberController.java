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
	public String member_login_pro(@RequestParam String member_id, @RequestParam String member_pass , HttpSession session, Model model) {
		
		// 회원 정보 확인(일치, 불일치)
		// MemberService - isMember() 메서드를 호출하여 회원 여부 확인
		// 파라미터 : id	리턴타입 : boolean(isMember)
		boolean isMember = service.isMember(member_id);
		if (!isMember) {
			// id가 DB에 없을 때
			model.addAttribute("msg", "존재하지 않는 ID 입니다!");
			return "failPage";
			
		} else {
			// id가 DB에 있을 때
			// MemberService - isCorrectMember() 메서드를 호출하여 회원 여부 확인
			// 파라미터 : MemberVO (member)- id, passwd		리턴타입 : boolean(isCorrectMember)
			boolean isCorrectMember = service.isCorrectMember(member_id, member_pass);
			
			if (!isCorrectMember) {
				// id와 pass가 일치하지 않을 때
				model.addAttribute("msg", "ID와 비밀번호가 일치하지 않습니다!");
				return "failPage";
				
			} else {
				// id와 pass가 일치할 때 -> session에 member_id를 저장하고 main 페이지로 돌아감
				session.setAttribute("member_id", member_id);
				return "redirect:/./";
			}
			
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
	
	// 회원가입 화면 2페이지 약관동의 후 , 네이버/카카오 인증 후 회원가입 화면 3페이지로 이동
	@RequestMapping(value = "member_join_step3", method = {RequestMethod.GET, RequestMethod.POST})
	public String member_join_step3(MemberVO member, Model model) {
		
		// 2페이지에서 받아온 약관동의 여부 저장 후 step3 페이지로 이동
//		model.addAttribute("member", member);
		
		return "member/member_join_step3";
	}
	
	@PostMapping("member_join_pro")
	public String member_join_pro(MemberVO member, Model model) {
		// 회원가입 화면 3페이지에서 회원가입 클릭 시 이동하는 회원가입 처리
		
		
		// 회원가입 로직 MemberService - joinMember() 메서드 호출
		// 파라미터 : MemberVO (member)		리턴타입 : int(insertCount)
		int insertCount = service.joinMember(member);
		
		if (insertCount == 0) {
			// 등록 실패 시
			model.addAttribute("msg", "회원가입 실패! 입력창을 다시 확인해주세요!");
			return "failPage";
		}
		// 등록 성공 시
		
		return "member_join_step4";	// 회원가입 화면 4페이지로 이동
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
	
//	// 임시 - 정보입력화면 
//	@GetMapping("member_join_step3")
//	public String member_join_step3() {
//		return "member/member_join_step3";
//	}
	

}


























