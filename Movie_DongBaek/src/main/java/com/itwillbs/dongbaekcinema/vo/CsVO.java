package com.itwillbs.dongbaekcinema.vo;

import java.sql.*;

import lombok.*;

@Data	// lombok -> Getter/Setter, 기본생성자, toString() 오버라이딩
public class CsVO {
	private int cs_num;
	private String cs_subject;
	private String cs_content;
	private Timestamp cs_date;
	private String cs_type;
	private String cs_file;
	private String cs_file_real;
	private String cs_reply;
	private String cs_phone;
	private int cs_type_list_num;
	private String member_id;
	
}
