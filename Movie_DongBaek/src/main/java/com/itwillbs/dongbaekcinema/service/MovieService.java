package com.itwillbs.dongbaekcinema.service;

import java.util.List;

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
	

	// 영화 정보 조회 요청을 위한 getMovieList() 메서드 정의
	public MovieVO getMovie(int movie_num) {
		System.out.println("ReservationService - getMovie()");
		
		return mapper.selectMovie(movie_num);
	}
	
	
	// 영화 목록 조회 요청을 위한 getMovieList() 메서드 정의 - 현재상영작? select_presentMovie
	public List<MovieVO> getMovieList() {
		System.out.println("ReservationService - getMovieList()");
				
		return mapper.select_presentMovie();
	}
	
	//영화목록조회  - 상영예정작? select_prepareMovie
	
	
	//영화목록조회  - 현재상영작? select_presentMovie
	//영화목록조회  - 상영예정작? select_prepareMovie

}
