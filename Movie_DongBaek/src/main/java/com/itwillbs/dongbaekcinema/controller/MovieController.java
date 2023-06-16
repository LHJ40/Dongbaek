package com.itwillbs.dongbaekcinema.controller;

import java.util.*;
import java.util.List;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.itwillbs.dongbaekcinema.service.*;
import com.itwillbs.dongbaekcinema.vo.*;

import antlr.collections.*;

@Controller
public class MovieController {
	
	@Autowired
	private MovieService service;
	
	//영화목록-현재상영작탭 클릭시(영화목록 디폴트)
	@GetMapping("movie_list_present")
	public String movie_list_present(@RequestParam Map<String, String> map, Model model) {
		System.out.println("controller-movie_list_present");
		
		List<MovieVO> movieList = service.getMovieList_present_bookrate();
		model.addAttribute("movieList", movieList);
		System.out.println(movieList);
		
		return "movie/movie_list_present";
	}
	
	//영화목록-상영예정작
	@GetMapping("movie_list_prepare")
	public String movie_list_prepare() {
		
		return "movie/movie_list_prepare";
	}
	
	
	//영화상세정보-메인
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
