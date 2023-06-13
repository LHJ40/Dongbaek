package com.itwillbs.dongbaekcinema.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MovieController {
	
	//영화목록-상영예정작
	@GetMapping("movie_list_prepare")
	public String movie_list_prepare() {
		return "movie/movie_list_prepare";
	}
	
	//영화목록-현재상영작
	@GetMapping("movie_list_present")
	public String movie_list_present() {
		return "movie/movie_list_present";
	}
	
	//영화상세정보-
	@GetMapping("movie_detail_info")
	public String movie_detail_info() {
		return "movie/movie_detail_info";
	}
	
	//영화상세정보-포토탭
	@GetMapping("movie_detail_photo")
	public String movie_detail_photo() {
		return "movie/movie_detail_photo";
	}
	
	//영화상세정보-리뷰탭
	@GetMapping("movie_detail_review")
	public String movie_detail_review() {
		return "movie/movie_detail_review";
	}
	
	
}
