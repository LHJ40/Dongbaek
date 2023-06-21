package com.itwillbs.dongbaekcinema.voNew;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//페이징처리에 사용되는 정보를 저장할 PageInfo클래스 정의

@Data
@AllArgsConstructor //모든전달인자받는 생성인자
@NoArgsConstructor // 기본생성자 필요시 반드시 추가해야하는 어노테이션

public class PageInfoVO {
	private int listCount; //총게시물수
	private int pageListLimit; //페이지당 표시 페이지번호 개수
	private int maxPage; // 전체페이지수(최대페이지번호)
	private int startPage; //시작페이지번호
	private int endPage; //끝페이지번호
	
	
	
	
}
