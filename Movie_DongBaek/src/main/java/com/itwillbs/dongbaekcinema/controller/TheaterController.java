package com.itwillbs.dongbaekcinema.controller;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.dongbaekcinema.service.TheaterService;
import com.itwillbs.dongbaekcinema.vo.PlayVO;
import com.itwillbs.dongbaekcinema.vo.ScheduleVO;
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
		
		
		model.addAttribute("theaterList", theaterList);
		
		return "theater/theater_main";
	}

	@ResponseBody
	@GetMapping("getTheater")
	public Object getTheater(int theater_num, Model model) {
		System.out.println(theater_num);
		TheaterVO theater=service.getTheater(theater_num);
		model.addAttribute("theater", theater);		
		System.out.println(theater);
		return theater;
	}
	
	@ResponseBody
	@GetMapping("getSchedule")
	public List<ScheduleVO> getSchedule(int theater_num, String play_date, Model model) {
		System.out.println("getSchedule");
		List<ScheduleVO> schedule = service.getSchedule(theater_num,play_date);
		model.addAttribute("schedule", schedule);
		System.out.println(schedule);
		
		return schedule;
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
		LocalDate maxdate=currentdate.plusDays(7);

		
		
		model.addAttribute("theaterList", theaterList);
		model.addAttribute("currentdate", currentdate);
		model.addAttribute("maxdate", maxdate);
		
		return "theater/theater-runningtime_tap";
	}
}
