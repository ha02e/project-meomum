package com.mm.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
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

	@Autowired
	private LoveDAO loveDao;
	
	//찜 추가
	@RequestMapping(value="loveInsert.do", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView loveAdd(
			@RequestParam(name="pro_idx",defaultValue="1") int pro_idx,
			@RequestParam(name="user_idx",defaultValue="1") int user_idx) {
	
	
	ModelAndView mav= new ModelAndView();
	System.out.println(pro_idx+"pro");
	System.out.println(user_idx+"user");
	loveDao.loveInsert(pro_idx, user_idx);
	mav.setViewName("mmJson");
	return mav;
	}
}
