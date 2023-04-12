package com.mm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mm.member.model.MemberDTO;
import com.mm.point.model.PointDAO;
import com.mm.point.model.PointDTO;

@Controller
public class PointController {
	
	@Autowired
	private PointDAO pDao;
	
	/*
	 * @RequestMapping("/pointSearch.do") public ModelAndView
	 * pointSearch(@ModelAttribute PointDTO dto) { int point = pDao.pointTotal(dto);
	 * 
	 * ModelAndView mav = new ModelAndView(); mav.addObject("pointTotal",point);
	 * return mav; }
	 */
	
	
	
	@RequestMapping("/myPoint.do")
	public ModelAndView myPointList(HttpSession session,@RequestParam(value="cp",defaultValue = "1")int cp ) {
		ModelAndView mav = new ModelAndView();
		
		
		if(session.getAttribute("ssInfo")==null) {
			mav.addObject("msg", "로그인을 해주세요.");
			mav.addObject("gopage","location.href='index.do';");
			mav.setViewName("mainMsg");
			return mav;
		}
		
		MemberDTO sdto =(MemberDTO) session.getAttribute("ssInfo");
		int user_idx = sdto.getUser_idx();
		
		int rtotalCnt = pDao.pointCnt(user_idx);
		int totalCnt = rtotalCnt==0?1:rtotalCnt;
		int listSize = 10;
		int pageSize = 5;
		
		String pageStr = com.mm.module.PageModule.makePage("myPoint.do", totalCnt, listSize, pageSize, cp);

		int totalPoint = pDao.pointTotal(user_idx);
		
	    List<PointDTO> lists = pDao.pointList(user_idx,cp,listSize);
	    
	    
	    mav.addObject("totalPoint", totalPoint);
	    mav.addObject("lists", lists);
		mav.setViewName("member/myPoint");
		mav.addObject("pageStr",pageStr);

		return mav;

	}

}
