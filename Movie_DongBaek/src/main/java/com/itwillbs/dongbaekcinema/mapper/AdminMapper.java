package com.itwillbs.dongbaekcinema.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.dongbaekcinema.vo.CsVO;
import com.itwillbs.dongbaekcinema.vo.MovieVO;
import com.itwillbs.dongbaekcinema.vo.PlayVO;
import com.itwillbs.dongbaekcinema.voNew.CsInfoVO;
import com.itwillbs.dongbaekcinema.voNew.PlayScheduleVO;

@Mapper
public interface AdminMapper {
	
	// 셀렉트박스 영화관 정보 가져오기
	public List<HashMap<String, String>> getTeater();

	// 확인 버튼 클릭 시 스케줄 목록 가져오기
	public List<PlayScheduleVO> selectScheduleList(@Param("theater_num") String theater_num, @Param("play_date") String play_date,@Param("pageNo") int pageNo);

	// 확인 버튼 클릭 시 선택가능한 영화 정보 가져오기
	public List<MovieVO> findMovieList(@Param("play_date") String play_date);

	// 영화 목록 셀렉트 박스 클릭시 선택 가능한 영화 정보 가져오기
	public List<PlayScheduleVO> getTurnInfo(@Param("theater_num") int theater_num, @Param("movie_num") int movie_num, @Param("pageNo") int pageNo);

	
	
    // CS 게시판 목록 가져오기
    List<CsInfoVO> getCsWithPaging(@Param("start") int start, @Param("pageSize") int pageSize, @Param("condition") String condition);

    // CS 게시판 총 목록 수 가져오기
	public int getCsCount(@Param("condition") String condition);

	// CS 게시판 글수정& 답글 달기시 정보 가져오기
	public CsInfoVO getCsInfo(@Param("condition")String condition, @Param("cs_type_list_num") int cs_type_list_num);
	
	// CS 게시판 cs_type_list_num(타입별 글번호) 카운트
	public int countCsTypeListNum(@Param("condition")String condition);

	// CS 게시판 공지사항, 자주묻는 질문 글쓰기
	public int registCs(@Param("condition")String condition, @Param("csInfo")CsInfoVO csInfo, @Param("cs_file")String cs_file, @Param("cs_file_real")String cs_file_real);

	// CS 게시판 공지사항, 자주묻는 질문 게시판 글 수정
	public int updateCs(@Param("condition")String condition, @Param("csInfo")CsInfoVO csInfo, @Param("cs_file")String cs_file, @Param("cs_file_real")String cs_file_real);

	// CS 게시판 1:1 게시판 답변 추가
	public int updateReply(@Param("condition")String condition, @Param("qnaInfo")CsInfoVO qnaInfo);



	
	
//	// 상영 스케줄 목록 가져오기
//	List<PlayScheduleVO> getObjectsWithPaging(@Param("startPage") int startPage, @Param("pageSize") int pageSize);
//
//	// 총 목록 개수 카운트
//    int getCountCsNotice();
}
