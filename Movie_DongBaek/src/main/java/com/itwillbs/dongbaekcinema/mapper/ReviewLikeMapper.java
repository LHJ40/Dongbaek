package com.itwillbs.dongbaekcinema.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.dongbaekcinema.vo.ReviewLikeVO;

@Mapper
public interface ReviewLikeMapper {

	int selectFindReviewLike(@Param("review_num") int review_num, @Param("member_id") String member_id);
//	ReviewLikeVO selectReviewLike(String member_id);

	int insertReviewLike(@Param("review_num") int review_num, @Param("member_id") String member_id);

	int selectReviewLikeCount(int review_num);

	int deleteReviewLike(@Param("review_num") int review_num, @Param("member_id") String member_id);

	int selectMember(String member_id);



}
