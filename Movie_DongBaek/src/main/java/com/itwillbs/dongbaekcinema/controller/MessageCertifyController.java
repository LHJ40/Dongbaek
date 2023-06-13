package com.itwillbs.dongbaekcinema.controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import com.itwillbs.dongbaekcinema.service.*;

@Controller
public class MessageCertifyController {
	
	@Autowired
	private testService service;
	
	@RequestMapping(value = "/phoneCheck", method = RequestMethod.GET)
	@ResponseBody
	public String sendSMS(@RequestParam("phone") String Member_phone) { // 휴대폰 문자보내기
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성

		service.certifiedPhoneNumber(Member_phone,randomNumber);
		
		return Integer.toString(randomNumber);
	}
	
}
