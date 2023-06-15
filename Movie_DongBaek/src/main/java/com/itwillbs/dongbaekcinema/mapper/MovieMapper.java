package com.itwillbs.dongbaekcinema.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.dongbaekcinema.vo.MovieVO;

@Mapper
public interface MovieMapper {

	
	int insertMovie(MovieVO movie);

	// 영화 정보 조회
	MovieVO selectMovie(int movie_num);
	
	// 영화 목록 조회 - 현재상영작
	List<MovieVO> select_presentMovie();


	
	// 영화 목록 조회 - 상영예정작
	List<MovieVO> select_prepareMovie();

	// 영화 정보 모두 조회
	List<MovieVO> selectMovieList();
}
