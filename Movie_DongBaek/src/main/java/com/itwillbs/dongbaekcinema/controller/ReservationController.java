package com.itwillbs.dongbaekcinema.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReservationController {

	@GetMapping("reservation_ing")
	public String reservation_ing() {
		return "reservation/reservation_ing";
	}
	
	@GetMapping("reservation_check")
	public String reservation_check() {
		
		return "reservation/reservation_check";
	}
	@GetMapping("reservation_main")
	public String reservation_main() {
		
		return "reservation/reservation_main";
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
