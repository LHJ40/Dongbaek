package com.itwillbs.dongbaekcinema.controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.http.*;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.*;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.itwillbs.dongbaekcinema.handler.MyPasswordEncoder;
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
	// => 패스워드 암호화 기능(BCryptPasswordEncoder 활용)
	@PostMapping("member_join_pro")
	public String joinPro(MemberVO member, HttpSession session,  Model model) {
		System.out.println(member);
		
		// 패스워드 암호화(해싱)--------------
		// => MyPasswordEncoder  클래스에 덮어쓰기
		MyPasswordEncoder passwordEncoder = new MyPasswordEncoder();
		
		// 2. getCtyptoPassword() 메서드에 평문 전달하며 암호문 얻어오기
		String securePasswd = passwordEncoder.getCryptoPasswd(member.getMember_pass());
		
		// 3. 리턴받은 암호문을 MemberVO 객체에 덮어쓰기
		member.setMember_pass(securePasswd);
		// --------------------------------------
		
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
				HttpSession session, HttpServletResponse response, Model model) {
		
		// 1. 일반 로그인 시도
		// MemberService - getPasswd()
		// member 테이블에서 id가 일치하는 레코드의 패스워드(passwd) 조회
		// 파라미터 : MemberVO member	리턴타입 : String(passwd)
//		String passwd = service.getPasswd(member);
//		MemberVO getMember = service.getMember(member.getMember_id());
		
		// BcryptPasswordEncoder 객체를 활요한 로그인(해싱된 암호 필요)-----------------
//		String passwd = getMember.getMember_pass();
//		System.out.println(passwd);
		// 1. MemberService - getPasswd() 메서드를 호출하여 
		// member 테이블에서 id 가 일치하는 레코드 패스워드 조회 요청
		// => 파라미터 : memberVO 객체		리턴타입 : String securePasswd
		String securePasswd = service.getPasswd(member);
			System.out.println(securePasswd);
			System.out.println(member.getMember_pass());
		
		// 2. BcryptPasswordEncoder 객체 생성
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		// 3. BcryptPasswordEncoder 객체의 matches() 메서드 호출해서 암호 비교
		// => 파라미터 : 평문, 암호화 된 암호 		리턴타입 : boolean
		// 로그인 성공/ 실패 여부 판별하여 포워딩
		// => 성공 : MemberVO 객체에 데이터가 저장되어 있고 입력받은 패스워드가 같음
		// => 실패 : MemberVO 객체가 null 이거나 입력받은 패스워드와 다름
		
		System.out.println("securePasswd : " + securePasswd);

		if(member.getMember_id() == null) {		
			// 아이디로 조회 시 없는 아이디일 때
			model.addAttribute("msg", "없는 아이디 입니다. "
					+ "입력하신 내용을 다시 확인해주세요.");
			return "fail_back";
		} else if (member.getMember_pass() ==  null || !passwordEncoder.matches(member.getMember_pass(), securePasswd)) {
			// 패스워드가 member.getPasswd와 다를 때(비밀번호가 틀림)
			model.addAttribute("msg", "아이디 또는 비밀번호를 잘못 입력했습니다. "
					+ "입력하신 내용을 다시 확인해주세요.");
			return "fail_back";
		} else {
			// 로그인 성공 시
			// 세션에 값 넣기
			session.setAttribute("member_id", member.getMember_id());
			session.setAttribute("member_type", member.getMember_type());
			
			// 만약, "아이디 저장" 체크박스 버튼이 눌려진 경우 cookie에 member_id 저장
//			Cookie cookie = new Cookie("member_id", member.getMember_id());
			Cookie cookie = new Cookie("member_id", member.getMember_id());
			
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
			
			// 만약, 다른 작업을 하다 로그인을 해야할 때
			// 세션에 선택된 값, 다음으로 이동할 값을 저장해서 로그인 성공 시 세션에 저장된 주소("url")로 이동
			if(session.getAttribute("url") != null) {
				// 세션에 url이라는 이름을 가진 속성이 있으면 
				// model에 값 넣어("msg") 원하는 주소로 이동("targetURL")
				model.addAttribute("targetURL", session.getAttribute("url"));
				return "success_forward";
			}
			
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
	
	// 비회원 로그인(가입) 작업
	@PostMapping("no_member_login_pro")
	public String no_member_login_pro(MemberVO noMember, Model model, HttpSession session) {
		
		// 비회원 로그인 작업 
		// MemberService - noMemberLogin()
		// 파라미터 : MemberVO(noMember)	리턴타입 : int(insertCount)
		int insertCount = service.noMemberLogin(noMember);
		System.out.println(insertCount);
		// 비회원 로그인(가입) 성공 시 success_back으로 이동
		if(insertCount > 0) {
			session.setAttribute("member_id", noMember.getMember_name()); // name으로 불리게 하기
			session.setAttribute("member_type", "비회원");
			// 나중에 작업하던 곳으로 돌아가게 설정하기
//			model.addAttribute("url", "/");
//			model.addAttribute("msg", "비회원 로그인 성공!");
			
//			return "success_back";
			return "redirect:/./";
		} else {
			// 로그인 실패 시 "로그인에 실패했습니다." 띄우고 이전 페이지로 돌아가기
			model.addAttribute("msg", "로그인에 실패했습니다.");
			
			return "fail_back";
		}
		
	}

	// 회원 로그인 화면에서 상단 탭(header)의  비회훤 예매 확인 탭 클릭 시 비회원 예매 확인 페이지로 이동
	@GetMapping("no_member_reservation_check_form")
	public String no_member_reservation_check_form() {
		
		return "member/no_member_reservation_check_form";
	}
	
	// 비회원 예매 확인을 위한 로그인
	@PostMapping("noMemberCheckPro")
	public String no_member_reservation_check_pro(String member_name, String member_phone, String member_pass
					, Model model, HttpSession session) {
		
		// 이름, 휴대폰번호, 비밀번호를 받아 맞는 레코드 조회
		// MemberService - getNoMemberPasswd()
		// 파라미터 : String 파라미터 두 개(member_name, member_phone)	리턴타입 : String(passwd)
		String passwd = service.getNoMemberPasswd(member_name, member_phone);
		System.out.println(passwd);
		
		if (passwd == null || !passwd.equals(member_pass)) {	// 가져오는 비밀번호가 없음
			
			model.addAttribute("msg", "회원이 아니거나 비밀번호가 틀립니다. 다시 한 번 정보를 확인해주세요.");
			return "fail_back";
			
		} else  {	// 비밀번호 일치 -> 로그인 성공
			session.setAttribute("member_id", member_name);
			// 세션에 "member_type"로 저장해서 비회원의 경우 권한 제한
			session.setAttribute("member_type", "비회원");
			// 마이페이지 홈으로 이동
			return "myPage/myPage";
		} 
		
	}
	
	
	@GetMapping("MemberModifyForm")
	public String modifyForm() {
		return "member/NewFile";
	}
	
	@PostMapping("MemberModify")
	public String modifyPro(MemberVO member, HttpSession session, Model model) {
		
		
		// 패스워드 암호화(해싱)--------------
		// => MyPasswordEncoder  클래스에 덮어쓰기
		MyPasswordEncoder passwordEncoder = new MyPasswordEncoder();
		
		// 2. getCtyptoPassword() 메서드에 평문 전달하며 암호문 얻어오기
		String securePasswd = passwordEncoder.getCryptoPasswd(member.getMember_pass());
		
		// 3. 리턴받은 암호문을 MemberVO 객체에 덮어쓰기
		member.setMember_pass(securePasswd);
		// --------------------------------------
		
		// MemberService(registMember()) - MemberMapper(insertMember())
		int updateCount = service.modifyMember(member);
		
		if (updateCount > 0) {
			model.addAttribute("msg", "회원 정보 수정 성공!");
			model.addAttribute("targetURL", "MemberModifyForm");
			
			return "success_forward";
		} else {
			model.addAttribute("msg", "회원 정보 수정 실패!");
			model.addAttribute("targetURL", "MemberModifyForm");
			
			return "fail_location";
		}
		
		// 일반 회원이 패스워드가 일치하거나, 관리자일 때
		// MemberService - modifyMember() 메서드 호출하여 회원 정보 수정 요청
		// => 단, 관리자일 때  
		// => 파라미터 : MemberVO 객체, 새 패스워드(newPasswd)
		// => 추가) BCryptPasswordEncoder 를 활용하여 새 패스워드 암호화
//		service.modifyMember(member, newPasswd);
		
		// "회원 정보 수정 성공!" 메세지 출력 및 "MemberInfo" 서블릿 리다이렉트를 위해 데이터 저장 후
		// success_forward.jsp 페이지로 포워딩
		
		
		
	}
	
	
	
	
}


























