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
	public String movie_list_present(Model model) {
//		System.out.println("Moviecontroller-movie_list_present");
	
//  @GetMapping("movie_list_present")
//	public String movie_list_present(@RequestParam String param, Model model){	
//		if(!param.equals("평점순")) { 		//셀렉트박스 선택값이 변하지 않았을 경우-예매율순 무비리스트 출력
			List<MovieVO> movieList = service.getMovieList_present_bookrate();
			model.addAttribute("movieList", movieList);
			//System.out.println(movieList);
//		} else { //셀렉트박스 선택값이 변했을 경우 - 평점순 무비리스트 출력
//			List<MovieVO> movieList = service.getMovieList_present_reviewrate();
//			model.addAttribute("movieList", movieList);
//		}
//		return "movie/movie_list_present";	
//	}
		return "movie/movie_list_present";
	}
	
	
	//영화목록-현재상영작 평점순셀렉트박스 선택시
	@ResponseBody
	@GetMapping(value="movieListReviewRate", produces = "application/json;charset=utf-8")
	public List<MovieVO> movieListReviewRate(Model model){
		System.out.println("MovieController - movieListPresent()");
		// 평점순 영화목록 movieList에저장
		// 요청시 movieList 전달
		List<MovieVO> movieList = service.getMovieList_present_reviewrate();
		model.addAttribute("movieList", movieList);
		return movieList ;
	}
	
	
	//---------------------------------------------------------------------
	
	
	
	//영화목록-상영예정작탭 클릭시
	@GetMapping("movie_list_prepare")
	public String movie_list_prepare(Model model) {
//		System.out.println("Moviecontroller-movie_list_prepare");
		
		List<MovieVO> movieList = service.getMovieList_prepare();
		model.addAttribute("movieList", movieList);
//		System.out.println(movieList);
		
		return "movie/movie_list_prepare";
	}
	
	
	//영화상세정보-메인
	@GetMapping("movie_detail_info")
	public String movie_detail_info(int movie_num, Model model) {
//		System.out.println("Moviecontroller-movie_detail_info");
//		System.out.println(movie_num);
		
		// 각 영화의 상세정보 출력 getMovie()메서드
		// 파라미터: 리턴타입:MemberVO
		MovieVO movie = service.getMovie(movie_num);
//		System.out.println(movie);
		model.addAttribute("movie", movie);
		
		// 각 영화의 리뷰정보 출력 getReviewRating
		ReviewVO review = service.getReview(movie_num);
//		System.out.println(review);
		model.addAttribute("review", review);

		return "movie/movie_detail_info";
	}
	

	//영화상세정보-포토탭
	@GetMapping("movie_detail_photo")
	public String movie_detail_photo(int movie_num, Model model) {
		
		// 각 영화의 상세정보 출력 getMovie()메서드
		// 파라미터: 리턴타입:MemberVO
		MovieVO movie = service.getMovie(movie_num);
//		System.out.println(movie);
		model.addAttribute("movie", movie);
		
		// 각 영화의 리뷰정보 출력 getReviewRating
		ReviewVO review = service.getReview(movie_num);
//		System.out.println(review);
		model.addAttribute("review", review);
		
		return "movie/movie_detail_photo";
	}
	
	//영화상세정보-리뷰탭
	@GetMapping("movie_detail_review")
	public String movie_detail_review(int movie_num, Model model) {
		
		// 각 영화의 상세정보 출력 getMovie()메서드
		// 파라미터: 리턴타입:MemberVO
		MovieVO movie = service.getMovie(movie_num);
		model.addAttribute("movie", movie);
		
		// 각 영화의 리뷰정보 출력 getReviewRating
		ReviewVO review = service.getReview(movie_num);
		model.addAttribute("review", review);
		
		// 각 영화의 리뷰개수 출력 getReviewCounting
		ReviewVO reviewCount = service.getReviewCounting(movie_num);
		model.addAttribute("reviewCount", reviewCount);
//		System.out.println(reviewCount);
		
		// 리뷰목록출력(리뷰탭 컨텐츠영역) getReviewList
		List<ReviewVO> reviewList = service.getReviewList(movie_num);
		model.addAttribute("reviewList", reviewList);
//		System.out.println(reviewList);
		
		
		return "movie/movie_detail_review";
	}
	
	
	//메인페이지에 영화리스트 전달
//	@GetMapping("/")
//	public String mainPage(Model model) {
//
//		//영화 목록 조회(현재상영작.예매율순)
//		List<MovieVO> movieList = service.getMovieList_present_bookrate();
//		model.addAttribute("movieList", movieList);
//		System.out.println(movieList);
//		
//		return "home";
//	}
	
	


	
}
