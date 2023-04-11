package com.mm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReturnController {

	@RequestMapping("/returnForm.do")
	public String returnForm() {
		return "turnback/returnForm";
	}
	
}
