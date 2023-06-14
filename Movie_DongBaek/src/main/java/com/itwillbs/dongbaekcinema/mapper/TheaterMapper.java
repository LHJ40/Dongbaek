package com.itwillbs.dongbaekcinema.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.dongbaekcinema.vo.TheaterVO;

@Mapper
public interface TheaterMapper {

	List<TheaterVO> selectTheaterList();

	TheaterVO selectTheater(int theater_num);

}
