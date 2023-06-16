package com.itwillbs.dongbaekcinema.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.dongbaekcinema.vo.RoomVO;
import com.itwillbs.dongbaekcinema.mapper.ReservationMapper;
import com.itwillbs.dongbaekcinema.vo.TheaterVO;
import com.itwillbs.dongbaekcinema.vo.MovieVO;
import com.itwillbs.dongbaekcinema.vo.PlayVO;

@Service
public class ReservationService {

	@Autowired
	private ReservationMapper mapper;

	// 예매율순 영화 목록 조회 요청을 위한 getMovieList() 메서드 정의
	public List<MovieVO> getMovieListDescBookingRate() {
		System.out.println("ReservationService - getMovieList()");
				
		return mapper.selectMovieListDescBookinRate();
	}

	// 가나다순 영화 목록 조회 요청을 위한 getMovieList() 메서드 정의
	public List<MovieVO> getMovieListAscMovieName() {
		System.out.println("ReservationService - getMovieList()");
		
		return mapper.selectMovieListAscMovieName();
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
	
	// 극장 정보 조회를 위한 getTheater() 정의
	public TheaterVO getTheater(int theater_num) {
		System.out.println("ReservationService - getTheater()");
		
		return mapper.selectTheater(theater_num);
	}

	// 날짜 목록 조회를 위해 getPlayList() 정의
	public List<Map<String, Object>> getPlayList(int movie_num, int theater_num, String play_date) {
		System.out.println("ReservationService - getPlayList()");
		
		return mapper.selectPlayList(movie_num, theater_num, play_date);
	}

	// 상영관 목록 조회를 위해 roomList() 정의
	public List<RoomVO> getRoomList(int theater_num) {
		System.out.println("ReservationService -getRoomList()");
		
		return mapper.selectRoomList(theater_num);
	}

}
