package com.mm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SvcController {
	
	@RequestMapping("/svc.do")
	public String svc() {
		return "svc/svcForm";
	}

}
