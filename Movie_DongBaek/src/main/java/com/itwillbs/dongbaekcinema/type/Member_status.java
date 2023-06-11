package com.itwillbs.dongbaekcinema.type;

import org.apache.ibatis.type.*;

public enum Member_status implements CodeEnum {
	// 입력값(출력값)
	ACTIVE("활동"),
	WITHDRAWAL("탈퇴");
	
	private String code;
	
	Member_status(String code) {	// 회원상태를 문자열로 전달받아 초기화
		this.code = code;
	}
	
	@MappedTypes(Member_status.class)
	public static class TypeHandler extends CodeEnumTypeHandler<Member_status> {
		public TypeHandler() {
			super(Member_status.class);
		}
	}
	
	// Getter -> 인터페이스 오버라이딩
	@Override
	public String getCode() {
		// TODO Auto-generated method stub
		return this.code;
	}
}
