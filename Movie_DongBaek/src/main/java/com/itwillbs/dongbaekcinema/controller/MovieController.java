package com.itwillbs.dongbaekcinema.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MovieController {
	
	@GetMapping("movie_list_prepare")
	public String movie_list_prepare() {
		return "movie/movie_list_prepare";
	}
	
	@GetMapping("movie_list_present")
	public String movie_list_present() {
		return "movie/movie_list_present";
	}
	@GetMapping("movie_detail_info")
	public String movie_detail_info() {
		return "movie/movie_detail_info";
	}
	@GetMapping("movie_detail_photo")
	public String movie_detail_photo() {
		return "movie/movie_detail_photo";
	}
	@GetMapping("movie_detail_review")
	public String movie_detail_review() {
		return "movie/movie_detail_review";
	}
	
	
}
