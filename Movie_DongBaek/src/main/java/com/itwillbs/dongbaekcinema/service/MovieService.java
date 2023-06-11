package com.itwillbs.dongbaekcinema.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.dongbaekcinema.mapper.MovieMapper;
import com.itwillbs.dongbaekcinema.vo.MovieVO;

@Service
public class MovieService {

	@Autowired
	private MovieMapper mapper;
	
	// 영화 등록 요청 작업을 위한 registMovie() 메서드 정의
	public int registMovie(MovieVO movie) {
		return mapper.insertMovie(movie);
	}

}
