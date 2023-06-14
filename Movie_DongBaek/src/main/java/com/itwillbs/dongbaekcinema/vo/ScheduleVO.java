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

/*
SELECT  movie_name_kr,room_num,play_start_time,
DATE_ADD( play_start_time, INTERVAL (movie_running_time)MINUTE) AS end_time, 
play_time_type,  movie_name_en  FROM PLAYS p
JOIN MOVIES m ON m.movie_num=p.movie_num
WHERE play_date="2023-06-13" AND theater_num=1
ORDER BY movie_name_kr,room_num,play_start_time; 
 */ 
