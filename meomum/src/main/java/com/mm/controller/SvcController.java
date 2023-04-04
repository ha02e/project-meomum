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
	
	/**방문 견적 신청*/
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
	
	/**방문 견적 신청 시 예약된 시간 비활성화*/
	@RequestMapping(value = "/svcTimeSelect.do", method = RequestMethod.GET)
	@ResponseBody 
	public ModelAndView test(@RequestParam("svc_days")String days){
		List<String> times = svcDao.svcTimeSelect(days);
		ModelAndView mav = new ModelAndView();
		mav.addObject("times", times);
		mav.setViewName("mmJson");
		return mav; 
	}
	
	/**관리자 페이지-예약 현황*/
	@RequestMapping("/asvcList.do")
	public ModelAndView asvcList() {
		List<SvcSelectAllDTO> list = svcDao.svcAdminList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("svcDTO", list);
		mav.setViewName("svc/a_svcList");
		return mav;
	}
	
	/**관리자 페이지-예약 상세 보기*/
	@RequestMapping("/asvcContent.do")
	public ModelAndView asvcInfo(@RequestParam("svc_idx")String idx) {
		SvcContentDTO dto = svcDao.svcContent(idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto",dto);
		mav.setViewName("svc/a_svcContent");
		return mav;
	}
	
	/**관리자 페이지-예약 수정*/
	@RequestMapping("/asvcUpdate.do")
	public ModelAndView asvcUpdate(SvcMemDTO memDto,SvcDetailDTO detailDto, SvcDateDTO dateDto) {
		int memUpdate = svcDao.svcMemUpdate(memDto);
		int detailUpdate = svcDao.svcDetailUpdate(detailDto);
		int dateUpdate = svcDao.svcDateUpdate(dateDto);
		
		
		int result = memUpdate+detailUpdate+dateUpdate;
		
		String msg = result>0?"방문견적 예약이 수정되었습니다":"다시 시도해주세요";
		String link = result>0?"a_svcList.do":"a_svcContent.do";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("link",link);
		
		mav.setViewName("/msg");
		
		return mav;
	}

	/**마이페이지-방문 견적 내역*/
	@RequestMapping("/svcList.do")
	public ModelAndView svcUserList(@RequestParam("user_idx")int idx) {
		System.out.println(idx);
		List<SvcSelectAllDTO> list = svcDao.svcUserList(idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		System.out.println(list);
		mav.setViewName("svc/svcList");
		return mav;
	}
}
