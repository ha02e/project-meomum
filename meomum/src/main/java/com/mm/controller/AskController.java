package com.mm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mm.ask.model.AskDAO;
import com.mm.ask.model.AskDTO;

@Controller
public class AskController {
	
	@Autowired
	private AskDAO adao;
	
	/**간단문의 리스트*/
	@RequestMapping("/askList.do")
	public ModelAndView askList() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ask/askList");
		return mav;
	}
	
	/**간단문의 글작성 페이지 이동*/
	@RequestMapping(value="/askWrite.do", method = RequestMethod.GET)
	public String askWriteForm() {
		return "ask/askWriteForm";
	}
	/**간단문의 글작성 submit*/
	@RequestMapping(value="/askWrite.do", method = RequestMethod.POST)
	public ModelAndView askWriteSubmit(AskDTO dto) {
		
		ModelAndView mav = new ModelAndView();
		int result = adao.askInsert(dto);
		
		if(result>0){
			mav.addObject("msg","간단문의 작성이 등록되었습니다.빠른시일내로 답변드리겠습니다.");
			mav.addObject("link","askList.do");
			mav.setViewName("msg");
		}else {
			mav.addObject("msg","간단문의 작성에 실패하였습니다.");
			mav.addObject("gopage","history.back();");
			mav.setViewName("mainMsg");
		}
		return mav;
		
	}
}
