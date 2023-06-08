package com.itwillbs.dongbaekcinema.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.dongbaekcinema.vo.MemberVO;

//DAO대신 활용하는 MAPPER
//인터페이스 내의 추상메서드 이름은 XML 파일의 태그 ID 속성값과 동일하게 지정하기

@Mapper
public interface MemberMapper {

	MemberVO selectStudent(String id);

}
