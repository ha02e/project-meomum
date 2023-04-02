package com.mm.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
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
	@RequestMapping("/reviewable.do")
	public String reviewable() {
		return "review/reviewable";
	}
	
	
	//리뷰작성 테스트
	@RequestMapping(value="/reviewWrite.do", method = RequestMethod.GET)
	public String reviewForm() {
		return "review/reviewWrite";
	}
	
	
	@RequestMapping(value="/reviewWrite.do", method = RequestMethod.POST)
	public ModelAndView reviewWriteSubmit(ReviewDTO dto) {
		int result=reviewService.reviewInsert(dto);
		String msg=result>0?"리뷰 등록 완료되었습니다.":"리뷰 등록에 실패하였습니다.";
		String link = result>0?"myReview.do":"reviewWrite.do";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("link", link);
		mav.setViewName("/msg");
		
		return mav;
	}
	
	/*
	@RequestMapping(value="/reviewWrite.do", method = RequestMethod.POST)
    public ModelAndView reviewWriteSubmit(ReviewDTO dto) {
		int result=reviewService.reviewInsert(dto);
		String msg=result>0?"리뷰 등록 완료되었습니다.":"리뷰 등록에 실패하였습니다.";
		String link = result>0?"myReview.do":"reviewWrite.do";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("link", link);
		mav.setViewName("/msg");
		
		return mav;
    }
	
	
	@RequestMapping(value="SummerNoteImageFile" , method = RequestMethod.POST)
	public @ResponseBody JsonObject SummerNoteImageFile(@RequestParam("file") MultipartFile file) {
		JsonObject jsonObject = reviewService.SummerNoteImageFile(file);
		System.out.println(jsonObject);
		return jsonObject;
	}

	

	@PostMapping("/review/article")
	public ReviewDTO<> saveReview(@RequestBody @Valid Board board, @PrincipalDetail principal) { 
		boardService.글쓰기(board, principal.getUser());
		return new ResponseDto(HttpStatus.OK.value(), "글쓰기가 완료되었습니다.");
	}
	 */

	
	@RequestMapping("/reviewList.do")
	public String reviewList() {
		return "review/reviewList";
	}
	
}
