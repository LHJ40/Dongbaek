package com.itwillbs.dongbaekcinema.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.dongbaekcinema.mapper.AdminMapper;
import com.itwillbs.dongbaekcinema.vo.CsVO;
import com.itwillbs.dongbaekcinema.vo.MovieVO;
import com.itwillbs.dongbaekcinema.vo.PlayVO;
import com.itwillbs.dongbaekcinema.voNew.CsInfoVO;
import com.itwillbs.dongbaekcinema.voNew.PlayScheduleVO;

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

	// 영화목록 셀렉트 박스 클릭 시 DB에서 회차 생성 관련 정보 가져오기
	public List<PlayScheduleVO> createTurn(int theater_num, int movie_num, int pageNo) {
		
		List<PlayScheduleVO> playScheduleList =  mapper.getTurnInfo(theater_num, movie_num, pageNo);
		
		int index = 1;
		// 리턴받은 상영스케줄 회차 정보가 없을 경우 회차 번호 생성
		for(PlayScheduleVO playSchedule : playScheduleList) {
			System.out.println("playSchedule" + index + " : "+ playSchedule);	
//			if(playSchedule.getPlay_turn() == ""){ // 회차 정보가 없는 경우
//				playSchedule.setPlay_turn(index);
//			}
			
			// 새로운 회차 정보 넣기
			
			index++; // 인덱스값 +1
		}
		
		
		
		return playScheduleList;
	}


	private void getTurnInfo(int theater_num, int movie_num, int pageNo) {
		// TODO Auto-generated method stub
		
	}

	
    // CS 게시판 목록 가져오기
	public List<CsVO> getCsList(int pageNo, int pageSize, int startRow, int csType) {
	
		// CS 게시판 구분용 contiodion 변수
		String condition = distinctType(csType);
		
//		System.out.println("getCsNoticeList - startPage, pageSize, condition:" + startRow + pageSize + condition);
		// 목록 시작지점 지정
		return mapper.getCsWithPaging(startRow, pageSize, condition);
	}
	
	// CS게시판 총 필요한 페이지 개수 가져오기
    public int getCsTotalPageCount(int pageSize, int csType) {

		// CS 게시판 구분용 contiodion 변수
		String condition = distinctType(csType);
		
		
        int totalCount = mapper.getCsCount(condition);
        
//        System.out.println("getCsTotalPageCount pageSize:" + pageSize + "csType:" + csType + "condition" + condition + "totalCount" + totalCount);
        return (int) Math.ceil((double) totalCount / pageSize);
    }


    // CS게시판 1:1 질문 관리 답변 화면 정보 가져오기
	public CsInfoVO getCsInfo(int csType, int cs_type_list_num) {
		
		// CS 게시판 구분용 contiodion 변수
		String condition = distinctType(csType);
		
		
		return mapper.getCsInfo(condition, cs_type_list_num);
	}

	// CS게시판 1:1 질문 관리 답변 등록
	public int quaReply(int csType, CsInfoVO qnaInfo) {
		
		// CS 게시판 구분용 contiodion 변수
		String condition = distinctType(csType);
		
		return mapper.updateReply(condition, qnaInfo);
	}
	
	
	
	// CS 게시판 구분용 메서드 모듈
	public String distinctType(int csType) {
		
		String condition = ""; // 조건절 변수명
		// csType 변수명에 따라 Cs게시판 목록 가져오기
		if(csType == 1) {
			condition = "'공지'"; 
		} else if(csType == 2) {
			condition = "'영화정보문의', '회원 문의', '예매 결제 관련 문의', '일반 문의'";
		} else if(csType == 3) {
			condition = "'예매','멤버십','결제수단','극장','할인혜택'";
		}
		
		return condition;
	};


}
