package com.itwillbs.dongbaekcinema.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.dongbaekcinema.vo.PaymentVO;

@Mapper
public interface PaymentMapper {

	// 결제 내역 상세 조회 id로 구별
	PaymentVO selectPayment(int order_num);
	
	// 결제 내역 조회
	List<PaymentVO> selectPaymentList();
	
	// 마이페이지 - 회원의 나의 구매내역 조회(지영)
	List<PaymentVO> selectMyPaymentList(String member_id);

}
