package com.itwillbs.dongbaekcinema.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.dongbaekcinema.vo.MemberVO;

//DAO대신 활용하는 MAPPER
//인터페이스 내의 추상메서드 이름은 XML 파일의 태그 ID 속성값과 동일하게 지정하기

@Mapper
public interface MemberMapper {
	
	// 회원 가입 
	int insertMember(MemberVO member);
	
	// 로그인 작업 (id로 조회, passwd받아오기)
	String selectPasswd(MemberVO member_id);

	// 회원 정보 조회 id로 구별
	MemberVO selectMember(String member_id);
	
	// 회원 목록 조회 
	List<MemberVO> selectMemberList();

	// 아이디 중복 체크 (카카오 로그인에서도 사용 - 값이 있으면 > 0)
	int idCheck(String member_id);
	
	// 페이징처리중 - 0616 정의효
	List<MemberVO> getMemberList(@Param("start") int start, @Param("perPage") int pageSize);
	
	// 페이징처리중 - 0616 정의효
	int getCount();


	


	
}
