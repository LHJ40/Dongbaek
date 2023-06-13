package com.itwillbs.dongbaekcinema.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.dongbaekcinema.service.ReservationService;
import com.itwillbs.dongbaekcinema.vo.MovieVO;
import com.itwillbs.dongbaekcinema.vo.TheaterVO;

@Controller
public class ReservationController {

	@Autowired
	private ReservationService service;
	
	
	@GetMapping("reservation_main")
	public String reservation_prac(@RequestParam Map<String, String> map, Model model) {
		System.out.println("ReservationController - reservation_main");
		
		List<MovieVO> movieList = service.getMovieList();
		System.out.println(movieList);
		model.addAttribute("movieList", movieList);
		
		return "reservation/reservation_main";
	}
		
	@ResponseBody
	@RequestMapping(value = "ReservationStep1Servlet", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json;charset=utf-8")
	public Object reservationStep1Servlet(int movie_num, Model model) {
		System.out.println("ReservationController - reservationStep1Servlet");
		
		List<TheaterVO> theaterList = service.getTheaterList(movie_num);
		model.addAttribute("theaterList", theaterList);		
		System.out.println(theaterList);		
		
		return theaterList;
	}
	
	@GetMapping("reservation_ing")
	public String reservation_ing() {
		return "reservation/reservation_ing";
	}
	
	@GetMapping("reservation_check")
	public String reservation_check() {
		
		return "reservation/reservation_check";
	}
	
	@GetMapping("reservation_seat")
	public String reservation_seat() {
		
		return "reservation/reservation_seat";
	}
	@GetMapping("reservation_snack")
	public String reservation_snack() {
		
		return "reservation/reservation_snack";
	}
}
