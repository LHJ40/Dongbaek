package com.itwillbs.dongbaekcinema.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.itwillbs.dongbaekcinema.service.TheaterService;
import com.itwillbs.dongbaekcinema.vo.SnackVO;
import com.itwillbs.dongbaekcinema.vo.TheaterVO;

@Controller
public class TheaterController {
	
	@Autowired
	private TheaterService service;
	
	@GetMapping("theater_main")
	public String theater_main(Model model) {
		List<TheaterVO> theaterList = service.getTheaterList();
		System.out.println(theaterList);
		
		// student_list.jsp 페이지로 포워딩 시 전달할 List 객체 저장
		model.addAttribute("theaterList", theaterList);
		
		return "theater/theater_main";
	}
	@GetMapping("theater_tap")
	public String theater_tap() {
		return "theater/theater_tap";
	}
	@GetMapping("theater-price_tap")
	public String theater_price_tap() {
		return "theater/theater-price_tap";
	}
	@GetMapping("theater-runningtime_tap")
	public String theater_runningtime_tap() {
		return "theater/theater-runningtime_tap";
	}
}
