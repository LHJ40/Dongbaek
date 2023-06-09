package com.itwillbs.dongbaekcinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.dongbaekcinema.mapper.PaymentMapper;
import com.itwillbs.dongbaekcinema.vo.PaymentVO;

@Service
public class PaymentService {

	@Autowired
	private PaymentMapper mapper;
	
	// 결제 상세 조회를 위한 메서드(id로 구분)
	public PaymentVO getPayment(String id) {
		return mapper.selectPayment(id);
	}
	
	// (모든) 결제 내역을 조회후 리스트게 아겨조기위한 메서드
	public List<PaymentVO> getPaymentList() {
		return mapper.selectPaymentList();
	}

}
