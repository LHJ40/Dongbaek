package com.itwillbs.dongbaekcinema;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class CsController {
	
	@GetMapping("cs_main")
	public String cs_main() {
		return "cs/cs_main";
	}
	
}
