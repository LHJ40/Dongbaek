package com.itwillbs.dongbaekcinema.vo;

import java.sql.Date;
import java.sql.Time;

import lombok.Data;

@Data
public class PlayVO {

    private int play_num;
    private String play_date;
    private int play_turn;
    private String play_start_time;
    private String play_end_time;
//    private Enum<play_time_type<String>> play_time_type;
    private int movie_num;
    private int theater_num;
    private int room_num;
//    private String theater_name; // 값 받아오기용 임시
//    private String movie_name; // 값 받아오기용 임시

}

//enum play_time_type {
//    "조조", "일반", "심야";
//}
