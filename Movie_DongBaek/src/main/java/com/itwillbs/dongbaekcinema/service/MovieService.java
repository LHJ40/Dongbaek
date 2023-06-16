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
	

	// 영화 정보 조회 요청을 위한 getMovieList() 메서드 정의 -(0613+정의효 
	public MovieVO getMovie(int movie_num) {
		System.out.println(movie_num);
		return mapper.selectMovie(movie_num);
	}
	
	
	// 영화 목록 조회 요청을 위한 getMovieList() 메서드 정의 - 현재상영작
	public List<MovieVO> getMovieList_present() {
		System.out.println("getMovieList_present()");
		return mapper.select_presentMovie();
	}
	
	// 현재상영작 예매율순 영화목록 조회 요청 
	public List<MovieVO> getMovieList_present_bookrate(){
		System.out.println("getMovieList_present_bookrate()");
		return mapper.select_presentMovie_bookingRateDESC();
	}

	
	
	
	// 영화 목록 전부 조회 페이징처리로 필요없음 - 0616정의효
//	public List<MovieVO> getMovieList() {
//		return mapper.selectMovieList();
//	}

	//페이징처리 - 0616 정의효
	public List<MovieVO> getMovieList(int pageNo, int pageSize) {
		int start = (pageNo - 1) * pageSize;
		return mapper.getMovieList(start, pageSize);
	}


	//페이징처리 - 0616 정의효
	public int getTotalPageCount(int pageSize) {
		int totalCount = mapper.getCount();
		return (int) Math.ceil((double) totalCount / pageSize);
	}

	
	
	
	
	//영화목록조회  - 현재상영작? select_presentMovie
	//영화목록조회  - 상영예정작? select_prepareMovie

}
