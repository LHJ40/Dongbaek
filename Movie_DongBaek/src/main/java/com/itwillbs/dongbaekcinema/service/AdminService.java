package com.itwillbs.dongbaekcinema.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.dongbaekcinema.mapper.AdminMapper;
import com.itwillbs.dongbaekcinema.vo.PlayVO;

@Service
public class AdminService {

    @Autowired
    private AdminMapper mapper;

    // 상단 버튼 클릭 시 상영 목록 검색
    public List<PlayVO> showSchedual(String theater_name, String play_date) {
    	System.out.println("AdminService - showSchedual()");
    	System.out.println(theater_name + ", " + play_date);
        return mapper.selectScheduleList(theater_name, play_date);
    }

}
