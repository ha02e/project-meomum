package com.mm.controller;

import java.util.ArrayList;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mm.member.model.MemberDAO;
import com.mm.member.model.MemberDTO;
import com.mm.svc.model.SvcContentDTO;
import com.mm.svc.model.SvcDAO;
import com.mm.svc.model.SvcMemDTO;
import com.mm.svc.model.SvcSelectAllDTO;
import com.mm.svc.model.SvcDetailDTO;
import com.mm.svc.model.SvcIngDTO;
import com.mm.svc.model.SvcDateDTO;


@Controller
public class SvcController {
	
	@Autowired
	private SvcDAO svcDao;
	private MemberDAO mdao;
	
	@RequestMapping("/svc.do")
	public ModelAndView svc(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		if(session.getAttribute("ssInfo")==null) {
			mav.addObject("msg", "로그인 후 이용가능합니다");
			mav.addObject("link", "login.do");
			mav.setViewName("svc/msg");
		}else {
			mav.setViewName("svc/svcForm");
		}
		return mav;
	}
	
	/**방문 견적 신청*/
	@RequestMapping("/svcFormSubmit.do")
	public ModelAndView svcFormSubmit(SvcMemDTO memDto,SvcDetailDTO detailDto, SvcDateDTO dateDto) {
		int memAdd = svcDao.svcMemInsert(memDto);
		int detailAdd = svcDao.svcDetailInsert(detailDto);
		int dateAdd = svcDao.svcDateInsert(dateDto);
		
		int result = memAdd+detailAdd + dateAdd;
		
		String msg = result>0?"방문견적 예약이 신청되었습니다":"다시 시도해주세요";
		String link = result>0?"index.do":"svcList.do";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("link",link);
		mav.setViewName("svc/msg");
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
	
	/**관리자 페이지-예약 리스트*/
	@RequestMapping("/asvcList.do")
	public ModelAndView asvcList() {
		List<SvcSelectAllDTO> list = svcDao.svcAdminList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("svcDTO", list);
		mav.setViewName("svc/a_svcList");
		return mav;
	}
	
	
	/**관리자-예약 세부 검색*/
	@RequestMapping("/svcSearch.do")
	@ResponseBody
	public ModelAndView svcSearch(@RequestParam("minDate") String minDate,
			@RequestParam("maxDate") String maxDate,
            @RequestParam(value="category",defaultValue="1") int category,
            @RequestParam("keyword") String keyword,
            @RequestParam("state[]") List<String> state){
		
		ArrayList<String> arr = new ArrayList<String>();
		for(int i=0;i<state.size();i++) {
			arr.add(state.get(i));
		}
		
		List<SvcSelectAllDTO> list = svcDao.svcSelectDetail(minDate,maxDate,category,keyword,arr);

		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("mmJson");
		return mav;
	}
	
	/**관리자-예약 상세 보기*/
	@RequestMapping("/asvcContent.do")
	public ModelAndView asvcInfo(@RequestParam("svc_idx")String idx) {
		SvcContentDTO dto = svcDao.svcContent(idx);
		SvcIngDTO ingDto = svcDao.svcIngContent(idx);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto",dto);
		mav.addObject("ingdto", ingDto);
		mav.setViewName("svc/a_svcContent");
		return mav;
	}
	

	/**관리자-서비스 견적 추가 팝업창으로 이동*/
	@RequestMapping("/asvcIngPopup.do")
	public String asvcIngPopup() {
		return "svc/a_svcIngPopup";
	}

	/**관리자-서비스 견적 추가*/
	@RequestMapping("/svcIngInsert.do")
	public ModelAndView svcIngInsert(SvcIngDTO dto) {
		int result = svcDao.svcIngInsert(dto);
		String link = result>0? "asvcContent.do?svc_idx="+dto.getSvc_idx():"asvcIngPopup.do";
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("link",link);
		mav.setViewName("svc/a_svcIngPopup");

		return mav;
	}
	
	/**관리자-서비스 견적 상세 보기*/
	@RequestMapping("asvcIngContent.do")
	public ModelAndView asvcIngContent(@RequestParam("svc_idx")String idx) {
		SvcIngDTO ingDto = svcDao.svcIngContent(idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("ingdto", ingDto);
		mav.setViewName("svc/a_svcIngContent");
		return mav;
	}


	/**관리자 페이지-방문 견적 수정*/
	@RequestMapping("/asvcUpdate.do")
	public ModelAndView asvcUpdate(SvcMemDTO memDto,SvcDetailDTO detailDto, SvcDateDTO dateDto) {
		int memUpdate = svcDao.svcMemUpdate(memDto);
		int detailUpdate = svcDao.svcDetailUpdate(detailDto);
		int dateUpdate = svcDao.svcDateUpdate(dateDto);
		
		int result = memUpdate+detailUpdate+dateUpdate;
		
		String msg = result>0?"방문견적 예약이 수정되었습니다":"다시 시도해주세요";
		String link = result>0?"asvcList.do":"asvcContent.do";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("link",link);
		
		mav.setViewName("svc/msg");
		
		return mav;
	}
	
	/**관리자-서비스 신청 수정*/
	@RequestMapping("/asvcIngUpdate.do")
	public ModelAndView asvcIngUpdate(SvcIngDTO dto,SvcMemDTO memDto) {
		int ingUpdate = svcDao.svcIngUpdate(dto);
		/* int memUpdate = svcDao.svcStateUpdate(memDto); */
		ModelAndView mav = new ModelAndView();
	
		mav.setViewName("svc/a_svcIngContent");
		return mav;
	}


	/**마이페이지-방문 견적 내역 리스트*/
	@RequestMapping("/svcList.do")
	public ModelAndView svcUserList(HttpSession session) {
		session.getAttribute("ssInfo");
		MemberDTO sdto =(MemberDTO) session.getAttribute("ssInfo");
		
		int user_idx = sdto.getUser_idx();
		List<SvcSelectAllDTO> list = svcDao.svcUserList(user_idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);

		mav.setViewName("svc/svcList");
		return mav;
	}
	
	/**마이페이지-정리일상 진행 리스트*/
	@RequestMapping("/svcIngList.do")
	public ModelAndView svcIngList(HttpSession session) {
		session.getAttribute("ssInfo");
		MemberDTO sdto =(MemberDTO) session.getAttribute("ssInfo");
		
		int user_idx = sdto.getUser_idx();
		List<SvcIngDTO> list = svcDao.svcIngList(user_idx);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list", list);
		mav.setViewName("svc/svcIngList");
		return mav;
		
	}
	
	/**마이페이지-예약 상세 보기(방문 견적 신청 내역)*/
	@RequestMapping("/svcContent.do")
	public ModelAndView svcInfo(@RequestParam("svc_idx")String idx) {
		SvcContentDTO dto = svcDao.svcContent(idx);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("dto",dto);
		mav.setViewName("svc/svcContent");

		return mav;
	}
	
	/**마이페이지-예약 상세 보기(정리일상 진행 현황)*/
	@RequestMapping("/svcIngContent.do")
	public ModelAndView svcIngContent_a(@RequestParam("svc_idx")String idx) {
		SvcContentDTO dto = svcDao.svcContent(idx);
		SvcIngDTO ingdto = svcDao.svcIngContent(idx);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("dto",dto);
		System.out.println(dto.getSvc_state());
		System.out.println(dto.getSvc_idx());
		mav.addObject("ingdto",ingdto);
	
		mav.setViewName("svc/svcIngContent");
	
		return mav;
	}
	
	/**사용자 페이지-예약 수정 폼*/
	@RequestMapping("/svcUpdateForm.do")
	public ModelAndView updateForm(@RequestParam("svc_idx")String idx) {
		SvcContentDTO dto = svcDao.svcContent(idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto",dto);
		mav.setViewName("svc/svcUpdate");
		return mav;
	}
	
	/**사용자 페이지-예약 수정*/
	@RequestMapping("/svcUpdate.do")
	public ModelAndView svcUpdate(SvcMemDTO memDto,SvcDetailDTO detailDto, SvcDateDTO dateDto) {
		int memUpdate = svcDao.svcMemUpdate(memDto);
		int detailUpdate = svcDao.svcDetailUpdate(detailDto);
		int dateUpdate = svcDao.svcDateUpdate(dateDto);
		
		int result = memUpdate+detailUpdate+dateUpdate;
		
		String msg = result>0?"방문견적 예약이 수정되었습니다":"다시 시도해주세요";
		String link = result>0?"svcList.do":"svcUpdate.do";
	
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("link",link);
		
		mav.setViewName("svc/msg");
		
		return mav;
	}
	

	/**사용자-방문견적 예약 취소*/
	@RequestMapping("/svcCancle.do")
	public ModelAndView svcDelete(@ModelAttribute SvcContentDTO dto) {
		int stateResult=svcDao.svcStateCancle(dto);
		int dateResult = svcDao.svcDateCancle(dto);
		
		ModelAndView mav = new ModelAndView();
		
		String msg = stateResult+dateResult>0?"방문견적 예약이 취소되었습니다":"다시 시도해주세요";
		String link = stateResult+dateResult>0?"svcList.do":"svcContent.do";
		
		mav.addObject("msg",msg);
		mav.addObject("link",link);
		
		mav.setViewName("svc/msg");
		
		return mav;
	}
}
