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
	public List<MovieVO> getMovieList_present_bookrate(int startRow, int listLimit){
		//		System.out.println("getMovieList_present_bookrate()");
		return mapper.select_presentMovie_bookingRateDESC(startRow, listLimit);
	}
	
	// 전체 글 목록 갯수 조회 요청 - 검색X
	public int getBoardListCount() {
		return mapper.selectBoardListCount();
	}
	
	
	
	
	
	// 현재상영작 평점순 영화목록 조회 요청
	public List<MovieVO> getMovieList_present_reviewrate(){
		System.out.println("getMovieList_present_reviewrate()");
		return mapper.select_presentMovie_reviewRate();
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
//	@Override
//	public List<MovieVO> getList(Criteria criteria){
//		System.out.println(criteria);
//		return mapper.getListWithPaging(criteria);
//	}
	
	
	// 영화 목록 전부 조회 페이징처리로 필요없음 - 0616정의효
//	public List<MovieVO> getMovieList() {
//		return mapper.selectMovieList();
//	}

	//페이징처리 - 0616 정의효
	public List<MovieVO> getMovieList(int pageNo, int pageListLimit) {
		int start = (pageNo - 1) * pageListLimit;
		return mapper.getMovieList(start, pageListLimit);
	}


	//페이징처리 - 0616 정의효
	public int getTotalPageCount(int pageListLimit) {
		int totalCount = mapper.getCount();
		return (int) Math.ceil((double) totalCount / pageListLimit);
	}

	//영화삭제 - 0620정의효
	public void movieDelete(String movie_num) {
		mapper.movieDelete(movie_num);
	}

	//영화수정 - 0620정의효 작성중
	public void movieModify(MovieVO movie) {
		 mapper.movieModify(movie);
	}




}
