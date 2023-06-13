package com.itwillbs.dongbaekcinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.dongbaekcinema.mapper.TheaterMapper;
import com.itwillbs.dongbaekcinema.vo.TheaterVO;

@Service
public class TheaterService {
	@Autowired 
	TheaterMapper mapper;
	public List<TheaterVO> getTheaterList() {
		// TODO Auto-generated method stub
		return mapper.selectTheaterList();
	}

}
