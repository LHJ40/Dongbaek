package com.itwillbs.dongbaekcinema.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.dongbaekcinema.mapper.PaymentMapper;
import com.itwillbs.dongbaekcinema.vo.PaymentVO;
import com.itwillbs.dongbaekcinema.voNew.*;

@Service
public class PaymentService {

	@Autowired
	private PaymentMapper mapper;
	
	// 결제 상세 조회를 위한 메서드(id로 구분)
	public PaymentVO getPayment(int order_num) {
		return mapper.selectPayment(order_num);
	}
	
	// (모든) 결제 내역을 조회후 리스트게 아겨조기위한 메서드
	public List<PaymentVO> getPaymentList() {
		return mapper.selectPaymentList();
	}
	
	// 마이페이지 - 회원의 나의 구매내역 조회(지영)
	public List<MyReservationDetailVO> getMyPaymentList(String member_id, int pageNum) {
		return mapper.selectMyPaymentList(member_id, pageNum);
	}
	
	// 페이징처리 테스트 - 현재페이지? 0615정의효
	public List<PaymentVO> getPaymentList(int pageNo, int pageSize) {
		int start = (pageNo - 1) * pageSize;
		return mapper.getPaymentList(start, pageSize);
	}
	
	// 페이징처리 테스트 - 총 몇페이진지 0615정의효
//	public int getTotalPageCount(int pageSize) {
//		int totalCount = mapper.getCount();
//		return (int) Math.ceil((double) totalCount / pageSize);
//	}
	public int getTotalPageCount(int pageSize) {
		int totalCount = mapper.getCount();
		int totalPageCount = (int) Math.ceil((double) totalCount / pageSize);
		return totalPageCount;
	}

	//페이징처리테스트 -10페이지 까지나오게 0615 정의효
	public int getStartIndex(int pageNo, int pageSize) {
		return (pageNo - 1) * pageSize + 1;
	}
		
	//페이징처리테스트 -10페이지 까지나오게 0615 정의효
	public int getEndIndex(int pageNo, int pageSize) {
		return pageNo * pageSize;
	}
}









