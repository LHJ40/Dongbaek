package com.itwillbs.dongbaekcinema.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.dongbaekcinema.mapper.MemberMapper;
import com.itwillbs.dongbaekcinema.vo.MemberVO;

@Service
public class MemberService {
	
	@Autowired
	private MemberMapper mapper;
	

	// 회원 정보 조회 요청을 위한 메서드
	public MemberVO getMember(String id) {
		return mapper.selectStudent(id);
	}

}
