package com.mm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IndexController {
	
	@RequestMapping("/index.do")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/admin.do")
	public String admin() {
		return "admin";
	}

}
