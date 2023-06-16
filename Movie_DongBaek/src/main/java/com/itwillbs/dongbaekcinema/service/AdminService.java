package com.itwillbs.dongbaekcinema.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.dongbaekcinema.mapper.AdminMapper;
import com.itwillbs.dongbaekcinema.vo.MovieVO;
import com.itwillbs.dongbaekcinema.vo.PlayVO;

@Service
public class AdminService {

    @Autowired
    private AdminMapper mapper;

    // 영화관 정보 불러오기
	public List<HashMap<String, String>> getTheater() {
		System.out.println("AdminService - getTheater()");
		
		return mapper.getTeater();
	}
    
    
    // 상단 확인 버튼 클릭 시 상영 목록 검색
    public List<PlayVO> showSchedual(String theater_num, String play_date, int pageNo) {
    	System.out.println("AdminService - showSchedual()");
    	System.out.println(theater_num + ", " + play_date);
        return mapper.selectScheduleList(theater_num, play_date, pageNo);
    }

    // 상단 확인 버튼 클릭 시 셀렉트박스에서 선택가능한 영화 목록 조회
	public List<MovieVO> findMovieList(String play_date) {
		
		return mapper.findMovieList(play_date);
	}



}
