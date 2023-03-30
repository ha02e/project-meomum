package com.mm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReviewController {

	@RequestMapping("/myReview.do")
	public String myReview() {
		return "review/myReview";
	}
	
	//리뷰작성 테스트
	@RequestMapping("/reviewWrite.do")
	public String reviewForm() {
		return "review/reviewWrite";
	}
	
}
