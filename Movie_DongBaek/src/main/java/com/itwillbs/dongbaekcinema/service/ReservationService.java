package com.itwillbs.dongbaekcinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.dongbaekcinema.mapper.ReservationMapper;
import com.itwillbs.dongbaekcinema.vo.TheaterVO;
import com.itwillbs.dongbaekcinema.vo.MovieVO;

@Service
public class ReservationService {

	@Autowired
	private ReservationMapper mapper;

	// 영화 목록 조회 요청을 위한 getMovieList() 메서드 정의
	public List<MovieVO> getMovieList() {
		System.out.println("ReservationService - getMovieList()");
				
		return mapper.selectMovieList();
	}

	// 영화 정보 조회 요청을 위한 getMovieList() 메서드 정의
	public MovieVO getMovie(int movie_num) {
		System.out.println("ReservationService - getMovie()");
		
		return mapper.selectMovie(movie_num);
	}

	
	// 극장 목록 조회 요청을 위한 getTheaterList() 정의
	public List<TheaterVO> getTheaterList(int movie_num) {
		System.out.println("ReservationService - getTheaterList()");
		
		return mapper.selectTheaterList(movie_num);
	}

}
