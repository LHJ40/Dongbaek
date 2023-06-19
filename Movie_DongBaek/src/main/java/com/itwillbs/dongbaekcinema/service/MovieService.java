package com.itwillbs.dongbaekcinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.dongbaekcinema.mapper.MovieMapper;
import com.itwillbs.dongbaekcinema.vo.MovieVO;
import com.itwillbs.dongbaekcinema.vo.ReviewVO;
import com.itwillbs.dongbaekcinema.voNew.*;

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
	
	
	// 현재상영작 예매율순 영화목록 조회 요청 - 기본
	public List<MovieVO> getMovieList_present_bookrate(){
		System.out.println("getMovieList_present_bookrate()");
		return mapper.select_presentMovie_bookingRateDESC();
	}

	
	// 영화 목록 조회 요청을 위한 getMovieList_prepare() 메서드 정의 - 현재상영작
	public List<MovieVO> getMovieList_prepare() {
		System.out.println("getMovieList_prepare()");
		return mapper.select_prepareMovie();
	}
	
	// 메인페이지 탑4 영화목록 조회 요청
	public List<MovieVO> getMovieList_top4() {
		System.out.println("getMovieList_top4");
		return mapper.select_movieListTop4();
	}
	//------------------------------------------------------------------------------
	// 리뷰 정보 조회 요청을 위한 getReviewRating()메서드 정의
	// 파라미터:movie_num 리턴타입:ReviewVO 
	public ReviewVO getReview(int movie_num) {
		System.out.println("Service - getReview()");
		return mapper.selectReview(movie_num);
	}

	// 영화당 리뷰 개수정보 조회요청을 위한 getReviewCounting()메서드 정의
	// 파라미터 : movie_num, 리턴타입 : ReviewVO
	public ReviewVO getReviewCounting(int movie_num) {
		System.out.println("service-getReviewCounting");
		return mapper.selectReviewCounting(movie_num);
	}
	
	//리뷰 목록 조회요청 - getReviewList
	public List<ReviewVO> getReviewList(int movie_num) {
		System.out.println("Service - getReviewList()");
		return mapper.selectReviewList(movie_num);
	}
	
	
	//-------------------------------------------------------------------------
	// 페이징처리 - (movie페이지)

	
	
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
