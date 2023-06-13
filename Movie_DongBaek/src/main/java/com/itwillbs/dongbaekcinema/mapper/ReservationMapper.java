package com.itwillbs.dongbaekcinema.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.dongbaekcinema.vo.MovieVO;
import com.itwillbs.dongbaekcinema.vo.PlayVO;
import com.itwillbs.dongbaekcinema.vo.TheaterVO;

@Mapper
public interface ReservationMapper {
	
	// 영화 목록 조회(예매율 순)
	List<MovieVO> selectMovieListDescBookinRate();
	
	// 영화 목록 조회(가나다 순)
	List<MovieVO> selectMovieListAscMovieName();
	
	// 영화 정보 조회
	MovieVO selectMovie(int movie_num);

	// 극장 목록 조회
	List<TheaterVO> selectTheaterList(int movie_num);

	// 극장 정보 조회
	TheaterVO selectTheater(int theater_num);

	// 날짜 목록 조회
	List<PlayVO> selectPlayList(int movie_num, int theater_num);
}
