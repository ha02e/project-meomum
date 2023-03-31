package com.mm.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mm.svc.model.SvcDAO;
import com.mm.svc.model.SvcDTO;
import com.mm.svc.model.SvcDateDTO;


@Controller
public class SvcController {
	
	@Autowired
	private SvcDAO svcDao;
	
	@RequestMapping("/svc.do")
	public String svc() {
		return "svc/svcForm";
	}
	
	@RequestMapping("/svcFormSubmit.do")
	public ModelAndView svcFormSubmit(SvcDTO dto,SvcDateDTO svdto) {
		int detailAdd = svcDao.svcInsert(dto);
		int dateAdd = svcDao.svcDateInsert(svdto);
		
		int result = detailAdd + dateAdd;
		
		String msg = result>0?"방문견적 예약이 신청되었습니다":"다시 시도해주세요";
		String link = result>0?"index.do":"svc.do";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("link",link);
		mav.setViewName("/msg");
		return mav;
	}
	
	

}
