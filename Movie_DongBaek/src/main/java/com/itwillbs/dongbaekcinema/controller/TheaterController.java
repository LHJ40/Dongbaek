package com.itwillbs.dongbaekcinema.controller;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.dongbaekcinema.service.ReservationService;
import com.itwillbs.dongbaekcinema.service.TheaterService;
import com.itwillbs.dongbaekcinema.vo.ScheduleVO;
import com.itwillbs.dongbaekcinema.vo.SnackVO;
import com.itwillbs.dongbaekcinema.vo.TheaterVO;
import com.itwillbs.dongbaekcinema.vo.TicketTypeVO;

@Controller
public class TheaterController {
	
	@Autowired
	private TheaterService service;
	
	@Autowired
	private ReservationService service2;
	
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
	
	//극장별예매?movie_num=1&theater_num=1&play_date=2023-06-28->reservation_seat 
//	@GetMapping("Theater-reservation")
//	public String Theater_reservation(@RequestParam int movie_num, @RequestParam int theater_num, @RequestParam String play_date, Model model) {
//		System.out.println("ReservationController - PlayList");
//		
//
//		List<Map<String, Object>> playList = service2.getPlayList(movie_num, theater_num, play_date);
//		model.addAttribute("playList", playList);		
//		System.out.println(playList);		
//
//		JSONArray ja = new JSONArray(playList);
//		System.out.println(ja);
//		return "reservation/reservation_seat";
//	}
}
