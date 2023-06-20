package com.itwillbs.dongbaekcinema.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.dongbaekcinema.vo.PlayVO;
import com.itwillbs.dongbaekcinema.vo.SnackVO;
import com.itwillbs.dongbaekcinema.vo.RoomVO;
import com.itwillbs.dongbaekcinema.vo.OrderTicketVO;
import com.itwillbs.dongbaekcinema.voNew.ReservationVO;
import com.itwillbs.dongbaekcinema.service.ReservationService;
import com.itwillbs.dongbaekcinema.service.StoreService;
import com.itwillbs.dongbaekcinema.vo.MovieVO;
import com.itwillbs.dongbaekcinema.vo.TheaterVO;

@Controller
public class ReservationController {

	@Autowired
	private ReservationService service;
	
	@Autowired
	private StoreService service2;
	
	// 네비바의 [예매] 클릭 시 
	// reservation_main 요청에 의해 "reservation_main/reservation_main.jsp" 페이지로 포워딩
	// 포워딩 시 reservation_main.jsp의 [영화선택] 영역에 
	// 접속일 기준 10일이내에 상영하는 영화목록을 예매율순으로 출력
	@GetMapping("reservation_main")
	public String reservation_main(Model model) {
		System.out.println("ReservationController - reservation_main");
		
		// ReservationService - getMovieListDescBookingRate() 메서드를 호출하여
		// MOVIES 테이블에서 접속일 기준 10일이내에 상영하는 영화목록을 예매율순으로 조회
		// => 파라미터 : 없음   리턴타입 : List<MovieVO>(movieList)
		List<MovieVO> movieList = service.getMovieListDescBookingRate();
//		System.out.println(movieList);
		model.addAttribute("movieList", movieList);
		
		// 네비 탭의 [영화]에서 영화 선택 후 [예매하기] 버튼 클릭 시
//		MovieVO movie = service.getMovie(movie_num);
//		System.out.println(movie);
//		model.addAttribute("movie", movie);
		
		return "reservation/reservation_main";
	}

	// reservation_main.jsp의 [예매율순] 클릭 시
	// descBookingRate 요청에 의해 reservation_main.jsp의 [영화선택] 영역에 
	// 접속일에 상영중인 영화목록을 예매율순으로 출력
	@ResponseBody
	@GetMapping(value = "DescBookingRate", produces = "application/json;charset=utf-8")
	public List<MovieVO> DescBookingRate(Model model) {
		System.out.println("ReservationController - DescBookingRate");
		
		// ReservationService - getMovieListDescBookingRate() 메서드를 호출하여
		// MOVIES 테이블에서 접속일 기준 10일이내에 상영하는 영화목록을 예매율순으로 조회
		// => 파라미터 : 없음   리턴타입 : List<MovieVO>(movieList)
		List<MovieVO> movieList = service.getMovieListDescBookingRate();
//		System.out.println(movieList);
		model.addAttribute("movieList", movieList);
		
		return movieList;
	}
	
	// reservation_main.jsp의 [가나다순] 클릭 시
	// ascMovieName 요청에 의해 reservation_main.jsp의 [영화선택] 영역에 
	// 접속일에 상영중인 영화목록을 가나다순으로 출력
	@ResponseBody
	@GetMapping(value = "AscMovieName", produces = "application/json;charset=utf-8")
	public List<MovieVO> AscMovieName(Model model) {
		System.out.println("ReservationController - AscMovieName");
		
		// ReservationService - getMovieListAscMovieName() 메서드를 호출하여
		// MOVIES 테이블에서 접속일에 상영중인 영화목록을 가나다순으로 조회
		// => 파라미터 : 없음   리턴타입 : List<MovieVO>(movieList)
		List<MovieVO> movieList = service.getMovieListAscMovieName();
//		System.out.println(movieList);

		model.addAttribute("movieList", movieList);
		
		return movieList;
	}
	
	// reservation_main.jsp의 [영화명] 클릭 시 극장명 출력되도록
	// TheaterList 요청에 의해 reservation_main.jsp의 [극장선택] 영역에 
	// 선택한 영화를 접속일 기준 10일이내에 상영하는 극장 목록 출력
	@ResponseBody
	@RequestMapping(value = "TheaterList", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json;charset=utf-8")
	public List<TheaterVO> TheaterList(int movie_num, Model model) {
		System.out.println("ReservationController - TheaterList");
		
		// ReservationService - getTheaterList() 메서드를 호출하여
		// THEATERS 테이블에서 선택한 영화를 접속일 기준 10일이내에 상영하는 극장 조회
		// => 파라미터 : movie_num   리턴타입 : List<TheaterVO>(theaterList)
		List<TheaterVO> theaterList = service.getTheaterList(movie_num);
		model.addAttribute("theaterList", theaterList);		
		System.out.println(theaterList);		
		
		return theaterList;
	}
	
	
	// reservation_main.jsp의 [날짜] 클릭 시 시간 정보 출력
	// PlayList 요청에 의해 reservation_main.jsp의 [시간선택] 영역에 
	// 선택한 영화를 선택한 극장에서 선택한 날짜에 상영하는 시간과 상영관 목록 출력
	@ResponseBody
	@RequestMapping(value = "PlayList", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json;charset=utf-8")
	public String reservationStep3Servlet(@RequestParam int movie_num, @RequestParam int theater_num, @RequestParam String play_date, Model model) {
		System.out.println("ReservationController - PlayList");
		
//			TheaterVO theater = service.getTheater(theater_num);
//			model.addAttribute("theater", theater);
		
		// ReservationService - getTheaterList() 메서드를 호출하여
		// PLAYS 테이블에서 선택한 영화를 선택한 극장에서 선택한 날짜에 상영하는 시간과 상영관 조회
		// => 파라미터 : movie_num, theater_num, play_date  리턴타입 : List<PlayVO>(playList)
		List<Map<String, Object>> playList = service.getPlayList(movie_num, theater_num, play_date);
		model.addAttribute("playList", playList);		
		System.out.println(playList);		

		JSONArray ja = new JSONArray(playList);
		System.out.println(ja);
		return ja.toString();
	}

	// reservation_seat 요청에 의해 "reservation_seat.jsp" 페이지로 포워딩
	// 포워딩 시 상영번호에 해당하는 상영정보를 [선택정보] 영역에 출력
	@RequestMapping(value = "reservation_seat", method= {RequestMethod.GET, RequestMethod.POST})
	public String reservation_seat(@RequestParam int play_num, Model model) {
		System.out.println("ReservationController - Play()");
		System.out.println(play_num);
		
		// ReservationService - getPlay() 메서드를 호출하여
		// PLAYS 테이블에서 선택한 상영번호에 해당하는 상영정보 조회
		// => 파라미터 : play_num  리턴타입 : PlayVO(play)
		ReservationVO reservation = service.getPlay(play_num);
		model.addAttribute("reservation", reservation);
		System.out.println(reservation);
		
		return "reservation/reservation_seat";
	}

	@ResponseBody
	@RequestMapping(value = "SelectPeople", method= {RequestMethod.GET, RequestMethod.POST}, produces = "application/json;charset=utf-8")
	public String SelectPeople(@RequestParam String play_num, Model model) {
		System.out.println("ReservationController - SelectPeople()");
		System.out.println(play_num);
		
		// ReservationService - getOrderTicket() 메서드를 호출하여
		// PLAYS 테이블에서 선택한 상영번호에 해당하는 상영정보 조회
		// => 파라미터 : play_num  리턴타입 : List<OrderTicketVO>(orderticketList)
		int playNum = Integer.parseInt(play_num);
		List<OrderTicketVO> orderTicketList = service.getOrderTicket(playNum);
		model.addAttribute("orderTicketList", orderTicketList);
		System.out.println(orderTicketList);
		
		JSONArray ja = new JSONArray(orderTicketList);
		System.out.println(ja);
		return ja.toString();
	}
	
	@GetMapping("reservation_ing")
	public String reservation_ing() {
		return "reservation/reservation_ing";
	}
	
	@GetMapping("reservation_check")
	public String reservation_check() {
		
		return "reservation/reservation_check";
	}
	
	@GetMapping("reservation_snack")
	public String reservation_snack(@RequestParam Map<String, String> map,HttpServletRequest request, Model model) {
		String beforePage =(String)request.getHeader("REFERER");
		//잘못된 접근처리
		if(beforePage==null) {
			model.addAttribute("msg", "잘못된 접근");
			model.addAttribute("url", "./");
			
			return "fail_location";
		}
		System.out.println(beforePage);
		List<SnackVO> snackList = service2.getSnackList();
		System.out.println(snackList);
		model.addAttribute("snackList", snackList);
		
		return "reservation/reservation_snack";
	}
}
