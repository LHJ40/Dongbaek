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
	
	// DB에 있는 id인지 판별
	public boolean isMember(String member_id) {
		// DB 작업 수행할 Mapper 객체의 메서드를 호출 해 SQL 구문 실행 요청
		// mapper에서 selectStudent()를 사용해 회원 여부를 확인 후 boolean 타입으로 return
		boolean isMember = false;
		
		MemberVO member = mapper.selectStudent(member_id);
		
		if (member != null) {
			// 존재하는 회원
			isMember = true;
		}
		return isMember;	// MemberController 로 리턴(존재하는 id, or Not)
	}
	
	// 아이디, 비밀번호 일치 판별 -> 로그인 성공여부
	public boolean isCorrectMember(String member_id, String member_pass) {
		boolean isCorrectMember = false;
		
		MemberVO member = mapper.CorrectMember(member_id, member_pass);
		
		if (member != null) {
			// 로그인 성공!
			isCorrectMember = true;
		}
		
		return isCorrectMember;	// MemberController로 리턴 (로그인 판별)
	}
	
	// 회원 가입을 위한 메서드
	public int joinMember(MemberVO member) {
		return mapper.joinMember(member);
	}
	
	
	// 회원 정보 조회 요청을 위한 메서드
	public MemberVO getMember(String member_id) {
		return mapper.selectStudent(member_id);
	}

	// 회원 목록 조회 요청을 위한 메서드
	public List<MemberVO> getMemberList() {
		return mapper.selectMemberList();
	}








}
