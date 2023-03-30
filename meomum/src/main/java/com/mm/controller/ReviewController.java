package com.mm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mm.review.model.ReviewDAO;
import com.mm.review.model.ReviewDTO;
import com.mm.review.service.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping("/myReview.do")
	public String myReview() {
		return "review/myReview";
	}
	
	//리뷰작성 테스트
	@RequestMapping(value="/reviewWrite.do", method = RequestMethod.GET)
	public String reviewForm() {
		return "review/reviewWrite";
	}
	
	@RequestMapping(value="/reviewWrite.do", method = RequestMethod.POST)
	public ModelAndView reviewWriteSubmit(ReviewDTO dto) {
		int result=reviewService.reviewWrite(dto);
		String msg=result>0?"리뷰 등록 완료되었습니다.":"리뷰 등록에 실패하였습니다.";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("review/reviewMsg");
		
		return mav;
	}
	
}
