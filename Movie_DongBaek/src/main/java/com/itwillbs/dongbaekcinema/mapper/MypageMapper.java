package com.itwillbs.dongbaekcinema.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.itwillbs.dongbaekcinema.vo.*;
import com.itwillbs.dongbaekcinema.voNew.*;

@Mapper
public interface MypageMapper {
	
	
	// 나의 예매내역 조회 - 회원 아이디로 레코드 조회
	List<MyTicketVO> selectMyTicket(String member_id);

	// 나의 개인정보 조회  - 회원 아이디로 레코드 조회
	List<MemberVO> getMyInfoList(String member_id);
	
	// 나의 멤버십 등급 조회 - 회원 아이디로 레코드 조회
	GradeNextVO selectMyGrade(String member_id);

	// 나의 문의 내역 조회 - 회원 아이디로 레코드 조회
	List<CsVO> selectMyInq(String member_id);

	// 나의 개인정보 수정 - 회원 아이디로 조회하여 업데이
	int updateMyInfo(String member_id);

	//
	String selectMyPasswd(String member_id);
	
	
}
