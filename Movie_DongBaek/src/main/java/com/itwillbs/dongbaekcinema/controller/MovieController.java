package com.itwillbs.dongbaekcinema.controller;

import java.util.*;
import java.util.List;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.itwillbs.dongbaekcinema.service.*;
import com.itwillbs.dongbaekcinema.vo.*;

import antlr.collections.*;

@Controller
public class MovieController {
	
	@Autowired
	private MovieService service;
	
	//영화목록-현재상영작탭 클릭시(예매율순.기본)
	@GetMapping("movie_list_present")
	public String movie_list_present(@RequestParam Map<String, String> map, Model model) {
		System.out.println("Moviecontroller-movie_list_present");
		
		List<MovieVO> movieList = service.getMovieList_present_bookrate();
		model.addAttribute("movieList", movieList);
		System.out.println(movieList);
		
		return "movie/movie_list_present";
	}
	
	//영화목록-현재상영작 평점순정렬
	
	
	//영화목록-상영예정작탭 클릭시
	@GetMapping("movie_list_prepare")
	public String movie_list_prepare(@RequestParam Map<String, String> map, Model model) {
		System.out.println("Moviecontroller-movie_list_prepare");
		
		List<MovieVO> movieList = service.getMovieList_present_bookrate();
		model.addAttribute("movieList", movieList);
		System.out.println(movieList);
		
		return "movie/movie_list_prepare";
	}
	
	
	//영화상세정보-메인
	@GetMapping("movie_detail_info")
	public String movie_detail_info(int movie_num, Model model) {
		System.out.println("Moviecontroller-movie_detail_info");
		System.out.println(movie_num);
		
		// 각 영화의 상세정보 출력 getMovie()메서드
		// 파라미터: 리턴타입:MemberVO
		MovieVO movie = service.getMovie(movie_num);
		System.out.println(movie);
		model.addAttribute("movie", movie);
		
		// 각 영화의 리뷰정보 출력 getReviewRating
		ReviewVO review = service.getReviewRating(movie_num);
		System.out.println(review);
		model.addAttribute("review", review);

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
