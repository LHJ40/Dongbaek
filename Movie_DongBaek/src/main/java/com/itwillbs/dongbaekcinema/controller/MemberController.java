package com.itwillbs.dongbaekcinema.controller;

import java.io.IOException;
import java.net.http.*;
import java.util.*;

import javax.servlet.http.*;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.itwillbs.dongbaekcinema.naver.NaverLoginBO;
import com.itwillbs.dongbaekcinema.service.*;
import com.itwillbs.dongbaekcinema.vo.*;

@Controller
public class MemberController {
	
	// Service와 연결하기
	@Autowired
	private MemberService service;
		
	
	// 회원가입 폼에서 아이디 중복확인
	@PostMapping("/idCheck")
	@ResponseBody // json 값을 가져오기 위한 어노테이션 @ResponseBody
	public int idCheck(@RequestParam("id") String id) { // id 값을 받아오기 위한 @RequestParam
		int cnt = service.idCheck(id);
		return cnt;
	}
	
	// "/member_join_pro" 요청에 대해 MemberService 객체 비즈니스 로직 수행 
	// => 폼 파라미터로 전달되는 가입 정보를 파라미터로 전달받기 
	// => 가입 완료 후 이동할 페이지 : member/member_join_step4.jsp 
	// => 가입 실패 시 오류 페이지(fail_back) 을 통해 "회원 가입이 실패하였습니다." 출력 후 이전 페이지( )로 돌아가기!
	@PostMapping("member_join_pro")
	public String joinPro(MemberVO member, HttpSession session,  Model model) {
		System.out.println(member);
		
		// MemberService(registMember()) - MemberMapper(insertMember())
		int insertCount = service.registMember(member);
		
		
		// 회원 가입 성공/실패에 따른 페이지 포워딩
		// => 성공 시 MemberJoinSuccess 로 리다이렉트
		// => 실패 시 fail_back.jsp 로 포워딩(model 객체의 "msg" 속성으로 "회원 가입 실패!" 저장)
		if(insertCount > 0) {
			// (카카오)회원 이메일, 이름 session에서 제거
			session.removeAttribute("member_email");
			session.removeAttribute("member_name");
			return "redirect:/MemberJoinSuccess";
		} else {
			model.addAttribute("msg", "회원 가입이 실패하였습니다!");
			return "fail_back";
		}
	}
	
	// "/MemberJoinSuccess" 요청에 대해 "member/member_join_step4.jsp" 페이지 포워딩
	// => GET 방식 요청, Dispatch 방식 포워딩 
	@GetMapping("MemberJoinSuccess")
	public String joinSuccess() {
		return "member/member_join_step4";
	}
	
	@GetMapping("member_join_step4")
	public String member_join_step4() {
		return "member_join_step4";
	}
	
	// 메인화면에서 회원 로그인 화면으로 이동
//	@GetMapping("member_login_form")
//	public String member_login_form() {
//		return "member/member_login_form";
//	}
//	
	// 로그인 폼에서 로그인 버튼, 네이버/카카오 로그인 버튼 클릭 시 처리
	@PostMapping("member_login_pro")
	public String member_login_pro(MemberVO member, boolean remember_me,
				HttpServletRequest request, HttpServletResponse response, Model model) {
		
		// 1. 일반 로그인 시도
		// MemberService - getPasswd()
		// member 테이블에서 id가 일치하는 레코드의 패스워드(passwd) 조회
		// 파라미터 : MemberVO member	리턴타입 : String(passwd)
//		String passwd = service.getPasswd(member);
		MemberVO getMember = service.getMember(member.getMember_id());
//		System.out.println(passwd);
		String passwd = getMember.getMember_pass();
		// 로그인 성공/ 실패 여부 판별하여 포워딩
		// => 성공 : MemberVO 객체에 데이터가 저장되어 있고 입력받은 패스워드가 같음
		// => 실패 : MemberVO 객체가 null 이거나 입력받은 패스워드와 다름
		if(passwd == null) {
			// 아이디로 조회 시 없는 아이디일 때
			model.addAttribute("msg", "없는 아이디 입니다. "
					+ "입력하신 내용을 다시 확인해주세요.");
			return "fail_back";
			
		} else if (!passwd.equals(member.getMember_pass())) {
			// 패스워드가 member.getPasswd와 다를 때(비밀번호가 틀림)
			model.addAttribute("msg", "아이디 또는 비밀번호를 잘못 입력했습니다. "
					+ "입력하신 내용을 다시 확인해주세요.");
			return "fail_back";
		} else {
			// 로그인 성공 시
			// 세션에 값 넣기
			HttpSession session = request.getSession();
			session.setAttribute("member_id", member.getMember_id());
			session.setAttribute("member_type", getMember.getMember_type());
//			System.out.println(remember_me);
			
			// 만약, "아이디 저장" 체크박스 버튼이 눌려진 경우 cookie에 member_id 저장
//			Cookie cookie = new Cookie("member_id", member.getMember_id());
			Cookie cookie = new Cookie("member_id", getMember.getMember_id());
			
			if(remember_me) {
				// Cookie에 로그인 성공한 member_id 저장 (name : "member_id")
				// cookie 유지 시간 지정 (초 단위)
				cookie.setMaxAge(60 * 60 * 24 * 15); // 15일 유지 (초 * 분 * 시 * 일)
			} else if (!remember_me) {
				// "아이디 저장" 체크박스 버튼이 눌려져 있지 않을 때 => cookie에 member_id 제거
				// cookie 유지 시간 지정 (초 단위)
				cookie.setMaxAge(0); // 삭제
			}
			response.addCookie(cookie);
			
			return "redirect:/";	// 메인페이지(루트)로 리다이렉트 (href="./" 와 같음)
		}
			
	}
		
	// 네이버/카카오 로그인 클릭 시 (네이버/카카오 로그인 성공)
	// 넘어온 이메일 정보가 DB에 있는지 확인
	
	// 2. 카카오 로그인 클릭
	@PostMapping("/checkKakao")
	@ResponseBody	// Json 형태의 응답을 반환하도록 지정
	public String checkKakao(@RequestParam String email, @RequestParam String nickname, HttpSession session) {
		// 카카오에서 받아온 데이터 출력
		System.out.println("email : " + email + "name : " + nickname);
		
		// DB에서 리턴받아 판별
		// MemberService - idCheck()
		// 파라미터 : String(email -> member_id)		리턴타입 : int(idCheck)
		int idCheck = service.idCheck(email);
		
		// 카카오에서 전달받은 이메일 값으로 회원가입 여부 판별
		if (idCheck > 0) {
			// DB에 카카오에서 전달받은 이메일이 아이디로 존재할 때
			System.out.println("존재하는 회원");
			
			// 이미 가입된 회원이므로 세션에 유저의 아이디 저장
			session.setAttribute("member_id", email);
			return "existing";
		} else {
			// DB에 아이디가 존재하지 않는 경우 -> 회원가입으로 넘어가기
			return "new";
		}
		
	}
	
	// 3. 네이버 로그인 --------------------------------
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	// (1) 로그인 첫 화면 요청 메소드
	@RequestMapping(value="member_login_form", method = {RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {
		
		/* 네이버 아이디로 인증 URL 을 생성하기 위하여 naverLoginBO 클래스의 getAuthorizationUrl 메소드 호출  */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
	
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버 :" + naverAuthUrl);
		
		// 네이버
		model.addAttribute("url", naverAuthUrl);
		
		return "member/member_login_form";
	}
	
	// (2) 네이버 로그인 성공 시 callback 호출 메서드
	@RequestMapping(value = "/callback", method = {RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
		System.out.println("콘솔에 callback이 나타났습니당");
		
		OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
		
        // 1. 로그인 사용자 정보를 읽어온다. 
        apiResult = naverLoginBO.getUserProfile(oauthToken); // String 형식의 json 데이터 
        	
       // 2. String 형식인 apiResult 를 json 형태로 바꾼다. 
       JSONParser parser = new JSONParser();
       Object obj = parser.parse(apiResult);
       JSONObject jsonObj = (JSONObject) obj;
       
       // 3. 데이터 파싱 
       // TOP 레벨 단계 _resonse 파싱
       JSONObject response_obj = (JSONObject)jsonObj.get("response");
       // response 의 nickname 값 파싱
       String nickname = (String)response_obj.get("nickname");
       
       System.out.println(nickname);

       // 4. 파싱 닉네임을 세션에 저장
       session.setAttribute("sessionId", nickname); // 세션 생성
       
       model.addAttribute("result", apiResult);
       
       return "member/member_join_step2";
	}
	
	// (3) 로그아웃
	@RequestMapping(value="/logout", method = {RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session) throws IOException  {
		System.out.println("콘솔에 logout이 나타났습니당");
		session.invalidate();
		
		return "redirect:/";
	}
	
	//----------------------------------------------------
		
	// 이메일 정보가 있을 때 (회원임)
	
	// 이메일이 회원정보에 없을 때(회원 아님)
	// "아직 동백씨네마의 회원이 아닙니다. 회원가입 하시겠습니까?" => 회원가입 페이지로 넘어가기
//		return "member/member_join_step3";	// => 회원가입(3단계) 정보입력창으로 가기
		
	
	// 로그아웃 작업 후 메인으로 돌아가기
	@GetMapping("member_logout")
	public String member_logout(HttpSession session) {
		// 세션에 저장한 member_id(저장한 정보들) 초기화
		session.invalidate();
		
		// 세션 초기화 후 main 화면으로 돌아가기
		return "redirect:/";
	}
	
	// 메인화면에서 회원가입 화면 1페이지로 이동
	@GetMapping("member_join_step1")
	public String member_join_step1() {
		return "member/member_join_step1";
	}
	
	// 회원가입 화면 1페이지에서 휴대폰 인증 클릭 시 이동
	@GetMapping("member_join_certify")
	public String member_join_certify() {
		return "member/member_join_certify";
	}
	
	// 회원가입 화면 1 인증 성공, 네이버/카카오 인증 성공하면 회원가입 화면 2페이지로 이동
	@RequestMapping(value = "/member_join_step2", method = {RequestMethod.GET, RequestMethod.POST})
	public String member_join_step2(MemberVO member, Model model) {
//		System.out.println(member);
		
		// 약관 동의 하는 페이지로 이동
		model.addAttribute("member", member);
		
		return "member/member_join_step2";
	}
	
	// 회원정보(member_phone, member_email, member_birth 등)을 가지고 정보입력(step3)로 이동
	@RequestMapping(value = "/member_join_step3", method = {RequestMethod.GET, RequestMethod.POST})
	public String member_join_step3(MemberVO member, Model model) {
		System.out.println(member);
		
		model.addAttribute("member", member);
		
		return "member/member_join_step3";
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
	
	

}


























