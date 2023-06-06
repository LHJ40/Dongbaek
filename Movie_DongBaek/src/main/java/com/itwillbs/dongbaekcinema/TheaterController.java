package com.itwillbs.dongbaekcinema;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TheaterController {
	@GetMapping("theater_main")
	public String theater_main() {
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
