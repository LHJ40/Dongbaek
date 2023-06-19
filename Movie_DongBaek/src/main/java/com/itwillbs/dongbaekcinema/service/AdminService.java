package com.itwillbs.dongbaekcinema.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.io.File;
import java.io.IOException;
import java.util.UUID;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.ServletContext;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

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
    

	// 파일 경로 저장 변수 선언
	private String realPath;

	@Autowired
	public void getRealPath(ServletContext servletContext) {
	    this.realPath = servletContext.getRealPath("/WEB-INF/views/upload");
	}
	// 실제 경로: C:\\java\\workspace_sts\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Movie_DongBaek\\WEB-INF\\views\\upload   
    

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
	public List<CsInfoVO> getCsList(int pageNo, int pageSize, int startRow, int csType) {
	
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
    
    
	// 관리자 공지사항, 자주묻는 질문 글쓰기 등록
	public int registCs(int csType, CsInfoVO csInfo, MultipartFile files) {
		
		// CS 게시판 구분용 contiodion 변수
		String condition = distinctType(csType);
	
		// 글쓰기 등록 전 cs_type_list_num 카운트
		csInfo.setCs_type_list_num(mapper.countCsTypeListNum(condition) + 1); // 가장 많은 번호 + 1

		if(files != null) { // 파일이 첨부된 상태
			
			// 파일명 저장		
			String cs_file = files.getOriginalFilename();
			// 실제 파일명 저장
			String cs_file_real = saveFile(files);

			
			System.out.println("registCs - csInfo :" + csInfo + "condition :" + condition + "cs_file_real :" + cs_file_real + "cs_file :" + cs_file);
			
			if(cs_file != null) { // 파일 저장 성공
				System.out.println("공지사항 파일 저장 성공");
				
				// DB에 글쓰기 저장
				return mapper.registCs(condition, csInfo, cs_file, cs_file_real);
				
				} else { // 파일 저장 실패
					System.out.println("공지사항 파일 저장 실패");
					return 0;
				}
			
			} else { // 파일이 첨부되지 않은 상태
			System.out.println("공지사항 파일 미첨부");
			
			// 파일 미첨부시 이름에 "" 등록
			String cs_file = "";
			String cs_file_real = "";
			
			System.out.println("registCs - csInfo :" + csInfo + "condition :" + condition + "cs_file_real :" + cs_file_real + "cs_file :" + cs_file);
			return mapper.registCs(condition, csInfo, cs_file, cs_file_real);
		}
	

	}
    
	
	// CS 공지, 자주묻는 질문 게시판 글수정
	public int updateCs(int csType, CsInfoVO csInfo, MultipartFile files) {
		
		// CS 게시판 구분용 contiodion 변수(1: 공지사항, 2: 자주묻는 질문 게시판)
		String condition = distinctType(csType);
		

		if(files != null) { // 파일이 첨부된 상태
			
			// 파일명 저장		
			String cs_file = files.getOriginalFilename();
			// 실제 파일명 저장
			String cs_file_real = saveFile(files);
			
			
			
			if(cs_file != null) { // 파일 저장 성공
				System.out.println("CS 공지, 자주묻는 질문 수정 파일 저장 성공");
				
				System.out.println("updateCs - csInfo :" + csInfo + ", condition :" + condition + ", cs_file_real :" + cs_file_real + ", cs_file :" + cs_file);
				// DB에 글쓰기 저장
				return mapper.updateCs(condition, csInfo, cs_file, cs_file_real);
				
			} else { // 파일 저장 실패
				System.out.println("CS 공지, 자주묻는 질문 수정 파일 저장 실패");
				
				return 0;
			}
			
		} else { // 파일이 첨부되지 않은 상태
			System.out.println("수정 파일 미첨부");
			
			// 파일 미첨부시 이름에 "" 등록
			String cs_file = "";
			String cs_file_real = "";
			
			System.out.println("updateCs(파일미첨부) - csInfo :" + csInfo + ", condition :" + condition + ", cs_file_real :" + cs_file_real + ", cs_file :" + cs_file);
			return mapper.updateCs(condition, csInfo, cs_file, cs_file_real);
		}
		
		
		
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
	
	


	
	// 파입 업로드를 위한 클래스
    private String saveFile(MultipartFile file){
        
        UUID uuid = UUID.randomUUID();
        String saveName = uuid + "_" + file.getOriginalFilename(); // 저장할 파일 이름 변수
        
        // 저장할 File 객체를 생성(껍데기 파일)
        File saveFile = new File(realPath, saveName); // 저장할 폴더 이름, 저장할 파일 이름
 
        try {
            file.transferTo(saveFile); // 업로드 파일에 saveFile이라는 껍데기 입힘
        } catch (IOException e) {
        	System.out.println("saveFile() 실패");
            e.printStackTrace();
            return null;
        }
 
        return saveName;
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
    }



}
