package com.itwillbs.dongbaekcinema.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.dongbaekcinema.vo.MovieVO;
import com.itwillbs.dongbaekcinema.vo.ReviewVO;

@Mapper
public interface MovieMapper {

	// 영화 등록 0620정의효
	int insertMovie(MovieVO movie);

	// 영화 정보 조회
	MovieVO selectMovie(int movie_num);
	
	// 영화 목록 조회 - 현재상영작
	List<MovieVO> select_presentMovie();

	// 영화 목록 조회 - 현재상영작 예매율 순 정렬
	List<MovieVO> select_presentMovie_bookingRateDESC();
	
	//영화 목록 조회 - 현재상영작 평점 순 정렬
	List<MovieVO> select_presentMovie_reviewRating();
	
	// 영화 목록 조회 - 상영예정작
	List<MovieVO> select_prepareMovie();
	
	// 영화 목록 조회 - 탑4(메인)
	List<MovieVO> select_movieListTop4();
	
	//-------------------------------------------
	// 리뷰 정보 조회
	ReviewVO selectReview(int movie_num);
	
	// 리뷰 개수 정보 조회
	ReviewVO selectReviewCounting(int movie_num);

	// 리뷰 목록 조회
	List<ReviewVO> selectReviewList(int movie_num);

	
	// 페이징처리
	
	
	//---------------------------------------------
	// 영화 정보 모두 조회 페이징처리로 필요없음 - 0616 정의효
	//	List<MovieVO> selectMovieList();

	// 페이징처리 0616 정의효
	List<MovieVO> getMovieList(@Param("start") int start, @Param("perPage") int pageSize);

	// 페이징처리 0616 정의효
	int getCount();



	
}
