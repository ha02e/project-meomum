package com.mm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProController {

	@RequestMapping("/product.do")
	public String product() {
		return "/pro/proForm";
	}
	
	
}
