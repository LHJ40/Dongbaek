package com.itwillbs.dongbaekcinema.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.itwillbs.dongbaekcinema.mapper.*;
import com.itwillbs.dongbaekcinema.vo.*;
import com.itwillbs.dongbaekcinema.voNew.*;

@Service
public class MypageService {
	
	@Autowired
	private MypageMapper mapper;
	
	// 나의 예매내역 조회 - 회원 아이디로 레코드 조회
	public List<MyTicketVO> getMyTicket(String member_id) {
		return mapper.selectMyTicket(member_id);
	}

	
	
	
}
