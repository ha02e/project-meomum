package com.mm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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

}
