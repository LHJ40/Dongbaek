package com.itwillbs.dongbaekcinema.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.itwillbs.dongbaekcinema.vo.*;

@Mapper
public interface CsMapper {
	
	// cs게시판 중 Faq 레코드 조회(지영)
	List<CsVO> selectCsFaq(String cs_type);
	
}
