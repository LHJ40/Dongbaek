package com.itwillbs.dongbaekcinema.mapper;

import java.util.Date;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.dongbaekcinema.vo.PlayVO;

@Mapper
public interface AdminMapper {

	PlayVO selectSchedualList(String theater_name, String play_date);
	
}
