package com.itwillbs.dongbaekcinema.voNew;

import lombok.*;

@Data
public class Criteria {
	
	private int pageNum; // 페이지번호
	private int size; // 한페이지당 출력 DATA 개수
	
	
	public Criteria() {
		this(1,10);
	}
	
	public Criteria(int pageNum, int size) {
		this.pageNum = pageNum;
		this.size = size;
	}
	
//	//getSkip() 통해 mapper.xml에서 ${skip} 사용가능
//	// ex) pageNum 2, size 10 => getSkip() 리턴값 : 10
//	// => limit 10, 10이 되어 2번째페이지 만들어짐
//	public int getSkip() {
//		return this.pageNum = (pageNum - 1) * size;
//	}
	
	
	
}
