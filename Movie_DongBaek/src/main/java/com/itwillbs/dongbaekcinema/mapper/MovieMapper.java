package com.itwillbs.dongbaekcinema.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.dongbaekcinema.vo.MovieVO;

@Mapper
public interface MovieMapper {

	int insertMovie(MovieVO movie);


}
