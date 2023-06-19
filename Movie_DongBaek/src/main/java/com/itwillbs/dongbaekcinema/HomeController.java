package com.itwillbs.dongbaekcinema;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.dongbaekcinema.service.MovieService;
import com.itwillbs.dongbaekcinema.vo.MovieVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private MovieService service;
	
	//메인페이지에 영화리스트 전달
	@GetMapping("/")
	public String mainPage(Model model) {

		//영화 목록 조회(현재상영작.예매율순)
		List<MovieVO> movieList = service.getMovieList_top4();
		model.addAttribute("movieList", movieList);
		System.out.println(movieList);
		
		return "home";
	}
	
	
	
	
}
