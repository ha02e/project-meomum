package com.mm.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mm.love.model.LoveDAO;
import com.mm.love.model.LoveDTO;
import com.mm.member.model.MemberDTO;

@Controller
public class LoveController {

	private LoveDAO loveDao;
	
	//찜 추가
	@RequestMapping(value="loveInsert.do", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView loveInsert(
			@RequestParam("pro_idx") int pro_idx,
			HttpSession session) {
		
		ModelAndView mav= new ModelAndView();
		
		session.getAttribute("ssInfo");
		MemberDTO sdto=(MemberDTO) session.getAttribute("ssInfo");
		
		String msg=null;
		
		int user_idx=sdto.getUser_idx();
		LoveDTO dto=new LoveDTO();
		
			dto.setUser_idx(user_idx);
			dto.setPro_idx(pro_idx);

			loveDao.loveInsert(dto);
			mav.setViewName("mmJson");
			return mav;
	
	}
	
}
