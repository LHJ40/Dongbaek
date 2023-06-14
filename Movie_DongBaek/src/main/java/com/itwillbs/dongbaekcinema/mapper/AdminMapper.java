package com.itwillbs.dongbaekcinema.mapper;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.dongbaekcinema.vo.PlayVO;

@Mapper
public interface AdminMapper {

	public List<PlayVO> selectScheduleList(@Param("theater_name") String theater_name, @Param("play_date") String play_date);

	
}
