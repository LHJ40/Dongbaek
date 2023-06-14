package com.itwillbs.dongbaekcinema.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
//	@ResponseBody
//	@GetMapping(value="getTheater",produces = "application/json;charset=utf-8")
//	public Object theater_tap(int theater_num) {
//		System.out.println("theater_tap");
//		System.out.println(theater_num);
//		return "";
//	}
	
	@ResponseBody
	@GetMapping("getTheater")
	public Object getTheater(int theater_num, Model model) {
		System.out.println(theater_num);
		TheaterVO theater=service.getTheater(theater_num);
		model.addAttribute("theater", theater);		
		System.out.println(theater);
		return theater;
	}
	@GetMapping("theater-price_tap")
	public String theater_price_tap() {
		return "theater/theater-price_tap";
	}
	@GetMapping("theater-runningtime_tap")
	public String theater_runningtime_tap(Model model) {
		List<TheaterVO> theaterList = service.getTheaterList();
		System.out.println(theaterList);
		
		LocalDate currentdate = LocalDate.now();
	

		
		// student_list.jsp 페이지로 포워딩 시 전달할 List 객체 저장
		model.addAttribute("theaterList", theaterList);
		model.addAttribute("currentdate", currentdate);
		
		return "theater/theater-runningtime_tap";
	}
}
