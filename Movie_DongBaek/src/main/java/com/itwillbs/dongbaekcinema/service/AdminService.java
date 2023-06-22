package com.itwillbs.dongbaekcinema.service;

import java.io.File;
import java.io.IOException;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.dongbaekcinema.mapper.AdminMapper;
import com.itwillbs.dongbaekcinema.vo.MovieVO;
import com.itwillbs.dongbaekcinema.voNew.*;

@Service
public class AdminService {

    @Autowired
    private AdminMapper mapper;
    
    @Autowired
    private HttpSession session;
    
    @Autowired
    private PayService payService;


    // 영화관 정보 불러오기
	public List<HashMap<String, String>> getTheater() {
		System.out.println("AdminService - getTheater()");
		
		return mapper.getTeater();
	}
    
    
    // 상단 확인 버튼 클릭 시 상영 목록 검색
    public List<PlayScheduleVO> showSchedual(String theater_num, String play_date, int pageNo) {
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

	// 영화관 번호로 상영관 번호와 이름 가져오기
	public List<PlayScheduleVO> getRoomInfo(String theater_num) {
		
		return mapper.getRoom(theater_num);
	}

	// 특정 날짜에 상영관 스케줄이 등록되어있는지 확인
	public int checkSchedule(String play_date, int theater_num, int room_num) {
		
		return mapper.checkSchedule(play_date, theater_num, room_num);
	}
	
	// 특정 날짜의 영화관의 상영관별 상영 스케줄 삭제
	public int deleteSchedule(String play_date, int theater_num, int room_num) {
		
		return mapper.deleteSchedule(play_date, theater_num, room_num);
	}

	// 특정 날짜의 상영관 스케줄 등록
	public int insertSchedule(String play_date, int theater_num, int room_num, int movie_num) {
		int insertCount = 0;
		
		Date date = new Date();
		// play_date를 LocalDate 형식으로 변환
        LocalDate localDate = LocalDate.parse(play_date, DateTimeFormatter.ISO_DATE);
        Date targetDate = java.sql.Date.valueOf(localDate);
        System.out.println(date);
                
        // 현재 날짜를 생성
        Date currentDate = new Date();

        // before() 메서드로 날짜 비교
        if (targetDate.after(currentDate)) {
        	// 등록 날짜가 오늘 보다 미래일 경우에만 등록 가능 (return>1)
            System.out.println("insertSchedule - 주어진 날짜가 오늘보다 이후입니다.");
            
            // 상영회차 정보 생성을 위해 영화 상영정보 가져오기(movie_running_time)
            int movie_running_time = mapper.findMovieRunningTime(movie_num);
            
            // 상영회차 정보 생성을 위해 상영관 시작시간 종료시간 가져오기(room_start_time)
            PlayScheduleVO playSchedule = mapper.getRoomStartTime(theater_num, room_num);
            
            
            // 회차 정보 생성을 위한 계산
            System.out.println("영화러닝타임:" + movie_running_time + " 과 상영관 시작시간:" + playSchedule.getRoom_start_time());
            
            // 쉬는 시간 변수
            int breakTime = 60;

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");

            // 새로운 배열 생성
            LocalTime startDateTime1 = LocalTime.parse(playSchedule.getRoom_start_time(), formatter);
            LocalTime endDateTime1 = startDateTime1.plusMinutes(movie_running_time);

            String[] new_start_turn = new String[5];
            String[] new_end_turn = new String[5];
            String[] play_time_type = new String[5];

            for (int i = 0; i < 5; i++) {
                if (i == 0) {
                    // 첫 번째 회차
                    new_start_turn[i] = startDateTime1.format(formatter);
                    new_end_turn[i] = endDateTime1.format(formatter);
                } else {
                    // 나머지 회차
                    LocalTime previousEndDateTime = LocalTime.parse(new_end_turn[i - 1], formatter);
                    LocalTime breakStartDateTime = previousEndDateTime.plusMinutes(breakTime);
                    LocalTime startDateTime = breakStartDateTime.plusMinutes(30);
                    LocalTime endDateTime = startDateTime.plusMinutes(movie_running_time);

                    new_start_turn[i] = startDateTime.format(formatter);
                    new_end_turn[i] = endDateTime.format(formatter);
                }

                // play_time_type 설정
                LocalTime startTime = LocalTime.parse(new_start_turn[i], formatter);

                if (startTime.isBefore(LocalTime.parse("09:00:00", formatter))) {
                    play_time_type[i] = "조조";
                } else if (startTime.isAfter(LocalTime.parse("22:00:00", formatter))) {
                    play_time_type[i] = "심야";
                } else {
                    play_time_type[i] = "일반";
                }
            }

            // 출력(1~5회차 등록)
            for (int i = 0; i < new_start_turn.length; i++) {
                System.out.println("New Start Time [" + i + "]: " + new_start_turn[i]);
                System.out.println("New End Time [" + i + "]: " + new_end_turn[i]);
                System.out.println("Play Time Type [" + i + "]: " + play_time_type[i]);
                int play_turn = i + 1;

                insertCount += mapper.insertSchedule(play_date, theater_num, room_num, movie_num, new_start_turn[i], new_end_turn[i], play_turn, play_time_type[i]);
            }

            
            
            // 제대로 등록될 경우 insertCount=5
            System.out.println("상영 스케줄 등록:" + insertCount);
            return insertCount;
        } else {
        	
        	// 등록 날짜가 오늘 보다 과거일 경우 (return=0)
            System.out.println("insertSchedule - 주어진 날짜가 오늘과 같거나 이전입니다.");
            
            return 0;
        }
		

	}
	
	

	
    // CS 게시판 목록 가져오기
	public List<CsInfoVO> getCsList(int pageNo, int pageListLimit, int startRow, int csType) {
	
		// CS 게시판 구분용 contiodion 변수
		String condition = distinctType(csType);
		
//		System.out.println("getCsNoticeList - startPage, pageListLimit, condition:" + startRow + pageListLimit + condition);
		// 목록 시작지점 지정
		return mapper.getCsWithPaging(startRow, pageListLimit, condition);
	}
	
	// CS게시판 총 목록 갯수 가져오기
    public int getCsTotalPageCount(int pageListLimit, int csType) {

		// CS 게시판 구분용 contiodion 변수(csType=1일경우 공지사항, cstype=2일경우 1:1질문 게시판, cstype=3경우 자주묻는 질문)
		String condition = distinctType(csType);
		
        
//        System.out.println("getCsTotalPageCount pageListLimit:" + pageListLimit + "csType:" + csType + "condition" + condition + "totalCount" + totalCount);
        return mapper.getCsCount(condition);
    }
    
    
	// 관리자 공지사항, 자주묻는 질문 글쓰기 등록
	public int registCs(int csType, CsInfoVO csInfo, MultipartFile files) {
		
		// CS 게시판 구분용 contiodion 변수
		String condition = distinctType(csType);
	
		// 글쓰기 등록 전 cs_type_list_num 카운트
		csInfo.setCs_type_list_num(mapper.countCsTypeListNum(condition) + 1); // 가장 많은 번호 + 1

		if(files.getOriginalFilename() != "") { // 파일이 첨부된 상태
			
			// 파일명 저장		
			String cs_file = files.getOriginalFilename();
			// 실제 파일명 저장
			String cs_file_real = saveFile(files);

			
			
			if(cs_file != "") { // 파일 저장 성공
				System.out.println("공지사항 파일 저장 성공");
				System.out.println("registCs - csInfo :" + csInfo + "condition :" + condition + "cs_file_real :" + cs_file_real + "cs_file :" + cs_file);
				
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
		

		if(files.getOriginalFilename() != "") { // 파일이 첨부된 상태
			
			// 파일명 저장		
			String cs_file = files.getOriginalFilename();
			// 실제 파일명 저장
			String cs_file_real = saveFile(files);
			
			
			
			if(cs_file != "") { // 파일 저장 성공
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
    
	// CS게시판 공지사항, 자주묻는 질문 삭제
	public int deleteCs(int csType, int cs_type_list_num) {

		// CS 게시판 구분용 contiodion 변수
		String condition = distinctType(csType);
		
		System.out.println("deleteCs_service condition:" + condition + ", cs_type_list_num :" + cs_type_list_num);

		return mapper.deleteCs(condition, cs_type_list_num);
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
    public String saveFile(MultipartFile file){
    	// 실제 파일 경로 저장
    	
    	
    	String saveDir = session.getServletContext().getRealPath("/resources/upload");

        String uuid = UUID.randomUUID().toString();
        String saveName = uuid + "_" + file.getOriginalFilename(); // 저장할 파일 이름 변수
        
        
//        try {
//			String subDir = ""; // 서브디렉토리(날짜 구분)
			// 업로드 디렉토리를 날짜별 디렉토리로 자동 분류하기
			// => 하나의 디렉토리에 너무 많은 파일이 존재하면 로딩 시간 길어지며 관리도 불편
			// => 따라서, 날짜별 디렉토리 구별 위해 java.util.Date 클래스 활용
			// 1. Date 객체 생성(기본 생성자 호출하여 시스템 날짜 정보 활용)
//			Date date = new Date(); // Mon Jun 19 11:26:52 KST 2023
//		System.out.println(date);
			// 2. SimpleDateFormat 클래스를 활용하여 날짜 형식을 "yyyy/MM/dd" 로 지정
			// => 디렉토리 구조로 바로 활용하기 위해 날짜 구분 기호를 슬래시(/)로 지정
			// => 디렉토리 구분자를 가장 정확히 표현하려면 File.pathSeperator 또는 File.seperator 상수 활용
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			// 3. 기존 업로드 경로에 날짜 경로 결합하여 저장
//			subDir = "/" + sdf.format(date);
//			saveDir += subDir;
			
			
//			Path path = Paths.get(saveDir + subDir); // 아직 배우지않은 부분
			// Files 클래스의 createDirectories() 메서드를 호출하여
			// Path 객체가 관리하는 경로 생성(존재하지 않으면 거쳐가는 경로들 중 없는 경로 모두 생성)

//			Files.createDirectories(path);
			
//		} catch (IOException e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}		
		
		
		
		
        // 저장할 File 객체를 생성(껍데기 파일)
        File saveFile = new File(saveDir, saveName); // 저장할 폴더 이름, 저장할 파일 이름
        
        
        
        
 
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
