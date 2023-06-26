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
	public List<MyTicketVO> getMyTicket(String member_id, int startRow, int listLimit) {
		return mapper.selectMyTicket(member_id, startRow, listLimit);
	}

	// 나의 개인정보 조회  - 회원 아이디로 레코드 조회 , myPage_modify_form.jsp 
	public List<MemberVO> getMyInfo(String member_id) {
		return mapper.getMyInfoList(member_id);
	}
	
	// 나의 멤버십 등급 조회 - 회원 아이디로 레코드 조회
	public GradeNextVO getMyGrade(String member_id) {
		return mapper.selectMyGrade(member_id);
	}

	public List<CsVO> getMyInq(String member_id) {
		return mapper.selectMyInq(member_id);
	}

	// 개인정보수정 을 위한 비밀번호 확인 작업
	public String getPasswd(String member_id) {
		return mapper.selectMyPasswd(member_id);
	}

	// 개인정보 수정 
	public int updateMyInfo(MemberVO member, String member_pass, String member_email, String member_like_genre, String member_id) {
		return mapper.updateMyInfo(member, member_pass, member_email,member_like_genre, member_id);
	}

	// 회원 탈퇴
	public int memberwithdrawal(String member_id) {
		return mapper.memberwithdrawal(member_id);
	}

	// 나의 리뷰public List<ReviewVO> getMyReview(String member_id, int pageNum) {
//	public List<MyReviewVO> getMyReview(String member_id, int pageNum) {
	public List<ReviewVO> getMyReview(String member_id, int pageNum) {
		return mapper.selectMyReview(member_id, pageNum);
	}




	
	
	
}
