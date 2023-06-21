<<<<<<< HEAD
//<<<<<<< HEAD
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
//=======
//package com.itwillbs.dongbaekcinema.voNew;
//
//
//import lombok.AllArgsConstructor;
//import lombok.Data;
//import lombok.NoArgsConstructor;
//
//@AllArgsConstructor // 모든 프로퍼티를 변수로 갖는 생성자
//@NoArgsConstructor // 기본생성자
//@Data
//public class PageInfoVO {
//
//	private int listCount; // 총 게시물 수
//	private int pageListLimit; // 페이지 당 표시할 페이지 번호 갯수 (pageSize)
//	private int maxPage; // 전체 페이지 수(최대 페이지 번호)
//	private int startPage; // 시작 페이지 번호
//	private int endPage; // 끝 페이지 번호
//	
//
//
//}
//>>>>>>> branch 'main' of https://github.com/itwillbs51/Dongbaek.git
=======

package com.itwillbs.dongbaekcinema.voNew;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor // 모든 프로퍼티를 변수로 갖는 생성자
@NoArgsConstructor // 기본생성자
@Data
public class PageInfoVO {

	private int listCount; // 총 게시물 수
	private int pageListLimit; // 페이지 당 표시할 페이지 번호 갯수 (pageSize)
	private int maxPage; // 전체 페이지 수(최대 페이지 번호)
	private int startPage; // 시작 페이지 번호
	private int endPage; // 끝 페이지 번호
	


}
>>>>>>> branch 'main' of https://github.com/itwillbs51/Dongbaek.git
