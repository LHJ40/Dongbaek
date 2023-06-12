package com.itwillbs.dongbaekcinema.vo;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.itwillbs.dongbaekcinema.type.*;

import lombok.Data;

 
@Data
public class MemberVO {
	private String member_id;
	private String member_pass;
	private String member_name;
	private String member_email;
	private Date member_birth;  //Date : java.sqlDate 임포트함
	private Date member_date;	//Date : java.sqlDate 임포트함
	private String member_phone;
	private Member_status member_status;
	private boolean member_agree_marketing;
	private Date member_withdrawl;	//Date : java.sql.Date 임포트함 XX-YY-MM
	private String member_type;
	private String member_like_genre;

	
	
//  myBatis Enum 타입 사용법 공부(기본 EnumTypeHandler 사용하면될지
//	커스텀typeHandler만들어야할지 ..	
//	데이터넣고 주석풀고 확인하기 0608 - 정의효
	
}
