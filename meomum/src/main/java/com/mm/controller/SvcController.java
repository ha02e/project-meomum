package com.mm.controller;

import java.util.ArrayList;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mm.svc.model.SvcContentDTO;
import com.mm.svc.model.SvcDAO;
import com.mm.svc.model.SvcMemDTO;
import com.mm.svc.model.SvcSelectAllDTO;
import com.mm.svc.model.SvcDetailDTO;
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
	public ModelAndView svcFormSubmit(SvcMemDTO memDto,SvcDetailDTO detailDto, SvcDateDTO dateDto) {
		int memAdd = svcDao.svcMemInsert(memDto);
		int detailAdd = svcDao.svcDetailInsert(detailDto);
		int dateAdd = svcDao.svcDateInsert(dateDto);
		
		int result = memAdd+detailAdd + dateAdd;
		
		String msg = result>0?"방문견적 예약이 신청되었습니다":"다시 시도해주세요";
		String link = result>0?"index.do":"svc.do";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("link",link);
		mav.setViewName("/msg");
		return mav;
	}
	
	@RequestMapping(value = "/svcTimeSelect.do", method = RequestMethod.GET)
	@ResponseBody 
	public ModelAndView test(@RequestParam("svc_days")String days){
		List<String> times = svcDao.svcTimeSelect(days);
		ModelAndView mav = new ModelAndView();
		mav.addObject("times", times);
		mav.setViewName("mmJson");
		return mav; 
	}
	
	@RequestMapping("/svcList.do")
	public ModelAndView svcList() {
		List<SvcSelectAllDTO> list = svcDao.svcList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("svcDTO", list);
		mav.setViewName("svc/svcList");
		return mav;
	}
	
	@RequestMapping("/svcContent.do")
	public ModelAndView svcInfo(@RequestParam("svc_idx")String idx) {
		List<SvcContentDTO> list = svcDao.svcContent(idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto",list);
		mav.setViewName("svc/svcContent");
		return mav;
	}


}
