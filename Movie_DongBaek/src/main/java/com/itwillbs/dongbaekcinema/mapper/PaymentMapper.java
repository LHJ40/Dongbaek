package com.itwillbs.dongbaekcinema.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.dongbaekcinema.vo.PaymentVO;
import com.itwillbs.dongbaekcinema.voNew.*;

@Mapper
public interface PaymentMapper {

	// 결제 내역 상세 조회 id로 구별
	//0616 수정중 
//	--------------------원본--------------------------
//	PaymentVO selectPayment(int order_num);
	List<PaymentVO> selectPayment(int order_num);
	
//	// 결제 내역 조회 - 0615정의효 페이징처리로 이거없어도됨
//	List<PaymentVO> selectPaymentList();
	
	// 마이페이지 - 회원의 나의 구매내역 조회(지영)
	List<MyReservationDetailVO> selectMyPaymentList(@Param("member_id") String member_id, @Param("pageNum") int pageNum);

	// 마이페이지 - 회원의 나의 구매내역 상세 조회(지영)
	MyReservationDetailVO selectMyPaymentList(int order_num);
	
	//페이징처리중 - 0615 정의
	List<PaymentVO> getPaymentList(@Param("start") int start, @Param("perPage") int pageSize);
	
	//페이징처리중 - 0615 정의
	int getCount();

}
