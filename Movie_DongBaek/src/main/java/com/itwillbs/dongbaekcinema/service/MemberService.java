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

	









}
