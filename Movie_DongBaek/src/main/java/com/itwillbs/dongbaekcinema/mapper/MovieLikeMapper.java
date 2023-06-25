package com.itwillbs.dongbaekcinema.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.itwillbs.dongbaekcinema.vo.*;

@Mapper
public interface MovieLikeMapper {

	// 찜한 영화 찾기(지영)
	List<MovieLikeVO> selectLikeMovie(String member_id);
	
	// 찜 기능(지영)
	int insertLikeMovie(MovieLikeVO movieLike);

	// 찜 취소(지영)
	int deleteLikeMovie(MovieLikeVO movieLike);
	
	
}
