package com.itwillbs.dongbaekcinema.vo;

import java.sql.Time;

import lombok.Data;

@Data
public class ScheduleVO {
	private String movie_name_kr;
	private int room_num;
	private Time play_start_time ;
	private Time end_time; 
	private String play_time_type;
	private String movie_name_en;
}
