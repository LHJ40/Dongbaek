package com.itwillbs.dongbaekcinema.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.dongbaekcinema.service.TheaterService;
import com.itwillbs.dongbaekcinema.vo.ScheduleVO;
import com.itwillbs.dongbaekcinema.vo.SnackVO;
import com.itwillbs.dongbaekcinema.vo.TheaterVO;
import com.itwillbs.dongbaekcinema.vo.TicketTypeVO;

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
	
	@PostMapping("getSchedule")
	public String getSchedule(int theater_num, String play_date, Model model) {
		System.out.println("getSchedule");
		System.out.println(theater_num);
		System.out.println(play_date);
		List<ScheduleVO> scheduleList = service.getSchedule(theater_num,play_date);
		model.addAttribute("scheduleList",scheduleList);
		System.out.println(scheduleList);

		return "theater/runningtime_tap_ajax";
	}
	@GetMapping("theater-price_tap")
	public String theater_price_tap(Model model) {
		List<TicketTypeVO> ticketList = service.getTicketList();
		System.out.println(ticketList);
		model.addAttribute("ticketList", ticketList);
		return "theater/theater-price_tap";
	}
	@GetMapping("theater-runningtime_tap")
	public String theater_runningtime_tap(Model model) {
		List<TheaterVO> theaterList = service.getTheaterList();
		System.out.println(theaterList);
		
		LocalDate currentdate = LocalDate.now();
		LocalDate maxdate=currentdate.plusDays(10);

		
		
		model.addAttribute("theaterList", theaterList);
		model.addAttribute("currentdate", currentdate);
		model.addAttribute("maxdate", maxdate);
		
		return "theater/theater-runningtime_tap";
	}
}
