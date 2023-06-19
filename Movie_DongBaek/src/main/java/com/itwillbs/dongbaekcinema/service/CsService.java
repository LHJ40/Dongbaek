package com.itwillbs.dongbaekcinema.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.itwillbs.dongbaekcinema.mapper.*;
import com.itwillbs.dongbaekcinema.vo.*;

@Service
public class CsService {

	@Autowired
	private CsMapper mapper;
	
	public CsVO getCsNotice() {
		// 
		return null;
	}
	
	// cs게시판 중 Faq 레코드 조회(지영)
	public List<CsVO> getCsFaq(String cs_type) {
		return mapper.selectCsFaq(cs_type);
	}
	
	
	
}
