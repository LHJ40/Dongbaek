package com.itwillbs.dongbaekcinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.dongbaekcinema.mapper.MemberMapper;
import com.itwillbs.dongbaekcinema.vo.MemberVO;
import com.itwillbs.dongbaekcinema.vo.PaymentVO;

@Service
public class MemberService {
	
	@Autowired
	private MemberMapper mapper;
	
	// 회원가입 폼 - 아이디 중복확인 메서드 
	public int idCheck(String member_id) {
		int cnt = mapper.idCheck(member_id);
		System.out.println("cnt : " + cnt);
		return cnt;
	}
	
	// 회원 가입 
	public int registMember(MemberVO member) {
		return mapper.insertMember(member);
	}
	
	// 로그인 작업
	public String getPasswd(MemberVO member_id) {
		// 받아온 member_id로 회원 정보 조회 후 그 회원의 member_pass 리턴
		return mapper.selectPasswd(member_id);
	}
	
	// 회원 정보 조회 요청을 위한 메서드
	public MemberVO getMember(String member_id) {
		return mapper.selectMember(member_id);
	}

	// 회원 목록 조회 요청을 위한 메서드
	public List<MemberVO> getMemberList() {
		return mapper.selectMemberList();
	}
	
	// 비회원 로그인(가입) 작업을 위한 메서드
	public int noMemberLogin(MemberVO noMember) {
		return mapper.insertNoMember(noMember);
	}
	
	// 비회원 로그인(정보조회) 작업을 위한 메서드
	public String getNoMemberPasswd(String member_name, String member_phone) {
		return mapper.selectNoMemberPasswd(member_name, member_phone);
	}
	
	//페이징처리 테스트 -0616정의효
	public List<MemberVO> getMemberList(int pageNo, int pageSize) {
		int start = (pageNo - 1) * pageSize;
		return mapper.getMemberList(start, pageSize);
	}

	//페이징처리 테스트 -0616정의효
	public int getTotalPageCount(int pageSize) {
		int totalCount = mapper.getCount();
		return (int) Math.ceil((double) totalCount / pageSize);
	}

	// 0619정의효 멤버 등급 변경
	public void changeMemberGrade(String grade_name, String member_id) {
		mapper.changeMemberGrade(grade_name, member_id);
	}

	// 0619정의효 멤버 상태 변경
	public void changeMemberStatus(String member_status, String member_id) {
		mapper.changeMemberStatus(member_status, member_id);
	}

	// 0619정의효 멤버 삭제
	public void memberDelete(String member_id) {
		mapper.memberDelete(member_id);
		
	}
	
	// 회원정보 비밀번호 수정
	public int modifyMember(MemberVO member) {
		
		return mapper.updateMemeber(member);
	}

	// 아이디 찾기
	public String findId(String member_name, String member_phone) {

		return mapper.findMemberId(member_name, member_phone);
	}


	


	

	









}
